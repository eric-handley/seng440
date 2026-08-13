#!/usr/bin/env python3

import subprocess
import shlex
import glob
import os
import re
import shutil
import time
import resource
import argparse
from dataclasses import dataclass

NUM_AVGING_RUNS = 3

@dataclass
class TagInfo:
    name: str
    commit: str

class CompileError(Exception):
    pass

def compile(cmd: str):
    result = subprocess.run(shlex.split(cmd), capture_output=True, text=True, check=False)
    if result.returncode != 0:
        raise CompileError(result.stderr)

def execute(command_str: str, print_out: bool = False):
    command_list = shlex.split(command_str)

    result = subprocess.run(command_list, capture_output=True, text=True, check=False)

    if result.returncode != 0:
        print(result.stderr)
        raise Exception(f"Command failed: {command_str}")

    if print_out:
        print(result.stdout)
    
    return result.stdout

def benchmark_command(cmd: str) -> tuple[float, float]:
    cpu_before = resource.getrusage(resource.RUSAGE_CHILDREN)
    wall_start = time.perf_counter()
    execute(cmd)
    wall_elapsed = time.perf_counter() - wall_start
    cpu_after = resource.getrusage(resource.RUSAGE_CHILDREN)
    cpu_elapsed = (cpu_after.ru_utime + cpu_after.ru_stime) - (cpu_before.ru_utime + cpu_before.ru_stime)

    return (wall_elapsed, cpu_elapsed)

def build_with_args(args: str):
    os.makedirs("build", exist_ok=True)
    sources = glob.glob("**/*.c", recursive=True)
    compile("gcc " + " ".join(sources) + " -o build/out " + args)
    execute("chmod a+x build/out")

def clean_asm():
    if not os.path.isdir("asm"):
        return
    for entry in os.listdir("asm"):
        if entry == "current":
            continue
        path = os.path.join("asm", entry)
        if os.path.isdir(path):
            shutil.rmtree(path)
        else:
            os.remove(path)

def build_asm(tag_name: str, opt_level: int) -> int:
    out_dir = os.path.join("asm", tag_name, f"O{opt_level}")
    os.makedirs(out_dir, exist_ok=True)
    total_lines = 0
    for src in glob.glob("**/*.c", recursive=True):
        name = os.path.splitext(os.path.basename(src))[0] + ".s"
        out_path = os.path.join(out_dir, name)
        compile(f"gcc {src} -S -O{opt_level} -Iinc -o {out_path}")
        with open(out_path) as f:
            total_lines += sum(1 for _ in f)
    return total_lines

# Fixed width for a percentage value (including sign), so numbers line up.
PCT_NUM_W = 6

_ANSI_RE = re.compile(r"\033\[[0-9;]*m")

def visible_len(s: str) -> int:
    return len(_ANSI_RE.sub("", s))

def pad(s: str, width: int) -> str:
    return s + " " * max(0, width - visible_len(s))

def labelled_pct(label: str, value: float, baseline: float) -> str:
    pct = (value - baseline) / baseline * 100
    # Truecolor codes so the red/green overrides the shell theme.
    colour = "\033[38;2;255;0;0m" if pct > 0 else "\033[38;2;0;200;0m"
    return f"{label}: {colour}{pct:+{PCT_NUM_W}.1f}%\033[0m"

# A delta group is "(<opt slot>, <tag slot>)". Each slot has a fixed width so
# the opt and tag deltas each stay in their own column. The opt label is always
# 2 chars ("Ox"); the tag label is the previous tag's name.
OPT_SLOT_W = len("Ox: ") + PCT_NUM_W + 1

def tag_slot_w() -> int:
    return 1 + pct_tag_label_len + len("': ") + PCT_NUM_W + 1

def build_group(opt_entry, tag_entry) -> str:
    # Render the "(...)" delta group with fixed slots, padding a slot with
    # spaces when its delta is absent so the remaining columns still line up.
    if opt_entry is None and tag_entry is None:
        return ""
    if not compare_tags:
        return f"({opt_entry})" if opt_entry else ""
    s1 = pad(opt_entry or "", OPT_SLOT_W)
    if tag_entry is None:
        return f"({s1})"
    sep = ", " if opt_entry else "  "
    return f"({s1}{sep}{tag_entry})"

def pct_col_width() -> int:
    # Width of the widest group that can appear, so the asm column lines up.
    if not compare_tags:
        return 1 + OPT_SLOT_W + 1
    return 1 + OPT_SLOT_W + 2 + tag_slot_w() + 1

# Each metric's value from the previous tag, used to report its delta against
# the tag benchmarked just before. cpu is keyed by (opt_level, operation); asm
# line count is keyed by opt_level. prev_tag_name labels the delta.
prev_cpu = {}
prev_asm = {}
prev_tag_name = None
pct_tag_label_len = 0

def benchmark_tag(tag: TagInfo):
    global prev_tag_name

    print(f"\n'{tag.name}' ({tag.commit}):")

    # Each metric's previous-opt-level value for this tag, so a level can show
    # its improvement over the level immediately before it.
    prev_opt_cpu = {}
    prev_opt_asm = 0

    for opt_level in range(0, 4):
        compress_results = []
        decompress_results = []
        args = f"-O{opt_level} -static -Iinc"

        asm_lines = build_asm(tag.name, opt_level)

        for _ in range(0, NUM_AVGING_RUNS):

            build_with_args(args)

            compress_results.append(benchmark_command(f"./build/out -c -i {cli_args.wav} -o build/compressed.wav"))
            decompress_results.append(benchmark_command("./build/out -d -i build/compressed.wav -o build/decompressed.wav"))

        asm_opt = labelled_pct(f"O{opt_level - 1}", asm_lines, prev_opt_asm) if opt_level > 0 else None
        asm_tag = labelled_pct(f"'{prev_tag_name}'", asm_lines, prev_asm[opt_level]) if opt_level in prev_asm else None
        prev_asm[opt_level] = asm_lines
        prev_opt_asm = asm_lines
        asm_str = f"\tasm: {asm_lines:>4} lines  " + build_group(asm_opt, asm_tag)

        def report(operation: str, results):
            wall = sum(r[0] for r in results) / NUM_AVGING_RUNS
            cpu = sum(r[1] for r in results) / NUM_AVGING_RUNS

            cpu_opt = labelled_pct(f"O{opt_level - 1}", cpu, prev_opt_cpu[operation]) if opt_level > 0 else None
            key = (opt_level, operation)
            cpu_tag = labelled_pct(f"'{prev_tag_name}'", cpu, prev_cpu[key]) if key in prev_cpu else None
            prev_cpu[key] = cpu
            prev_opt_cpu[operation] = cpu

            line = "\t\t"
            line += pad(f"{operation}:", 12)
            line += pad(f"wall: {wall:.4f}s\t", 14)
            line += pad(f"cpu: {cpu:.4f}s", 13)
            line += pad(build_group(cpu_opt, cpu_tag), pct_col_width()) + "  "
            line += asm_str
            print(line.rstrip())

        print(f"\t{args}:")
        report("compress", compress_results)
        report("decompress", decompress_results)

    prev_tag_name = tag.name

parser = argparse.ArgumentParser()
parser.add_argument("wav", help="Path to the .wav file to compress during benchmarking")
parser.add_argument("--current", action="store_true", help="Benchmark the current working tree as-is, without stashing or checking out tags")
cli_args = parser.parse_args()

# Tag deltas are only shown when benchmarking multiple tags, not in --current.
compare_tags = not cli_args.current

# Only clear old asm when benchmarking tags; --current keeps them so its asm
# can be compared against older versions.
if not cli_args.current:
    clean_asm()

# Copy the wav into build/ (untracked, so it survives git checkouts of older
# tags that predate the sample file) and point the benchmark at that copy.
os.makedirs("build", exist_ok=True)
wav_path = os.path.join("build", os.path.basename(cli_args.wav))
shutil.copyfile(cli_args.wav, wav_path)
cli_args.wav = wav_path

def benchmark_current():
    # The current working tree may be work in progress and fail to compile;
    # indicate that and exit cleanly instead of raising a traceback.
    try:
        benchmark_tag(TagInfo("current", "uncommitted"))
    except CompileError as e:
        print("'current' (uncommitted): build failed, skipping")
        print(e)

if cli_args.current:
    benchmark_current()
else:
    stash_output = execute("git stash")
    stashed = "No local changes to save" not in stash_output

    try:
        tags = execute("git for-each-ref refs/tags --sort=creatordate --format='%(refname:short) %(objectname:short)'").removesuffix("\n")
        tags = [TagInfo(name, commit) for name, commit in (t.split(' ') for t in tags.split('\n'))]

        # Size the tag-delta column to the longest tag name (the label is always
        # a previous tag's name, so tag names alone cover it).
        pct_tag_label_len = max((len(t.name) for t in tags), default=0)

        for tag in tags:
            execute(f"git checkout {tag.commit}")
            benchmark_tag(tag)
            execute("git checkout main")

    finally:
        # Always return to main before restoring the stash so it's applied on
        # the same base it was created from, then only pop if we actually stashed.
        execute("git checkout main")
        if stashed:
            execute("git stash pop")

    # Benchmark the (now restored) working tree last so tags can be compared
    # against the current in-progress version.
    benchmark_current()

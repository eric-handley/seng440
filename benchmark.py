#!/usr/bin/env python3

import subprocess
import shlex
import glob
import os
import shutil
import argparse
import signal
import time
from datetime import datetime
from dataclasses import dataclass

# Turn SIGTERM into a normal exception so it unwinds through the same try/finally
# cleanup (checkout main, restore stash) as Ctrl-C, instead of killing the
# process mid-checkout and leaving a detached HEAD / stashed changes behind.
def _handle_sigterm(signum, frame):
    raise KeyboardInterrupt

signal.signal(signal.SIGTERM, _handle_sigterm)

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

def benchmark_command(cmd: str):
    # Count CPU cycles with perf instead of measuring wall/CPU time: cycles is a
    # hardware counter, so unlike getrusage time it's immune to scheduler
    # quantization and CPU frequency scaling (1000 cycles is 1000 cycles at any
    # clock). We also grab task-clock, perf's CPU time counter, purely for a
    # human-readable seconds figure alongside the cycles. perf writes a CSV
    # summary to stderr with -x; the first field of each event's row is its count.
    #
    # task-clock is CPU time summed across all threads, so it stays flat (or
    # rises) when work is parallelised and hides any threading win. Wall time is
    # measured separately in Python around the whole subprocess: it's the elapsed
    # real time, which is what actually drops when threads run in parallel.
    command_list = ["perf", "stat", "-x", ",", "-e", "cycles,task-clock"] + shlex.split(cmd)
    wall_start = time.perf_counter()
    result = subprocess.run(command_list, capture_output=True, text=True, check=False)
    wall_time = time.perf_counter() - wall_start
    if result.returncode != 0:
        print(result.stderr)
        raise Exception(f"Command failed: {cmd}")

    cycles = None
    cpu_time = None
    for line in result.stderr.splitlines():
        fields = line.split(",")
        if len(fields) < 3:
            continue
        # perf appends an access modifier to the event name (e.g. "cycles:u" for
        # userspace-only counting at perf_event_paranoid >= 2), so drop the
        # ":<mods>" suffix before matching.
        event = fields[2].strip().split(":")[0]
        count = fields[0].strip()
        if event == "cycles":
            if count in ("<not counted>", "<not supported>"):
                raise Exception(f"perf could not count cycles: {line}")
            cycles = float(count)
        elif event == "task-clock":
            if count in ("<not counted>", "<not supported>"):
                raise Exception(f"perf could not count task-clock: {line}")
            # task-clock's raw CSV count is in nanoseconds; convert to seconds.
            cpu_time = float(count) / 1e9

    if cycles is None or cpu_time is None:
        raise Exception(f"Could not parse perf output:\n{result.stderr}")
    return cycles, cpu_time, wall_time

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

# GitHub renders inline math ($...$) with KaTeX, which honours \color but only
# with a hex value, not rgb(). These match a bright terminal green/red.
MD_GREEN = "#00c800"
MD_RED = "#ff0000"

def md_pct(value: float, baseline: float, as_speedup: bool = False) -> str:
    if as_speedup:
        # Speedup relative to baseline: value at 1/4 the baseline is 4x as fast,
        # shown as +300%. Unbounded upward, so big wins don't crush toward -100%
        # the way a plain % change does. Positive = faster = good (green).
        pct = (baseline / value - 1) * 100
        improved = pct > 0
    else:
        pct = (value - baseline) / baseline * 100
        improved = pct < 0
    colour = MD_GREEN if improved else MD_RED
    # \% escapes the percent sign inside math.
    return f"$\\color{{{colour}}}{{{pct:+.1f}\\%}}$"

def md_cell(entry) -> str:
    return entry or ""

# Each metric's value from the previous tag, used to report its delta against
# the tag benchmarked just before. cpu (cycles) and time (CPU seconds) are keyed
# by (opt_level, operation); asm line count is keyed by opt_level. prev_tag_name
# labels the delta.
prev_cpu = {}
prev_time = {}
prev_wall = {}
prev_asm = {}
prev_tag_name = None

# The baseline (first tag benchmarked) metric values, so every later tag can
# report its improvement over v1 as well as over the tag just before it. Keyed
# the same as the prev_* maps. base_tag_name labels the delta.
base_cpu = {}
base_time = {}
base_wall = {}
base_asm = {}
base_tag_name = None

# Each tag gets its own table under a heading naming it, so the tag isn't
# repeated in every row. The table is written row-by-row as benchmarking
# proceeds (rather than buffered and dumped at the end) so results can be watched
# building up live. Value columns hold the raw metric; each paired "Δ" column
# holds one colour-coded comparison. The comparison targets (the previous tag and
# the baseline tag) are fixed per table, so they name the column headers rather
# than repeating in every cell.
def build_md_header() -> str:
    prev = prev_tag_name or ""
    base = base_tag_name or ""
    return (
        "| build | op "
        f"|  | cycles   | Δ prev | {f"Δ '{prev}'" if prev else ""} | {f"Δ '{base}' O2" if base else ""} "
        f"|  | cpu time | Δ prev | {f"Δ '{prev}'" if prev else ""} | {f"Δ '{base}' O2" if base else ""} "
        f"|  | wall     | Δ prev | {f"Δ '{prev}'" if prev else ""} | {f"Δ '{base}' O2" if base else ""} "
        f"|  | asm      | Δ prev | {f"Δ '{prev}'" if prev else ""} | {f"Δ '{base}' O2" if base else ""} |\n"
        "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|"
    )

# The output file handle, opened once at startup below.
md_file = None

def write_md_row(row: str):
    md_file.write(row + "\n")
    md_file.flush()

def write_md_table_header(tag: TagInfo):
    md_file.write(f"\n## '{tag.name}' ({tag.commit})\n\n")
    write_md_row(build_md_header())

def benchmark_tag(tag: TagInfo):
    global prev_tag_name, base_tag_name

    print(f"Benchmarking '{tag.name}' ({tag.commit})...")
    write_md_table_header(tag)

    # The first tag benchmarked is the baseline everything else is compared to.
    is_base = compare_tags and base_tag_name is None
    if is_base:
        base_tag_name = tag.name

    # Each metric's previous-opt-level value for this tag, so a level can show
    # its improvement over the level immediately before it.
    prev_opt_cpu = {}
    prev_opt_time = {}
    prev_opt_wall = {}
    prev_opt_asm = 0

    for opt_level in range(0, 4):
        compress_results = []
        decompress_results = []
        args = f"-O{opt_level} -static -Iinc"

        asm_lines = build_asm(tag.name, opt_level)
        build_with_args(args)

        for _ in range(0, NUM_AVGING_RUNS):
            compress_results.append(benchmark_command(f"./build/out -c -i {cli_args.wav} -o build/compressed.wav"))
            decompress_results.append(benchmark_command("./build/out -d -i build/compressed.wav -o build/decompressed.wav"))

        # The v1 column compares against the baseline tag at O2 (a sane default
        # build; O0 is never shipped and inflates the deltas), so it's shown for
        # every non-baseline tag.
        show_v1 = not is_base
        md_asm_opt = md_cell(md_pct(asm_lines, prev_opt_asm) if opt_level > 0 else None)
        md_asm_tag = md_cell(md_pct(asm_lines, prev_asm[opt_level]) if opt_level in prev_asm else None)
        md_asm_v1 = md_cell(md_pct(asm_lines, base_asm[2]) if show_v1 and 2 in base_asm else None)
        if is_base:
            base_asm[opt_level] = asm_lines
        prev_asm[opt_level] = asm_lines
        prev_opt_asm = asm_lines

        def report(operation: str, results):
            cpu = sum(r[0] for r in results) / NUM_AVGING_RUNS
            cpu_time = sum(r[1] for r in results) / NUM_AVGING_RUNS
            wall = sum(r[2] for r in results) / NUM_AVGING_RUNS

            key = (opt_level, operation)
            base_key = (2, operation)

            md_cpu_opt = md_cell(md_pct(cpu, prev_opt_cpu[operation], as_speedup=True) if opt_level > 0 else None)
            md_cpu_tag = md_cell(md_pct(cpu, prev_cpu[key], as_speedup=True) if key in prev_cpu else None)
            md_cpu_v1 = md_cell(md_pct(cpu, base_cpu[base_key], as_speedup=True) if show_v1 and base_key in base_cpu else None)
            if is_base:
                base_cpu[key] = cpu
            prev_cpu[key] = cpu
            prev_opt_cpu[operation] = cpu

            md_time_opt = md_cell(md_pct(cpu_time, prev_opt_time[operation]) if opt_level > 0 else None)
            md_time_tag = md_cell(md_pct(cpu_time, prev_time[key]) if key in prev_time else None)
            md_time_v1 = md_cell(md_pct(cpu_time, base_time[base_key]) if show_v1 and base_key in base_time else None)
            if is_base:
                base_time[key] = cpu_time
            prev_time[key] = cpu_time
            prev_opt_time[operation] = cpu_time

            md_wall_opt = md_cell(md_pct(wall, prev_opt_wall[operation]) if opt_level > 0 else None)
            md_wall_tag = md_cell(md_pct(wall, prev_wall[key]) if key in prev_wall else None)
            md_wall_v1 = md_cell(md_pct(wall, base_wall[base_key]) if show_v1 and base_key in base_wall else None)
            if is_base:
                base_wall[key] = wall
            prev_wall[key] = wall
            prev_opt_wall[operation] = wall

            # Only the compress row labels the build; the decompress row beneath
            # it shares the same one, so its build cell is left blank.
            build_cell = f"O{opt_level}" if operation == "compress" else ""
            write_md_row(
                f"| {build_cell} | {operation} "
                f"|  | {cpu:,.0f} | {md_cpu_opt} | {md_cpu_tag} | {md_cpu_v1} "
                f"|  | {cpu_time:.4f}s | {md_time_opt} | {md_time_tag} | {md_time_v1} "
                f"|  | {wall:.4f}s | {md_wall_opt} | {md_wall_tag} | {md_wall_v1} "
                f"|  | {asm_lines} | {md_asm_opt} | {md_asm_tag} | {md_asm_v1} |"
            )

        report("compress", compress_results)
        report("decompress", decompress_results)

        print(f"    - Completed level O{opt_level}")

    prev_tag_name = tag.name

parser = argparse.ArgumentParser()
parser.add_argument("wav", help="Path to the .wav file to compress during benchmarking")
parser.add_argument("--current", action="store_true", help="Benchmark the current working tree as-is, without stashing or checking out tags")
parser.add_argument("--exclude-current", action="store_true", help="When benchmarking tags, skip benchmarking the current working tree at the end")
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

# Open the output file up front so each tag's table can be appended (and flushed)
# as it completes and watched building up live.
out_file = f"benchmark-{datetime.now().strftime('%Y-%m-%d_%H-%M-%S')}.md"
md_file = open(out_file, "w")
print(f"Writing results to {out_file}")

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
    # against the current in-progress version, unless --exclude-current.
    if not cli_args.exclude_current:
        benchmark_current()

md_file.close()
print(f"Wrote results to {out_file}")

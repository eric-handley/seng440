#!/usr/bin/env python3

import subprocess
import shlex
import sys
import glob
import os
import time
import resource
import argparse
from dataclasses import dataclass

NUM_AVGING_RUNS = 3

@dataclass
class TagStats:
    name: str
    commit: str
    wall_time: float = 0.0
    cpu_time: float = 0.0

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
    execute("gcc " + " ".join(sources) + " -o build/out " + args)
    execute("chmod a+x build/out")

def benchmark_tag(tag: TagStats):
    print(f"'{tag.name}' ({tag.commit}):")

    for opt_level in range(0, 4):
        run_results = []
        args = f"-O{opt_level} -static -Iinc"

        for i in range(0, NUM_AVGING_RUNS):

            build_with_args(args)

            run_results.append(benchmark_command("./build/out -c -i samples/untitled.wav -o build/compressed.wav"))

        tag.wall_time = sum(r[0] for r in run_results) / NUM_AVGING_RUNS
        tag.cpu_time = sum(r[1] for r in run_results) / NUM_AVGING_RUNS
        print(f"\t{args}:\twall: {tag.wall_time:.4f}s  cpu: {tag.cpu_time:.4f}s")

parser = argparse.ArgumentParser()
parser.add_argument("--current", action="store_true", help="Benchmark the current working tree as-is, without stashing or checking out tags")
cli_args = parser.parse_args()

if cli_args.current:
    benchmark_tag(TagStats("current", "uncommitted"))
else:
    execute("git stash")

    try:
        tags = execute("git for-each-ref refs/tags --format='%(refname:short) %(objectname:short)'").removesuffix("\n")
        tags = [TagStats(name, commit) for name, commit in (t.split(' ') for t in tags.split('\n'))]

        for tag in tags:
            execute(f"git checkout {tag.commit}")
            benchmark_tag(tag)

    finally:
        execute("git checkout main")
        
        try: # If there's no changes to stash at the beginning, this will fail
            execute("git stash pop")
        except:
            pass

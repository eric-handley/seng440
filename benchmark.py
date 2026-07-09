#!/usr/bin/env python3

import subprocess
import shlex
import sys

def execute(command_str: str):
    command_list = shlex.split(command_str)

    result = subprocess.run(command_list, capture_output=True, text=True, check=False)   

    if result.stderr:
        print(result.stderr)
        raise Exception

    return result.stdout

execute("git stash")

try:
    tags = execute("git for-each-ref refs/tags --format='%(refname:short) %(objectname:short)'").removesuffix("\n")

    for pair in [t.split(' ') for t in tags.split('\n')]:
        execute(f"git checkout {pair[1]}")
        print(execute(f"git status"))
        print(execute("gcc \"$(find . -name *.c -print)\" -o build/out"))
        
finally:
    execute("git checkout main")
    execute("git stash pop")

#!python3

from sys import argv, exit
from os import getcwd
from pathlib import Path
from runpy import run_path


from subprocess import run

script_dir = Path(__file__).resolve().parent
base_dir = Path(script_dir).parent

print(f"Running `make all` under {base_dir}")

result = run(
    ["make", "all"],
    cwd=base_dir,
    capture_output=True,
    text=True
    )

print(result.stdout)
print(result.stderr)
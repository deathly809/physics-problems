#!python3

from sys import argv, exit
from os import getcwd
from pathlib import Path
from runpy import run_path

if len(argv) > 1:
    print("usage: build.py [Filter]")
    exit(1)

if (len(argv) == 2):
    filter = argv[1]
else:
    filter = ""

pattern = 'build.py'
script_dir = Path(__file__).resolve().parent
base_dir = Path(script_dir).parent.joinpath("subjects")

print(f"Searching under {base_dir}")

matching_files = [str(file) for file in base_dir.rglob(pattern) if file.is_file()]



for matching_file in matching_files:
    if filter in matching_file:
        print(f"Running {matching_file}")
        run_path(matching_file)
    else:
        print(f"Skipping {matching_file}")
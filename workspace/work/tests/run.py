"""Run every source fixture; a failed child must fail the whole batch."""
from pathlib import Path
import subprocess
import sys

tests = sorted(Path(__file__).resolve().parent.glob('test_*.py'))
assert tests, 'No renderer fixtures found'
for test in tests:
    print('RUN', test.name, flush=True)
    subprocess.run([sys.executable, str(test)], check=True)
print('PASS: all', len(tests), 'fixtures', flush=True)

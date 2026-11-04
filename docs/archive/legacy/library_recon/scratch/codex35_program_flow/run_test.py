"""All-nine-method source CPU comparison; no unmatched-body byte credit."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex31_program/run_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '64f33748c44be6f37c5f3ec729bd39545213eabc8a5112e84f4d124ca50e8467'
source = prior.read_text().replace('codex31_program', 'codex35_program_flow')
source = source.replace('program_matched', 'flow').replace('program.cpp', 'flow.cpp')
source = source.replace('== 12', '== 10').replace('>= 12', '>= 10')
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'run_test.py'), '__name__': '__main__'})

"""Reuse pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_duplicates/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '4a7dfb95dd363a242e08fefe495c04a9b49178a710c1fcb3685187fdee207d9e'
source = prior.read_text()
source = source.replace('codex35_program_duplicates', 'codex35_instruction_duplicates')
source = source.replace('codex_shader_program_duplicates/duplicates.cpp', 'codex_shader_instruction_duplicates/instructions.cpp')
source = source.replace('== 224', '== 227')
source = source.replace('== 244', '== 247')
source = source.replace('duplicates.obj', 'instructions.obj')
source = source.replace('Three-method clean duplicate-argument cohort', 'Three-method clean duplicate-instruction cohort')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

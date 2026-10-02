"""Reuse pinned complete gates for uniform-pruning integration."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_varying/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '2593f7ae18d64df61949d80d657c4c536d869aca0378323a58763c2c508c009b'
source = prior.read_text()
source = source.replace('codex35_program_varying', 'codex35_program_pruning')
source = source.replace('codex_shader_program_varying/varying.cpp', 'codex_shader_program_pruning/pruning.cpp')
source = source.replace('== 214', '== 215')
source = source.replace('== 234', '== 235')
source = source.replace("len(proof['rows']) == 2", "len(proof['rows']) == 1")
source = source.replace('len(cohort_names) == 2', 'len(cohort_names) == 1')
source = source.replace('varying.obj', 'pruning.obj')
source = source.replace('Two-method clean varying cohort', 'One-method clean uniform-pruning cohort')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

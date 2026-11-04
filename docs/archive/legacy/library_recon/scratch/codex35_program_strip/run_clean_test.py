"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_pruning/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'b58f8fd149be0b7dae3562ae4929fa7930ee7d5a57363f417497009b9d0d5f54'
source = prior.read_text()
source = source.replace('codex35_program_pruning', 'codex35_program_strip')
source = source.replace('codex_shader_program_pruning/pruning.cpp', 'codex_shader_program_strip/strip.cpp')
source = source.replace('== 215', '== 220')
source = source.replace('== 235', '== 240')
source = source.replace("len(proof['rows']) == 1", "len(proof['rows']) == 5")
source = source.replace('len(cohort_names) == 1', 'len(cohort_names) == 5')
source = source.replace('pruning.obj', 'strip.obj')
source = source.replace('One-method clean uniform-pruning cohort', 'Five-method clean varying-pruning/accessor cohort')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

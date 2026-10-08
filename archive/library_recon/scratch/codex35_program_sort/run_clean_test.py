"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_strip/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'e595ff10df35d0d9940684c844b87034fc0a6087ea4962f7500233b227211b16'
source = prior.read_text()
source = source.replace('codex35_program_strip', 'codex35_program_sort')
source = source.replace('codex_shader_program_strip/strip.cpp', 'codex_shader_program_sort/sort.cpp')
source = source.replace('== 220', '== 221')
source = source.replace('== 240', '== 241')
source = source.replace("len(proof['rows']) == 5", "len(proof['rows']) == 1")
source = source.replace('len(cohort_names) == 5', 'len(cohort_names) == 1')
source = source.replace('strip.obj', 'sort.obj')
source = source.replace('Five-method clean varying-pruning/accessor cohort', 'One-method clean heap-sort cohort')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

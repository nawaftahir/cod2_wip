"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_sort/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'f101ea0df21fef25ea9f324291f646d4c4dd85cd65b76cddc5bddde1e2255d4f'
source = prior.read_text()
source = source.replace('codex35_program_sort', 'codex35_program_duplicates')
source = source.replace('codex_shader_program_sort/sort.cpp', 'codex_shader_program_duplicates/duplicates.cpp')
source = source.replace('== 221', '== 224')
source = source.replace('== 241', '== 244')
source = source.replace("len(proof['rows']) == 1", "len(proof['rows']) == 3")
source = source.replace('len(cohort_names) == 1', 'len(cohort_names) == 3')
source = source.replace('sort.obj', 'duplicates.obj')
source = source.replace('One-method clean heap-sort cohort', 'Three-method clean duplicate-argument cohort')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

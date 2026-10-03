"""Replay full CPU outputs with exact four-helper ownership."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_order/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'b0413cc0f8b8352c34996c136654d5e0d90bf79f4c788469b8d1e38383fd5b7a'
source = prior.read_text()
source = source.replace('codex35_program_order', 'codex35_pool_helpers')
source = source.replace('codex_shader_program_order/program_order.cpp', 'codex_shader_pool_helpers/pool_helpers.cpp')
source = source.replace('== 279', '== 283').replace('== 259', '== 263')
source = source.replace("len(proof['rows']) == 8", "len(proof['rows']) == 4").replace('len(cohort_names) == 8', 'len(cohort_names) == 4')
source = source.replace('program_order.obj', 'pool_helpers.obj')
source = source.replace('Eight-body ordering and transform-context cohort', 'Four-body register-pool helper cohort')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

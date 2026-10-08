"""Replay complete original/source CPU outputs with exact driver ownership."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_helpers/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '278992e554048b26f7cb30647447d75d89b78558dde61b218018b5464c31c7a9'
source = prior.read_text().replace('codex35_pool_helpers', 'codex32_program_diagnostics')
source = source.replace('codex_shader_pool_helpers/pool_helpers.cpp', 'codex_shader_program_diagnostics/diagnostics.cpp')
source = source.replace('== 283', '== 289').replace('== 263', '== 269')
source = source.replace("len(proof['rows']) == 4", "len(proof['rows']) == 4").replace('len(cohort_names) == 4', 'len(cohort_names) == 4')
source = source.replace('pool_helpers.obj', 'diagnostics.obj')
source = source.replace('Four-body register-pool helper cohort', 'Two-body program-driver cohort')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

"""Replay complete original/source CPU outputs with exact driver ownership."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ffb1d0f67b40e10372624f7ce90eb203d48852bdaebce68ec77bdf3689681e6a'
source = prior.read_text().replace('codex35_program_flow', 'codex35_register_split')
source = source.replace('codex_shader_program_flow/flow.cpp', 'codex_shader_register_split/register_split.cpp')
source = source.replace('== 232', '== 301').replace('== 212', '== 281')
source = source.replace("len(proof['rows']) == 4", "len(proof['rows']) == 2").replace('len(cohort_names) == 4', 'len(cohort_names) == 2')
source = source.replace('flow.obj', 'register_split.obj')
source = source.replace('Four-body register-pool helper cohort', 'Two-body program-driver cohort')
source = source.replace('source = prior.read_text()', '''source = prior.read_text().replace("'__file__': str(HERE / 'run_test.py')", "'__file__': str(HERE / 'run_clean_test.py')")''')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

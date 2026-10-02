"""Reuse full-output CPU comparison with two-method source ownership."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ffb1d0f67b40e10372624f7ce90eb203d48852bdaebce68ec77bdf3689681e6a'
source = prior.read_text().replace('codex35_program_flow', 'codex35_program_varying').replace('codex_shader_program_flow/flow.cpp', 'codex_shader_program_varying/varying.cpp')
source = source.replace('== 212', '== 214').replace('== 232', '== 234').replace("len(proof['rows']) == 4", "len(proof['rows']) == 2").replace('len(cohort_names) == 4', 'len(cohort_names) == 2').replace('libraries/flow.obj', 'libraries/varying.obj').replace("'flow.obj' if mode", "'varying.obj' if mode").replace('Four-method clean program-flow cohort', 'Two-method clean varying cohort')
source = source.replace('source = prior.read_text()', '''source = prior.read_text().replace("'__file__': str(HERE / 'run_test.py')", "'__file__': str(HERE / 'run_clean_test.py')")''')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

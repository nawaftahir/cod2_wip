"""Replay unchanged full CPU gates with explicit new-cohort ownership."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ffb1d0f67b40e10372624f7ce90eb203d48852bdaebce68ec77bdf3689681e6a'
source = prior.read_text()
source = source.replace('codex35_program_flow', 'codex35_predicate_order')
source = source.replace('codex_shader_program_flow/flow.cpp', 'codex_shader_predicate_order/predicate.cpp')
source = source.replace('== 232', '== 271')
source = source.replace('== 212', '== 251')
source = source.replace("len(proof['rows']) == 4", "len(proof['rows']) == 1")
source = source.replace('len(cohort_names) == 4', 'len(cohort_names) == 1')
source = source.replace('flow.obj', 'predicate.obj')
source = source.replace('Four-method clean program-flow cohort', 'Single-method clean predicate-ordering cohort')
source = source.replace('source = prior.read_text()', '''source = prior.read_text().replace("'__file__': str(HERE / 'run_test.py')", "'__file__': str(HERE / 'run_clean_test.py')")''')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

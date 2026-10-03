"""Replay unchanged full CPU gates with explicit new-cohort ownership."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ffb1d0f67b40e10372624f7ce90eb203d48852bdaebce68ec77bdf3689681e6a'
source = prior.read_text()
source = source.replace('codex35_program_flow', 'codex35_program_coalesce')
source = source.replace('codex_shader_program_flow/flow.cpp', 'codex_shader_program_coalesce/coalesce.cpp')
source = source.replace('== 232', '== 252')
source = source.replace('== 212', '== 232')
source = source.replace("len(proof['rows']) == 4", "len(proof['rows']) == 3")
source = source.replace('len(cohort_names) == 4', 'len(cohort_names) == 3')
source = source.replace('flow.obj', 'coalesce.obj')
source = source.replace('Four-method clean program-flow cohort', 'Three-method clean pool/predicate/swizzle cohort')
source = source.replace('source = prior.read_text()', '''source = prior.read_text().replace("'__file__': str(HERE / 'run_test.py')", "'__file__': str(HERE / 'run_clean_test.py')")''')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

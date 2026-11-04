"""Reuse pinned complete parent gates for the ordering source cohort."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_predicate_order/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'd95322326cd48ff0ae5a4337c8c3da985d3530ef9616e7065dcab0f942907321'
source = prior.read_text()
source = source.replace('codex35_predicate_order', 'codex35_program_order')
source = source.replace('codex_shader_predicate_order/predicate.cpp', 'codex_shader_program_order/program_order.cpp')
source = source.replace('== 271', '== 279').replace('== 251', '== 259')
source = source.replace("len(proof['rows']) == 1", "len(proof['rows']) == 8").replace('len(cohort_names) == 1', 'len(cohort_names) == 8')
source = source.replace('predicate.obj', 'program_order.obj')
source = source.replace('Single-method clean predicate-ordering cohort', 'Eight-body ordering and transform-context cohort')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

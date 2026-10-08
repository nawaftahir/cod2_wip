"""Select the original SDK dependencies, replacing only the evaluator."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_parser/select_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8fc5e16e488acfd1d675e4970ac921376405858c14914c6bf348ec681b51e692'
source = prior.read_text()
for before, after in [
    ('codex30_parser', 'codex35_parse_casts'),
    ("('d3dxtok', 'd3dxasm', 'd3dxshader', 'instruction_predicates', 'shader_native_constants')", "('casts',)"),
    ('len(replacements) == 40', 'len(replacements) == 2'),
]:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_dependencies.py'), '__name__': '__main__'})

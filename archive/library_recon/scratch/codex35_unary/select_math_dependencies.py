"""Select opaque SDK dependencies for three experimental source definition."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_parser/select_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8fc5e16e488acfd1d675e4970ac921376405858c14914c6bf348ec681b51e692'
source = prior.read_text().replace('codex30_parser', 'codex35_unary_math')
source = source.replace("('d3dxtok', 'd3dxasm', 'd3dxshader', 'instruction_predicates', 'shader_native_constants')", "('math',)")
source = source.replace('len(replacements) == 40', 'len(replacements) == 3')
source = source.replace("run / 'libraries'", "HERE / 'obj'")
source = source.replace("'dependency_selection.json'", "'math_dependency_selection.json'")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_math_dependencies.py'), '__name__': '__main__'})

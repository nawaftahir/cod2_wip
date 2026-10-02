"""Reuse the strict selector; five experimental definitions are replaced."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_parser/select_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8fc5e16e488acfd1d675e4970ac921376405858c14914c6bf348ec681b51e692'
source = prior.read_text().replace('codex30_parser', 'codex35_expression')
source = source.replace("('d3dxtok', 'd3dxasm', 'd3dxshader', 'instruction_predicates', 'shader_native_constants')", "('expression', 'helpers')")
source = source.replace('len(replacements) == 40', 'len(replacements) == 5')
source = source.replace("run / 'libraries'", "HERE / 'obj'")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_dependencies.py'), '__name__': '__main__'})

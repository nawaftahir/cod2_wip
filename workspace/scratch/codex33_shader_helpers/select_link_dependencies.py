"""Strict dependency selection; identical standard-ABI private mask helper."""
import ast
import hashlib
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex33_constant_table/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '5093ebc61b38464f0004c7233a5cd48973c3a9bffcbf185b2699d7f3633a0243'
source = prior.read_text()
while True:
    tree = ast.parse(source, str(prior))
    if any(isinstance(n, ast.FunctionDef) and n.name == 'main' for n in tree.body):
        break
    last = tree.body[-1]
    assert isinstance(last, ast.Expr) and isinstance(last.value, ast.Call)
    assert isinstance(last.value.func, ast.Name) and last.value.func.id == 'exec'
    scope = {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'}
    exec(compile(ast.Module(body=tree.body[:-1], type_ignores=[]), str(prior), 'exec'), scope)
    source, prior = scope['source'], scope['prior']
for before, after in [
    ('codex33_constant_table', 'codex33_shader_helpers'),
    ("'casts', 'matched'):", "'casts', 'matched', 'native_helpers'):"),
    ('len(replacements) == 337', 'len(replacements) == 342'),
    ("callbacks = {", "callbacks = {'?IsValidWriteMask@D3DXShader@@YGHPAIK@Z': ('native_helpers.obj', 107), "),
]:
    assert before in source, before
    source = source.replace(before, after)
if '--cpu' in sys.argv:
    source = source.replace('codex33_shader_helpers', 'codex33_shader_helpers/fixture')
    source = source.replace('len(replacements) == 342', 'len(replacements) == 5')
    source = source.replace('len(coalesced) == 1', 'len(coalesced) == 0')
    source = source.replace('link_dependency_selection.json', 'fixture_dependency_selection.json')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

"""Retain700 preceding matches; complete body and binding proof for five helpers."""
import ast
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex33_constant_table/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'e84013855fb4c3f9a2173ff9d37209bb969c96df11a3c96d48349afc6c62bfc2'
source = prior.read_text()
while True:
    tree = ast.parse(source, str(prior))
    if any(isinstance(n, ast.FunctionDef) and n.name == 'main' for n in tree.body):
        break
    last = tree.body[-1]
    assert isinstance(last, ast.Expr) and isinstance(last.value, ast.Call)
    assert isinstance(last.value.func, ast.Name) and last.value.func.id == 'exec'
    scope = {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'}
    exec(compile(ast.Module(body=tree.body[:-1], type_ignores=[]), str(prior), 'exec'), scope)
    source, prior = scope['source'], scope['prior']
for before, after in [
    ('build/codex33_constant_table', 'build/codex33_shader_helpers'),
    ('build/codex35_parse_casts', 'build/codex33_constant_table'),
    ('== 668', '== 700'),
    ("'baseline_source_matches': 668", "'baseline_source_matches': 700"),
    ('all 668 previous', 'all 700 previous'),
    ('== 46546', '== 47162'),
    ("'codex35_parse_casts'):", "'codex35_parse_casts', 'codex33_constant_table'):"),
]:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})

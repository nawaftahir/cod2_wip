"""Retain 668 preceding source matches and prove the new 30 linked bodies."""
import hashlib
import ast
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_parse_casts/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '71045be750bb398ad63fecf74a4fad7dbace637b59d84edfabf001045a7ade75'
source = prior.read_text()
# Evaluate only the existing hash-pinned wrapper setup. Apply this cohort's
# substitutions to the final checker, never to quoted wrapper substitutions.
while True:
    tree = ast.parse(source, str(prior))
    if any(isinstance(node, ast.FunctionDef) and node.name == 'main' for node in tree.body):
        break
    last = tree.body[-1]
    assert isinstance(last, ast.Expr) and isinstance(last.value, ast.Call)
    assert isinstance(last.value.func, ast.Name) and last.value.func.id == 'exec'
    scope = {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'}
    setup = ast.Module(body=tree.body[:-1], type_ignores=[])
    exec(compile(setup, str(prior), 'exec'), scope)
    source, prior = scope['source'], scope['prior']
changes = [
    ('build/codex35_parse_casts', 'build/codex33_constant_table'),
    ('build/codex35_shader_buffers', 'build/codex35_parse_casts'),
    ('== 666', '== 668'),
    ("'baseline_source_matches': 666", "'baseline_source_matches': 668"),
    ('all 666 previous', 'all 668 previous'),
    ('== 42642', '== 46546'),
    ("'codex35_shader_buffers'):", "'codex35_shader_buffers', 'codex35_parse_casts'):"),
    ("locator_only = {", "locator_only = {'??_GCConstant@D3DXShader@@QAEPAXI@Z': 33, '?TypeSize@D3DXShader@@YGXPAVCConstantTable@1@PAU_D3DXSHADER_CONSTANTINFO@@PAU_D3DXSHADER_TYPEINFO@@IPAI3@Z': 187, '??1CConstant@D3DXShader@@QAE@XZ': 142, '?SetScratch@CConstant@D3DXShader@@QAEJPAK@Z': 108, "),
    ("row['name'] in locator_only and not row['hits']", "row['name'] in locator_only and (not row['hits'] or row['name'] == '??_GCConstant@D3DXShader@@QAEPAXI@Z')"),
]
for before, after in changes:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})

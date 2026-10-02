"""Strict scratch V2 for clipping plus its already-accepted temporary callee."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '1ffb58a461240fe7153c93d6d34eadf68787b2f216f28d460d96a94f389c1e23'
source = prior.read_text()
changes = [
    ('codex_shader_compiler', 'codex_shader_clip'),
    ('build/codex35_compiler/libraries', 'build/codex35_clip/libraries'),
    ("compiler.obj' if CLEAN else 'compiler_matched.obj", "clip.obj' if CLEAN else 'clip_matched.obj"),
    ("'compiler' if CLEAN else 'compiler_matched'", "'clip' if CLEAN else 'clip_matched'"),
    ('assert len(functions) == 8', 'assert len(functions) == 2'),
    ('?Scratch@CCompiler@D3DXShader@@IAEPAII@Z', '?EmitClip@CCompiler@D3DXShader@@IAEJPAVCNode@2@PAII@Z'),
    ("[SOURCES / (prefix + '.cpp'), ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp']",
     "[SOURCES / (prefix + '.cpp'), SOURCES / 'expression.h', ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp']"),
]
for before, after in changes:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

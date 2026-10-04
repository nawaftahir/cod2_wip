"""Reuse complete typed/boundary/literal/runtime proof for the two casts."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '1ffb58a461240fe7153c93d6d34eadf68787b2f216f28d460d96a94f389c1e23'
source = prior.read_text()
for before, after in [
    ('codex_shader_compiler', 'codex_shader_parse_casts'),
    ('build/codex35_compiler/libraries', 'build/codex35_parse_casts/libraries'),
    ('compiler_matched.obj', 'casts.obj'),
    ('compiler.obj', 'casts.obj'),
    ('assert len(functions) == 8', 'assert len(functions) == 2'),
    ("prefix = 'compiler' if CLEAN else 'compiler_matched'", "prefix = 'casts'"),
    ("floating = list(members(crt_path.read_bytes()))[721]", "floating = list(members(crt_path.read_bytes()))[721]\\n    conversion = list(members(crt_path.read_bytes()))[686]"),
    ("pins = [", "pins = [('__ftol', '?AddArgument@CBaseProgram@D3DXShader@@QAEIPAVCArgument@2@@Z', None, None),"),
    ("dependency = floating", "dependency = conversion if name == '__ftol' else floating"),
]:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

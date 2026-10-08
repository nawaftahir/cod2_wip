"""Complete proof of AddArgument356/CopyArgument82; existing destructor32 is duplicate."""
import hashlib
import sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d'
source = prior.read_text().replace('codex35_program_flow', 'codex35_argument_alloc').replace('codex_shader_program_flow', 'codex_shader_argument_alloc')
source = source.replace('flow_matched.obj', 'argument_alloc.obj').replace('flow.obj', 'argument_alloc.obj')
source = source.replace("prefix = 'flow' if CLEAN else 'flow_matched'", "prefix = 'argument_alloc'")
source = source.replace('assert len(functions) == 4', 'assert len(functions) == 3')
marker = "exec(compile(source, str(prior), 'exec'),"
runtime_overrides = '''overrides.extend([
    ("floating = list(members(crt_path.read_bytes()))[721]", "floating = list(members(crt_path.read_bytes()))[721]\\n    conversion = list(members(crt_path.read_bytes()))[686]"),
    ("pins = [", "pins = [('__ftol', '?AddArgument@CBaseProgram@D3DXShader@@QAEIPAVCArgument@2@@Z', None, None),"),
    ("dependency = floating", "dependency = conversion if name == '__ftol' else floating"),
])
'''
assert source.count(marker) == 1
source = source.replace(marker, runtime_overrides + marker)
if '--draft' in sys.argv:
    marker = "exec(compile(source, str(prior), 'exec'),"
    extra = """overrides.append(("SOURCES = ROOT / 'gfx/target/src/codex_shader_argument_alloc' if CLEAN else HERE", "SOURCES = HERE"))\n"""
    assert source.count(marker) == 1
    source = source.replace(marker, extra + marker)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

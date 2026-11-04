"""Complete typed proof of the two special/literal source bodies."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d'
source = prior.read_text().replace('codex35_program_flow', 'codex32_swizzle').replace('codex_shader_program_flow', 'codex_shader_swizzle')
source = source.replace('flow_matched.obj', 'swizzle.obj').replace('flow.obj', 'swizzle.obj')
source = source.replace("prefix = 'flow' if CLEAN else 'flow_matched'", "prefix = 'swizzle'")
source = source.replace('assert len(functions) == 4', 'assert len(functions) == 1')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

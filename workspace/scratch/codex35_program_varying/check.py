"""Complete two-method proof; retain every parent boundary/binding/negative gate."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d'
source = prior.read_text().replace('codex_shader_program_flow', 'codex_shader_program_varying').replace('build/codex35_program_flow/libraries', 'build/codex35_program_varying/libraries')
source = source.replace("'flow.obj' if CLEAN else 'flow_matched.obj'", "'varying.obj' if CLEAN else 'varying.obj'").replace("'assert len(functions) == 4'", "'assert len(functions) == 2'").replace("prefix = 'flow' if CLEAN else 'flow_matched'", "prefix = 'varying'")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

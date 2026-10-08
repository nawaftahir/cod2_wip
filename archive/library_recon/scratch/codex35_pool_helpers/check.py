"""Reuse pinned complete body, typed binding and negative-test gates."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d'
source = prior.read_text()
source = source.replace('codex35_program_flow', 'codex35_pool_helpers')
source = source.replace('codex_shader_program_flow', 'codex_shader_pool_helpers')
source = source.replace('flow_matched.obj', 'pool_helpers.obj').replace('flow.obj', 'pool_helpers.obj')
source = source.replace("prefix = 'flow' if CLEAN else 'flow_matched'", "prefix = 'pool_helpers'")
source = source.replace('complete source program-flow bodies', 'complete source register-pool helper bodies')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

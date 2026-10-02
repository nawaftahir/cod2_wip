"""Reuse pinned complete gates for uniform-pruning integration."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_varying/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '3e4a4abdfe093d6acec180fce92654e9b15939abe649ae43d0219c22504ad4be'
source = prior.read_text()
source = source.replace('codex35_program_varying', 'codex35_program_pruning')
source = source.replace('codex_shader_program_varying', 'codex_shader_program_pruning')
source = source.replace('varying.obj', 'pruning.obj')
source = source.replace("prefix = 'varying'", "prefix = 'pruning'")
source = source.replace('assert len(functions) == 2', 'assert len(functions) == 1')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

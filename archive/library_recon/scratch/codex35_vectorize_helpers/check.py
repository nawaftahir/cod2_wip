"""Reuse pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_instruction_duplicates/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8eef2b8e1aa771e0b286b0c483a6c7ef64dd34ba5d48f0d3aec8a60059c3ea07'
source = prior.read_text()
source = source.replace('codex35_instruction_duplicates', 'codex35_vectorize_helpers')
source = source.replace('codex_shader_instruction_duplicates', 'codex_shader_vectorize_helpers')
source = source.replace('instructions.obj', 'helpers.obj')
source = source.replace("prefix = 'instructions'", "prefix = 'helpers'")
source = source.replace('assert len(functions) == 3', 'assert len(functions) == 2')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

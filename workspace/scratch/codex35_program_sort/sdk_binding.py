"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_strip/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '3222ef0e76d4f60cece65298c096a8af564258709b59434df83491ca963b8aa0'
source = prior.read_text()
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

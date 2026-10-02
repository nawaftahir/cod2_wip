"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_sort/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '01b2c27438ec8d705e63b325167987aa05342263d331c09a6e68c200d6e1086c'
source = prior.read_text()
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

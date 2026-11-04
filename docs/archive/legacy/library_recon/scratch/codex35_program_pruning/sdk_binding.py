"""Reuse pinned complete gates for uniform-pruning integration."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_varying/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '86c3f1cce75c47874c8f0d28ce0c97789b5394b1a3bb8ccdef048e260dbb707c'
source = prior.read_text()
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

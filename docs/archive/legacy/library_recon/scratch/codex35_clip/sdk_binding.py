"""Reuse the pinned binding entrypoint without changing its gates."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/sdk_binding.py'
source = prior.read_text()
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

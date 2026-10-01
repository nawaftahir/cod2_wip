"""Retain the prior node-vtable proof against the new private image."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_assembler/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8da29b66d6b3e22d6a0c283d049240bed6ac6f3e1557a97d94966c94a6ec3f56'
source = prior.read_text().replace('build/codex30_assembler', 'build/codex35_preprocessor')
__file__ = str(prior)
exec(compile(source, str(prior), 'exec'), globals())

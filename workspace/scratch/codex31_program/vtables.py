"""Reuse the complete typed vtable checks; vtables add no source credit."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler_types/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'cbf165a0f317e882ffc91eaca082ea3bb7a715826a0a24ef610218f06831b730'
exec(compile(prior.read_text().replace('codex35_compiler_types', 'codex31_program'), str(prior), 'exec'), globals())

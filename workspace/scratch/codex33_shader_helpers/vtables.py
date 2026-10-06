"""Reuse independently proved retained SDK table extents, with zero credit."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex33_constant_table/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'dda6f091d1bceb17f4833577ac1896f87aa3f0eed705f732b76e51234b8c9bb6'
source = prior.read_text().replace('codex33_constant_table', 'codex33_shader_helpers')
exec(compile(source, str(prior), 'exec'), globals())

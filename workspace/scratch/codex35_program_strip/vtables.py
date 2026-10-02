"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_pruning/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '0a33a985b4bff6b7f853cf48b0ab816e04beca1eacac5fcdfa92e1917e9530ed'
source = prior.read_text()
source = source.replace('codex35_program_pruning', 'codex35_program_strip')
exec(compile(source, str(prior), 'exec'), globals())

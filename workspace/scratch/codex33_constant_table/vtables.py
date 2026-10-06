"""Retained SDK table locators; opaque dependencies receive zero credit."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_parse_casts/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '5735cd4b43d991980d45d8e653e20349880136b5399d2adec27e74dc483ade5d'
source = prior.read_text().replace('codex35_parse_casts', 'codex33_constant_table')
exec(compile(source, str(prior), 'exec'), globals())

"""Reuse pinned complete gates for uniform-pruning integration."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_varying/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'b1a051cff4026c84c502ea7d1287a3975879608d5922074d016cf4da93563426'
source = prior.read_text()
source = source.replace('codex35_program_varying', 'codex35_program_pruning')
exec(compile(source, str(prior), 'exec'), globals())

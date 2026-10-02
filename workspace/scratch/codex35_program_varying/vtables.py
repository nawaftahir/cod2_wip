"""Reuse complete vtables and destructor locators in the new private link."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '0471ea47f47b1737f68b733137698b19a6cd73e339fcaeb01e75ec5c719d1909'
source = prior.read_text().replace("'codex31_program', 'codex35_program_flow'", "'codex31_program', 'codex35_program_varying'")
exec(compile(source, str(prior), 'exec'), globals())

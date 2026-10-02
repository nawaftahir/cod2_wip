"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_sort/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '9128978f55edae4b6ef5d6cdf18615d40931c36758980fb04e431ac6c62cb2df'
source = prior.read_text()
source = source.replace('codex35_program_sort', 'codex35_program_duplicates')
exec(compile(source, str(prior), 'exec'), globals())

"""Reuse pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_duplicates/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'b7b78ef336cc7c648b3613cfb0b4bf89fd30ad6af699340456cd0a480998dceb'
source = prior.read_text()
source = source.replace('codex35_program_duplicates', 'codex35_instruction_duplicates')
exec(compile(source, str(prior), 'exec'), globals())

"""Reuse pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_instruction_duplicates/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '80e709146d8454f1583975f98cf103b0df51f8b939caa543af2613d0f6f570f3'
source = prior.read_text()
source = source.replace('codex35_instruction_duplicates', 'codex35_predicate_merge')
exec(compile(source, str(prior), 'exec'), globals())

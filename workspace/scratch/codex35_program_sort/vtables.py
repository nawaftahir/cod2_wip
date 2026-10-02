"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_strip/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '709068f243c8bc57f41cb841272558c78256a1fcdc4013d20d772be110426e26'
source = prior.read_text()
source = source.replace('codex35_program_strip', 'codex35_program_sort')
exec(compile(source, str(prior), 'exec'), globals())

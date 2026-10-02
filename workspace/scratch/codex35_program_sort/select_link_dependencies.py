"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_strip/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'e57dcb8fc0b8768fdf0bd19d69179df68fca364fb2905656254d34dfc8454553'
source = prior.read_text()
source = source.replace('codex35_program_strip', 'codex35_program_sort')
source = source.replace("'program', 'flow', 'varying', 'pruning', 'strip')", "'program', 'flow', 'varying', 'pruning', 'strip', 'sort')")
source = source.replace('len(replacements) == 220', 'len(replacements) == 221')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

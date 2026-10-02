"""Reuse pinned complete gates for uniform-pruning integration."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_varying/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '7caa6729c6bc357abc1960ec7b217f49b4ac28212aa3e6b8f78fc17069dc0875'
source = prior.read_text()
source = source.replace('codex35_program_varying', 'codex35_program_pruning')
source = source.replace("'program', 'flow', 'varying')", "'program', 'flow', 'varying', 'pruning')")
source = source.replace('len(replacements) == 214', 'len(replacements) == 215')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_pruning/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8f35c012425c874e6800dce886ec59839c65468d873c92f073b47ce63ccba432'
source = prior.read_text()
source = source.replace('codex35_program_pruning', 'codex35_program_strip')
source = source.replace("'program', 'flow', 'varying', 'pruning')", "'program', 'flow', 'varying', 'pruning', 'strip')")
source = source.replace('len(replacements) == 215', 'len(replacements) == 220')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

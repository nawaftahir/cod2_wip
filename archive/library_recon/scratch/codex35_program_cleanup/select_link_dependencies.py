"""Reuse pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_instruction_duplicates/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'eaed2a3ecb7815a557238fbab2ba67859274cd1aa60b08ca32f45670d4cf5a3a'
source = prior.read_text()
source = source.replace('codex35_instruction_duplicates', 'codex35_program_cleanup')
source = source.replace("'duplicates', 'instructions')", "'duplicates', 'instructions', 'merge', 'coalesce', 'helpers', 'cleanup')")
source = source.replace('len(replacements) == 227', 'len(replacements) == 236')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

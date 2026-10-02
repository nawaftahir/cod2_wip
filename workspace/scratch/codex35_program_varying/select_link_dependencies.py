"""Add the one varying definition; keep the proven static callback checks."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'e631f05c5b8653a9cde5f379bffbd1198978c61514df2dfea585e017c9c350a4'
source = prior.read_text().replace('codex35_program_flow', 'codex35_program_varying').replace("'program', 'flow')", "'program', 'flow', 'varying')").replace('len(replacements) == 212', 'len(replacements) == 214')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

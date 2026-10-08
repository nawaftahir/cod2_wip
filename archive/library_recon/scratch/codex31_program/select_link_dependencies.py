"""Retain strict selection and add twelve actual source program definitions."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler_types/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'd411f66abceed265907bab0232bef54478407b0589ae1e9822c88a8f343ba7bc'
source = prior.read_text().replace('codex35_compiler_types', 'codex31_program')
marker = '\nexec(compile(source'
assert source.count(marker) == 1
source = source.replace(marker, '''
source = source.replace("'preprocessor', 'compiler', 'types')", "'preprocessor', 'compiler', 'types', 'program')")
source = source.replace('len(replacements) == 196', 'len(replacements) == 208')
''' + marker)
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

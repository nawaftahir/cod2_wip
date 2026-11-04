"""Strict existing archive selection; 196 distinct source-supplied methods."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '3f45fc62c1702ea31c1effc8b0eafaf2f94d3588e1cbb5dddd35168ea297851f'
source = prior.read_text().replace('codex35_compiler', 'codex35_compiler_types')
source = source.replace("'preprocessor', 'compiler')", "'preprocessor', 'compiler', 'types')")
source = source.replace('len(replacements) == 193', 'len(replacements) == 196')
exec(compile(source, str(prior), 'exec'),
    {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

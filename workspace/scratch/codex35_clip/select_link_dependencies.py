"""Strict selection:194 source-supplied definitions, no duplicate callee."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '3f45fc62c1702ea31c1effc8b0eafaf2f94d3588e1cbb5dddd35168ea297851f'
source = prior.read_text().replace('codex35_compiler', 'codex35_clip').replace('len(replacements) == 193', 'len(replacements) == 194')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

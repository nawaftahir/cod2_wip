"""Reuse complete retail/source/compiler gates for the nine-method cohort."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '1ffb58a461240fe7153c93d6d34eadf68787b2f216f28d460d96a94f389c1e23'
source = prior.read_text()
for before, after in [('codex_shader_compiler', 'codex_shader_compiler_clip'),
    ('build/codex35_compiler/libraries', 'build/codex35_clip/libraries'),
    ('assert len(functions) == 8', 'assert len(functions) == 9')]:
    assert before in source
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

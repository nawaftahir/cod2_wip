"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_sort/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '770b6323c0af1e28bd3a9457e5799342cd629e5c973c823920d34f399178bd59'
source = prior.read_text()
source = source.replace('codex35_program_sort', 'codex35_program_duplicates')
source = source.replace('codex_shader_program_sort', 'codex_shader_program_duplicates')
source = source.replace('sort.obj', 'duplicates.obj')
source = source.replace("prefix = 'sort'", "prefix = 'duplicates'")
source = source.replace('assert len(functions) == 1', 'assert len(functions) == 3')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

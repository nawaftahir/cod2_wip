"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_strip/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'b683f03cbb70a8b9e86a5c1cd0bf89c43f11c487f717e45f28e67f44be62b68a'
source = prior.read_text()
source = source.replace('codex35_program_strip', 'codex35_program_sort')
source = source.replace('codex_shader_program_strip', 'codex_shader_program_sort')
source = source.replace('strip.obj', 'sort.obj')
source = source.replace("prefix = 'strip'", "prefix = 'sort'")
source = source.replace('assert len(functions) == 5', 'assert len(functions) == 1')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

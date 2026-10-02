"""Reuse the unchanged typed SDK vtable proof."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '164015760b74b004fec21fc282354dd99ec3b19254f789b1c4b0992f58b5de8b'
source = prior.read_text().replace('build/codex35_compiler', 'build/codex35_compiler_types')
exec(compile(source, str(prior), 'exec'), globals())

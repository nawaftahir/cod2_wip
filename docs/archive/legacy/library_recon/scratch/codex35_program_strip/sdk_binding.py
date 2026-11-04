"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_pruning/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '017ab86683f1b1b31277006e797254954f7007362ab5ca63ebec7061761170bc'
source = prior.read_text()
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

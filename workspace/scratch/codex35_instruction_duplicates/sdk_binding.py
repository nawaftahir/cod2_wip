"""Reuse pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_duplicates/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '5ba504f78f48404deb0f7f935beffef47c0acf89e562931a7bb1aa8e40ed5bbf'
source = prior.read_text()
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

"""Reuse complete-section diagnostics; no source acceptance or credit."""
import hashlib
from pathlib import Path
import sys
HERE = Path(__file__).resolve().parent
assert len(sys.argv) == 3
source = HERE / sys.argv[2]
obj = HERE / 'obj' / sys.argv[1]
assert source.stat().st_mtime_ns <= obj.stat().st_mtime_ns
prior = HERE.parent / 'codex30_constants/probe.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '95d68413ad4582c5da798955cff7b5f18484aceaed538972efb4544f4529f0dc'
exec(compile(prior.read_text(), str(prior), 'exec'), {'__file__': str(HERE / 'probe.py'), '__name__': '__main__'})

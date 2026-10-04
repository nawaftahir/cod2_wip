"""Reuse complete-section diagnostics; no acceptance or source credit."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_constants/probe.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '95d68413ad4582c5da798955cff7b5f18484aceaed538972efb4544f4529f0dc'
exec(compile(prior.read_text(), str(prior), 'exec'),
     {'__file__': str(HERE / 'probe.py'), '__name__': '__main__'})

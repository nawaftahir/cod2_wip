"""Reuse pinned SDK symbol-binding checks without weakening gates."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_reads/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '46a6483b141233eb367e878b5f0e7d80ca1ff8093ebd2c93de83a533beffd1d9'
exec(compile(prior.read_text(), str(prior), 'exec'),
     {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

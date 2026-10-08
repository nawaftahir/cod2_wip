"""Reuse the complete pinned SDK binding gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_instruction_duplicates/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8ce62472b579e256c088ea4cd70b05f6e2c7744c646d1efb16066adf7d9be2e3'
exec(compile(prior.read_text(), str(prior), 'exec'),
     {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})


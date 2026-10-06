"""Reuse the standard complete SDK binding checks."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex33_constant_table/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'db5575d59bba5af264f0be6472ffa50e027d8d8fd7d88750ebb15054c2ea6e1e'
exec(compile(prior.read_text(), str(prior), 'exec'), {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

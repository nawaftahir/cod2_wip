"""Reuse complete SDK array binding checks without weaker gates."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex31_program/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '0a4414bf24bc01d01014167365cac7385e36a11fc67d068c29b59721dd727b53'
exec(compile(prior.read_text(), str(prior), 'exec'),
     {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

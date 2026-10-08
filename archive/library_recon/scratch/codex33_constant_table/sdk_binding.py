"""Reuse complete SDK symbol-binding checks."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_parse_casts/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'c064855b9b3769726ee4b7fa3c15d68d428dea428695efffc8c3c8fd545a91c7'
exec(compile(prior.read_text(), str(prior), 'exec'), {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

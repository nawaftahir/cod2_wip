"""Reuse the pinned complete SDK array binding checker."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'e63f153274accaae64bf14f73f997062cea05b658ae02d158948418bc2fb1e28'
exec(compile(prior.read_text(), str(prior), 'exec'), {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

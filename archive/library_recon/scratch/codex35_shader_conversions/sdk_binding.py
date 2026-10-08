"""Reuse pinned SDK symbol-binding checks without weakening gates."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_shader_comment/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '37149ec12ed52a2f18473eec5e85ede1103a60e7719374529ea65f4872a2bb5d'
exec(compile(prior.read_text(), str(prior), 'exec'),
     {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

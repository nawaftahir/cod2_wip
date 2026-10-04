"""Reuse pinned SDK symbol-binding checks without weakening gates."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_shader_conversions/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '810e883920c72a98d769c1fb7eb486adb8a0be7ab680d35ccdb75e56b4372005'
exec(compile(prior.read_text(), str(prior), 'exec'),
     {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

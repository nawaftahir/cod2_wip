"""Reuse the pinned complete SDK symbol-binding proof."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_shader_buffers/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '074eefcfe6c56d9e893b7d8a26ad2ba7554f3f2046a0c38770493cda0058ddcc'
exec(compile(prior.read_text(), str(prior), 'exec'),
     {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

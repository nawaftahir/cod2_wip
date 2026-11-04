"""Reuse the original typed SDK binding checker without relaxed gates."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler_types/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '3fbb85d3acc340d9fa1ccf328e0eb15ea0e798e21502c779d98cce2fbe71606e'
exec(compile(prior.read_text().replace('codex35_compiler_types', 'codex31_program'), str(prior), 'exec'),
     {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

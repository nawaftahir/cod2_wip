"""Reuse the complete SDK flags-column iterator binding proof unchanged."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_instructions/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'd10021efd10506d110cfec38535668c696194a6dfdb972564cbc30fe136bd69f'
exec(compile(prior.read_text(), str(prior), 'exec'), {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

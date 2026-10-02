"""Reuse the pinned complete parent gates without weakening acceptance."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_pruning/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '967adc2d4aa4f5436afcc98ed491cbcc87d163145bd72dcba4d36ce5065b0c4f'
source = prior.read_text()
source = source.replace('codex35_program_pruning', 'codex35_program_strip')
source = source.replace('codex_shader_program_pruning', 'codex_shader_program_strip')
source = source.replace('pruning.obj', 'strip.obj')
source = source.replace("prefix = 'pruning'", "prefix = 'strip'")
source = source.replace('assert len(functions) == 1', 'assert len(functions) == 5')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

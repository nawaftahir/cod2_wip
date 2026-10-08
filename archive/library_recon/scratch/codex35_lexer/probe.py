"""Full SDK section diagnostics, never source coverage."""
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_constants/probe.py'
exec(compile(prior.read_text(), str(prior), 'exec'), {'__file__': str(HERE / 'probe.py'), '__name__': '__main__'})

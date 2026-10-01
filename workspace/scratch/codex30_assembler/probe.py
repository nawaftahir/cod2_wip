"""SDK full-section diagnostics only; no acceptance or coverage."""
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_constants/probe.py'
prefix = sys.argv[1] if len(sys.argv) > 1 else 'asm_nodes'
sys.argv = ['probe.py', prefix + '.obj', prefix + '.cpp']
source = prior.read_text().replace("obj = HERE / 'obj' /", "obj = HERE.parent / 'codex30_token/obj' /")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'probe.py'), '__name__': '__main__'})

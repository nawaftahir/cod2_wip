"""Use the unchanged typed-SDK vtable proof."""
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/vtables.py'
source = prior.read_text().replace('build/codex35_compiler', 'build/codex35_clip')
exec(compile(source, str(prior), 'exec'), globals())

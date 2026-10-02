"""Reuse typed SDK instruction differences for compiler methods."""
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_lexer/diff.py'
source = prior.read_text().replace('@CTokenize@', '@CCompiler@')
source = source.replace('[93]', '[73]').replace('obj/lexer.obj', 'obj/compiler.obj')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'diff.py'), '__name__': '__main__'})

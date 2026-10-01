"""Reuse instruction diagnostics for the complete preprocessor cohort."""
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_lexer/diff.py'
source = prior.read_text().replace('@CTokenize@', '@CPreProcessor@')
source = source.replace('[93]', '[94]').replace('obj/lexer.obj', 'obj/preprocessor.obj')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'diff.py'), '__name__': '__main__'})

"""Reuse the complete preprocessor link/binding proof with eight compiler methods."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_preprocessor/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8a2e304b695fd8068c86c0e9fc8d2c7a045ab682c3cbe5ebb46adc2c523c25a8'
source = prior.read_text()
changes = [
    ('build/codex35_preprocessor', 'build/codex35_compiler'),
    ('build/codex35_lexer', 'build/codex35_preprocessor'),
    ('== 523', '== 548'),
    ("'codex35_lexer'):", "'codex35_lexer', 'codex35_preprocessor'):"),
    ('== 17868', '== 18625'),
    ("HERE / 'select_dependencies.py'", "HERE / 'select_link_dependencies.py'"),
    ("HERE / 'dependency_selection.json'", "HERE / 'link_dependency_selection.json'"),
    ("'baseline_source_matches': 523", "'baseline_source_matches': 548"),
    ('all 523 previous', 'all 548 previous'),
]
for before, after in changes:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})

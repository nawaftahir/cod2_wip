"""Retain all556 baseline matches; use the existing full-link binding proof."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '0ada8b5cabe8fe3d7db827296f1972975aa74a2bf2006a40ee97e7726c142df1'
source = prior.read_text()
for before, after in [
    ("('build/codex35_preprocessor', 'build/codex35_compiler')", "('build/codex35_preprocessor', 'build/codex35_clip')"),
    ("('build/codex35_lexer', 'build/codex35_preprocessor')", "('build/codex35_lexer', 'build/codex35_compiler')"),
    ("'== 548'", "'== 556'"),
    ("'== 18625'", "'== 18934'"),
    ("'baseline_source_matches': 548", "'baseline_source_matches': 556"),
    ('all 548 previous', 'all 556 previous'),
]:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})

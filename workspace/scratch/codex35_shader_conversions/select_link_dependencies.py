"""Reuse the strict SDK selector; exclude only the ten source-matched callbacks."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_reads/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '1ed71669eff57de3cb940997b38a1b54b106016665e4fd3dd82fd0cc325cb0d5'
source = prior.read_text()
changes = [
    ('codex35_pool_reads', 'codex35_shader_conversions'),
    ("'validation', 'pool_reads'):", "'validation', 'pool_reads', 'comment', 'conversions'):"),
    ('len(replacements) == 288', 'len(replacements) == 299'),
]
for before, after in changes:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

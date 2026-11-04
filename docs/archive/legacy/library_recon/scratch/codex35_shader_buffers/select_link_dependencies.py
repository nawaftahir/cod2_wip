"""Use the strict SDK selector; replace only the four source-proven callbacks."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_reads/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '1ed71669eff57de3cb940997b38a1b54b106016665e4fd3dd82fd0cc325cb0d5'
source = prior.read_text()
for before, after in [
    ('codex35_pool_reads', 'codex35_shader_buffers'),
    ("'validation', 'pool_reads'):", "'validation', 'pool_reads', 'comment', 'conversions', 'buffers'):"),
    ('len(replacements) == 288', 'len(replacements) == 303'),
]:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

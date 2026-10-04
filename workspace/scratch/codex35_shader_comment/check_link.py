"""Retain all651 previous matches and certify the complete linked comment body."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_reads/check_link.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '0c921f9eef8ba96fc0f64652e0fe395c8789e82e9fd5a1c4e0f9f303260d97d4'
source = prior.read_text()
for before, after in [
    ('build/codex35_pool_reads', 'build/codex35_shader_comment'),
    ('build/codex35_validation', 'build/codex35_pool_reads'),
    ('== 650', '== 651'),
    ("'baseline_source_matches': 650", "'baseline_source_matches': 651"),
    ('all 650 previous', 'all 651 previous'),
    ('== 41198', '== 41429'),
    ("'codex35_validation'):", "'codex35_validation', 'codex35_pool_reads'):"),
]:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check_link.py'), '__name__': '__main__'})

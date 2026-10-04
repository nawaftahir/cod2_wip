"""Replay the existing full1284-case shader-compiler fixture with comment ownership."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_reads/run_clean_test.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '838a65c6b609207033301fb614a046fff3f1ccda592d8417ba6c86a2a5b00b4e'
source = prior.read_text().replace('codex35_pool_reads', 'codex35_shader_comment')
source = source.replace('codex_shader_pool_reads/pool_reads.cpp', 'codex_shader_comment/comment.cpp')
source = source.replace('== 308', '== 309').replace('== 288', '== 289')
source = source.replace('pool_reads.obj', 'comment.obj')
source = source.replace('One-body pool-read collector cohort', 'One-body public shader-comment cohort')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'run_clean_test.py'), '__name__': '__main__'})

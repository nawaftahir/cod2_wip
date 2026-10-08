"""Reuse the strict SDK selector; only the matched public comment body is new."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_reads/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '1ed71669eff57de3cb940997b38a1b54b106016665e4fd3dd82fd0cc325cb0d5'
source = prior.read_text().replace('build/codex35_pool_reads', 'build/codex35_shader_comment')
source = source.replace('codex35_pool_reads\\\\dependencies', 'codex35_shader_comment\\\\dependencies')
source = source.replace("'validation', 'pool_reads'):", "'validation', 'pool_reads', 'comment'):")
source = source.replace('len(replacements) == 288', 'len(replacements) == 289')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

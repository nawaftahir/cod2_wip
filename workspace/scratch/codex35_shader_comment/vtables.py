"""Retain existing table/constructor binding locators; none earns new credit."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_reads/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '29166b861ff4b0029a2d686f9ddb4d55dd5e356bbcb08a7cb58d6eaed72f355c'
source = prior.read_text().replace("'codex35_pool_reads')", "'codex35_shader_comment')")
source = source.replace('gfx/target/build/codex35_pool_reads', 'gfx/target/build/codex35_shader_comment')
exec(compile(source, str(prior), 'exec'), globals())

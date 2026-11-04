"""Retain every prior table proof against the new private helper image."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_order/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8d9262732ae3f79fca061a5e7c2d4f0fb22ac425b1cb0d8e35aa571d176024e8'
source = prior.read_text()
source = source.replace('ORDERING_HERE = HERE', "ORDERING_HERE = HERE.parent / 'codex35_program_order'")
source = source.replace("replace('codex35_predicate_order', 'codex35_program_order')", "replace('codex35_predicate_order', 'codex35_pool_helpers')")
source = source.replace('gfx/target/build/codex35_program_order', 'gfx/target/build/codex35_pool_helpers')
exec(compile(source, str(prior), 'exec'), globals())

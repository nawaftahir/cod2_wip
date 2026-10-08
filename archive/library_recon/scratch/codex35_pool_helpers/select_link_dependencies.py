"""Extend exact source ownership without accepting opaque SDK methods."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_order/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'b00cbc19045679bdb4a4985740e1a7cae746f1600f8f3e847f5e55f3ca503541'
source = prior.read_text().replace('codex35_program_order', 'codex35_pool_helpers')
source = source.replace("'driver', 'predicate', 'program_order')", "'driver', 'predicate', 'program_order', 'pool_helpers')")
source = source.replace('len(replacements) == 259', 'len(replacements) == 263')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

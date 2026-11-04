"""Reuse pinned complete parent gates for the ordering source cohort."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_predicate_order/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '6aab1cecef9f38f9a58a025dba0701f296cac5e01dbd4a857cc616d21b434a34'
source = prior.read_text()
source = source.replace('codex35_predicate_order', 'codex35_program_order')
source = source.replace("'driver', 'predicate')", "'driver', 'predicate', 'program_order')")
source = source.replace('len(replacements) == 251', 'len(replacements) == 259')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

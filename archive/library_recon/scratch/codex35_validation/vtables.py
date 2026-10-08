"""Retain all complete table/constructor proofs in the new validation image."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_argument_alloc/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '6863c83b3e88e622cf5ca3f4037ea269f705cd137201cddf195c5da97fdecc62'
source = prior.read_text().replace('ARGUMENT_HERE = HERE', "ARGUMENT_HERE = HERE.parent / 'codex35_argument_alloc'")
source = source.replace("'codex35_argument_alloc')", "'codex35_validation')").replace('gfx/target/build/codex35_argument_alloc', 'gfx/target/build/codex35_validation')
exec(compile(source, str(prior), 'exec'), globals())


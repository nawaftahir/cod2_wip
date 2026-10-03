"""Apply retained complete table proofs to the new driver image."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_helpers/vtables.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'c19905ccf2adabca7ae8b409e51612d6ad2d9b3618ed26f02c2338cc5c5913c7'
source = prior.read_text().replace("'codex35_pool_helpers')", "'codex35_register_split')").replace('gfx/target/build/codex35_pool_helpers', 'gfx/target/build/codex35_register_split')
exec(compile(source, str(prior), 'exec'), globals())

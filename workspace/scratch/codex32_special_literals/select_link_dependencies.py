"""Extend genuine source ownership by two driver definitions."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_pool_helpers/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '1d09beb13fd8f5422bad5389bde8c1d014a610d1b80d48f8bd743863035c61c8'
source = prior.read_text().replace('codex35_pool_helpers', 'codex32_special_literals')
source = source.replace("'program_order', 'pool_helpers')", "'program_order', 'pool_helpers', 'drivers', 'diagnostics', 'special_literals')")
source = source.replace('len(replacements) == 263', 'len(replacements) == 271')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

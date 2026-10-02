"""Use the existing SDK binding proof without weakening its gates."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_compiler/sdk_binding.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'f18f559c0c1aa4e465cb9da86cb8b27fba703fc24279fefff43945ac5db2035d'
exec(compile(prior.read_text(), str(prior), 'exec'),
    {'__file__': str(HERE / 'sdk_binding.py'), '__name__': '__main__'})

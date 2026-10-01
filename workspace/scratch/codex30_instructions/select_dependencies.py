"""Reuse the pinned private SDK selector; retained SDK stays zero credit."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_parser/select_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8fc5e16e488acfd1d675e4970ac921376405858c14914c6bf348ec681b51e692'
source = prior.read_text().replace('codex30_parser', 'codex30_instructions')
source = source.replace("'shader_native_constants')", "'shader_native_constants', 'read_typed', 'shader_version', 'instruction_copy', 'shader_profiles', 'cparse_cast')")
source = source.replace('len(replacements) == 40', 'len(replacements) == 56')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_dependencies.py'), '__name__': '__main__'})
response = HERE.parents[1] / 'build/codex30_instructions/dependencies/members.rsp'
assert all(line.startswith('build\\codex30_instructions\\dependencies\\') for line in response.read_text().splitlines())

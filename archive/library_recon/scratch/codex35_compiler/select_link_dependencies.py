"""Reuse the strict dependency selector for 193 source-supplied definitions."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_parser/select_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8fc5e16e488acfd1d675e4970ac921376405858c14914c6bf348ec681b51e692'
source = prior.read_text().replace('codex30_parser', 'codex35_compiler')
source = source.replace("'shader_native_constants')", "'shader_native_constants', 'read_typed', 'shader_version', 'instruction_copy', 'shader_profiles', 'cparse_cast', 'nodes', 'asm_nodes', 'assembler', 'alloc', 'errors', 'lexer', 'preprocessor', 'compiler')")
source = source.replace('len(replacements) == 40', 'len(replacements) == 193')
source = source.replace("HERE / 'dependency_selection.json'", "HERE / 'link_dependency_selection.json'")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

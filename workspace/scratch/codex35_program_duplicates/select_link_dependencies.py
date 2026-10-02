"""Verify complete source callbacks before replacing private SDK definitions."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_parser/select_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '8fc5e16e488acfd1d675e4970ac921376405858c14914c6bf348ec681b51e692'
source = prior.read_text().replace('codex30_parser', 'codex35_program_duplicates')
allowed = "('d3dxtok', 'd3dxasm', 'd3dxshader', 'instruction_predicates', 'shader_native_constants')"
assert allowed in source
source = source.replace(allowed, "('d3dxtok', 'd3dxasm', 'd3dxshader', 'instruction_predicates', 'shader_native_constants', 'read_typed', 'shader_version', 'instruction_copy', 'shader_profiles', 'cparse_cast', 'nodes', 'asm_nodes', 'assembler', 'alloc', 'errors', 'lexer', 'preprocessor', 'compiler', 'types', 'program', 'flow', 'varying', 'pruning', 'strip', 'sort', 'duplicates')")
source = source.replace('len(replacements) == 40', 'len(replacements) == 224')
source = source.replace("HERE / 'dependency_selection.json'", "HERE / 'link_dependency_selection.json'")
before = "                    assert s['sclass'] == 2 and s['naux'] == 0"
assert before in source
source = source.replace(before, '''                    if s['sclass'] == 3:
                        callbacks = {
                            '?CompareIndex@D3DXShader@@YGHIIPBX@Z': ('flow.obj', 26),
                            '?CompareValue@D3DXShader@@YGHIIPBX@Z': ('duplicates.obj', 79),
                            '?CompareRegister@D3DXShader@@YGHIIPBX@Z': ('duplicates.obj', 142)}
                        assert s['name'] in callbacks and s['naux'] == 0
                        owner, size = callbacks[s['name']]
                        replacement = (run / 'libraries' / owner).read_bytes()
                        rc = m['parse_coff'](replacement)
                        rf, = [fn for fn in rc['symbols'] if fn['name'] == s['name'] and fn['sec'] > 0]
                        rs = rc['sections'][rf['sec'] - 1]
                        assert rf['value'] == 0 and rf['sclass'] == 2 and rf['naux'] == 0
                        assert sec['rawsize'] == rs['rawsize'] == size
                        assert not sec['relocs'] and not rs['relocs']
                        assert original[sec['rawptr']:sec['rawptr'] + size] == replacement[rs['rawptr']:rs['rawptr'] + size]
                        # Only a fully identical callback becomes a source-bound reference.
                        raw[offset + 16] = 2
                    else:
                        assert s['sclass'] == 2 and s['naux'] == 0''')
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'select_dependencies.py'), '__name__': '__main__'})

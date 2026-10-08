"""Keep private helpers together; require literal bodies and zero outside callers."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_duplicates/select_link_dependencies.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '7156643144eeb1d1003cf7eaa1ae5141b00c6dd6d643f70c5d8ee18f35d8e983'
source = prior.read_text()
source = source.replace('codex35_program_duplicates', 'codex35_instruction_duplicates')
source = source.replace("'sort', 'duplicates')", "'sort', 'duplicates', 'instructions')")
source = source.replace('len(replacements) == 224', 'len(replacements) == 227')
before = "                    if s['sclass'] == 3:"
assert before in source
source = source.replace(before, '''                    private_helpers = {
                        '?CompareDuplicateInstructions@D3DXShader@@YGHIIPBX@Z': 415,
                        '?CompareDuplicateInstructionsStable@D3DXShader@@YGHIIPBX@Z': 44}
                    if s['name'] in private_helpers:
                        assert s['sclass'] == 3 and s['naux'] == 0
                        replacement = (run / 'libraries/instructions.obj').read_bytes()
                        rc = m['parse_coff'](replacement)
                        rsymbols = {fn['idx']: fn for fn in rc['symbols']}
                        rf, = [fn for fn in rc['symbols'] if fn['name'] == s['name'] and fn['sec'] > 0]
                        rs = rc['sections'][rf['sec'] - 1]
                        size = private_helpers[s['name']]
                        assert rf['sclass'] == 3 and rf['naux'] == 0 and rf['value'] == 0
                        assert sec['rawsize'] == rs['rawsize'] == size
                        assert original[sec['rawptr']:sec['rawptr'] + size] == replacement[rs['rawptr']:rs['rawptr'] + size]
                        assert [(r['vaddr'], r['type'], syms[r['sym']]['name']) for r in sec['relocs']] == [(r['vaddr'], r['type'], rsymbols[r['sym']]['name']) for r in rs['relocs']]
                        # The source TU owns every caller of these private helpers.
                        for other_number, other in enumerate(c['sections'], 1):
                            if other_number not in sections:
                                assert not any(syms[r['sym']]['sec'] == number for r in other['relocs'])
                        # Unreferenced original static symbol; never expose a different ABI.
                        raw[offset:offset + 18] = bytes(18)
                    elif s['sclass'] == 3:''')
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'select_link_dependencies.py'), '__name__': '__main__'})

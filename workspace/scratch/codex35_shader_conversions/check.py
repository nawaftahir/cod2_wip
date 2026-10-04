"""Ten complete conversion callbacks; retain strict SDK identity/boundary gates."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_sdk/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '4f2532050cbf83fc4d161dae896d388cf791da54e3219073d8dedd7c0b4a9ddc'
source = prior.read_text()
changes = [
    ('build/codex35_sdk', 'build/codex35_shader_conversions'),
    ("HERE / 'discovery.json'", "HERE.parent / 'codex35_sdk/discovery.json'"),
    ("[('instruction_predicates', 25), ('shader_native_constants', 12)]", "[('conversions', 10)]"),
    ("'src/codex_libraries'", "'src/codex_shader_conversions'"),
    ("stem == 'shader_native_constants'", "stem == 'conversions'"),
    ("'original_referee_match': 100, 'bindings': {},", "'section_bytes': len(code), 'excluded_table_bytes': 0, 'original_referee_match': 100, 'instruction_aware_referee_match': 100, 'bindings': {},"),
    ("'class_layout_scope': 'five-word instruction prefix only; no full allocation layout'", "'class_layout_scope': 'static callback methods; SDK IDirect3DDevice9 interface, no private allocation layout'"),
    ("HERE / 'packet.json'", "HERE / 'clean_packet.json'"),
    ("assert fn['value'] == 0 and sec['flags'] & 32 and not sec['relocs']", """assert fn['value'] == 0 and sec['flags'] & 32
            float_callbacks = {
                '?Set@?$SetShaderConstant@$0A@$0A@$02@D3DXShader@@SGJPBXI0PAKI@Z',
                '?Set@?$SetShaderConstant@$00$0A@$02@D3DXShader@@SGJPBXI0PAKI@Z'}
            floating = fn['name'] in float_callbacks
            assert bool(sec['relocs']) == floating
            if floating:
                assert sec['rawsize'] == 82
                assert [(r['vaddr'], r['type']) for r in sec['relocs']] == [(25, 6)]
                r, = sec['relocs']
                literal = names[r['sym']]
                assert literal['name'] == '__real@00000000' and literal['sec'] > 0
                data_section = coff['sections'][literal['sec'] - 1]
                assert literal['value'] + 4 <= data_section['rawsize']
                literal_bytes = raw[data_section['rawptr'] + literal['value']:data_section['rawptr'] + literal['value'] + 4]
                equal(literal_bytes, bytes(4))
                negative(bytes([1, 0, 0, 0]), literal_bytes)"""),
    ("assert not oracle_sec['relocs']", """assert bool(oracle_sec['relocs']) == floating
            if floating:
                assert [(r['vaddr'], r['type']) for r in oracle_sec['relocs']] == [(25, 6)]
                osymbols = {s['idx']: s for s in oracle_coff['symbols']}
                r, = oracle_sec['relocs']
                oliteral = osymbols[r['sym']]
                assert oliteral['name'] == '__real@00000000' and oliteral['sec'] > 0
                odata = oracle_coff['sections'][oliteral['sec'] - 1]
                equal(oracle_raw[odata['rawptr'] + oliteral['value']:odata['rawptr'] + oliteral['value'] + 4], bytes(4))
                assert struct.unpack_from('<I', code, 25)[0] == 0"""),
    ("equal(code, retail)", """bindings = {}
            if floating:
                assert struct.unpack_from('<I', code, 25)[0] == 0
                target = struct.unpack_from('<I', retail, 25)[0]
                assert target % 4 == 0
                assert target >= 0x10000000
                equal(pe.get_data(target - 0x10000000, 4), literal_bytes)
                bindings['__real@00000000'] = hex(target)
                code = code[:25] + bytes(4) + code[29:]
                retail = retail[:25] + bytes(4) + retail[29:]
            equal(code, retail)"""),
    ("assert not any(start <= p < start + len(code) for p in m['PE_RELOCS'])", """assert {p - start for p in m['PE_RELOCS'] if start <= p < start + len(code)} == ({25} if floating else set())"""),
    ("'instruction_aware_referee_match': 100, 'bindings': {},", "'instruction_aware_referee_match': 100, 'bindings': bindings,"),
]
for before, after in changes:
    assert before in source, before
    source = source.replace(before, after)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

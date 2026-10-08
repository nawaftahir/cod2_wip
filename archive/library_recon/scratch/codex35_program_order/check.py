"""Full ordering and generated transform-context proof; no mask-only credit."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d'
source = prior.read_text()
source = source.replace('codex35_program_flow', 'codex35_program_order')
source = source.replace('codex_shader_program_flow', 'codex_shader_program_order')
source = source.replace('flow_matched.obj', 'program_order.obj').replace('flow.obj', 'program_order.obj')
source = source.replace("prefix = 'flow' if CLEAN else 'flow_matched'", "prefix = 'program_order'")
source = source.replace('assert len(functions) == 4', 'assert len(functions) == 8')
helpers = '''
def transform_references(m, oracle, refs, pe):
    raw = oracle[90]
    coff = m['parse_coff'](raw)
    specs = [('CTransform', 62, 64, 68, 12, 0x10110440),
             ('CTReorderInstructions', 69, 71, 173, 15, 0x10110448)]
    for cls, ctor_section, dtor_section, deleting_section, pointer_offset, table in specs:
        ctor = '??0' + cls + '@D3DXShader@@QAE@PAVCProgram@1@@Z'
        ref = refs[ctor]
        assert ref['member'] == 90 and ref['section'] == ctor_section
        start, = [int(v, 16) for v in ref['placements']]
        sec = coff['sections'][ctor_section - 1]
        assert sec['rawsize'] == 23 and len(sec['relocs']) == 1
        retail = pe.get_data(start - 0x10000000, 23)
        equal(mask(retail, sec), mask(raw[sec['rawptr']:sec['rawptr'] + 23], sec))
        assert struct.unpack_from('<I', retail, pointer_offset)[0] == table
        targets = [(dtor_section, start + 23, 7, 'constructor-adjacent complete vptr-reset body'),
                   (deleting_section, struct.unpack('<I', pe.get_data(table - 0x10000000, 4))[0], 34,
                    'typed deleting-destructor vtable slot')]
        for number, target, size, provenance in targets:
            fn, = [s for s in coff['symbols'] if s['sec'] == number and is_function(raw, s)]
            ds = coff['sections'][number - 1]
            assert fn['value'] == 0 and ds['rawsize'] == size
            expected = raw[ds['rawptr']:ds['rawptr'] + size]
            actual = pe.get_data(target - 0x10000000, size)
            equal(mask(expected, ds), mask(actual, ds))
            reset, = [r for r in ds['relocs'] if r['type'] == 6]
            assert struct.unpack_from('<I', actual, reset['vaddr'])[0] == 0x10110440
            refs[fn['name']] = {'symbols': [fn['name']], 'member': 90, 'section': number,
                'section_bytes': size, 'placements': [hex(target)], 'typed_constructor': ctor,
                'typed_vtable': hex(table), 'identity_provenance': provenance}
    name = '?Apply@CTransform@D3DXShader@@UAEJXZ'
    target = struct.unpack('<I', pe.get_data(0x110444, 4))[0]
    assert target == 0x10086d26 and pe.get_data(target - 0x10000000, 6) == bytes.fromhex('b801400080c3')
    refs[name] = {'symbols': [name], 'member': 90, 'section': 66,
        'section_bytes': 6, 'placements': [hex(target)], 'typed_vtable_slot': 4}
    return refs


def transform_alias(raw, coff, symbol):
    if symbol['sclass'] != 105:
        return symbol['name']
    assert symbol['sec'] == 0 and symbol['naux'] == 1
    symptr = struct.unpack_from('<I', raw, 8)[0]
    alias, kind = struct.unpack_from('<II', raw, symptr + (symbol['idx'] + 1) * 18)
    assert kind == 2
    return next(s['name'] for s in coff['symbols'] if s['idx'] == alias)


def certify_vtable(m, refs, pe, original, oc, old, raw, c, symbol, base):
    if symbol['name'].startswith('??_7CNode'):
        return certify_node_vtable(m, refs, pe, original, oc, old, raw, c, symbol, base)
    tables = {'??_7CTransform@D3DXShader@@6B@': (8, 0x10110440),
              '??_7CTReorderInstructions@D3DXShader@@6B@': (12, 0x10110448)}
    size, expected_base = tables[symbol['name']]
    assert base == expected_base and symbol['value'] == old['value'] == 0
    ours, sdk = c['sections'][symbol['sec'] - 1], oc['sections'][old['sec'] - 1]
    assert ours['rawsize'] == sdk['rawsize'] == size
    assert not (ours['flags'] | sdk['flags']) & 32
    fields = {(p, 6) for p in range(0, size, 4)}
    assert {(r['vaddr'], r['type']) for r in ours['relocs']} == fields
    assert {(r['vaddr'], r['type']) for r in sdk['relocs']} == fields
    assert len(ours['relocs']) == len(sdk['relocs']) == size // 4
    a = raw[ours['rawptr']:ours['rawptr'] + size]
    b = original[sdk['rawptr']:sdk['rawptr'] + size]
    retail = pe.get_data(base - 0x10000000, size)
    equal(mask(a, ours), mask(b, sdk)); equal(mask(a, ours), mask(retail, sdk))
    reloc_sites = {pe.OPTIONAL_HEADER.ImageBase + e.rva for block in pe.DIRECTORY_ENTRY_BASERELOC
                   for e in block.entries if e.type == 3}
    assert {p - base for p in reloc_sites if base <= p < base + size} == set(range(0, size, 4))
    names = {s['idx']: s for s in c['symbols']}
    old_names = {s['idx']: s for s in oc['symbols']}
    old_fields = {r['vaddr']: r for r in sdk['relocs']}
    oracle = list(members((ROOT / 'sdk/sum2004/Lib/d3dx9.lib').read_bytes()))
    result = []
    for edge in ours['relocs']:
        p = edge['vaddr']
        name = transform_alias(raw, c, names[edge['sym']])
        assert name == transform_alias(original, oc, old_names[old_fields[p]['sym']])
        assert struct.unpack_from('<I', a, p)[0] == struct.unpack_from('<I', b, p)[0] == 0
        target = struct.unpack_from('<I', retail, p)[0]
        ref = refs[name]; address, = [int(v, 16) for v in ref['placements']]
        assert target == address
        dependency = oracle[ref['member']]; dc = m['parse_coff'](dependency)
        ds = dc['sections'][ref['section'] - 1]
        expected = dependency[ds['rawptr']:ds['rawptr'] + ds['rawsize']]
        equal(mask(expected, ds), mask(pe.get_data(target - 0x10000000, len(expected)), ds))
        negative(binding, target, address + 1, 0)
        result.append({'offset': p, 'symbol': name, 'target': hex(target),
            'complete_sdk_callee_equal': True, 'weak_fallback_search_kind': 2 if p == 0 else None,
            'dependency_source_credit': 0})
    return result
'''
overrides = [
    ('def certify_vtable(', 'def certify_node_vtable('),
    ('def main():', helpers + '\ndef main():'),
    ('    refs = runtime_references(m, oracle, refs, pe)',
     '    refs = transform_references(m, oracle, refs, pe)\n    refs = runtime_references(m, oracle, refs, pe)'),
    ("symbol['name'].startswith('??_7CNode')", "(symbol['name'].startswith('??_7CNode') or symbol['name'] in ('??_7CTransform@D3DXShader@@6B@', '??_7CTReorderInstructions@D3DXShader@@6B@'))"),
    ('complete source program-flow bodies', 'complete source program-ordering and generated transform bodies'),
]
# The table dispatch inside our helper must retain its node-only condition.
overrides[1] = (overrides[1][0], overrides[1][1].replace("symbol['name'].startswith('??_7CNode')", "symbol['name'].startswith(('??_7CNode',))"))
marker = "'flow_overrides': overrides}"
assert source.count(marker) == 1
source = source.replace(marker, "'flow_overrides': overrides + ordering_overrides}")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'),
    '__name__': '__main__', 'ordering_overrides': overrides})

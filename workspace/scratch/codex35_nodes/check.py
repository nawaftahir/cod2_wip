"""Complete typed node bodies and vtable bindings; reuse the pinned SDK proof."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex30_parser/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'a7de81ca77ba6de75cea6213795052867fdf88375929345644ce0272a2effb05'
source = prior.read_text()
helpers = '''
def mask(data, section):
    result = bytearray(data)
    for relocation in section['relocs']:
        result[relocation['vaddr']:relocation['vaddr'] + 4] = bytes(4)
    return result


def node_references(m, oracle, refs, pe):
    # Typed COFF call edges distinguish identical scalar/pointer constructors.
    edges, edge_proofs = {}, {}
    for ref in refs.values():
        if len(ref['placements']) != 1:
            continue
        raw = oracle[ref['member']]
        coff = m['parse_coff'](raw)
        section = coff['sections'][ref['section'] - 1]
        names = {s['idx']: s for s in coff['symbols']}
        va = int(ref['placements'][0], 16)
        body = pe.get_data(va - 0x10000000, section['rawsize'])
        original = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
        equal(mask(original, section), mask(body, section))
        for r in section['relocs']:
            p = r['vaddr']
            if r['type'] != 20 or not p or body[p - 1] not in (0xe8, 0xe9):
                continue
            name = names[r['sym']]['name']
            addend = struct.unpack_from('<I', original, p)[0]
            destination = (va + p + 4 + struct.unpack_from('<i', body, p)[0] - addend) & 0xffffffff
            edges.setdefault(name, set()).add(destination)
            edge_proofs.setdefault(name, []).append({'caller': ref['symbols'][0],
                'address': hex(va), 'offset': p, 'callee': hex(destination),
                'complete_sdk_caller_section_equal': True})
    raw = oracle[75]
    coff = m['parse_coff'](raw)
    for fn in coff['symbols']:
        if fn['sec'] <= 0 or not is_function(raw, fn):
            continue
        name = fn['name']
        if name not in refs or len(refs[name]['placements']) > 1:
            if name not in edges:
                continue
            address, = edges[name]
            section = coff['sections'][fn['sec'] - 1]
            original = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
            equal(mask(original, section), mask(pe.get_data(address - 0x10000000, len(original)), section))
            refs[name] = {'symbols': [name], 'member': 75, 'section': fn['sec'],
                'section_bytes': len(original), 'placements': [hex(address)],
                'typed_caller_proofs': edge_proofs[name]}
    return refs


def certify_vtable(m, refs, pe, original, oc, old, raw, c, symbol, base):
    old_section = oc['sections'][old['sec'] - 1]
    section = c['sections'][symbol['sec'] - 1]
    assert symbol['sec'] > 0 and old['value'] == symbol['value'] == 0
    assert old_section['rawsize'] == section['rawsize'] == 12
    assert not old_section['flags'] & 32 and not section['flags'] & 32
    old_names = {s['idx']: s for s in oc['symbols']}
    names = {s['idx']: s for s in c['symbols']}
    a = raw[section['rawptr']:section['rawptr'] + 12]
    b = original[old_section['rawptr']:old_section['rawptr'] + 12]
    retail = pe.get_data(base - 0x10000000, 12)
    equal(mask(a, section), mask(b, old_section))
    equal(mask(a, section), mask(retail, old_section))
    assert {(r['vaddr'], r['type']) for r in section['relocs']} == {(0, 6), (4, 6), (8, 6)}
    assert len(section['relocs']) == len(old_section['relocs']) == 3
    original_fields = {r['vaddr']: r for r in old_section['relocs']}
    reloc_sites = {e.rva + pe.OPTIONAL_HEADER.ImageBase for block in pe.DIRECTORY_ENTRY_BASERELOC
                   for e in block.entries if e.type == 3}
    proof = []
    for r in section['relocs']:
        p = r['vaddr']
        prior = original_fields[p]
        assert prior['type'] == 6 and base + p in reloc_sites
        function, old_function = names[r['sym']], old_names[prior['sym']]
        assert function['name'] == old_function['name']
        assert struct.unpack_from('<I', a, p)[0] == struct.unpack_from('<I', b, p)[0] == 0
        target = struct.unpack_from('<I', retail, p)[0]
        assert old_function['sec'] > 0 and is_function(original, old_function)
        callee = oc['sections'][old_function['sec'] - 1]
        expected = original[callee['rawptr']:callee['rawptr'] + callee['rawsize']]
        equal(mask(expected, callee), mask(pe.get_data(target - 0x10000000, len(expected)), callee))
        if function['name'] in refs:
            assert target in [int(v, 16) for v in refs[function['name']]['placements']]
        else:
            # Debug Print methods fold to a shared empty body, never source credit.
            assert function['name'].startswith('?Print@CNode') and expected == bytes([0xc3])
        negative(binding, target, target + 1, 0)
        proof.append({'offset': p, 'symbol': function['name'], 'target': hex(target),
                      'complete_sdk_callee_equal': True, 'dependency_source_credit': 0})
    return proof
'''
source = source.replace('\ndef main():', helpers + '\ndef main():')
source = source.replace("SOURCES = ROOT / 'gfx/target/src/codex_parsers' if CLEAN else HERE",
    "SOURCES = ROOT / 'gfx/target/src/codex_shader_nodes' if CLEAN else HERE")
source = source.replace("OBJECTS = ROOT / 'gfx/target/build/codex30_parser/libraries' if CLEAN else HERE / 'obj'",
    "OBJECTS = ROOT / 'gfx/target/build/codex35_nodes/libraries' if CLEAN else HERE.parent / 'codex30_token/obj'")
source = source.replace("    rows = []\n    for prefix, code_bytes in [('d3dxtok', 1128), ('d3dxasm', 1263), ('d3dxshader', 3691)]:\n        name = '?' + prefix + '_parse@D3DXShader@@YGHXZ'", '''    refs = node_references(m, oracle, refs, pe)
    candidate = OBJECTS / ('nodes.obj' if CLEAN else 'nodes_matched.obj')
    candidate_raw = candidate.read_bytes()
    candidate_coff = m['parse_coff'](candidate_raw)
    functions = [s for s in candidate_coff['symbols'] if s['sec'] > 0 and is_function(candidate_raw, s)]
    assert len(functions) == 72
    rows = []
    for fn_spec in functions:
        prefix = 'nodes' if CLEAN else 'nodes_matched'
        name = fn_spec['name']
        code_bytes = candidate_coff['sections'][fn_spec['sec'] - 1]['rawsize']''')
source = source.replace("                    assert not ds['flags'] & 32 and not ds['relocs']",
    "                    if symbol['name'].startswith('??_7CNode'):\n                        proofs.append({'kind': 'TYPED-SOURCE-VTABLE', 'symbol': symbol['name'], 'base': hex(base), 'slots': certify_vtable(m, refs, pe, original, oc, old, raw, c, symbol, base)})\n                    else:\n                        assert not ds['flags'] & 32 and not ds['relocs']")
# The existing storage proof below applies only to non-relocated SDK globals.
source = source.replace("                    section_base = base - old['value']",
    "                    if symbol['name'].startswith('??_7CNode'):\n                        binding(target, base, addend)\n                        negative(binding, target, base + 1, addend)\n                        a[p:p + 4] = b[p:p + 4] = o[p:p + 4] = bytes(4)\n                        continue\n                    section_base = base - old['value']")
source = source.replace("assert any(s['sec'] == fn['sec'] and s['value'] == code_bytes for s in symbols.values())", 'assert len(body) == code_bytes')
source = source.replace("        m['INV'][f'{address:x}']['size'] = len(body)",
    "        m['INV'].setdefault(f'{address:x}', {'name': name, 'size': len(body)})['size'] = len(body)")
source = source.replace("[SOURCES / (prefix + '.cpp'), SOURCES / (prefix + '_actions.inc'), SOURCES / 'parser_core.h']", "[SOURCES / (prefix + '.cpp')]")
source = source.replace("*(OBJECTS / (n + '.obj') for n in ('d3dxtok', 'd3dxasm', 'd3dxshader'))", 'candidate')
source = source.replace('reconstructed SDK parser C++; SDK dependencies external', 'reconstructed SDK shader-node C++; remaining SDK methods external')
source = source.replace('complete source parser bodies', 'complete source node bodies')
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

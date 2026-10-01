"""Complete tokenizer bodies using the existing pinned source/SDK/retail gates."""
import hashlib
from pathlib import Path

HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_nodes/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '662f35a91c9d5ac91821aa0002681dee5e9d994d632ea9a7311f05dba77893c7'
source = prior.read_text()
runtime_helper = '''
def runtime_references(m, oracle, refs, pe):
    library = HERE / 'dependencies/libcmt.lib'
    assert sha(library) == '6e2b3742e58245de52149137f64281b73db1487a07a31e165fff269fbf9b2ee8'
    runtime = list(members(library.read_bytes()))
    raw = oracle[93]
    coff = m['parse_coff'](raw)
    names = {s['idx']: s['name'] for s in coff['symbols']}
    for name, member in [('_isalpha', 3), ('_isdigit', 3), ('_isalnum', 3),
                         ('_atof', 7), ('_tolower', 20), ('__alloca_probe', 390)]:
        edges, evidence = set(), []
        for ref in list(refs.values()):
            if ref['member'] != 93 or len(ref['placements']) != 1:
                continue
            sec = coff['sections'][ref['section'] - 1]
            original = raw[sec['rawptr']:sec['rawptr'] + sec['rawsize']]
            address = int(ref['placements'][0], 16)
            retail = pe.get_data(address - 0x10000000, len(original))
            equal(mask(original, sec), mask(retail, sec))
            for r in sec['relocs']:
                if r['type'] != 20 or names[r['sym']] != name:
                    continue
                p = r['vaddr']
                assert retail[p - 1] == 0xe8
                destination = (address + p + 4 + struct.unpack_from('<i', retail, p)[0]
                    - struct.unpack_from('<I', original, p)[0]) & 0xffffffff
                edges.add(destination)
                evidence.append({'caller': ref['symbols'][0], 'address': hex(address),
                                 'offset': p, 'callee': hex(destination),
                                 'complete_sdk_caller_section_equal': True})
        address, = edges
        dependency = runtime[member]
        dc = m['parse_coff'](dependency)
        definition, = [s for s in dc['symbols'] if s['name'] == name and s['sec'] > 0]
        sec = dc['sections'][definition['sec'] - 1]
        assert definition['value'] == 0
        # Original MASM stack probe lacks the C compiler's COFF function type.
        assert is_function(dependency, definition) or (name == '__alloca_probe'
            and member == 390 and sec['name'] == '.text' and sec['rawsize'] == 61)
        original = dependency[sec['rawptr']:sec['rawptr'] + sec['rawsize']]
        retail = pe.get_data(address - 0x10000000, len(original))
        equal(mask(original, sec), mask(retail, sec))
        fields = {r['vaddr']: r['type'] for r in sec['relocs']}
        start = m['rva2off'](address - 0x10000000)
        expected = {p - start: 6 for p in m['PE_RELOCS'] if start <= p < start + len(original)}
        expected.update({p: 20 for p in branch_fields(retail, address)})
        assert fields == expected and len(fields) == len(sec['relocs'])
        assert name not in refs
        refs[name] = {'symbols': [name], 'member': len(oracle), 'section': definition['sec'],
                      'section_bytes': len(original), 'placements': [hex(address)],
                      'typed_caller_proofs': evidence, 'dependency_source_credit': 0}
        oracle.append(dependency)
    return refs
'''
overrides = [
    ('codex_shader_nodes', 'codex_shader_lexer'),
    ('build/codex35_nodes/libraries', 'build/codex35_lexer/libraries'),
    ("HERE.parent / 'codex30_token/obj'", "HERE / 'obj'"),
    ("candidate = OBJECTS / ('nodes.obj' if CLEAN else 'nodes_matched.obj')",
     "candidate = OBJECTS / ('lexer.obj' if CLEAN else 'lexer_matched.obj')"),
    ('assert len(functions) == 72', 'assert len(functions) == 7'),
    ("prefix = 'nodes' if CLEAN else 'nodes_matched'", "prefix = 'lexer' if CLEAN else 'lexer_matched'"),
    ('    refs = node_references(m, oracle, refs, pe)',
     '    refs = runtime_references(m, oracle, refs, pe)'),
    ('def main():', runtime_helper + '\ndef main():'),
    ('complete source node bodies', 'complete source tokenizer bodies'),
    ('reconstructed SDK shader-node C++; remaining SDK methods external',
     'reconstructed SDK tokenizer C++; remaining SDK/runtime methods external'),
    ('    paths = [sdk, discovery_path,',
     "    paths = [sdk, discovery_path, HERE / 'dependencies/libcmt.lib', ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp', ROOT / 'gfx/target/src/codex_shader_support/support.h',"),
    ("[SOURCES / (prefix + '.cpp')]",
     "[SOURCES / (prefix + '.cpp'), ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp', ROOT / 'gfx/target/src/codex_shader_support/support.h']"),
]
marker = '\nexec(compile(source'
assert source.count(marker) == 1
source = source.replace(marker, '\nfor before, after in overrides:\n    assert before in source, before\n    source = source.replace(before, after)\n' + marker)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'),
     '__name__': '__main__', 'overrides': overrides})

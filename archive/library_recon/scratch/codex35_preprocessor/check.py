"""Complete preprocessor source bodies; retain pinned SDK and binding gates."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_nodes/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '662f35a91c9d5ac91821aa0002681dee5e9d994d632ea9a7311f05dba77893c7'
source = prior.read_text()
runtime = '''
def runtime_references(m, oracle, refs, pe):
    sdk_ref = refs['?Assure@CAssembler@D3DXShader@@IAEJI@Z']
    raw = oracle[sdk_ref['member']]
    coff = m['parse_coff'](raw)
    sec = coff['sections'][sdk_ref['section'] - 1]
    address, = [int(v, 16) for v in sdk_ref['placements']]
    original = raw[sec['rawptr']:sec['rawptr'] + sec['rawsize']]
    retail = pe.get_data(address - 0x10000000, len(original))
    equal(mask(original, sec), mask(retail, sec))
    names = {s['idx']: s['name'] for s in coff['symbols']}
    for name, file, digest in [
        ('??2@YAPAXI@Z', 'new.obj', 'b50d9802dcd8d135e5159c0de26fff5cf8bd43e99af1244bd609d743ebb8723a'),
        ('??3@YAXPAX@Z', 'delete.obj', 'aead5eabbcdf9cd490a1d80ae60de7cdce13269a57372dedc055c055a000da24')]:
        path = HERE.parent / 'codex30_cpp/obj/mt' / file
        assert sha(path) == digest
        dependency = path.read_bytes()
        dc = m['parse_coff'](dependency)
        fn, = [s for s in dc['symbols'] if s['name'] == name and s['sec'] > 0]
        edge, = [r for r in sec['relocs'] if names[r['sym']] == name]
        p = edge['vaddr']
        assert edge['type'] == 20 and retail[p - 1] == 0xe8
        target = (address + p + 4 + struct.unpack_from('<i', retail, p)[0]
                  - struct.unpack_from('<I', original, p)[0]) & 0xffffffff
        ds = dc['sections'][fn['sec'] - 1]
        equal(mask(dependency[ds['rawptr']:ds['rawptr'] + ds['rawsize']], ds),
              mask(pe.get_data(target - 0x10000000, ds['rawsize']), ds))
        assert name not in refs
        refs[name] = {'symbols': [name], 'member': len(oracle), 'section': fn['sec'],
                      'section_bytes': ds['rawsize'], 'placements': [hex(target)],
                      'dependency_source_credit': 0}
        oracle.append(dependency)
    return refs
'''
overrides = [
    ('codex_shader_nodes', 'codex_shader_preprocessor'),
    ('build/codex35_nodes/libraries', 'build/codex35_preprocessor/libraries'),
    ("HERE.parent / 'codex30_token/obj'", "HERE / 'obj'"),
    ("candidate = OBJECTS / ('nodes.obj' if CLEAN else 'nodes_matched.obj')",
     "candidate = OBJECTS / ('preprocessor.obj' if CLEAN else 'preprocessor_matched.obj')"),
    ('assert len(functions) == 72', 'assert len(functions) == 25'),
    ("        address, = [int(v, 16) for v in ref['placements']]",
     "        assert len(ref['placements']) == 1, (name, ref['placements'])\n        address, = [int(v, 16) for v in ref['placements']]"),
    ('        assert fields == expected',
     '        assert fields == expected, (name, hex(address), fields, expected)'),
    ('        branches = branch_fields(retail[:code_bytes], address)',
     '''        branches = branch_fields(retail[:code_bytes], address)
        # These typed SDK sections contain recursive calls to their own entry.
        # The shared branch locator intentionally excludes all internal edges.
        for instruction in d.disasm(retail[:code_bytes], address):
            if instruction.size == 5 and instruction.bytes[0] == 0xe8:
                target = instruction.address + 5 + struct.unpack('<i', instruction.bytes[1:])[0]
                if target == address:
                    branches[instruction.address - address + 1] = target'''),
    ("prefix = 'nodes' if CLEAN else 'nodes_matched'", "prefix = 'preprocessor' if CLEAN else 'preprocessor_matched'"),
    ('def node_references(m, oracle, refs, pe):', 'def node_references(m, oracle, refs, pe, member=75):'),
    ('    raw = oracle[75]', '    raw = oracle[member]'),
    ("'member': 75,", "'member': member,"),
    ('    refs = node_references(m, oracle, refs, pe)',
     '''    refs = node_references(m, oracle, refs, pe)
    # A typed deleting-helper edge can resolve its destructor only next pass.
    previous = None
    while previous != {n: tuple(r['placements']) for n, r in refs.items()}:
        previous = {n: tuple(r['placements']) for n, r in refs.items()}
        refs = node_references(m, oracle, refs, pe, member=94)
    refs = runtime_references(m, oracle, refs, pe)'''),
    ('def main():', runtime + '\ndef main():'),
    ("        with contextlib.redirect_stdout(io.StringIO()):\n            assert m['cmd_diff'](hex(address), str(obj), name) == 100",
     '''        import os
        prior_mask = os.environ.pop('MASK_INTRA', None)
        try:
            if address in branches.values():
                # Use the original referee's existing option for recursive
                # COFF relocations, after the complete strict binding proof.
                assert name in ('??1CPPConditional@D3DXShader@@QAE@XZ',
                                '??1CPPBlock@D3DXShader@@QAE@XZ')
                os.environ['MASK_INTRA'] = '1'
            with contextlib.redirect_stdout(io.StringIO()):
                result = m['cmd_diff'](hex(address), str(obj), name)
            assert result == 100, (name, result)
        finally:
            os.environ.pop('MASK_INTRA', None)
            if prior_mask is not None:
                os.environ['MASK_INTRA'] = prior_mask'''),
    ("ins[-1].mnemonic == 'ret'", "(ins[-1].mnemonic == 'ret' or name == '?FindDefine@CPreProcessor@D3DXShader@@IAEHPBDPAPAVCNode@2@1@Z' and code_bytes == 135 and ins[-1].mnemonic == 'jmp' and int(ins[-1].op_str, 16) == address + 100 and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 100 <= i.address - address <= 103] == [(100, 'pop', 'edi'), (101, 'pop', 'esi'), (102, 'pop', 'ebp'), (103, 'ret', '0xc')])"),
    ('complete source node bodies', 'complete source preprocessor bodies'),
    ('reconstructed SDK shader-node C++; remaining SDK methods external',
     'reconstructed SDK preprocessor C++; remaining SDK/runtime methods external'),
    ('    paths = [sdk, discovery_path,',
     "    paths = [sdk, discovery_path, ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp', ROOT / 'gfx/target/src/codex_shader_support/support.h', ROOT / 'gfx/target/src/codex_shader_lexer/lexer.cpp', HERE.parent / 'codex30_cpp/obj/mt/new.obj', HERE.parent / 'codex30_cpp/obj/mt/delete.obj',"),
    ("[SOURCES / (prefix + '.cpp')]",
     "[SOURCES / (prefix + '.cpp'), ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp', ROOT / 'gfx/target/src/codex_shader_support/support.h', ROOT / 'gfx/target/src/codex_shader_lexer/lexer.cpp']"),
]
marker = '\nexec(compile(source'
assert source.count(marker) == 1
source = source.replace(marker, '\nfor before, after in overrides:\n    assert before in source, before\n    source = source.replace(before, after)\n' + marker)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'),
     '__name__': '__main__', 'overrides': overrides})

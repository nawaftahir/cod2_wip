"""Reuse the pinned complete-body proof for two assembler source TUs."""
import hashlib
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
prior = HERE.parent / 'codex35_nodes/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '662f35a91c9d5ac91821aa0002681dee5e9d994d632ea9a7311f05dba77893c7'
parts = []
for prefix, count in [('asm_nodes', 6), ('assembler', 8)]:
    candidate = prefix if prefix == 'asm_nodes' or '--clean' in sys.argv else 'assembler_matched'
    output = ('clean_' if '--clean' in sys.argv else '') + prefix + '_packet.json'
    external_vtable = '''        dependency_raw, dependency_coff = original, oc
        if old_function['sec'] <= 0:
            dependency = refs[old_function['name']]
            assert target in [int(v, 16) for v in dependency['placements']]
            dependency_raw = oracle[dependency['member']]
            dependency_coff = m['parse_coff'](dependency_raw)
            old_function, = [s for s in dependency_coff['symbols']
                             if s['name'] == old_function['name'] and s['sec'] > 0]
        assert is_function(dependency_raw, old_function)
        callee = dependency_coff['sections'][old_function['sec'] - 1]
        expected = dependency_raw[callee['rawptr']:callee['rawptr'] + callee['rawsize']]'''
    overrides = [
        ('codex_shader_nodes', 'codex_shader_assembler'),
        ('build/codex35_nodes/libraries', 'build/codex30_assembler/libraries'),
        ("candidate = OBJECTS / ('nodes.obj' if CLEAN else 'nodes_matched.obj')",
         "candidate = OBJECTS / %r" % (candidate + '.obj')),
        ('assert len(functions) == 72', 'assert len(functions) == %d' % count),
        ("prefix = 'nodes' if CLEAN else 'nodes_matched'", 'prefix = %r' % candidate),
        ("    refs = node_references(m, oracle, refs, pe)", '''    refs = node_references(m, oracle, refs, pe)
    # Complete original SDK call edges identify zero-credit CRT dependencies.
    sdk_ref = refs['?Assure@CAssembler@D3DXShader@@IAEJI@Z']
    sdk_raw = oracle[sdk_ref['member']]
    sdk_coff = m['parse_coff'](sdk_raw)
    sdk_section = sdk_coff['sections'][sdk_ref['section'] - 1]
    sdk_address, = [int(v, 16) for v in sdk_ref['placements']]
    sdk_body = sdk_raw[sdk_section['rawptr']:sdk_section['rawptr'] + sdk_section['rawsize']]
    retail_body = pe.get_data(sdk_address - 0x10000000, len(sdk_body))
    equal(mask(sdk_body, sdk_section), mask(retail_body, sdk_section))
    sdk_names = {s['idx']: s['name'] for s in sdk_coff['symbols']}
    for runtime_name, file_name, digest in [
        ('??2@YAPAXI@Z', 'new.obj', 'b50d9802dcd8d135e5159c0de26fff5cf8bd43e99af1244bd609d743ebb8723a'),
        ('??3@YAXPAX@Z', 'delete.obj', 'aead5eabbcdf9cd490a1d80ae60de7cdce13269a57372dedc055c055a000da24')]:
        dependency_path = HERE.parent / 'codex30_cpp/obj/mt' / file_name
        assert sha(dependency_path) == digest
        raw_dependency = dependency_path.read_bytes()
        dependency_coff = m['parse_coff'](raw_dependency)
        definition, = [s for s in dependency_coff['symbols'] if s['name'] == runtime_name and s['sec'] > 0]
        edge, = [r for r in sdk_section['relocs'] if sdk_names[r['sym']] == runtime_name]
        p = edge['vaddr']
        assert edge['type'] == 20 and retail_body[p - 1] == 0xe8
        address = (sdk_address + p + 4 + struct.unpack_from('<i', retail_body, p)[0]
                   - struct.unpack_from('<I', sdk_body, p)[0]) & 0xffffffff
        runtime_section = dependency_coff['sections'][definition['sec'] - 1]
        equal(mask(raw_dependency[runtime_section['rawptr']:runtime_section['rawptr'] + runtime_section['rawsize']], runtime_section),
              mask(pe.get_data(address - 0x10000000, runtime_section['rawsize']), runtime_section))
        assert runtime_name not in refs
        refs[runtime_name] = {'symbols': [runtime_name], 'member': len(oracle), 'section': definition['sec'],
                             'section_bytes': runtime_section['rawsize'], 'placements': [hex(address)]}
        oracle.append(raw_dependency)'''),
        ('def certify_vtable(m, refs, pe, original,', 'def certify_vtable(m, refs, pe, oracle, original,'),
        ('certify_vtable(m, refs, pe, original,', 'certify_vtable(m, refs, pe, oracle, original,'),
        ("        assert old_function['sec'] > 0 and is_function(original, old_function)\n"
         "        callee = oc['sections'][old_function['sec'] - 1]\n"
         "        expected = original[callee['rawptr']:callee['rawptr'] + callee['rawsize']]", external_vtable),
        ("('clean_packet.json' if CLEAN else 'packet.json')", repr(output)),
        ('complete source node bodies', 'complete source assembler bodies'),
        ('reconstructed SDK shader-node C++; remaining SDK methods external',
         'reconstructed SDK assembler C++; remaining SDK methods external'),
        ("ins[-1].mnemonic == 'ret'", "(ins[-1].mnemonic == 'ret' or name == '?Token@CAssembler@D3DXShader@@IAEHXZ' and ins[-1].mnemonic == 'jmp' and int(ins[-1].op_str, 16) == address + 63 and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 63 <= i.address - address <= 66] == [(63, 'pop', 'edi'), (64, 'pop', 'esi'), (65, 'pop', 'ebx'), (66, 'ret', '')])"),
        ('    paths = [sdk, discovery_path,', "    paths = [sdk, discovery_path, ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp', ROOT / 'gfx/target/src/codex_shader_support/support.h', HERE.parent / 'codex30_cpp/obj/mt/new.obj', HERE.parent / 'codex30_cpp/obj/mt/delete.obj',"),
        ('    paths = [sdk, discovery_path,', "    paths = [sdk, discovery_path, *(ROOT / 'sdk/sum2004/Include').glob('*.h'), *(ROOT / 'sdk/sum2004/Include').glob('*.inl'),"),
    ]
    source = prior.read_text()
    marker = '\nexec(compile(source'
    assert source.count(marker) == 1
    source = source.replace(marker, '\nfor before, after in overrides:\n    assert before in source, before\n    source = source.replace(before, after)\n' + marker)
    exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'),
         '__name__': '__main__', 'overrides': overrides})
    parts.append(json.loads((HERE / output).read_text()))
packet = parts[0]
packet['rows'] += parts[1]['rows']
packet['files'].update(parts[1]['files'])
packet['verified_instruction_bytes'] += parts[1]['verified_instruction_bytes']
assert len(packet['rows']) == 14 and packet['verified_instruction_bytes'] == 1517
(HERE / ('clean_packet.json' if '--clean' in sys.argv else 'packet.json')).write_text(
    json.dumps(packet, indent=2) + '\n')
print('PASS: 14 complete assembler bodies; 1517 instruction bytes; tables excluded')

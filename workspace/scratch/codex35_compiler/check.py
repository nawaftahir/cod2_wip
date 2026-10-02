"""Reuse strict complete-body/binding proof for eight compiler definitions."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_nodes/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == '662f35a91c9d5ac91821aa0002681dee5e9d994d632ea9a7311f05dba77893c7'
source = prior.read_text()
runtime = '''
def runtime_references(m, oracle, refs, pe):
    crt_path = HERE.parent / 'codex35_lexer/dependencies/libcmt.lib'
    assert sha(crt_path) == '6e2b3742e58245de52149137f64281b73db1487a07a31e165fff269fbf9b2ee8'
    floating = list(members(crt_path.read_bytes()))[721]
    pins = [
        ('??2@YAPAXI@Z', '?Scratch@CCompiler@D3DXShader@@IAEPAII@Z',
         HERE.parent / 'codex30_cpp/obj/mt/new.obj',
         'b50d9802dcd8d135e5159c0de26fff5cf8bd43e99af1244bd609d743ebb8723a'),
        ('??3@YAXPAX@Z', '?Scratch@CCompiler@D3DXShader@@IAEPAII@Z',
         HERE.parent / 'codex30_cpp/obj/mt/delete.obj',
         'aead5eabbcdf9cd490a1d80ae60de7cdce13269a57372dedc055c055a000da24'),
        ('__finite', '?EvalValue@CCompiler@D3DXShader@@IAEJIPAN@Z', None, None),
        ('__isnan', '?EvalRange_Mul@CCompiler@D3DXShader@@IAEXPAU_D3DXRANGE@2@00K@Z', None, None)]
    for name, caller, path, digest in pins:
        if path:
            assert sha(path) == digest
            dependency = path.read_bytes()
        else:
            dependency = floating
        dc = m['parse_coff'](dependency)
        fn, = [s for s in dc['symbols'] if s['name'] == name and s['sec'] > 0]
        assert is_function(dependency, fn) and fn['value'] == 0
        ref = refs[caller]
        raw = oracle[ref['member']]
        coff = m['parse_coff'](raw)
        section = coff['sections'][ref['section'] - 1]
        va, = [int(v, 16) for v in ref['placements']]
        original = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
        retail = pe.get_data(va - 0x10000000, len(original))
        equal(mask(original, section), mask(retail, section))
        names = {s['idx']: s['name'] for s in coff['symbols']}
        edges = [r for r in section['relocs'] if names[r['sym']] == name]
        assert len(edges) == (2 if name == '__finite' else 1)
        targets = set()
        for edge in edges:
            p = edge['vaddr']
            assert edge['type'] == 20 and retail[p - 1] == 0xe8
            targets.add((va + p + 4 + struct.unpack_from('<i', retail, p)[0]
                - struct.unpack_from('<I', original, p)[0]) & 0xffffffff)
        target, = targets
        ds = dc['sections'][fn['sec'] - 1]
        equal(mask(dependency[ds['rawptr']:ds['rawptr'] + ds['rawsize']], ds),
              mask(pe.get_data(target - 0x10000000, ds['rawsize']), ds))
        assert name not in refs
        refs[name] = {'symbols': [name], 'member': len(oracle), 'section': fn['sec'],
            'section_bytes': ds['rawsize'], 'placements': [hex(target)],
            'typed_caller': caller, 'dependency_source_credit': 0}
        oracle.append(dependency)
    return refs
'''
overrides = [
    ('codex_shader_nodes', 'codex_shader_compiler'),
    ('build/codex35_nodes/libraries', 'build/codex35_compiler/libraries'),
    ("HERE.parent / 'codex30_token/obj'", "HERE / 'obj'"),
    ("candidate = OBJECTS / ('nodes.obj' if CLEAN else 'nodes_matched.obj')",
     "candidate = OBJECTS / ('compiler.obj' if CLEAN else 'compiler_matched.obj')"),
    ('assert len(functions) == 72', 'assert len(functions) == 8'),
    ("prefix = 'nodes' if CLEAN else 'nodes_matched'", "prefix = 'compiler' if CLEAN else 'compiler_matched'"),
    ('    refs = node_references(m, oracle, refs, pe)',
     '    refs = node_references(m, oracle, refs, pe)\n    refs = runtime_references(m, oracle, refs, pe)'),
    ('def main():', runtime + '\ndef main():'),
    ("ins[-1].mnemonic == 'ret'", "(ins[-1].mnemonic == 'ret' or name == '?IsFullySemantic@CCompiler@D3DXShader@@IAEHPAII@Z' and code_bytes == 69 and ins[-1].mnemonic == 'jmp' and int(ins[-1].op_str, 16) == address + 59 and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 59 <= i.address - address <= 62] == [(59, 'pop', 'edi'), (60, 'pop', 'esi'), (61, 'pop', 'ebp'), (62, 'ret', '8')])"),
    ('complete source node bodies', 'complete source compiler bodies'),
    ('reconstructed SDK shader-node C++; remaining SDK methods external',
     'reconstructed SDK compiler C++; remaining SDK/runtime methods external'),
    ("'compile_flags': '/O1 /Oy- /hotpatch /MT /Gy'",
     "'compile_flags': '/O1 /Oy- /hotpatch /MT /Gy /d2QIftol'"),
    ("if CLEAN else 'sha256:9147e3086f65d733e1bb939cfa4aad7882f494cd87183739258b72194661a694'",
     "if CLEAN else 'sha256:17ddd3cc30517bc070c4e1a1d8bec9c4abd0d8b453115dfa0324e7e20dc94131'"),
    ('    paths = [sdk, discovery_path,',
     "    paths = [sdk, discovery_path, ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp', HERE.parent / 'codex35_lexer/dependencies/libcmt.lib', HERE.parent / 'codex30_cpp/obj/mt/new.obj', HERE.parent / 'codex30_cpp/obj/mt/delete.obj',"),
    ("[SOURCES / (prefix + '.cpp')]",
     "[SOURCES / (prefix + '.cpp'), ROOT / 'gfx/target/src/codex_shader_nodes/nodes.cpp']"),
]
marker = '\nexec(compile(source'
assert source.count(marker) == 1
source = source.replace(marker, '\nfor before, after in overrides:\n    assert before in source, before\n    source = source.replace(before, after)\n' + marker)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__', 'overrides': overrides})

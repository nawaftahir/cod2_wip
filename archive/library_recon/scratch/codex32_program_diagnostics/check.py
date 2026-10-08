"""Reuse full typed proof; certify Link's exact SDK tail-jump boundary."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d'
source = prior.read_text()
source = source.replace('codex35_program_flow', 'codex32_program_diagnostics')
source = source.replace('codex_shader_program_flow', 'codex_shader_program_diagnostics')
source = source.replace('flow_matched.obj', 'diagnostics.obj').replace('flow.obj', 'diagnostics.obj')
source = source.replace("prefix = 'flow' if CLEAN else 'flow_matched'", "prefix = 'diagnostics'")
source = source.replace('assert len(functions) == 4', 'assert len(functions) == 4')
source = source.replace('complete source program-flow bodies', 'complete source program-driver bodies')
boundary = "(ins[-1].mnemonic == 'ret' or name == '?Link@CProgram@D3DXShader@@IAEJXZ' and code_bytes == 91 and ins[-1].address == address + 86 and ins[-1].mnemonic == 'jmp' and refs['?DeadLinkRemove@CProgram@D3DXShader@@AAEJXZ']['placements'] == [hex(int(ins[-1].op_str, 16))] and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 78 <= i.address - address <= 80] == [(78, 'pop', 'edi'), (79, 'pop', 'esi'), (80, 'mov', 'ecx, dword ptr [ecx + 0xe0]')])"
tail_edge = "assert int(i.op_str, 16) in starts or name == '?Link@CProgram@D3DXShader@@IAEJXZ' and code_bytes == 91 and i.address == address + 86 and i.mnemonic == 'jmp' and refs['?DeadLinkRemove@CProgram@D3DXShader@@AAEJXZ']['placements'] == [hex(int(i.op_str, 16))]"
source = source.replace('marker = ', 'overrides.extend([(' + repr("ins[-1].mnemonic == 'ret'") + ', ' + repr(boundary) + '), (' + repr('assert int(i.op_str, 16) in starts') + ', ' + repr(tail_edge) + ')])\nmarker = ', 1)
crt = '''
def diagnostic_runtime_references(m, oracle, refs, pe):
    library = HERE.parent / 'codex35_lexer/dependencies/libcmt.lib'
    assert sha(library) == '6e2b3742e58245de52149137f64281b73db1487a07a31e165fff269fbf9b2ee8'
    objects = list(members(library.read_bytes()))
    pins = [('__vsnprintf', 496, '?Error@CProgram@D3DXShader@@IAAJPAVCNode@2@IPBDZZ', 86),
            ('__snprintf', 478, '?GetArgumentName@CProgram@D3DXShader@@MAEXPAVCArgument@2@PADI@Z', 87)]
    for name, member, caller, size in pins:
        dependency = objects[member]
        dc = m['parse_coff'](dependency)
        fn, = [s for s in dc['symbols'] if s['name'] == name and s['sec'] > 0]
        ds = dc['sections'][fn['sec'] - 1]
        assert is_function(dependency, fn) and fn['value'] == 0 and ds['rawsize'] == size
        ref = refs[caller]
        raw = oracle[ref['member']]
        c = m['parse_coff'](raw)
        sec = c['sections'][ref['section'] - 1]
        address, = [int(v, 16) for v in ref['placements']]
        body = raw[sec['rawptr']:sec['rawptr'] + sec['rawsize']]
        retail = pe.get_data(address - 0x10000000, sec['rawsize'])
        equal(mask(body, sec), mask(retail, sec))
        symbols = {s['idx']: s['name'] for s in c['symbols']}
        edges = [r for r in sec['relocs'] if symbols[r['sym']] == name]
        assert len(edges) == (1 if name == '__vsnprintf' else 3)
        targets = set()
        for r in edges:
            p = r['vaddr']
            assert r['type'] == 20 and retail[p - 1] == 0xe8
            targets.add((address + p + 4 + struct.unpack_from('<i', retail, p)[0] - struct.unpack_from('<I', body, p)[0]) & 0xffffffff)
        target, = targets
        equal(mask(dependency[ds['rawptr']:ds['rawptr'] + size], ds), mask(pe.get_data(target - 0x10000000, size), ds))
        assert name not in refs
        refs[name] = {'symbols': [name], 'member': len(oracle), 'section': fn['sec'], 'section_bytes': size,
                      'placements': [hex(target)], 'typed_caller': caller, 'dependency_source_credit': 0}
        oracle.append(dependency)
    return refs
'''
extra = [('def main():', crt + '\ndef main():'),
         ('    refs = runtime_references(m, oracle, refs, pe)',
          '    refs = runtime_references(m, oracle, refs, pe)\n    refs = diagnostic_runtime_references(m, oracle, refs, pe)')]
source = source.replace('marker = ', 'overrides.extend(' + repr(extra) + ')\nmarker = ', 1)
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__'})

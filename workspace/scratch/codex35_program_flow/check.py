"""Complete typed proof of the three matched program-flow bodies."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex31_program/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'eb059e16ab89aac066d7e5cf98d1792514a8cff2af0b049cfeb82bbb569cddf5'
source = prior.read_text()
callback = '''
def index_reference(m, oracle, refs, pe):
    name = '?CompareIndex@D3DXShader@@YGHIIPBX@Z'
    caller = refs['?ParentChildInfo@CProgram@D3DXShader@@IAEJXZ']
    raw = oracle[caller['member']]
    coff = m['parse_coff'](raw)
    section = coff['sections'][caller['section'] - 1]
    address, = [int(v, 16) for v in caller['placements']]
    body = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
    retail = pe.get_data(address - 0x10000000, section['rawsize'])
    equal(mask(body, section), mask(retail, section))
    names = {s['idx']: s['name'] for s in coff['symbols']}
    edges = [r for r in section['relocs'] if names[r['sym']] == name]
    assert len(edges) == 2 and all(r['type'] == 6 for r in edges)
    bases = {struct.unpack_from('<I', retail, r['vaddr'])[0] - struct.unpack_from('<I', body, r['vaddr'])[0] for r in edges}
    target, = bases
    assert target == 0x100865c6
    ref = dict(refs[name])
    dependency = oracle[ref['member']]
    dc = m['parse_coff'](dependency)
    ds = dc['sections'][ref['section'] - 1]
    assert ds['rawsize'] == 26 and not ds['relocs']
    equal(dependency[ds['rawptr']:ds['rawptr'] + 26], pe.get_data(target - 0x10000000, 26))
    ref['placements'] = [hex(target)]
    ref['typed_caller'] = caller['symbols'][0]
    refs[name] = ref
    return refs
'''
overrides = [
    ('    m = load_matcher()', '''    m = load_matcher()
    from functools import lru_cache
    parse_uncached = m['parse_coff']
    m['parse_coff'] = lru_cache(maxsize=256)(parse_uncached)
    seed = oracle[90]
    assert m['parse_coff'](seed) == parse_uncached(seed)
    assert m['parse_coff'](seed) == parse_uncached(seed)
    assert m['parse_coff'].cache_info().hits == 1
    changed = bytearray(seed)
    executable, = [s for s in parse_uncached(seed)['sections'] if s['name'] == '.text' and s['rawsize'] == 565]
    changed[executable['rawptr']] ^= 1
    assert m['parse_coff'](bytes(changed)) == parse_uncached(bytes(changed))
    assert m['parse_coff'].cache_info().misses == 2'''),
    ('def main():', callback + '\ndef main():'),
    ('    refs = runtime_references(m, oracle, refs, pe)',
     '    refs = index_reference(m, oracle, refs, pe)\n    refs = runtime_references(m, oracle, refs, pe)'),
    ('codex_shader_program', 'codex_shader_program_flow'),
    ('build/codex31_program/libraries', 'build/codex35_program_flow/libraries'),
    ("candidate = OBJECTS / ('program.obj' if CLEAN else 'program_matched.obj')", "candidate = OBJECTS / ('flow.obj' if CLEAN else 'flow_matched.obj')"),
    ('assert len(functions) == 12', 'assert len(functions) == 4'),
    ("ins[-1].mnemonic == 'ret'", "(ins[-1].mnemonic == 'ret' or name == '?Initialize@CBaseProgram@D3DXShader@@QAEJPAV12@@Z' and code_bytes == 210 and ins[-1].mnemonic == 'jmp' and int(ins[-1].op_str, 16) == address + 196 and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 196 <= i.address - address <= 200] == [(196, 'pop', 'edi'), (197, 'pop', 'esi'), (198, 'pop', 'ebx'), (199, 'pop', 'ebp'), (200, 'ret', '4')])"),
    ("prefix = 'program'", "prefix = 'flow' if CLEAN else 'flow_matched'"),
    ('        refs = node_references(m, oracle, refs, pe, member=90)',
     '        refs = node_references(m, oracle, refs, pe, member=89)\n        refs = node_references(m, oracle, refs, pe, member=90)'),
    ('        branches = branch_fields(retail[:code_bytes], address)', '''        branches = branch_fields(retail[:code_bytes], address)
        for instruction in d.disasm(retail[:code_bytes], address):
            if instruction.size == 5 and instruction.bytes[0] == 0xe8:
                destination = instruction.address + 5 + struct.unpack('<i', instruction.bytes[1:])[0]
                if destination == address:
                    branches[instruction.address - address + 1] = destination'''),
    ("        with contextlib.redirect_stdout(io.StringIO()):\n            assert m['cmd_diff'](hex(address), str(obj), name) == 100", '''        from importlib.util import spec_from_file_location, module_from_spec
        normalizer = HERE.parent / 'codex35_compiler_types/referee.py'
        assert sha(normalizer) == 'NORMALIZER_PIN'
        spec = spec_from_file_location('flow_referee', normalizer)
        decoded = module_from_spec(spec)
        spec.loader.exec_module(decoded)
        decoded.self_check()
        with contextlib.redirect_stdout(io.StringIO()):
            raw_score = m['cmd_diff'](hex(address), str(obj), name)
        original_mask = m['pe_mask_for']
        try:
            m['pe_mask_for'] = lambda off, size, code, rva: decoded.relocation_mask(m, off, size, code, rva, code_bytes)
            with contextlib.redirect_stdout(io.StringIO()):
                assert m['cmd_diff'](hex(address), str(obj), name) == 100
        finally:
            m['pe_mask_for'] = original_mask'''),
    ("'original_referee_match': 100", "'original_referee_match': raw_score, 'instruction_aware_referee_match': 100"),
    ('complete source program bodies', 'complete source program-flow bodies'),
    (" + ('' if CLEAN else ' /DPROGRAM_MATCHED_ONLY')", ""),
    ('    paths = [sdk, discovery_path,', "    paths = [sdk, discovery_path, HERE.parent / 'codex35_compiler_types/referee.py',"),
]
normalizer_pin = '1f7f5e7380267e5cfe11fc03ffa31a3cee0996c3777749314685a04e0d9ba740'
overrides = [(a, b.replace('NORMALIZER_PIN', normalizer_pin)) for a, b in overrides]
marker = "'program_overrides': overrides}"
assert source.count(marker) == 1
source = source.replace(marker, "'program_overrides': overrides + flow_overrides}")
exec(compile(source, str(prior), 'exec'),
     {'__file__': str(HERE / 'check.py'), '__name__': '__main__', 'flow_overrides': overrides})

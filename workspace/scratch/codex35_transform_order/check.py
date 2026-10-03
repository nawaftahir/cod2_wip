"""Reuse complete byte/binding gates; resolve the callback through its caller."""
import hashlib
from pathlib import Path
HERE = Path(__file__).resolve().parent
prior = HERE.parent / 'codex35_program_flow/check.py'
assert hashlib.sha256(prior.read_bytes()).hexdigest() == 'ce576c6e32ee2270b5e992cbcbb9eca38b0a52bd56aa7b319fad6e89e1eb528d'
source = prior.read_text()
source = source.replace('codex35_program_flow', 'codex35_transform_order')
source = source.replace('codex_shader_program_flow', 'codex_shader_transform_order')
source = source.replace('flow_matched.obj', 'transform.obj').replace('flow.obj', 'transform.obj')
source = source.replace("prefix = 'flow' if CLEAN else 'flow_matched'", "prefix = 'transform'")
source = source.replace('assert len(functions) == 4', 'assert len(functions) == (9 if CLEAN else 10)')
helper = '''
def transform_index_reference(m, oracle, refs, pe):
    name = '?CompareIndex@CTReorderInstructions@D3DXShader@@KGHIIPBX@Z'
    caller = refs['?RemoveDuplicates@CTReorderInstructions@D3DXShader@@IAEXPAI0@Z']
    raw = oracle[caller['member']]
    coff = m['parse_coff'](raw)
    section = coff['sections'][caller['section'] - 1]
    address, = [int(v, 16) for v in caller['placements']]
    body = raw[section['rawptr']:section['rawptr'] + section['rawsize']]
    retail = pe.get_data(address - 0x10000000, section['rawsize'])
    equal(mask(body, section), mask(retail, section))
    names = {s['idx']: s['name'] for s in coff['symbols']}
    edge, = [r for r in section['relocs'] if names[r['sym']] == name]
    assert edge['type'] == 6
    target = struct.unpack_from('<I', retail, edge['vaddr'])[0] - struct.unpack_from('<I', body, edge['vaddr'])[0]
    assert target == 0x100cbbac
    ref = dict(refs[name])
    original = oracle[ref['member']]
    dc = m['parse_coff'](original)
    ds = dc['sections'][ref['section'] - 1]
    assert ds['rawsize'] == 26 and not ds['relocs']
    equal(original[ds['rawptr']:ds['rawptr'] + 26], pe.get_data(target - 0x10000000, 26))
    ref['placements'] = [hex(target)]
    ref['typed_caller'] = caller['symbols'][0]
    refs[name] = ref
    return refs
'''
overrides = [
    ('def main():', helper + '\ndef main():'),
    ('    refs = runtime_references(m, oracle, refs, pe)', '    refs = transform_index_reference(m, oracle, refs, pe)\n    refs = runtime_references(m, oracle, refs, pe)'),
    ('complete source program-flow bodies', 'complete source instruction-transform bodies'),
    ("ins[-1].mnemonic == 'ret'", "(ins[-1].mnemonic == 'ret' or name == '?Reduce@CTReorderInstructions@D3DXShader@@IAEJXZ' and code_bytes == 109 and ins[-1].mnemonic == 'jmp' and int(ins[-1].op_str, 16) == address + 102 and [(i.address - address, i.mnemonic, i.op_str) for i in ins if 102 <= i.address - address <= 104] == [(102, 'pop', 'edi'), (103, 'pop', 'esi'), (104, 'ret', '')])"),
]
marker = "'flow_overrides': overrides}"
assert source.count(marker) == 1
source = source.replace(marker, "'flow_overrides': overrides + transform_overrides}")
exec(compile(source, str(prior), 'exec'), {'__file__': str(HERE / 'check.py'), '__name__': '__main__', 'transform_overrides': overrides})

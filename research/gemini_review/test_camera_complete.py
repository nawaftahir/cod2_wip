"""Audit the camera-target dialog, all ATL header bodies and generated cleanup."""
import json
from pathlib import Path
import runpy

m = runpy.run_path('research/gemini_review/test_dialog_batch.py')
v, image, t, o, md, blob, u, sym = (m[k] for k in ('v','img','t','o','md','blob','u','sym'))
names = v.known_names()
import sys
sys.path.insert(0,'research/codex_camera')
from prove_copy_lib import prove as prove_copy
copy_names=prove_copy(v,image)
names.update(copy_names)
blob.__globals__['names'].update(copy_names)
manifest = json.loads(Path('research/codex_camera/manifest.json').read_text())
pinned={int(r['addr'],16):r['symbol'] for r in manifest['original']}
names.update(pinned)
blob.__globals__['names'].update(pinned)
source = 'src/radiant/cameratargetdlg.cpp'
visited = set()
def prove(address, symbol):
    start, code = image.code(symbol)
    key = (address, start)
    if key in visited: return
    visited.add(key)
    assert v.check(image, hex(address), symbol, names)[0] == 'MATCH', (hex(address), symbol)
    blob(address, start, len(code))
    target, _ = v.matcher.carve(hex(address))
    for left, right in zip(md.disasm(target, address), md.disasm(code, start)):
        if left.mnemonic not in ('call','jmp') or left.operands[0].type != m['IMM']: continue
        a, b = left.operands[0].imm, right.operands[0].imm
        if address <= a < address+len(target): continue
        if a in names:
            assert names[a] in image.labels[b], (hex(address), hex(a), names[a])
        else:
            assert b in image.at, ('unresolved helper', hex(a), hex(b))
            prove(a, image.at[b])

for row in manifest['original'] + manifest['representatives']:
    prove(int(row['addr'],16), row['symbol'])
expected_addresses = {int(r['addr'],16) for r in v.read_tsv('data/tu_map.tsv') if r['tu']=='radiant/cameratargetdlg.cpp'}
assert {int(r['addr'],16) for r in manifest['original']} == expected_addresses
assert len(manifest['original']) == 27 and sum(r['size'] for r in manifest['original']) == 1243
assert sum(r['size'] for r in manifest['original'] if r['role']=='game') == 212
assert sum(r['size'] for r in manifest['original'] if r['role']=='SDK') == 998
assert sum(r['size'] for r in manifest['original'] if r['role']=='scalar') == 33
assert len(manifest['sdk_owned']) == 29
m['dialog']('CCameraTargetDlg',0x402940,0x402a50,0x53d75c,0x4029c0,0x402ee0,
            expected_count=5,expected_shared=tuple(manifest['sdk_owned']),dispatches=1,source=source)
# The CDialog runtime class is inherited, distinct from the child's RTTI identity.
target = t.get_data(0x53d75c-0x400000,4)
get_runtime = int.from_bytes(target,'little')
actual_runtime=u(o,sym('??_7CCameraTargetDlg@@6B@'))[0]
assert '?GetRuntimeClass@CDialog@@UBEPAUCRuntimeClass@@XZ' in image.labels[actual_runtime]
assert o.get_data(actual_runtime-image.base,6)[0]==0xb8 and o.get_data(actual_runtime-image.base,6)[-1]==0xc3
rt_code = t.get_data(get_runtime-0x400000,6)
assert rt_code[0]==0xb8 and rt_code[-1]==0xc3
rt = int.from_bytes(rt_code[1:5],'little')
actual_rt = sym('?classCDialog@CDialog@@')
assert u(t,rt,7)[1:4] == u(o,actual_rt,7)[1:4] == (0x70,0xffff,0)
assert u(t,rt,7)[5:] == u(o,actual_rt,7)[5:] == (0,0)
assert m['d']['z'](t,u(t,rt)[0]) == m['d']['z'](o,u(o,actual_rt)[0]) == b'CDialog'
assert m['d']['z'](t,u(t,u(t,rt,6)[4])[0]) == m['d']['z'](o,u(o,u(o,actual_rt,6)[4])[0]) == b'CWnd'
ctor = names[0x402940];a,code=image.code(ctor)
old_count=len(m['manifest'])
assert m['eh'](0x402940,a,len(code)) is True
for row in m['manifest'][old_count:]: print('CAMERA GENERATED:',*row)
dtor=names[0x4029f0];a,code=image.code(dtor)
assert not m['eh'](0x4029f0,a,len(code)), 'unexpected destructor EH'
caller,_=v.matcher.carve('0x00409ce0')
assert bytes.fromhex('83ec78') in caller[:32] and bytes.fromhex('8d857cffffff') in caller[:48]
print('PASS: retail caller reserves exactly 0x78 bytes for the dialog after its EH frame')
print('PASS: CameraTarget 5 game routines / 212 B; scalar / 33 B; 21 in-range SDK routines / 998 B')
print('PASS: all 29 source-owned SDK labels have byte-identical retail representatives; recursive helper bindings',len(visited))
print('PASS: full 86-slot vtable/RTTI, inherited CDialog runtime record, message dispatch, defaults, padding and constructor EH; placement PENDING')

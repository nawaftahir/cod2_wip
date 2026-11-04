"""Audit the complete MRU TU and its reviewed registry-loader boundary."""
import runpy
import struct
from capstone.x86 import X86_OP_IMM, X86_OP_MEM

m = runpy.run_path('research/codex_order/test_model.py')
v, image, retail, ours, md = (m[k] for k in ('verify', 'image', 'retail', 'ours', 'md'))
names = v.known_names()
source = 'src/radiant/mru.cpp'
expected = {
    0x46bcd0: (126, 'CreateMruMenu'), 0x46bd50: (28, 'CreateMruMenuDefault'),
    0x46bd70: (55, 'DeleteMruMenu'), 0x46bdb0: (19, 'SetNbLruShow'),
    0x46bdd0: (63, 'SetMenuItem'), 0x46be10: (70, 'GetMenuItem'),
    0x46be60: (186, 'AddNewItem'), 0x46bf20: (93, 'DelMenuItem'),
    0x46bf80: (269, 'PlaceMenuMRUItem'), 0x46c090: (242, 'SaveMruInIni'),
    0x46c190: (257, 'LoadMruInIni'), 0x46c2a0: (21, 'IsWin395OrHigher'),
    0x46c2c0: (284, 'SaveMruInReg'), 0x46c3e0: (299, 'LoadMruInReg'),
    0x46c510: (43, 'GetWin32Kind'),
}
rows = [r for r in v.read_tsv('ledger/matches.tsv') if r['source'] == source]
assert {int(r['addr'], 16): (int(r['size']), r['name']) for r in rows} == expected
assert set(image.of_source(source)) == {r['symbol'] for r in rows}, 'unaccounted helper or initializer'
tu = [r for r in v.read_tsv('data/tu_map.tsv') if r['tu'] == 'radiant/mru.cpp']
assert {int(r['addr'], 16): int(r['size']) for r in tu} == {a: p[0] for a, p in expected.items()}
placed = [image.syms[names[a]] for a in sorted(expected)]
assert placed == sorted(placed), 'retail routine order'
imports = literals = cookies = 0
cookie = m['data_symbol']('___security_cookie')
for row in rows:
    assert v.check(image, row['addr'], row['symbol'], names)[0] == 'MATCH', row
    address = int(row['addr'], 16)
    target, _ = v.matcher.carve(row['addr'])
    start, code = image.code(row['symbol'])
    for left, right in zip(md.disasm(target, address), md.disasm(code, start)):
        assert (left.mnemonic, left.size) == (right.mnemonic, right.size)
        for a, b in zip(left.operands, right.operands):
            if a.type == X86_OP_MEM and not a.mem.base and not a.mem.index:
                p = a.mem.disp
                if p in m['retail_imports']:
                    assert m['actual_imports'][b.mem.disp] == m['retail_imports'][p], (row, hex(p))
                    imports += 1
                elif p == 0x58ea68:
                    assert b.mem.disp == cookie
                    assert retail.get_data(p - 0x400000, 4) == ours.get_data(cookie - image.base, 4)
                    cookies += 1
                elif 0x400000 <= p < 0x1400000:
                    raise AssertionError(('unaccounted absolute data', row, hex(p)))
            if a.type == X86_OP_IMM and 0x52720e <= a.imm < 0x58f800:
                wanted = retail.get_data(a.imm - 0x400000, 128).split(b'\0', 1)[0]
                actual = ours.get_data(b.imm - image.base, 128).split(b'\0', 1)[0]
                assert wanted == actual, (row, wanted, actual)
                literals += 1
# Every byte between the first MRU entry and the next TU is code or real padding.
end = 0x46bcd0
padding = 0
for address, (size, _) in sorted(expected.items()):
    gap = retail.get_data(end - 0x400000, address - end)
    assert all(b in (0xcc, 0x90) for b in gap), hex(end)
    padding += len(gap)
    end = address + size
last = retail.get_data(end - 0x400000, 0x46c540 - end)
assert all(b in (0xcc, 0x90) for b in last)
padding += len(last)
assert sum(p[0] for p in expected.values()) == 2055 and padding == 105
# The former entry consumes flags from the preceding CMP and the same stack frame.
loader, _ = v.matcher.carve('0x0046c3e0')
assert loader[0x54:0x66] == bytes.fromhex('66837b0400 c745e800000000 0f868e000000')
assert loader[:6] == bytes.fromhex('558bec83ec28')
assert v.matcher._image.find(struct.pack('<I', 0x46c440)) == -1
for meta in v.matcher.FUNCTIONS.values():
    begin = int(meta['addr'], 16)
    code, _ = v.matcher.carve(meta['addr'])
    for ins in md.disasm(code, begin):
        if ins.mnemonic.startswith('j') or ins.mnemonic == 'call':
            if ins.operands and ins.operands[0].type == X86_OP_IMM and ins.operands[0].imm == 0x46c440:
                assert 0x46c3e0 <= ins.address < 0x46c50b, hex(ins.address)
assert '0x0046c440' not in v.matcher.FUNCTIONS
assert (imports, literals, cookies) == (61, 6, 4), (imports, literals, cookies)
print('PASS: MRU 15/15 routines / 2055 B; no extra helpers/EH/initializers; 105 B original padding')
print('PASS: %d import accesses, %d literals, %d cookie bindings; all direct callees checked' % (imports, literals, cookies))
print('PASS: loader 299 = 96 + 203 B; flag-dependent internal boundary; image placement PENDING')

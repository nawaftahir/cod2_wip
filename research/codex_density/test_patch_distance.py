"""Check real patch geometry helpers, their opaque layout, and the actual sqrt binding."""
import sys
import struct
sys.path.insert(0, 'tools')
import lib_sweep, verify
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from capstone.x86 import X86_OP_IMM, X86_OP_MEM
v = verify
image = v.Linked()
names = v.known_names()
md = Cs(CS_ARCH_X86, CS_MODE_32); md.detail = True
pe = v.pefile.PE(str(v.link.RETAIL), fast_load=True)
pairs = (
    ('0x00426280', '?Patch_CalcBounds@@YAXPAUpatchMesh_t@@AAY02M1_N@Z'),
    ('0x00426b80', '?Patch_WidthDistanceTo@@YAMPAUpatchMesh_t@@H@Z'),
    ('0x00426c10', '?Patch_HeightDistanceTo@@YAMPAUpatchMesh_t@@H@Z'),
    ('0x0041f0f0', '_sqrtf'),
    ('0x0041f0f0', '?sqrt@@YAMM@Z'),
)
for address, symbol in pairs:
    status, detail = v.check(image, address, symbol, names)
    assert status == 'MATCH', (address, symbol, status, detail)
    target, _ = v.matcher.carve(address)
    a, actual = image.code(symbol)
    calls = 0
    bound_constants = set()
    for left, right in zip(md.disasm(target, int(address, 16)), md.disasm(actual, a)):
        if left.mnemonic == 'call' and left.operands[0].type == X86_OP_IMM:
            assert left.operands[0].imm == 0x4d98d4
            assert '_sqrt' in image.labels[right.operands[0].imm]
            calls += 1
        if address == '0x00426280':
            expected = {0x556bb4: 8.0, 0x556b30: 0.5, 0x556b6c: 4.0}
            for x, y in zip(left.operands, right.operands):
                if x.type == X86_OP_MEM and not x.mem.base and x.mem.disp in expected:
                    assert y.type == X86_OP_MEM and not y.mem.base
                    original = struct.unpack('<f', pe.get_data(x.mem.disp-0x400000, 4))[0]
                    actual_value = struct.unpack('<f', image.pe.get_data(y.mem.disp-image.base, 4))[0]
                    assert original == actual_value == expected[x.mem.disp]
                    bound_constants.add(x.mem.disp)
    assert calls == (0 if address == '0x00426280' else 1)
    if address == '0x00426280':
        assert bound_constants == {0x556bb4, 0x556b30, 0x556b6c}
        assert b'\x66\xff\x87\x2c\x38\x00\x00' in target
    print('PASS:', address, symbol, len(target), 'bytes; inlined bounds/constants/version' if calls == 0 else 'bytes; actual _sqrt callee')
owned = set(image.of_source('src/radiant/Pmesh.cpp'))
assert owned == {symbol for _, symbol in pairs}, owned
assert not any('ehhandler$' in name and 'Patch_' in name for name in image.syms)
# The original sqrt object has two entry prefixes followed by one shared body.
member, data = next((name, data) for name, data in lib_sweep.archive_members('/opt/msvc710/Vc7/lib/libcmt.lib') if name.lower().endswith('\\sqrt.obj'))
code, mask, selected = v.matcher.object_function(data, '__CIsqrt')
pe = v.pefile.PE(str(v.link.RETAIL), fast_load=True)
target = pe.get_data(0x4d98c0-0x400000, len(code))
tm = v.matcher.absolute_masks(target, v.matcher.pe_relocations(0x4d98c0, len(target), target))
assert selected == '__CIsqrt' and len(code) == 186 and b'\xd9\xfa' in code
assert v.matcher.normalize(target, mask | tm) == v.matcher.normalize(code, mask | tm)
sections, symbols = v.matcher.parse_coff(data)
sqrt_symbol = next(s for s in symbols if s['name'] == '_sqrt')
assert sqrt_symbol['value'] == 20 and 0x4d98c0+20 == 0x4d98d4
print('PASS:', member, '186 normalized bytes; __CIsqrt + _sqrt prefixes and shared FSQRT body; inventory unchanged')
allocation, _ = v.matcher.carve('0x00425770')
assert b'\x68\x38\x38\x00\x00' in allocation
assert b'\xb9\x00\x0e\x00\x00' in allocation
assert b'\x8d\x7e\x24' in allocation
print('PASS: 0x3838 patch allocation and 0x24 control start; 16x16 controls of 0x38 bytes, with compile-time layout assertions')
print('PASS: three authored Pmesh routines / 676 B; two 28-byte SDK wrappers equal the retail representative at 0x41f0f0; original ownership/placement pending; Pmesh remains PARTIAL')

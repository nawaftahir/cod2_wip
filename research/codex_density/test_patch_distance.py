"""Check real patch geometry helpers, their opaque layout, and the actual sqrt binding."""
import sys
sys.path.insert(0, 'tools')
import lib_sweep, verify
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from capstone.x86 import X86_OP_IMM
v = verify
image = v.Linked()
names = v.known_names()
md = Cs(CS_ARCH_X86, CS_MODE_32); md.detail = True
pairs = (
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
    for left, right in zip(md.disasm(target, int(address, 16)), md.disasm(actual, a)):
        if left.mnemonic == 'call' and left.operands[0].type == X86_OP_IMM:
            assert left.operands[0].imm == 0x4d98d4
            assert '_sqrt' in image.labels[right.operands[0].imm]
            calls += 1
    assert calls == 1
    print('PASS:', address, symbol, len(target), 'bytes; actual _sqrt callee')
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
print('PASS: two authored Pmesh routines / 266 B; two 28-byte SDK wrappers equal the retail representative at 0x41f0f0; original ownership/placement pending; Pmesh remains PARTIAL')

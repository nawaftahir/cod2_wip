"""Audit matched texture-vector code and data; report unfinished callees separately."""
import runpy
import struct
from capstone.x86 import X86_OP_IMM, X86_OP_MEM

m = runpy.run_path('workspace/research/codex_order/test_model.py')
v, image, retail, ours, md = (m[k] for k in ('verify', 'image', 'retail', 'ours', 'md'))
names = v.known_names()
pairs = (
    ('0x0043f8a0', '?TextureAxisFromPlane@@YAXQBMQAM1@Z'),
    ('0x0043f9f0', '?TextureVecsForNormal@@YAXQBMQAM1PAH2@Z'),
    ('0x004401d0', '?BuildTextureVecs@@YAXQBM00MMQAY03M@Z'),
)
def read(pe, address, size):
    rva = address - pe.OPTIONAL_HEADER.ImageBase
    section = pe.get_section_by_rva(rva)
    assert section and section.VirtualAddress <= rva < section.VirtualAddress + section.Misc_VirtualSize
    offset = rva - section.VirtualAddress
    available = max(0, min(size, section.SizeOfRawData - offset))
    start = section.PointerToRawData + offset
    return pe.__data__[start:start+available].ljust(size, b'\0')

state = {}
constants = strings = imports = 0
pending = {0x47d980: 0, 0x4969e0: 0, 0x4897c0: 0}
basis = set()
for address, symbol in pairs:
    assert v.check(image, address, symbol, names)[0] == 'MATCH', (address, symbol)
    target, _ = v.matcher.carve(address)
    start, code = image.code(symbol)
    for left, right in zip(md.disasm(target, int(address, 16)), md.disasm(code, start)):
        assert (left.address-int(address,16), left.mnemonic, left.size) == (right.address-start, right.mnemonic, right.size)
        if left.mnemonic == 'call' and left.operands[0].type == X86_OP_IMM:
            a, b = left.operands[0].imm, right.operands[0].imm
            if a in pending:
                assert b == image.base, ('pending callee unexpectedly changed', hex(a), hex(b))
                pending[a] += 1
            else:
                assert a in names and names[a] in image.labels[b], (hex(a), hex(b))
        for a, b in zip(left.operands, right.operands):
            if a.type == X86_OP_MEM:
                p, q = a.mem.disp, b.mem.disp
                if p in m['retail_imports']:
                    assert m['actual_imports'][q] == m['retail_imports'][p]
                    imports += 1
                elif 0x53db00 <= p < 0x53dbd8:
                    assert q - (p - 0x53db00) not in (0, image.base)
                    basis.add(q - (p - 0x53db00))
                elif 0x58f800 <= p < 0x1400000:
                    assert state.setdefault(p, q) == q
                    assert read(retail, p, a.size) == read(ours, q, b.size) == bytes(a.size)
                elif 0x52720e <= p < 0x58f800:
                    assert read(retail, p, a.size) == read(ours, q, b.size), (hex(p), hex(q))
                    constants += 1
            elif a.type == X86_OP_IMM and left.mnemonic == 'push' and 0x52720e <= a.imm < 0x58f800:
                wanted = read(retail, a.imm, 256).split(b'\0', 1)[0]
                actual = read(ours, b.imm, 256).split(b'\0', 1)[0]
                assert wanted == actual, (wanted, actual)
                strings += 1
assert len(basis) == 1, basis
assert read(retail, 0x53db00, 216) == read(ours, next(iter(basis)), 216)
assert len(state) == len(set(state.values())) == 12, state
assert pending == {0x47d980: 12, 0x4969e0: 7, 0x4897c0: 1}, pending
assert constants >= 10 and strings == 31 and imports == 8, (constants, strings, imports)
assert set(image.of_source('src/common/texturevecs.cpp')) == {s for _, s in pairs}
print('PASS: three authored texture-vector routines / 1779 B; full 216-byte basis table')
print('PASS: %d constant refs, %d strings, %d imports and 12 independent zero-initialized assertion flags' % (constants, strings, imports))
print('PENDING: inverse 0x43fbc0 / 1540 B; 12 assertion-handler, seven va and one SinCos call remain unresolved; file PARTIAL')

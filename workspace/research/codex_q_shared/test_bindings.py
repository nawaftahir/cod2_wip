"""Check restored info-string routines and their literal bindings in the live exe."""
import sys
sys.path.insert(0, 'tools')
import link
import verify
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from capstone.x86 import X86_OP_IMM

image = verify.Linked()
retail = pefile.PE(str(link.RETAIL), fast_load=True)
actual = image.pe
md = Cs(CS_ARCH_X86, CS_MODE_32)
md.detail = True
literals = []
for address, symbol in [
    ('0x00496aa0', '?Info_ValueForKey@@YAPBDPBD0@Z'),
    ('0x00496bf0', '?Info_RemoveKey@@YAXPADPBD@Z'),
    ('0x00496d10', '?Info_RemoveKey_Big@@YAXPADPBD@Z'),
]:
    assert verify.check(image, address, symbol, verify.known_names())[0] == 'MATCH'
    target, _ = verify.matcher.carve(address)
    start, code = image.code(symbol)
    for original, rebuilt in zip(md.disasm(target, int(address, 16)), md.disasm(code, start)):
        if original.mnemonic != 'push' or original.operands[0].type != X86_OP_IMM:
            continue
        pointer = original.operands[0].imm
        if not 0x52720e < pointer < 0x590000:
            continue
        expected = retail.get_data(pointer - retail.OPTIONAL_HEADER.ImageBase, 128).split(b'\0', 1)[0]
        got = actual.get_data(rebuilt.operands[0].imm - actual.OPTIONAL_HEADER.ImageBase, 128).split(b'\0', 1)[0]
        assert got == expected, (address, expected, got)
        literals.append(expected)
assert len(literals) == 3 and all(b': oversize infostring' in item for item in literals), literals
print('PASS: three info-string MATCHes and three actual retail error-string bindings')

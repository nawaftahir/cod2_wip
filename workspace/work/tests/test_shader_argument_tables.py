"""Keep the two shader-argument switch tables out of executable-byte coverage."""
import hashlib
from pathlib import Path
import struct
import capstone
import pefile

anchor = Path(__file__).resolve().parents[4] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
assert hashlib.sha256(anchor.read_bytes()).hexdigest() == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
pe = pefile.PE(str(anchor))
base = pe.OPTIONAL_HEADER.ImageBase
relocations = {base+entry.rva for block in pe.DIRECTORY_ENTRY_BASERELOC for entry in block.entries if entry.type==3}
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
md.detail = True
for start, code_size, table in ((0x1001a030,140,0x1001a0bc),(0x1001a0e0,104,0x1001a148)):
    code = pe.get_data(start-base,code_size)
    instructions = list(md.disasm(code,start))
    assert sum(i.size for i in instructions)==code_size and instructions[-1].mnemonic=='ret'
    assert start+code_size==table
    jump = [i for i in instructions if i.mnemonic=='jmp' and i.operands[0].type==capstone.x86.X86_OP_MEM]
    assert len(jump)==1 and jump[0].operands[0].mem.disp==table and jump[0].operands[0].mem.scale==4
    pointers = struct.unpack('<3I',pe.get_data(table-base,12))
    starts = {i.address for i in instructions}
    assert all(p in starts for p in pointers)
    assert all(table+4*i in relocations for i in range(3))
    selectors = pe.get_data(table-base+12,12)
    assert list(selectors)==[0,2,2,2,2,2,2,1,2,1,1,1]
print('PASS: shader argument extents164/128 include24 non-code bytes each;140/104 executable bytes')

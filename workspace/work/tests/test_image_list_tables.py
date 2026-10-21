"""Pin the image command's full extent and keep its55 data/padding bytes uncredited."""
import hashlib
from pathlib import Path
import struct
import capstone
import pefile

anchor = Path(__file__).resolve().parents[4] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
assert hashlib.sha256(anchor.read_bytes()).hexdigest() == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
pe = pefile.PE(str(anchor))
base = pe.OPTIONAL_HEADER.ImageBase
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
md.detail = True
start, code_size, extent, table = 0x1000d940, 1015, 1070, 0x1000dd38
instructions = list(md.disasm(pe.get_data(start-base, code_size), start))
assert sum(i.size for i in instructions) == code_size
assert instructions[-1].address == 0x1000dd36 and instructions[-1].mnemonic == 'ret'
assert pe.get_data(start-base+code_size, 1) == b'\x90'
switches = [i for i in instructions if i.mnemonic == 'jmp'
            and i.operands[0].type == capstone.x86.X86_OP_MEM]
assert len(switches) == 1
assert switches[0].operands[0].mem.disp == table and switches[0].operands[0].mem.scale == 4
pointers = struct.unpack('<6I', pe.get_data(table-base, 24))
assert pointers == (0x1000daee, 0x1000dae7, 0x1000db03, 0x1000daf5, 0x1000dafc, 0x1000db52)
assert set(pointers) <= {i.address for i in instructions}
relocations = {base+entry.rva for block in pe.DIRECTORY_ENTRY_BASERELOC
               for entry in block.entries if entry.type == 3}
assert all(table+4*i in relocations for i in range(6))
assert list(pe.get_data(table-base+24, 30)) == [0,1,2]+[5]*4+[3]+[5]*21+[4]
assert table+24+30 == start+extent
compare = list(md.disasm(pe.get_data(0xd900, 49), 0x1000d900))
assert sum(i.size for i in compare) == 49 and compare[-1].address == 0x1000d930
assert compare[-1].mnemonic == 'ret'
print('PASS: image comparator49; listing1070 comprises1015 code,1 pad,24 pointers and30 selectors')

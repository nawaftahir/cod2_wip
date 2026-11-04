"""Inline pointer tables must not misalign later real CRT instructions."""
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import struct
import sys
import capstone
import pefile

gfx=Path(__file__).resolve().parents[3]
sys.path.insert(0,str(gfx/'tools'))
from x86_instructions import instructions
cs=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
base=0x10001000
# A real relocated MOV operand is still an instruction. Table entries are data.
code=b'\xb8'+struct.pack('<I',0x10112233)+b'\x90'+struct.pack('<II',0xe8010203,0x1000e9ff)+b'\xe8'+struct.pack('<i',0x3000-(base+19))+b'\xc3'
rel={base+1,base+6,base+10}
relbytes={a+k for a in rel for k in range(4)}
rows=list(instructions(cs,code,base,relbytes))
assert [i.address-base for i in rows]==[0,5,14,19]
assert rows[0].mnemonic=='mov' and rows[2].mnemonic=='call' and rows[2].op_str=='0x3000'
assert list(instructions(cs,b'',base,set()))==[]
assert list(instructions(cs,code,base,set()))[0].address==base
assert [i.address for i in instructions(cs,b'\xc3',base,{base})]==[]
# Decode a slice that begins in the middle of an inline pointer.
assert [i.address-base for i in instructions(cs,code[8:],base+8,relbytes)]==[14,19]

# FF /7 cannot decode; skip known pointer data before asking the decoder.
invalid_table = b'\x90' + b'\xff' * 8 + b'\xe8' + struct.pack('<i', 0x3000-(base+14)) + b'\xc3'
invalid_relocations = set(range(base+1, base+9))
assert [i.address-base for i in instructions(cs,invalid_table,base,invalid_relocations)] == [0,9,14]
assert list(instructions(cs,b'\xff\xff',base,set())) == []

pe=pefile.PE(str(gfx/'workspace/work/build/gfx.dll'));rel={pe.OPTIONAL_HEADER.ImageBase+e.rva for b in pe.DIRECTORY_ENTRY_BASERELOC for e in b.entries if e.type==3}
relbytes={a+k for a in rel for k in range(4)}
# Independent target reference, not the candidate's accepted binding result.
anchor=pefile.PE(str(retail_anchor()))
arel={anchor.OPTIONAL_HEADER.ImageBase+e.rva for b in anchor.DIRECTORY_ENTRY_BASERELOC for e in b.entries if e.type==3}
for image,start in [(pe,next(int(line.split()[2],16) for line in (gfx/'workspace/work/build/gfx.map').read_text().splitlines() if len(line.split())>3 and line.split()[1]=='_memmove')),(anchor,0x100f67a0)]:
    relocbytes=relbytes if image is pe else {a+k for a in arel for k in range(4)}
    decoded=list(instructions(cs,image.get_data(start-image.OPTIONAL_HEADER.ImageBase,829),start,relocbytes))
    transfers=[i for i in decoded if i.mnemonic in ('call','jmp') and i.bytes[0] in (0xe8,0xe9)]
    assert all(start<=int(i.op_str,16)<start+829 for i in transfers),[(hex(i.address),i.op_str) for i in transfers]
    # Several indirect dispatches and multiple return sites still decode.
    assert sum(i.mnemonic=='jmp' for i in decoded)>=6 and sum(i.mnemonic=='ret' for i in decoded)>=2
print('PASS: real retail/candidate memmove tables, relocation operands, mid-pointer resynchronization and retained real external call')

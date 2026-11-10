#!/usr/bin/env python3
# c2xref.py C2DLL HEX...: VAs in c2.dll where the given dwords occur as bytes, with the instruction that holds them.
import sys, struct, pefile, capstone
pe = pefile.PE(sys.argv[1], fast_load=True)
img = pe.get_memory_mapped_image(); ib = pe.OPTIONAL_HEADER.ImageBase
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
for h in sys.argv[2:]:
    pat = struct.pack('<I', int(h, 16)); o = img.find(pat)
    while o >= 0:
        # try instruction starts up to 7 bytes back; keep one that covers the dword
        for b in range(1, 8):
            ins = next(md.disasm_lite(img[o - b:o - b + 15], ib + o - b), None)
            if ins and ins[1] >= b + 4:
                print(h, hex(ib + o - b), ins[2], ins[3]); break
        else:
            print(h, hex(ib + o), 'data')
        o = img.find(pat, o + 1)

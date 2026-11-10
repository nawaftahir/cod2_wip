#!/usr/bin/env python3
# c2dis.py C2DLL ADDR [N]: disassemble N bytes of c2.dll from ADDR (hex VA).
import sys, pefile, capstone
pe = pefile.PE(sys.argv[1], fast_load=True)
a = int(sys.argv[2], 16); n = int(sys.argv[3]) if len(sys.argv) > 3 else 128
img = pe.get_memory_mapped_image(); ib = pe.OPTIONAL_HEADER.ImageBase
for i in capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32).disasm_lite(img[a - ib:a - ib + n], a):
    print(hex(i[0]), i[2], i[3])

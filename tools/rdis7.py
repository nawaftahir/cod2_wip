#!/usr/bin/env python3
"""rdis7.py <start> <len> [version-dir 1.3]: retail disassembly with string/symbol hints (run anywhere)"""
import sys, pefile, capstone, struct
R = '/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.3/CoD2MP_s.exe'
pe = pefile.PE(R); base = 0x400000
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
a = int(sys.argv[1], 16); n = int(sys.argv[2], 0)
def cstr(v):
    try:
        d = pe.get_data(v - base, 48)
    except Exception: return None
    s = d.split(b'\0')[0]
    if len(s) >= 3 and all(32 <= c < 127 or c in (10, 9) for c in s): return s.decode()
for i in md.disasm(pe.get_data(a - base, n), a):
    note = ''
    for t in i.op_str.replace('[', ' ').replace(']', ' ').replace(',', ' ').split():
        if t.startswith('0x') and len(t) >= 7:
            v = int(t, 16)
            if 0x400000 <= v < 0x1a00000:
                s = cstr(v)
                if s: note += '  ; "%s"' % s
    print(hex(i.address), i.mnemonic, i.op_str, note)

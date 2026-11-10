#!/usr/bin/env python3
# gapref13.py exe 0xLO 0xHI: every dword in .text/.data/.rdata of exe whose value lies in [LO,HI) (proves a gap unreferenced when empty)
import sys, struct, pefile
pe = pefile.PE(sys.argv[1]); lo, hi = int(sys.argv[2], 16), int(sys.argv[3], 16)
base = pe.OPTIONAL_HEADER.ImageBase
n = 0
for s in pe.sections:
    name = s.Name.rstrip(b'\0').decode()
    if name not in ('.text', '.data', '.rdata'):
        continue
    d = s.get_data()
    for i in range(len(d) - 3):  # every byte offset: code operands are unaligned
        v = struct.unpack_from('<I', d, i)[0]
        if lo <= v < hi:
            print('%s %08x -> %08x' % (name, base + s.VirtualAddress + i, v)); n += 1
print('refs into [%08x,%08x): %d' % (lo, hi, n))

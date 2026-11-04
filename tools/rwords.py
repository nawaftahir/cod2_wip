#!/usr/bin/env python3
# rwords.py which(ours|retail) rdata_off len [ours.exe]: dwords; pointers into .rdata shown as string, into .text as T
import pefile, sys, struct
R = '/home/nawaf/cod2/test/dev/'
which, o, n = sys.argv[1], int(sys.argv[2], 16), int(sys.argv[3], 16)
path = R + 'cod2_wip/binaries/windows/1.3/CoD2MP_s.exe' if which == 'retail' else (sys.argv[4] if len(sys.argv) > 4 else R + 'claude_client13/lab13/s2/target/build/release/CoD2MP_s.exe')
pe = pefile.PE(path)
sec = {s.Name.rstrip(b'\0'): s for s in pe.sections}
rd = sec[b'.rdata']; rb = rd.get_data(); rva0 = rd.VirtualAddress + 0x400000
tx = sec[b'.text']
def desc(v):
    if rd.VirtualAddress + 0x400000 <= v < rva0 + len(rb):
        s = rb[v - rva0:v - rva0 + 40].split(b'\0')[0]
        return ' R%05x %r' % (v - rva0, s[:36]) if s and all(32 <= c < 127 for c in s) else ' R%05x' % (v - rva0)
    if tx.VirtualAddress + 0x400000 <= v < tx.VirtualAddress + 0x400000 + tx.Misc_VirtualSize: return ' T'
    return ''
for i in range(0, n, 4):
    v = struct.unpack_from('<I', rb, o + i)[0]
    print('%05x %08x%s' % (o + i, v, desc(v)))

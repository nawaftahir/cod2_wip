#!/usr/bin/env python3
# rview.py retail_off len delta [ours.exe]: hexdump retail .rdata at off and ours at off+delta
import pefile, sys
R = '/home/nawaf/cod2/test/dev/'
ours = sys.argv[4] if len(sys.argv) > 4 else R + 'claude_client13/lab13/s2/target/build/release/CoD2MP_s.exe'
g = lambda p: [s for s in p.sections if s.Name.startswith(b'.rdata')][0].get_data()
y = g(pefile.PE(R + 'cod2engineold/binaries/windows/1.3/CoD2MP_s.exe')); x = g(pefile.PE(ours))
o, n, d = int(sys.argv[1], 16), int(sys.argv[2], 16), int(sys.argv[3])
def dump(buf, off, n, tag):
    for i in range(0, n, 16):
        c = buf[off+i:off+i+16]
        print('%s %05x %-47s %s' % (tag, off+i, ' '.join('%02x' % b for b in c), ''.join(chr(b) if 32 <= b < 127 else '.' for b in c)))
dump(y, o, n, 'R'); print(); dump(x, o+d, n, 'O')

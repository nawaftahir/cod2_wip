#!/usr/bin/env python3
# rdiff13.py [lo hi] [ours.exe]: word-level diff of .rdata (pointers masked) ours vs retail 1.3.
# Lists blocks: DEL = retail-only words, INS = ours-only words, REP = both differ. Offsets are .rdata-relative.
import pefile, struct, sys, difflib
R = '/home/nawaf/cod2/test/dev/'
args = [a for a in sys.argv[1:]]
lo = int(args[0], 16) if args else 0
hi = int(args[1], 16) if len(args) > 1 else 1 << 30
ours = args[2] if len(args) > 2 else R + 'claude_client13/lab13/s2/target/build/release/CoD2MP_s.exe'
g = lambda p: [s for s in p.sections if s.Name.startswith(b'.rdata')][0].get_data()
y = g(pefile.PE(R + 'cod2_wip/binaries/windows/1.3/CoD2MP_s.exe')); x = g(pefile.PE(ours))
def words(b): return [struct.unpack_from('<I', b, i)[0] for i in range(0, len(b) - 3, 4)]
def mask(w): return 'P' if 0x400000 <= w < 0x1400000 else w
wy, wx = words(y), words(x)
my, mx = [mask(w) for w in wy], [mask(w) for w in wx]
sm = difflib.SequenceMatcher(None, my, mx, autojunk=False)
def prev(ws, a, b):
    bs = b''.join(struct.pack('<I', w) for w in ws[a:min(b, a + 6)])
    return ''.join(chr(c) if 32 <= c < 127 else '.' for c in bs)
for tag, a, b, c, d in sm.get_opcodes():
    if tag == 'equal': continue
    if a * 4 < lo or a * 4 > hi: continue
    k = {'delete': 'DEL', 'insert': 'INS', 'replace': 'REP'}[tag]
    print('%s retail %05x..%05x (%4d B) ours %05x..%05x (%4d B)  R:%r O:%r' % (k, a*4, b*4, (b-a)*4, c*4, d*4, (d-c)*4, prev(wy, a, b), prev(wx, c, d)))

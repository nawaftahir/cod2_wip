#!/usr/bin/env python3
# rdr13.py [ours.exe]: .rdata string-pool alignment vs retail 1.3. Prints aligned/misaligned spans
# and the points where (ours - retail) offset changes. Uses strings that are unique in ours.
import pefile, re, sys
R = '/home/nawaf/cod2/test/dev/'
ours = sys.argv[1] if len(sys.argv) > 1 else R + 'claude_client13/lab13/s2/target/build/release/CoD2MP_s.exe'
a = pefile.PE(ours); b = pefile.PE(R + 'cod2_wip/binaries/windows/1.3/CoD2MP_s.exe')
g = lambda p: [s for s in p.sections if s.Name.startswith(b'.rdata')][0].get_data()
x, y = g(a), g(b)
rx = rb'[\x20-\x7e\n\t]{6,}\x00'
S = [(m.start(), m.group()) for m in re.finditer(rx, y)]
o = {}
for m in re.finditer(rx, x): o.setdefault(m.group(), []).append(m.start())
cnt = {}
for _, s in S: cnt[s] = cnt.get(s, 0) + 1
seq = [(p, o[s][0] - p, s) for p, s in S if len(o.get(s, [])) == 1 and cnt[s] == 1]
print('retail strings %d, ours %d, unique-both %d, missing in ours %d' % (len(S), sum(len(v) for v in o.values()), len(seq), sum(1 for _, s in S if s not in o)))
iv = []; cur = None
for p, d, s in seq:
    if cur and cur[2] == d: cur[1] = p + len(s)
    else:
        if cur: iv.append(cur)
        cur = [p, p + len(s), d, s]
iv.append(cur)
print('aligned string bytes (d=0):', sum(v[1] - v[0] for v in iv if v[2] == 0), ' misaligned:', sum(v[1] - v[0] for v in iv if v[2] != 0))
if '-v' in sys.argv:
    last = None
    for v in iv:
        print('%05x..%05x len %6d d %+6d %r' % (v[0], v[1], v[1] - v[0], v[2], v[3][:44]))
else:
    for v in sorted([v for v in iv if v[2] != 0], key=lambda v: -(v[1] - v[0]))[:25]:
        print('%05x..%05x len %6d d %+6d first %r' % (v[0], v[1], v[1] - v[0], v[2], v[3][:44]))

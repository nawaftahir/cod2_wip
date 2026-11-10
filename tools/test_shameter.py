#!/usr/bin/env python3
"""test_shameter.py ANCHOR: self-check of tools/shameter.py. Known-good: the anchor against itself counts every
header and section byte. Broken: one flipped header byte costs exactly one byte of the total."""
import os, subprocess, sys, tempfile

A = sys.argv[1]
T = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'shameter.py')

def total(x):
    out = subprocess.run([sys.executable, T, x, A], capture_output=True, text=True, check=True).stdout
    line = out.strip().splitlines()[-1].split()
    assert line[:3] == ['ALL', 'header+sections', 'same-offset'], line
    n, t = map(int, line[3].split('/'))
    return n, t

n0, t0 = total(A)
assert n0 == t0, ('anchor vs itself', n0, t0)
d = bytearray(open(A, 'rb').read())
d[0x40] ^= 0xff  # DOS stub byte inside the header
with tempfile.NamedTemporaryFile(suffix='.exe', delete=False) as f:
    f.write(d)
try:
    n1, t1 = total(f.name)
finally:
    os.unlink(f.name)
assert (n1, t1) == (t0 - 1, t0), ('header flip', n1, t1, t0)
print('shameter self-check OK: %d/%d, header flip caught' % (n0, t0))

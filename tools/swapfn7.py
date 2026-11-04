#!/usr/bin/env python3
"""swapfn7.py <srcfile> <dstfile> <signature-start> : replace the function starting at the line that begins with
signature-start (up to the next line that is exactly '}') in dst with the same function from src."""
import sys
src, dst, sig = sys.argv[1:4]
def span(lines):
    s = next(i for i, l in enumerate(lines) if l.startswith(sig) and not l.rstrip().endswith(";") and lines[i+1].startswith("{"))
    e = next(i for i in range(s, len(lines)) if lines[i].rstrip('\r\n') == '}')
    return s, e
a = open(src, newline='', errors='surrogateescape').read().split('\n')
b = open(dst, newline='', errors='surrogateescape').read().split('\n')
s1, e1 = span(a); s2, e2 = span(b)
print('src lines', e1 - s1 + 1, 'dst lines', e2 - s2 + 1)
b[s2:e2 + 1] = a[s1:e1 + 1]
open(dst, 'w', newline='', errors='surrogateescape').write('\n'.join(b))

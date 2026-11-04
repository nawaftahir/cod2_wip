#!/usr/bin/env python3
"""fromgit7.py <file.c> <dropline-regex...>: replace our libwww file with the libwww-git text, deleting lines matching
regexes by exact index list 'drop=a-b,c' (1-based, of the git text). Prints OOM line numbers after."""
import sys, re
name = sys.argv[1]
drops = set()
for part in sys.argv[2].split(','):
    if not part: continue
    a, _, b = part.partition('-')
    drops.update(range(int(a), int(b or a) + 1))
g = open('/home/nawaf/cod2/test/dev/refrences/libwww-git/Library/src/' + name, errors='surrogateescape', newline='').read().split('\n')
out = [l for i, l in enumerate(g, 1) if i not in drops]
open(name, 'w', errors='surrogateescape', newline='').write('\n'.join(out))
for i, l in enumerate(out, 1):
    if 'HT_OUTOFMEM' in l: print(i, l.strip())

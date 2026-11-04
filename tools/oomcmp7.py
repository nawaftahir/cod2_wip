#!/usr/bin/env python3
"""oomcmp7.py <srcdir>: compare retail OOM lines (/tmp/oom_retail.txt) with HT_OUTOFMEM lines in our libwww .c files"""
import re, sys, collections
src = sys.argv[1] if len(sys.argv) > 1 else 'target/src/libwww/Library/src'
ret = collections.defaultdict(list)
for l in open('/tmp/oom_retail.txt'):
    a, f, ln, n = l.rstrip('\n').split(' ', 3)
    ret[f].append((int(ln), n))
bad = 0
for f in sorted(ret):
    ours = []
    try:
        for i, l in enumerate(open(f'{src}/{f}', errors='replace'), 1):
            m = re.search(r'HT_OUTOFMEM\("([^"]*)"\)', l)
            if m: ours.append((i, m.group(1)))
    except FileNotFoundError:
        print(f, 'MISSING'); continue
    r = sorted(ret[f])
    if sorted(ours) != r:
        bad += 1
        print(f, 'retail', [x[0] for x in r], 'ours', [x[0] for x in sorted(ours)],
              '' if [x[1] for x in r] == [x[1] for x in sorted(ours)] else 'NAMES DIFFER')
print('files off:', bad, 'of', len(ret))

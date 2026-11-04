#!/usr/bin/env python3
"""lw7.py [cmp13.json]: unmatched libwww fns (obj under libwww), bytes. run from lab13/w7"""
import json, sys, re
j = sys.argv[1] if len(sys.argv) > 1 else 'good13.json'
tus = open('target/src/tus.txt').read() if False else ''
lw = set()
for l in open('target/src/tus.txt'):
    m = re.search(r'libwww/.*?([^/\\]+)\.c', l)
    if m: lw.add(m.group(1) + '.obj')
d = json.load(open(j))
tot = 0; n = 0; allb = 0
for e in d:
    if e['obj'] in lw:
        allb += e['size']
        if not e['hits']:
            n += 1; tot += e['size']; print(e['obj'], e['name'][:44], e['size'])
print('unmatched libwww fns', n, 'bytes', tot, 'of', allb)

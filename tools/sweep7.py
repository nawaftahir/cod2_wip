#!/usr/bin/env python3
"""sweep7.py: unmatched fns (good13.json) whose body text differs from the same-named fn in lnxded-1.3/src. run from lab13/w7"""
import json, re, os, glob, sys
D = '/home/nawaf/cod2/test/dev/'
SRV = D + 'cod2engine/archive/lnxded-1.3/src'
OUR = 'target/src'
d = json.load(open('good13.json'))
lw = set()
for l in open('target/src/tus.txt'):
    if 'libwww' in l: lw.add(1)
def plain(m):
    if m.startswith('?'):
        return m[1:].split('@@')[0].split('@')[0]
    return m.lstrip('_')
def index(root):
    idx = {}
    for p in glob.glob(root + '/**/*.c*', recursive=True):
        try: lines = open(p, errors='replace').read().split('\n')
        except Exception: continue
        for i, l in enumerate(lines):
            if lines[i:i+1] and i + 1 < len(lines) and lines[i+1].startswith('{') and '(' in l and not l.endswith(';') and not l.startswith(('\t', ' ', '#', '/')):
                m = re.search(r'([A-Za-z_~][\w:~]*)\s*\(', l)
                if not m: continue
                e = next((j for j in range(i, len(lines)) if lines[j].rstrip('\r') == '}'), None)
                if e is None: continue
                idx.setdefault(m.group(1), []).append((p, i, e, '\n'.join(lines[i:e+1])))
    return idx
si, oi = index(SRV), index(OUR)
norm = lambda s: re.sub(r'\s+', ' ', s)
for e in sorted(d, key=lambda e: -e['size']):
    if e['hits'] or e['size'] < 12: continue
    n = plain(e['name'])
    if n not in si or n not in oi: continue
    for sp, s1, s2, st in si[n]:
        for op, o1, o2, ot in oi[n]:
            if 'libwww' in op: continue
            same = norm(st) == norm(ot)
            if same or e['size'] < 60: continue
            import difflib
            nl = lambda t: [x.strip() for x in t.split('\n') if x.strip()]
            print('====', e['size'], n, op.replace(OUR + '/', ''), '<-', sp.replace(SRV + '/', ''))
            print('\n'.join(list(difflib.unified_diff(nl(ot), nl(st), lineterm='', n=0))[2:int(os.environ.get('LIM', 14))]))

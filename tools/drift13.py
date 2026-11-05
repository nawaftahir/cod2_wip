#!/usr/bin/env python3
# drift13.py: .text position drift, ours vs retail 1.3. Walks our fns in address order; a fn with a unique retail hit gives
# delta = retail - ours. Prints each point where delta changes (a size difference sits between the two anchors).
import json, re, sys
import os
R = os.path.dirname(os.path.abspath(__file__)) + '/../build/'
cm = json.load(open(R + 'cmp13.json'))
by = {}
for x in cm:
    by.setdefault((x['name'], x['obj']), []).append(x)
syms = []
for line in open(R + 'release/CoD2MP_s.map', errors='replace'):
    m = re.match(r'\s*0001:[0-9a-f]+\s+(\S+)\s+([0-9a-f]{8}) f(?:\s+i)?\s+(\S+)', line)
    if m and ' f i ' not in line: syms.append((int(m.group(2), 16), m.group(1), m.group(3)))
syms.sort()
rows = []
for a, n, o in syms:
    xs = by.get((n, o), [])
    if len(xs) == 1 and len(xs[0]['hits']) == 1 and not xs[0].get('thunk') and xs[0]['size'] >= 16:  # short stubs hit by accident
        rows.append((a, int(xs[0]['hits'][0], 16), n, o, xs[0]['size']))
print('anchors', len(rows), 'of', len(syms), 'fns')
prev = None; lines = []
for a, r, n, o, s in rows:
    d = r - a
    if prev is None or d != prev[0]:
        lines.append((a, r, d, (d - prev[0]) if prev else 0, n, o, prev[2] if prev else ''))
    prev = (d, a, n)
print('delta changes', len(lines))
for a, r, d, dd, n, o, pn in lines[:int(sys.argv[1]) if len(sys.argv) > 1 else 40]:
    print('ours %06x retail %06x delta %+7d (step %+6d) %s [%s]  prev %s' % (a, r, d, dd, n[:48], o, pn[:36]))

# unmatched fns (ours) between the anchors of each break, with sizes
if len(sys.argv) > 2:
    un = []
    for a, n, o in syms:
        xs = by.get((n, o), [])
        if xs and not any(x['hits'] for x in xs): un.append((a, n, o, xs[0]['size']))
    ai = [r[0] for r in rows]
    import bisect
    print('\nbreaks with the unmatched fns just before them (ours addr size name):')
    for a, r, d, dd, n, o, pn in lines[:int(sys.argv[2])]:
        k = bisect.bisect_left(ai, a) - 1
        lo = ai[k] if k >= 0 else 0
        between = [u for u in un if lo < u[0] < a]
        print('%06x step %+6d [%s] %s' % (a, dd, o, ' ; '.join('%x %d %s' % (u[0], u[3], u[1][:28]) for u in between[:6])))

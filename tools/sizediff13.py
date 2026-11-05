#!/usr/bin/env python3
"""sizediff13.py [-o objsubstr] [-a] [N]: per-function SIZE diff, ours vs retail 1.3, in address order (offset-first work).
Retail address of a fn = its unique cmp13 hit, else the name-paired client address (ghidra/names_*.tsv).
Retail size = distance to the next retail fn start (E8 targets + 16-aligned starts after 0xCC/ret, plus all known
hits/pairs; HYPOTHESIS-level: a start inside a fn can shorten it). delta = ours - retail.
Default prints only fns with delta != 0 or no retail twin. -a prints all. -o filters by obj substring.
Then per obj: ours span and retail span (first unique hit of this obj to the next obj's), running drift, and
retail starts inside the obj's retail span that no fn of ours claims (MISSING candidates). Run in the worktree after a build."""
import bisect, collections, json, os, re, struct, sys
T = os.path.dirname(os.path.abspath(__file__)); B = T + '/../build/'
args = sys.argv[1:]; flt = None; allf = False; lim = 10**9
while args:
    a = args.pop(0)
    if a == '-o': flt = args.pop(0)
    elif a == '-a': allf = True
    else: lim = int(a)
R13 = os.environ.get('ANCHOR')
for up in ('/../../', '/../../../'):  # client-1.3 root or .worktrees/<work>
    if not R13 and os.path.exists(T + up + 'binaries/windows/1.3/CoD2MP_s.exe'): R13 = T + up + 'binaries/windows/1.3/CoD2MP_s.exe'
d = open(R13, 'rb').read()
pe = struct.unpack_from('<I', d, 0x3c)[0]; oh = struct.unpack_from('<H', d, pe + 20)[0]
for i in range(struct.unpack_from('<H', d, pe + 6)[0]):
    n, vs, va, rs, ro = struct.unpack_from('<8sIIII', d, pe + 24 + oh + 40 * i)
    if n.startswith(b'.text'): t, base = d[ro:ro + vs], 0x400000 + va; break
st = {base} | {base + k for k in range(16, len(t), 16) if t[k - 1] in (0xcc, 0xc3) or t[k - 2:k] == b'\xc2\x00'}
for i in range(len(t) - 5):
    if t[i] == 0xe8:
        x = base + i + 5 + struct.unpack_from('<i', t, i + 1)[0]
        if base <= x < base + len(t): st.add(x)
# name pairs (same priority as cmp13.py)
pr, drop = {}, set()
for f in ('names_fix.tsv', 'names_k.tsv', 'names_1.0.tsv', 'names_cg.tsv', 'names_loc.tsv'):
    for l in open(T + '/ghidra/' + f):
        r = l.rstrip('\n').split('\t')
        if len(r) > 2 and r[2] == 'drop': drop.add(r[1]); continue
        if len(r) >= 2:
            a = int(r[0], 16)
            if r[1] not in pr or (pr[r[1]] % 16 and not a % 16): pr[r[1]] = a
for k in drop: pr.pop(k, None)
def plain(m):
    if m.startswith('?'):
        p = m[1:].split('@@')[0].split('@')
        if len(p) >= 2 and p[1] and (p[1] + '::' + p[0]) in pr: return p[1] + '::' + p[0]
        return p[0]
    return m.lstrip('_')
cm = json.load(open(B + 'cmp13.json'))
by = {}
for x in cm: by.setdefault((x['name'], x['obj']), []).append(x)
syms = []
for line in open(B + 'release/CoD2MP_s.map', errors='replace'):
    m = re.match(r'\s*0001:[0-9a-f]+\s+(\S+)\s+([0-9a-f]{8}) f(?:\s+i)?\s+(\S+)', line)
    if m and ' f i ' not in line: syms.append((int(m.group(2), 16), m.group(1), m.group(3)))
syms.sort()
rows = []  # ours addr, name, obj, ours size, retail addr (or None), how
for a, n, o in syms:
    xs = by.get((n, o), [])
    if not xs or xs[0]['size'] == 0: continue
    x = xs[0]; ra, how = None, 'none'
    if len(x['hits']) == 1: ra, how = int(x['hits'][0], 16), 'hit'
    elif len(x['hits']) > 1: how = 'multi'
    else:
        p = pr.get(plain(n))
        if p and base <= p < base + len(t): ra, how = p, 'pair'
    rows.append([a, n, o, x['size'], ra, how])
# a name pair is trusted only between the retail addresses of its neighbouring unique hits (1.0 names can point elsewhere)
hv = [(i, r[4]) for i, r in enumerate(rows) if r[5] == 'hit']
for i, r in enumerate(rows):
    if r[5] != 'pair': continue
    lo = max([a for j, a in hv if j < i], default=0); hi = min([a for j, a in hv if j > i], default=1 << 32)
    if not lo < r[4] < hi: r[4], r[5] = None, 'badpair'
inner = set()  # false starts inside a matched fn are not fn starts
for r in rows:
    if r[5] == 'hit': inner.update(x for x in st if r[4] < x < r[4] + r[3])
known = (set(st) - inner) | {r[4] for r in rows if r[4]}
RS = sorted(known)
def rsize(a):
    i = bisect.bisect_right(RS, a)
    e = RS[i] if i < len(RS) else base + len(t)
    return len(t[a - base:e - base].rstrip(b'\xcc'))
print('%-8s %-8s %6s %6s %6s  %-5s %s' % ('ours', 'retail', 'oursB', 'retB', 'delta', 'how', 'name [obj]'))
n = 0
for a, nm, o, sz, ra, how in rows:
    if flt and flt not in o: continue
    rz = (sz if how == 'hit' else rsize(ra)) if ra else None
    dl = sz - rz if rz is not None else None
    if not allf and how in ('hit',) and dl == 0: continue
    if not allf and dl == 0: continue
    n += 1
    if n > lim: break
    print('%06x   %-8s %6d %6s %6s  %-5s %s [%s]' % (a, '%06x' % ra if ra else '-', sz, rz if rz is not None else '-',
          '%+d' % dl if dl is not None else '-', how, re.sub(r'^\?|@@.*', '', nm)[:44], o))
# per obj summary: ours bytes vs retail distance between first anchors of consecutive objs
objs = collections.OrderedDict()
for r in rows: objs.setdefault(r[2], []).append(r)
print('\n%-26s %7s %8s %7s %7s %s' % ('obj', 'oursSpan', 'retSpan', 'delta', 'drift', 'missing retail starts (addr:size) in span'))
claimed = {r[4] for r in rows if r[4]}
first = []  # (obj, ours addr, retail addr) of the obj's first unique hit
for o, rs_ in objs.items():
    f = [(r[0], r[4]) for r in rs_ if r[5] == 'hit']
    first.append((o, f[0][0] if f else None, f[0][1] if f else None))
drift = 0
for i, (o, oa, ra) in enumerate(first):
    nx = next(((x, y) for _, x, y in first[i + 1:] if x), None)
    if oa and nx and nx[1] > ra:
        span = nx[1] - ra; dl = (nx[0] - oa) - span; drift += dl
        miss = [x for x in RS if ra <= x < nx[1] and x not in claimed and rsize(x) >= 16]
        if not flt or flt in o:
            print('%-26s %7d %8d %+7d %+7d %s' % (o[:26], nx[0] - oa, span, dl, drift, ' '.join('%x:%d' % (x, rsize(x)) for x in miss[:6])))

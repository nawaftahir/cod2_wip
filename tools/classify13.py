#!/usr/bin/env python3
"""Classify retail 1.0 fns vs retail 1.3: IDENTICAL / CHANGED / REMOVED, rest of 1.3 = NEW.
usage (from dev/claude_client13): python3 tools/classify13.py > WORKLIST_1.3.md
1.0 names/objs come from our 1.0 build map (99.96% same-offset as retail 1.0); 1.3 names, where
any, from our in-progress 1.3 build map (exact masked match only). Masked = alldiff_lib.norm."""
import bisect, collections, difflib, hashlib, re, struct, sys
LIB = '../claude_client/alldiff_lib.py'
src = open(LIB).read()  # take only md + norm; the module itself loads build files on import
exec('import re, capstone\n' + src.split('\n')[1] + '\ndef norm' + src.split('def norm')[1].split('def ours')[0])

def text(path):
    d = open(path, 'rb').read()
    pe = struct.unpack_from('<I', d, 0x3c)[0]; oh = struct.unpack_from('<H', d, pe + 20)[0]
    for i in range(struct.unpack_from('<H', d, pe + 6)[0]):
        n, vs, va, rs, ro = struct.unpack_from('<8sIIII', d, pe + 24 + oh + 40 * i)
        if n.startswith(b'.text'): return d, d[ro:ro + vs], 0x400000 + va, va - ro
def mapsyms(path, lo, hi):
    r = {}
    for l in open(path, errors='replace'):
        m = re.match(r'\s*0001:\S+\s+(\S+)\s+([0-9a-f]{8}) f(?: i)?\s+(?:\S+:)?(\S+)', l)
        if m and lo <= int(m.group(2), 16) < hi: r.setdefault(int(m.group(2), 16), (m.group(1), m.group(3)))
    return r
def funcs(t, b, starts):
    s = sorted(starts); return [(a, t[a - b:e - b].rstrip(b'\xcc')) for a, e in zip(s, s[1:] + [b + len(t)])]
def key(a, c): return hashlib.md5('\n'.join(norm(c, a, len(c))).encode()).hexdigest() if c else 'empty'

R10, R13 = '../cod2engineold/binaries/windows/1.0/CoD2MP_s.exe', '../cod2engineold/binaries/windows/1.3/CoD2MP_s.exe'
_, t10, b10, _ = text(R10)
f13d, t13, b13, d13 = text(R13)
s10 = mapsyms('../claude_client/target/build/CoD2MP_s.map', b10, b10 + len(t10))
F10 = funcs(t10, b10, s10)
# 1.3 split: E8 targets + 16-aligned starts after padding/ret (simlocate/gapcalls logic)
st = {b13} | {b13 + k for k in range(16, len(t13), 16) if t13[k-1] in (0xcc, 0xc3) or t13[k-2:k] == b'\xc2\x00'}
for i in range(len(t13) - 5):
    if t13[i] == 0xe8:
        x = b13 + i + 5 + struct.unpack_from('<i', t13, i + 1)[0]
        if b13 <= x < b13 + len(t13): st.add(x)
F13 = funcs(t13, b13, st)
k10 = [key(a, c) for a, c in F10]; k13 = [key(a, c) for a, c in F13]
# exact masked pairs, in address order within each key
pool = collections.defaultdict(list)
for j, k in enumerate(k13): pool[k].append(j)
pair = {}
for i, k in enumerate(k10):
    if pool[k] and F10[i][1]: pair[i] = pool[k].pop(0)
ident = set(pair)
# near pairs: link order is kept, so look between consecutive exact anchors
anc = sorted(pair.items())
used = set(pair.values())
for (i0, j0), (i1, j1) in zip([(-1, -1)] + anc, anc + [(len(F10), len(F13))]):
    cand = [j for j in range(j0 + 1, j1) if j not in used]
    for i in range(i0 + 1, i1):
        a = norm(F10[i][1], F10[i][0], len(F10[i][1]))
        best = max(((difflib.SequenceMatcher(None, a, norm(F13[j][1], F13[j][0], len(F13[j][1])), autojunk=False).ratio(), j)
                    for j in cand if 0.5 < len(F13[j][1]) / max(1, len(F10[i][1])) < 2), default=(0, 0))
        if best[0] >= 0.6: pair[i] = best[1]; used.add(best[1]); cand.remove(best[1])
# 1.3 names from our 1.3 build (exact masked match), obj from our map
n13 = {}
try:
    _, o13, ob13, _ = text('target/build/CoD2MP_s.exe')
    sy = mapsyms('target/build/CoD2MP_s.map', ob13, ob13 + len(o13))
    for a, c in funcs(o13, ob13, sy): n13.setdefault(key(a, c), sy[a])
except OSError: pass
rev = {j: i for i, j in pair.items()}
def area(j):  # obj of our 1.3 build, else obj of the nearest paired 1.0 fn before it
    nm = n13[k13[j]][0] if k13[j] in n13 and len(F13[j][1]) >= 24 else ''  # tiny stubs match anything
    if 0x547f20 <= F13[j][0] < 0x57a640: return 'libwww (HT*.c, 95 TUs)', nm  # range PINNED in NOTES_1.3.md
    if nm: return n13[k13[j]][1], nm
    for jj in range(j, -1, -1):
        if jj in rev: return s10[F10[rev[jj]][0]][1] + '~', ''
    return '?', ''
# PunkBuster: fns referencing any PB string
pe = struct.unpack_from('<I', f13d, 0x3c)[0]; oh = struct.unpack_from('<H', f13d, pe + 20)[0]
secs = [struct.unpack_from('<8sIIII', f13d, pe + 24 + oh + 40 * i) for i in range(struct.unpack_from('<H', f13d, pe + 6)[0])]
def f2va(o): return next((0x400000 + va + o - ro for n, vs, va, rs, ro in secs if ro <= o < ro + rs), None)
pbstr = {}
for m in re.finditer(rb'[ -~]*(?:[Pp]unk[Bb]uster|pbcl|pbsv|pbag|_pb_|pb_sv|PB_)[ -~]*\0', f13d):
    pbstr[f2va(m.start())] = m.group()[:-1].decode()
pbfn = collections.defaultdict(set)
for i in range(len(t13) - 4):
    v = struct.unpack_from('<I', t13, i)[0]
    if v in pbstr:
        j = bisect.bisect_right([a for a, _ in F13], b13 + i) - 1; pbfn[j].add(pbstr[v])

P = print
nb = lambda c: len(c)
I = sum(nb(F10[i][1]) for i in ident); C = sum(nb(F13[pair[i]][1]) for i in pair if i not in ident)
Rm = [i for i in range(len(F10)) if i not in pair]; New = [j for j in range(len(F13)) if j not in rev]
P('# 1.3 work list (retail 1.0 -> retail 1.3 CoD2MP_s.exe)\n')
P('Generated by `tools/classify13.py`. Masked compare = `alldiff_lib.norm` (calls, jumps and 5+ hex-digit constants masked).')
P('1.0 split = our 1.0 map; 1.3 split = E8 targets + 16-aligned starts after padding (HYPOTHESIS-level: extra starts can split a fn).')
P('CHANGED = paired between exact anchors with difflib >= 0.6. `obj~` = area inferred from the preceding paired 1.0 fn.\n')
P('| class | fns | bytes |\n|---|---|---|')
P('| IDENTICAL | %d | %d |' % (len(ident), I)); P('| CHANGED (1.3 bytes) | %d | %d |' % (len(pair) - len(ident), C))
P('| NEW (1.3) | %d | %d |' % (len(New), sum(nb(F13[j][1]) for j in New)))
P('| REMOVED (1.0) | %d | %d |' % (len(Rm), sum(nb(F10[i][1]) for i in Rm)))
P('| retail .text 1.0 / 1.3 | %d / %d | %d / %d |\n' % (len(F10), len(F13), len(t10), len(t13)))
ga = collections.defaultdict(list)
for j in New: ga[area(j)[0]].append(j)
P('## NEW by area\n\n| area | fns | bytes | named (our 1.3 build) / sample addrs |\n|---|---|---|---|')
for a, js in sorted(ga.items(), key=lambda x: -sum(nb(F13[j][1]) for j in x[1])):
    nm = [area(j)[1] for j in js if area(j)[1]]
    P('| %s | %d | %d | %s |' % (a, len(js), sum(nb(F13[j][1]) for j in js), ', '.join(nm[:6]) or ', '.join('%x' % F13[j][0] for j in js[:4])))
P('\n## CHANGED by bytes (1.0 name, 1.0 addr -> 1.3 addr, size 1.0 -> 1.3)\n\n| fn | obj | 1.0 | 1.3 | size |\n|---|---|---|---|---|')
for i in sorted((i for i in pair if i not in ident), key=lambda i: -len(F13[pair[i]][1])):
    a = F10[i][0]; P('| `%s` | %s | %x | %x | %d -> %d |' % (s10[a][0], s10[a][1], a, F13[pair[i]][0], len(F10[i][1]), len(F13[pair[i]][1])))
P('\n## REMOVED (1.0 fns with no 1.3 counterpart)\n\n| fn | obj | 1.0 | size |\n|---|---|---|---|')
for i in sorted(Rm, key=lambda i: -len(F10[i][1])):
    a = F10[i][0]; P('| `%s` | %s | %x | %d |' % (s10[a][0], s10[a][1], a, len(F10[i][1])))
P('\n## PunkBuster in retail 1.3\n\nFns referencing PB strings (addr, class, size, area, strings):\n')
for j in sorted(pbfn):
    P('- %x %s %d B %s: %s' % (F13[j][0], 'NEW' if j not in rev else ('IDENT' if rev[j] in ident else 'CHANGED ' + s10[F10[rev[j]][0]][0]),
                                len(F13[j][1]), area(j)[0], '; '.join(sorted(pbfn[j]))[:200]))

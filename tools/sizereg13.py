#!/usr/bin/env python3
"""sizereg13.py [build_dir] [from_hex]: offset-first view. For every gap between two anchored fns (unique retail hit,
longest increasing run) whose retail span != our span, print step = retail span - our span, our unmatched fns (size)
and the unclaimed retail fn starts (size). From from_hex (default 4be000 = cg_main_mp) onward; the running drift is
retail - ours at each anchor. Retail starts are a heuristic (see inv13.py)."""
import bisect, json, re, struct, sys
B = sys.argv[1] if len(sys.argv) > 1 else "build"
FROM = int(sys.argv[2], 16) if len(sys.argv) > 2 else 0x4be000
R13 = "../../binaries/windows/1.3/CoD2MP_s.exe"
d = open(R13, "rb").read()
pe = struct.unpack_from("<I", d, 0x3c)[0]; oh = struct.unpack_from("<H", d, pe + 20)[0]
for i in range(struct.unpack_from("<H", d, pe + 6)[0]):
    n, vs, va, rs, ro = struct.unpack_from("<8sIIII", d, pe + 24 + oh + 40 * i)
    if n.startswith(b".text"): t, base = d[ro:ro + vs], 0x400000 + va; break
st = {base} | {base + k for k in range(16, len(t), 16) if t[k - 1] in (0xcc, 0xc3) or t[k - 2:k] == b"\xc2\x00"}
for i in range(len(t) - 5):
    if t[i] == 0xe8:
        x = base + i + 5 + struct.unpack_from("<i", t, i + 1)[0]
        if base <= x < base + len(t): st.add(x)
RS = sorted(st); rsz = {a: len(t[a - base:e - base].rstrip(b"\xcc")) for a, e in zip(RS, RS[1:] + [base + len(t)])}
cm = json.load(open(B + "/cmp13.json"))
mp = {}
for l in open(B + "/release/CoD2MP_s.map", errors="replace"):
    m = re.match(r"\s*0001:\S+\s+(\S+)\s+([0-9a-f]{8}) f", l)
    if m: mp.setdefault(m.group(1), int(m.group(2), 16))
O = sorted(((mp[x["name"]], x) for x in cm if x["name"] in mp), key=lambda p: p[0])
claimed = {int(h, 16) for _, x in O for h in x["hits"]}
for _, x in O:
    for h in x["hits"]:
        h = int(h, 16); claimed.update(RS[bisect.bisect_right(RS, h):bisect.bisect_left(RS, h + x["size"])])
anc = [i for i, (_, x) in enumerate(O) if len(x["hits"]) == 1]
keys = [int(O[i][1]["hits"][0], 16) for i in anc]
idx, prev = [], [-1] * len(keys)
for i, k in enumerate(keys):
    p = bisect.bisect_left([keys[j] for j in idx], k)
    if p == len(idx): idx.append(i)
    else: idx[p] = i
    prev[i] = idx[p - 1] if p else -1
keep, i = [], idx[-1]
while i != -1: keep.append(i); i = prev[i]
keep = [anc[i] for i in reversed(keep)]
sizeok = sum(1 for _, x in O if x["hits"] and a >= FROM) if False else 0
first = last = None; nfix = nbad = 0
for (i0, ), in [(k,) for k in keep[:0]]: pass
rows = []
for j in range(len(keep) - 1):
    i0, i1 = keep[j], keep[j + 1]
    o0, o1 = O[i0][0], O[i1][0]; r0, r1 = int(O[i0][1]["hits"][0], 16), int(O[i1][1]["hits"][0], 16)
    if o0 < FROM: continue
    drift0 = r0 - o0
    step = (r1 - r0) - (o1 - o0)
    if first is None: first = drift0
    last = r1 - o1
    if step == 0: continue
    U = [(O[i][1]["name"], O[i][1]["size"], O[i][1]["obj"]) for i in range(i0 + 1, i1) if not O[i][1]["hits"]]
    R = [(a, rsz[a]) for a in RS[bisect.bisect_right(RS, r0):bisect.bisect_left(RS, r1)] if a not in claimed and rsz[a] >= 8]
    rows.append((o0, o1, r0, r1, drift0, step, O[i0][1]["name"], O[i0][1]["obj"], U, R))
for o0, o1, r0, r1, dr, step, nm, ob, U, R in rows:
    print("ours %x..%x retail %x..%x drift %+d step %+d after %s [%s]" % (o0, o1, r0, r1, dr, step, nm[:40], ob))
    print("   ours unmatched: " + " ".join("%s:%d" % (re.sub(r"^\?|@@.*", "", n)[:30], s) for n, s, _ in U)[:300])
    print("   retail unclaimed: " + " ".join("%x:%d" % x for x in R)[:300])
print("region drift start %+d end %+d net %+d, %d steps" % (first or 0, last or 0, (last or 0) - (first or 0), len(rows)))

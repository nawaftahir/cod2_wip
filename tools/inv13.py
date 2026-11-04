#!/usr/bin/env python3
"""inv13.py [build_dir]: function-set inventory, ours vs retail 1.3, in link order. Run from claude_client13.
Anchors = our fns with exactly one retail hit (cmp13.json), longest increasing run. Between two anchors:
k = our unhit fns, m = retail fn starts nobody hit. k>m: EXTRA candidates, m>k: MISSING candidates.
Retail starts = E8 targets + 16-aligned starts after 0xCC/ret (HYPOTHESIS-level, can split a fn)."""
import bisect, collections, json, re, struct, sys
B = sys.argv[1] if len(sys.argv) > 1 else "target/build"
R13 = "/home/nawaf/cod2/test/dev/cod2_wip/binaries/windows/1.3/CoD2MP_s.exe"
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
for _, x in O:  # false starts inside a matched fn's body are not fns
    for h in x["hits"]:
        h = int(h, 16); claimed.update(a for a in RS[bisect.bisect_right(RS, h):bisect.bisect_left(RS, h + x["size"])])
anc = [i for i, (_, x) in enumerate(O) if len(x["hits"]) == 1]
keys = [int(O[i][1]["hits"][0], 16) for i in anc]
idx, prev = [], [-1] * len(keys)  # LIS
for i, k in enumerate(keys):
    p = bisect.bisect_left([keys[j] for j in idx], k)
    if p == len(idx): idx.append(i)
    else: idx[p] = i
    prev[i] = idx[p - 1] if p else -1
keep, i = [], idx[-1]
while i != -1: keep.append(i); i = prev[i]
keep = [anc[i] for i in reversed(keep)]
out, tot = [], collections.Counter()
bounds = [(-1, 0)] + [(i, int(O[i][1]["hits"][0], 16)) for i in keep] + [(len(O), base + len(t))]
for (i0, a0), (i1, a1) in zip(bounds, bounds[1:]):
    U = [O[i][1] for i in range(i0 + 1, i1) if not O[i][1]["hits"] and O[i][1]["size"] >= 16]
    A = [O[i][1] for i in range(i0 + 1, i1)]
    lo = bisect.bisect_right(RS, a0) if i0 >= 0 else 0
    R = [a for a in RS[lo:bisect.bisect_left(RS, a1)] if a not in claimed and rsz[a] >= 16]
    k, m = len(U), len(R)
    ub, rb = sum(x["size"] for x in U), sum(rsz[a] for a in R)
    if k == m or abs(ub - rb) <= max(24, max(ub, rb) // 33): continue  # same bytes = retail starts split inside one of our fns
    tot["extra_fns" if k > m else "missing_fns"] += abs(k - m)
    out.append((O[i0 + 1][0] if i0 + 1 < len(O) else 0, a0, a1, U, R, ub, rb, A))
print("# INVENTORY: segments between anchored fns where our unhit count != retail unhit count\n")
print("Anchors %d of %d fns. Retail starts %d, unclaimed %d.\n" % (len(keep), len(O), len(RS), len([a for a in RS if a not in claimed and rsz[a] >= 16])))
print("| our addr | obj(s) | retail range | ours k fns/B | retail m fns/B | verdict | ours (names) | retail (addr:size) |\n|---|---|---|---|---|---|---|---|")
ex = ms = 0
for oa, a0, a1, U, R, ub, rb, A in out:
    objs = ",".join(dict.fromkeys(x["obj"] for x in A))[:60]
    k, m = len(U), len(R)
    v = "EXTRA %d" % (k - m) if k > m else "MISSING %d" % (m - k)
    if k > m: ex += ub - rb if ub > rb else 0
    else: ms += rb - ub if rb > ub else 0
    nm = " ".join(re.sub(r"^\?|@@.*", "", x["name"]) for x in U)[:140]
    print("| %x | %s | %x-%x | %d/%d | %d/%d | %s | %s | %s |" % (oa, objs, a0, a1, k, ub, m, rb, v, nm, " ".join("%x:%d" % (a, rsz[a]) for a in R[:8])))
print("\nTotals: %s; approx extra bytes %d, missing bytes %d" % (dict(tot), ex, ms), file=sys.stderr)

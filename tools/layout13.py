#!/usr/bin/env python3
"""layout13.py [out.md]: per-TU gap report, retail 1.3 vs our build. Run from claude_client13 after tools/cmp13.
Retail TU = classify13 pairing (1.0 obj of the paired fn, else nearest preceding paired fn, libwww = one range).
Retail span = bytes of the fns assigned to the TU (HYPOTHESIS-level split, see classify13). Ours = cmp13.json sizes."""
import bisect, collections, contextlib, io, json, re, runpy, sys
with contextlib.redirect_stdout(io.StringIO()):
    ns = runpy.run_path("tools/classify13.py")
F13, rev, area = ns["F13"], ns["rev"], ns["area"]
tu = lambda j: area(j)[0].rstrip("~")
rt = collections.OrderedDict()  # tu -> [first addr, bytes, nfns]
for j, (a, c) in enumerate(F13):
    t = rt.setdefault(tu(j), [a, 0, 0]); t[1] += len(c); t[2] += 1
cm = json.load(open("target/build/cmp13.json"))
LW = "libwww (HT*.c, 95 TUs)"
for x in cm:  # our obj names: drop the lib prefix, fold HT*.obj into the libwww range
    x["obj"] = LW if re.match(r'HT\w*\.obj$', x["obj"]) else x["obj"].split(":")[-1]
mp = {}
for l in open("target/build/release/CoD2MP_s.map", errors="replace"):
    m = re.match(r"\s*0001:\S+\s+(\S+)\s+([0-9a-f]{8}) f", l)
    if m: mp.setdefault(m.group(1), int(m.group(2), 16))
ours = collections.defaultdict(lambda: [0, 0, 0, 0])  # bytes, nfns, matched bytes, first addr
for x in cm:
    o = ours[x["obj"]]; o[0] += x["size"]; o[1] += 1; o[3] = min(o[3] or 1 << 40, mp.get(x["name"], 1 << 40))
    if len(x["hits"]) >= 1: o[2] += x["size"]
def lis_bad(keys):  # items outside the longest increasing run
    idx, prev = [], [-1] * len(keys)
    for i, x in enumerate(keys):
        k = bisect.bisect_left([keys[j] for j in idx], x)
        if k == len(idx): idx.append(i)
        else: idx[k] = i
        prev[i] = idx[k - 1] if k else -1
    keep, i = set(), idx[-1] if idx else -1
    while i != -1: keep.add(i); i = prev[i]
    return [i for i in range(len(keys)) if i not in keep]
rows = []
for t, (a, rb, rn) in rt.items():
    o = ours.get(t, [0, 0, 0, 0])
    rows.append((rb - o[0], t, a, rb, rn, o[0], o[1], o[2]))
rows.sort(reverse=True)
common = [t for t in rt if t in ours and ours[t][3] < 1 << 40]
byretail = sorted(common, key=lambda t: rt[t][0]); ko = [ours[t][3] for t in byretail]
tuoo = [byretail[i] for i in lis_bad(ko)]
fno = collections.defaultdict(list)
byo = collections.defaultdict(list)
for x in cm:
    if len(x["hits"]) == 1 and x["name"] in mp and x["size"] >= 16 and x["obj"] != LW:
        byo[x["obj"]].append((int(x["hits"][0], 16), mp[x["name"]], x["name"]))
for o, v in byo.items():
    v.sort()
    for i in lis_bad([b for _, b, _ in v]): fno[o].append(v[i][2])
P = lambda *a: print(*a)
P("# 1.3 layout gap report (tools/layout13.py)\n")
P("Retail span = classify13-assigned bytes per TU; ours = cmp13.json fn bytes. Missing = retail - ours (negative = we have extra).")
P("Retail .text %d B, ours %d B, total missing %d B.\n" % (sum(r[3] for r in rows), sum(o[0] for o in ours.values()), sum(r[0] for r in rows)))
P("## TUs by missing bytes\n\n| TU | retail addr | retail B (fns) | ours B (fns) | matched B | missing B |\n|---|---|---|---|---|---|")
for d, t, a, rb, rn, ob, on, om in rows[:60]:
    if d > 0: P("| %s | %x | %d (%d) | %d (%d) | %d | %d |" % (t, a, rb, rn, ob, on, om, d))
P("\n## TUs out of retail order (by first fn address; outside longest in-order run)\n")
P(", ".join("%s" % t for t in tuoo) or "none")
P("\n## TUs only in ours (no retail pairing)\n")
P(", ".join(sorted(o for o in ours if o not in rt)) or "none")
P("\n## Fns out of order inside a TU (unique-hit fns; see fnorder.py)\n\n| TU | moved fns | examples |\n|---|---|---|")
for o, v in sorted(fno.items(), key=lambda x: -len(x[1])):
    P("| %s | %d | %s |" % (o, len(v), ", ".join(n[:30] for n in v[:3])))

#!/usr/bin/env python3
"""find_clusters.py - group IPRA consumers under their E8 callers.
A cluster root = function that does NOT consume register args itself but
calls >=1 consumer; members = transitively called consumers (depth<=3).

Usage: python3 tools/find_clusters.py
Output: build/clusters.tsv (root, nmembers, member_addrs...)
"""
import os, sys, json, struct

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M  # noqa: E402

inv = {f["addr"]: f for f in json.load(open(os.path.join(BASE, "data/functions_gfx10.json")))["functions"]}
consumers = set()
status = {}
for line in open(os.path.join(BASE, "build/ipra_consumers.tsv")):
    p = line.rstrip("\n").split("\t")
    if p[0] == "addr":
        continue
    consumers.add(p[0])
    status[p[0]] = p[4]

# full forward call graph via E8 scan
callers = {}   # callee -> set(caller)
callees = {}   # caller -> set(callee)
addrs = list(inv.keys())
fnbytes = {}
for a in addrs:
    try:
        fnbytes[a] = M.carve(a)[0]
    except KeyError:
        continue
for a, fn in fnbytes.items():
    i = 0
    n = len(fn)
    while i < n - 5:
        if fn[i] == 0xE8:
            disp = int.from_bytes(fn[i + 1:i + 5], "little", signed=True)
            tgt = int(a, 16) + i + 5 + disp
            ta = format(tgt, "08x")
            if ta in fnbytes:
                callers.setdefault(ta, set()).add(a)
                callees.setdefault(a, set()).add(ta)
            i += 5
            continue
        i += 1

roots = []
for callee, cs in callers.items():
    if callee not in consumers:
        continue
    for c in cs:
        if c in consumers:
            continue                      # caller itself is a consumer: chain up
        # c is a potential root for this consumer
        members = {callee}
        frontier = [callee]
        while frontier:
            x = frontier.pop()
            for y in callees.get(x, ()):
                if y in consumers and y not in members:
                    members.add(y)
                    frontier.append(y)
        roots.append((c, sorted(members)))

# rank: fewest members first (easiest wins), all members transplant/todo
ranked = []
for root, members in roots:
    if any(status.get(m) == "match" and inv[m]["size"] > 60 for m in members):
        pass                              # still allow; ranking only
    ranked.append((len(members), sum(inv[m]["size"] for m in members), root, members))
ranked.sort(key=lambda r: (r[1], r[0]))

out = open(os.path.join(BASE, "build/clusters.tsv"), "w")
out.write("root\tnmembers\ttotalbytes\tmembers\n")
for nm, tb, root, members in ranked[:80]:
    out.write(f"{root}\t{nm}\t{tb}\t{','.join(members)}\n")
out.close()
print(f"clusters found: {len(ranked)}; smallest by bytes:")
for nm, tb, root, members in ranked[:10]:
    print(f"  root {root} ({inv[root]['name']}, {inv[root]['size']}B) -> {nm} members, {tb}B total: {members}")

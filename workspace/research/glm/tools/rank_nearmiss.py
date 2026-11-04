#!/usr/bin/env python3
"""rank_nearmiss.py - rank compiled draft symbols by byte similarity against
same-length PE functions, to surface near-miss drafts worth hand-fixing.

Usage: python3 tools/rank_nearmiss.py [min_pct] [top_n]
"""
import os, sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M  # noqa: E402

MIN_PCT = int(sys.argv[1]) if len(sys.argv) > 1 else 60
TOP_N = int(sys.argv[2]) if len(sys.argv) > 2 else 12

rows = []
for line in open(os.path.join(BASE, "data/manifest.tsv")):
    p = line.rstrip("\n").split("\t")
    if len(p) < 5 or p[0] == "addr" or p[2] != "iw":
        continue
    rows.append(p)

pe = {}
for p in rows:
    try:
        fnb, _ = M.carve(p[0])
        off = M.rva2off(int(p[0], 16) - 0x10000000)
        pm = M.pe_mask_for(off, len(fnb), fnb, int(p[0], 16) - 0x10000000)
        pe[p[0]] = (M.normalize(fnb, pm), p[1])
    except KeyError:
        pass
bylen = {}
for a, (nb, nm) in pe.items():
    bylen.setdefault(len(nb), []).append((a, nb, nm))

best = {}
objs = sorted(os.listdir(os.path.join(BASE, "build/objs_draft")))
for o in objs:
    if not o.endswith(".obj"):
        continue
    blob = open(os.path.join(BASE, "build/objs_draft", o), "rb").read()
    try:
        coff = M.parse_coff(blob)
    except Exception:
        continue
    secs = coff["sections"]
    execs = {k + 1: s for k, s in enumerate(secs) if s["flags"] & 0x20 and s["rawsize"] > 0}
    relmap = {}
    for sn, s in execs.items():
        m = set()
        for rr in s.get("relocs", []):
            for k in range(4):
                m.add(rr["vaddr"] + k)
        relmap[sn] = m
    syms = [s for s in coff["symbols"] if s["sec"] in execs and not s["naux"]]
    vals = sorted({s["value"] for s in syms})
    for s in syms:
        ss = execs[s["sec"]]
        v = s["value"]
        nxt = min([x for x in vals if x > v] + [ss["rawsize"]])
        data = blob[ss["rawptr"]: ss["rawptr"] + ss["rawsize"]]
        om = {p - v for p in relmap[s["sec"]] if p >= v}
        nb = M.normalize(data[v:], om)
        if len(nb) < 40:
            continue
        for a, tb, nm in bylen.get(len(nb), []):
            eq = sum(1 for x, y in zip(nb, tb) if x == y)
            pct = 100 * eq // len(nb)
            if pct >= MIN_PCT and best.get(a, (0,))[0] < pct:
                best[a] = (pct, o, s["name"], nm)

items = sorted(best.items(), key=lambda kv: -kv[1][0])[:TOP_N]
for a, (pct, o, sn, nm) in items:
    print(f"{pct:3d}% {a} {nm} <- {sn[:28]} ({o})")
print(f"({len(best)} near-misses >= {MIN_PCT}%)")

#!/usr/bin/env python3
"""Group source files into compile units: units.py (after ltcg_scan.py)

PINNED 2026-10-21: plain /O2 gives register arguments only to `static` functions, and a static can
only be called from the same compile unit. Every register-argument call from file A into file B
therefore puts A and B in one unit (CamWnd.cpp -> XYWnd.cpp 0x44f5d0 reproduced byte-identical this
way: research/richtest/unity_test.cpp). Union-find over those links, using PINNED callers and callees
only, gives the unit groups. Writes data/units.tsv.
"""
import bisect
import collections
import os
import struct
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_radiant as m

BASE = m.BASE_DIR


def main():
    text = m.SECTIONS[".text"]
    code = m._image[text["ptr"]:text["ptr"] + text["vs"]]
    tbase = m.IMAGE_BASE + text["va"]
    funcs = sorted(int(a, 16) for a in m.FUNCTIONS)
    tu = {}
    for l in open(os.path.join(BASE, "data", "tu_map.tsv")).read().splitlines()[1:]:
        a, size, t, ev = l.split("\t")
        tu[int(a, 16)] = (t, ev)
    regf = {int(l.split("\t")[0], 16) for l in open(os.path.join(BASE, "data", "ltcg.tsv")).read().splitlines()[1:]}
    parent = {}

    def find(x):
        parent.setdefault(x, x)
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    links = collections.Counter()
    for j in range(len(code) - 5):
        if code[j] != 0xE8:
            continue
        dest = (tbase + j + 5 + struct.unpack_from("<i", code, j + 1)[0]) & 0xFFFFFFFF
        if dest not in regf:
            continue
        caller = funcs[bisect.bisect_right(funcs, tbase + j) - 1]
        (ct, ce), (dt, de) = tu.get(caller, ("", "")), tu.get(dest, ("", ""))
        if ce == "PINNED" and de == "PINNED" and ct and dt and ct != dt:
            links[(ct, dt)] += 1
            parent[find(ct)] = find(dt)
    files = sorted({t for t, ev in tu.values() if ev in ("PINNED", "SUPPORTED") and t})
    groups = collections.defaultdict(list)
    for f in files:
        groups[find(f)].append(f)
    with open(os.path.join(BASE, "data", "units.tsv"), "w") as out:
        out.write("# compile unit groups from static cross-file calls (tools/units.py)\nunit\tfile\n")
        for i, (root, members) in enumerate(sorted(groups.items(), key=lambda g: -len(g[1]))):
            for f in members:
                out.write("%d\t%s\n" % (i, f))
            print("unit %d (%d files): %s" % (i, len(members), " ".join(members)))
    print("links:", len(links))


if __name__ == "__main__":
    main()

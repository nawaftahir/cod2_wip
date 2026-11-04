#!/usr/bin/env python3
"""tu_diff.py — per-symbol diff of one compiled TU object against PE addresses.

Usage: tu_diff.py <obj-rel-to-build/> addr=symbol [addr=symbol ...]
Example: tu_diff.py objs_red/tu_emit.obj 10044e40=_R_EmitCmd 10045ce0=_FUN_10045ce0
"""
import os
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M


def main():
    objrel = sys.argv[1]
    pairs = sys.argv[2:]
    blob = open(os.path.join(BASE, "build", objrel.replace("build/", "", 1)
                             if objrel.startswith("build/") else objrel), "rb").read()
    coff = M.parse_coff(blob)
    secs = coff["sections"]
    execs = {k + 1: s for k, s in enumerate(secs)
             if s["flags"] & 0x20 and s["rawsize"] > 0}
    rel = {}
    for sn, s in execs.items():
        m = set()
        for r in s.get("relocs", []):
            for k in range(4):
                m.add(r["vaddr"] + k)
        rel[sn] = m

    want = {}
    for p in pairs:
        a, s = p.split("=", 1)
        want[s.lstrip("_")] = a

    npass = 0
    for sym in coff["symbols"]:
        bare = sym["name"].lstrip("_")
        if bare not in want or sym["sec"] not in execs or sym["naux"]:
            continue
        addr = want[bare]
        s = execs[sym["sec"]]
        v = sym["value"]
        data = blob[s["rawptr"]:s["rawptr"] + s["rawsize"]]
        if v >= len(data):
            print(f"{bare}: symbol value past section end")
            continue
        fnb, _ = M.carve(addr)
        off = M.rva2off(int(addr, 16) - 0x10000000)
        pm = M.pe_mask_for(off, len(fnb), fnb, int(addr, 16) - 0x10000000)
        a = M.normalize(fnb, pm)
        om = {p - v for p in rel[sym["sec"]] if p >= v}
        b = M.normalize(data[v:], om)
        n = min(len(a), len(b))
        eq = sum(1 for i in range(n) if a[i] == b[i])
        mx = max(len(a), len(b))
        pct = eq * 100 // max(mx, 1)
        ok = "PASS" if pct == 100 and len(a) == len(b) else "diff"
        if ok == "PASS":
            npass += 1
        print(f"{bare} @ {addr}: {eq}/{mx} ({pct}%) pe={len(a)} obj={len(b)} {ok}")
        if pct < 100:
            i = next((i for i in range(n) if a[i] != b[i]), 0)
            lo = max(0, i - 4)
            print("   pe:", a[lo:i + 10].hex(" "))
            print("   ob:", b[lo:i + 10].hex(" "))
    return 0 if npass == len(want) else 1


if __name__ == "__main__":
    sys.exit(main())

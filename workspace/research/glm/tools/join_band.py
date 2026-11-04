#!/usr/bin/env python3
"""join_band.py - index compiled draft objects and byte-join against PE
functions in a manifest size band.

Two normalization variants per object symbol:
  A) same-section rel32 relocations resolved to final displacements, kept
  B) all in-symbol relocation sites masked
PE side likewise joins under standard masking and (env-toggled) intra-call
masking. A hit on any consistent pair certifies byte identity.

Usage: python3 tools/join_band.py <lo> <hi>
Output: build/draft_hits_<lo>_<hi>.tsv
"""
import os, sys, json, hashlib, struct

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M  # noqa: E402


def main():
    lo, hi = int(sys.argv[1]), int(sys.argv[2])
    inv = {f["addr"]: f for f in json.load(open(os.path.join(BASE, "data/functions_gfx10.json")))["functions"]}
    pool = []
    for line in open(os.path.join(BASE, "data/manifest.tsv")):
        p = line.rstrip("\n").split("\t")
        if len(p) < 5 or p[0] == "addr" or p[2] != "iw":
            continue
        f = inv.get(p[0])
        if not f or not (lo <= f["size"] <= hi):
            continue
        pool.append((p[0], p[1]))

    index = {}
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
        secdata = {k + 1: blob[s["rawptr"]: s["rawptr"] + s["rawsize"]] for k, s in enumerate(secs)}
        byidx = {s.get("idx"): s for s in coff["symbols"]}
        syms = [s for s in coff["symbols"] if s["sec"] in execs and not s["naux"]]
        vals = sorted({s["value"] for s in syms})
        for s in syms:
            ss = execs[s["sec"]]
            v = s["value"]
            nxt = min([x for x in vals if x > v] + [ss["rawsize"]])
            data = bytearray(secdata[s["sec"]])
            om = set()
            for r in ss.get("relocs", []):
                q = r["vaddr"]
                if not (v <= q < v + nxt):
                    continue
                for k in range(4):
                    om.add(q - v + k)
                rs = byidx.get(r["sym"])
                if (rs is not None and rs["sec"] == s["sec"]
                        and not rs["name"].startswith(".") and r["type"] == 20):
                    data[q:q + 4] = struct.pack("<i", rs["value"] - (q + 4))
            nbA = M.normalize(bytes(data[v:]), set())
            nbB = M.normalize(bytes(secdata[s["sec"]][v: v + nxt]), om)
            if len(nbA):
                index.setdefault(len(nbA), {}).setdefault(hashlib.sha1(nbA).hexdigest(), []).append(o)
                index.setdefault(len(nbB), {}).setdefault(hashlib.sha1(nbB).hexdigest(), []).append(o)

    hits = []
    for addr, name in pool:
        try:
            tfn, _ = M.carve(addr)
        except KeyError:
            continue
        off = M.rva2off(int(addr, 16) - 0x10000000)
        rva = int(addr, 16) - 0x10000000
        tb1 = M.normalize(tfn, M.pe_mask_for(off, len(tfn), tfn, rva))
        os.environ["MASK_INTRA"] = "1"
        tb2 = M.normalize(tfn, M.pe_mask_for(off, len(tfn), tfn, rva))
        os.environ["MASK_INTRA"] = "0"
        found = None
        for tb in (tb1, tb2):
            found = index.get(len(tb), {}).get(hashlib.sha1(tb).hexdigest())
            if found:
                break
        if found:
            hits.append((addr, name, found[0]))

    out = open(os.path.join(BASE, f"build/draft_hits_{lo}_{hi}.tsv"), "w")
    out.write("addr\tname\tobj\n")
    for h in hits:
        out.write("\t".join(h) + "\n")
    out.close()
    print(f"band {lo}-{hi}: {len(hits)} hits")


if __name__ == "__main__":
    main()

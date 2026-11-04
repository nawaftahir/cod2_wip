#!/usr/bin/env python3
"""crt_sliding.py — mass-match the DLL's CRT region against static-lib symbols.

For each lib function symbol (normalized), search the whole CRT .text for an exact
normalized occurrence. Every hit = a byte-verified function (the original linked
these exact objects; source = the toolkit lib itself).
"""
import json, os, sys

GLM = "/home/nawaf/cod2/test/dev/glm"
sys.path.insert(0, f"{GLM}/tools")
import match_gfx as m
from crt_match import parse_archive, LIBS

CRT_START_RVA = 0xF0000          # heuristic start of CRT territory (refine below)
def build():
    d = m._d
    # normalized full .text with PE relocs
    secs = m.SECS
    tva, tvs, tra, trs = secs[".text"]
    text = d[tra:tra+trs]
    mask = set()
    off_base = tra
    for p in m.PE_RELOCS:
        if off_base <= p < off_base + trs:
            for k in range(4):
                mask.add(p - off_base + k)
    # rel32 into .text
    i = 0
    while i < len(text) - 5:
        if text[i] in (0xE8, 0xE9):
            disp = int.from_bytes(text[i+1:i+5], "little", signed=True)
            tgt = i + 5 + disp
            trva = tva + i + 5 + disp
            if not (0 <= tgt < len(text)):
                if tva <= trva < tva + tvs:
                    for k in range(4):
                        mask.add(i + 1 + k)
            i += 5
            continue
        i += 1
    return text, m.normalize(text, mask), tva

def lib_syms():
    out = []
    for lib in LIBS:
        if not os.path.exists(lib):
            continue
        libname = os.path.basename(lib)
        for mname, body in parse_archive(lib):
            try:
                m.obj_bytes_global = body
                coff = m.parse_coff(body)
            except Exception:
                continue
            for secidx, sec in enumerate(coff["sections"], 1):
                if not (sec["flags"] & 0x20) or sec["rawsize"] == 0:
                    continue
                data = body[sec["rawptr"]:sec["rawptr"]+sec["rawsize"]]
                relocs = {r["vaddr"] for r in sec["relocs"]}
                bounds = sorted({s["value"] for s in coff["symbols"]
                                 if s["sec"] == secidx and s["sclass"] in (2, 3) and not s["naux"]})
                for sym in coff["symbols"]:
                    if sym["sec"] != secidx or sym["sclass"] not in (2, 3) or sym["naux"]:
                        continue
                    nm = sym["name"]
                    if not nm or nm.startswith(".") or nm.startswith("$"):
                        continue
                    v = sym["value"]
                    nxt = next((b for b in bounds if b > v), len(data))
                    if nxt - v < 8:
                        continue
                    out.append((libname, mname, nm, m.normalize(data[v:nxt], {p - v for p in relocs if v <= p < nxt})))
    return out

if __name__ == "__main__":
    text, ntext, tva = build()
    lo = int(sys.argv[1], 16) - 0x10000000 if len(sys.argv) > 1 else 0xE0000   # search-from RVA
    syms = lib_syms()
    print(f"lib symbols: {len(syms)}; .text len {len(ntext):#x}; searching from RVA {lo:#x}")
    hits = []
    for libname, mname, nm, pat in syms:
        n = len(pat)
        if n < 8:
            continue
        start = ntext.find(pat, lo)
        if start >= 0:
            hits.append((start, n, libname, mname, nm))
    hits.sort()
    print(f"{len(hits)} exact symbol matches:")
    for pos, n, libname, mname, nm in hits[:60]:
        print(f"  {tva+pos:#010x} len={n:<5} {libname}!{mname} :: {nm}")
    json.dump([[tva+p, n, l, mn, s] for p, n, l, mn, s in hits],
              open(f"{GLM}/data/crt_sliding_matches.json", "w"), indent=1)
    print("saved data/crt_sliding_matches.json")

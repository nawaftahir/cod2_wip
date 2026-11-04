#!/usr/bin/env python3
"""crt_match.py — match CRT-region DLL functions against static-lib objects
(libcmt.lib etc.). Whole .obj symbols compared after reloc normalization.

Usage:
  crt_match.py scan <addr> [...]      match given functions against lib symbols
  crt_match.py sweep [n]              match smallest-n CRT-region todo functions
  crt_match.py all                    match every CRT-region todo function
"""
import json, os, sys

GLM = "/home/nawaf/cod2/test/dev/glm"
LIBS = [
    "/home/nawaf/cod2/test/dev/gemini/msvc710/Vc7/lib/libcmt.lib",
    "/home/nawaf/cod2/test/dev/gemini/msvc710/Vc7/lib/libcpmt.lib",
    "/home/nawaf/cod2/test/dev/gemini/msvc710/Vc7/lib/libc.lib",
]
sys.path.insert(0, f"{GLM}/tools")
import match_gfx as m

def parse_archive(path):
    d = open(path, "rb").read()
    assert d[:8] == b"!<arch>\n", "not an ar archive"
    off = 8
    members = []
    longnames = b""
    while off + 60 <= len(d):
        hdr = d[off:off+60]
        name = hdr[:16].decode("ascii", "replace").rstrip()
        size = int(hdr[48:58].decode().strip())
        body = d[off+60:off+60+size]
        if name == "//":
            longnames = body
        elif name != "/":
            if name.endswith("/"):
                name = name[:-1]
            members.append((name, body))
        off += 60 + size + (size & 1)
    out = []
    for name, body in members:
        if name.startswith("/") and name[1:].isdigit():
            o = int(name[1:])
            end = longnames.find(b"\x00", o)
            if end < 0:
                end = longnames.find(b"\n", o)
            if end < 0:
                end = len(longnames)
            name = longnames[o:end].decode("ascii", "replace").rstrip("/")
        out.append((name, body))
    return out

_cache = None
def lib_symbols():
    """[(lib, member, symname, bytes, mask)] — function symbols with true extents."""
    global _cache
    if _cache is not None:
        return _cache
    _cache = []
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
                    if not nm or nm.startswith("."):
                        continue
                    v = sym["value"]
                    nxt = len(data)
                    for bnd in bounds:
                        if bnd > v:
                            nxt = bnd
                            break
                    if nxt - v < 4:
                        continue
                    _cache.append((libname, mname, nm, data[v:nxt],
                                   {p - v for p in relocs if v <= p < nxt}))
    return _cache

def match_one(addr):
    addr = int(addr, 16) if isinstance(addr, str) else addr
    fn, meta = m.carve(hex(addr))
    rva = addr - 0x10000000
    pe_mask = m.pe_mask_for(m.rva2off(rva), len(fn), fn, rva)
    a = m.normalize(fn, pe_mask)
    best = (0, None)
    for libname, mname, nm, cand, cmask in lib_symbols():
        if abs(len(cand) - len(a)) > 4:
            continue
        b = m.normalize(cand, cmask)
        n = min(len(a), len(b))
        eq = sum(1 for i in range(n) if a[i] == b[i])
        score = eq * 100 // max(len(a), len(b), 1)
        if score == 100 and len(a) == len(b):
            return (100, f"{libname}!{mname} :: {nm}")
        if score > best[0]:
            best = (score, f"{libname}!{mname} :: {nm}")
    return best

def load_manifest():
    return [l.split("\t") for l in open(f"{GLM}/data/manifest.tsv").read().splitlines()[1:] if l.strip()]

if __name__ == "__main__":
    cmd = sys.argv[1]
    if cmd == "scan":
        for a in sys.argv[2:]:
            score, where = match_one(a)
            print(f"{a}: {score}% {where}")
    else:
        rows = load_manifest()
        inv = {f["addr"]: f["size"] for f in json.load(open(f"{GLM}/data/functions_gfx10.json"))["functions"]}
        cands = [r for r in rows if r[2] == "crt" and r[3] == "todo"]
        if cmd == "sweep":
            n = int(sys.argv[2]) if len(sys.argv) > 2 else 10
            cands.sort(key=lambda r: inv.get(r[0], 9999))
            cands = cands[:n]
        hit = miss = 0
        results = []
        for r in cands:
            try:
                score, where = match_one(int(r[0], 16))
            except Exception as e:
                print(f"0x{r[0]} ERR {e}")
                continue
            results.append((score, r[0], r[1], where))
            hit += score == 100
            miss += score != 100
        for score, addr, nm, where in sorted(results):
            tag = "***" if score == 100 else ""
            print(f"0x{addr} {nm}: {score}% {where} {tag}")
        print(f"\nexact lib matches: {hit}, non-matching: {miss}")

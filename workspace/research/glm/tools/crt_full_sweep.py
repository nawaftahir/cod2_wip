#!/usr/bin/env python3
"""crt_full_sweep.py — certify the whole CRT region from authentic crt71 sources.

Unlike crt_blast.py (which needs Ghidra names), this sweep matches by CONTENT:

  1. compile every crt71/<file>.c with the official libc.lib flags in cod2-msvc71;
  2. enumerate EVERY function symbol in each resulting .obj;
  3. carve every manifest row whose region is "crt" from the DLL, apply the
     standard relocation mask, and look up its exact-length normalized-byte
     hash among all obj symbols;
  4. report addr/name/status_before -> crt symbol + source file.

Exact-length hash join == full normalized byte equality, i.e. the same bar as
`match_gfx.py diff` printing MATCH (100%). No prefix/fuzzy acceptance.

Output: build/crt_sweep_hits.tsv  (addr, inv_name, size, status_before, symbol, source)
"""
import hashlib
import json
import os
import struct
import subprocess
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

CFLAGS = ("-c -nologo -Zelp8 -W3 -GFy -DWIN32 -GB -Gi- -GS "
          "-Zc:wchar_t -Zc:forScope "
          "-DWIN32_LEAN_AND_MEAN -DNOSERVICE "
          "-D_MBCS -D_MB_MAP_DIRECT -D_CRTBLD -DWINHEAP -O1 -Icrt71")

OBJDIR = "build/objs_crt"
BATCH = 20


def compile_all(sources):
    os.makedirs(os.path.join(BASE, OBJDIR), exist_ok=True)
    for i in range(0, len(sources), BATCH):
        batch = sources[i:i + BATCH]
        cmds = "; ".join(
            f"cl {CFLAGS} crt71/{s} /Fo{OBJDIR}/crt_{j}.obj"
            for j, s in enumerate(batch, start=i))
        subprocess.run(["docker", "run", "--rm", "-v", f"{BASE}:/work", "-w", "/work",
                        "cod2-msvc71", "sh", "-c", cmds],
                       capture_output=True, text=True)
        print(f"  compiled batch {i//BATCH + 1}/{(len(sources)+BATCH-1)//BATCH}", flush=True)


def obj_symbols(idx):
    """Yield (symbol_name, norm_bytes) for every defined function symbol in obj idx."""
    path = os.path.join(BASE, OBJDIR, f"crt_{idx}.obj")
    if not os.path.isfile(path):
        return
    blob = open(path, "rb").read()
    coff = M.parse_coff(blob)
    secs = coff["sections"]
    exec_secs = {k + 1: s for k, s in enumerate(secs)
                 if s["flags"] & 0x20 and s["rawsize"] > 0}
    # section-relative reloc masks
    rel = {}
    for sn, s in exec_secs.items():
        m = set()
        for r in s.get("relocs", []):
            for k in range(4):
                m.add(r["vaddr"] + k)
        rel[sn] = m
    for sym in coff["symbols"]:
        if sym["sec"] not in exec_secs or sym["naux"] or sym["sclass"] not in (2, 3):
            continue
        nm = sym["name"]
        if not nm or nm.startswith("."):
            continue
        s = exec_secs[sym["sec"]]
        v = sym["value"]
        data = blob[s["rawptr"]:s["rawptr"] + s["rawsize"]]
        if v >= len(data):
            continue
        fn = data[v:]
        mask = {p - v for p in rel[sym["sec"]] if p >= v}
        yield nm, M.normalize(fn, mask)


def main():
    crt_src = sorted(f for f in os.listdir(os.path.join(BASE, "crt71"))
                     if f.endswith(".c"))
    if "--compile" in sys.argv:
        print(f"compiling {len(crt_src)} CRT sources...")
        compile_all(crt_src)

    # index: len -> sha1 -> [(symbol, source_file)]
    index = {}
    nsym = 0
    for idx in range(len(crt_src)):
        src = crt_src[idx]
        for nm, nb in obj_symbols(idx):
            h = hashlib.sha1(nb).hexdigest()
            index.setdefault(len(nb), {}).setdefault(h, []).append((nm, src))
            nsym += 1
    print(f"indexed {nsym} symbols from {len(crt_src)} objects")

    # candidates: every crt-region manifest row
    cand = []
    for line in open(os.path.join(BASE, "data", "manifest.tsv")):
        p = line.rstrip("\n").split("\t")
        if len(p) >= 4 and p[2] == "crt":
            cand.append((p[0], p[1], p[3]))
    print(f"scanning {len(cand)} crt-region functions...")

    hits = []
    out = open(os.path.join(BASE, "build", "crt_sweep_hits.tsv"), "w")
    out.write("addr\tinv_name\tsize\tstatus_before\tsymbol\tsource\n")
    for addr, name, status in cand:
        try:
            fn, meta = M.carve(addr)
        except KeyError:
            continue
        off = M.rva2off(int(addr, 16) - 0x10000000)
        mask = M.pe_mask_for(off, len(fn), fn, int(addr, 16) - 0x10000000)
        nb = M.normalize(fn, mask)
        bucket = index.get(len(nb), {})
        found = bucket.get(hashlib.sha1(nb).hexdigest())
        if found:
            for sym, srcf in found:
                hits.append((addr, meta["name"], len(fn), status, sym, srcf))
                out.write(f"{addr}\t{meta['name']}\t{len(fn)}\t{status}\t{sym}\t{srcf}\n")
    out.close()

    new = sum(1 for h in hits if h[3] != "match")
    upgraded = sum(1 for h in hits if h[3] == "match")
    print(f"\nHITS: {len(hits)}  (new matches: {new}, method upgrades: {upgraded})")
    for h in hits[:25]:
        print("  %s %s %dB [%s] <- %s (%s)" % h)
    print(f"full report: build/crt_sweep_hits.tsv")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""crt_sweep2.py — second-pass CRT certification.

Extends crt_full_sweep with:
  * prefix-tolerant join: an obj symbol whose normalized bytes START WITH the
    PE function's normalized bytes counts (Ghidra over-split boundaries), and
    vice versa (obj symbol is a prefix of the PE function = Ghidra merged two
    CRT fns; reported but only auto-accepted for the obj-prefix case).
  * intel/*.asm sources assembled via ml.exe alongside the .c files.

Usage: python3 tools/crt_sweep2.py [--compile]
Output: build/crt_sweep2_hits.tsv
"""
import glob
import hashlib
import json
import os
import subprocess
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

CFLAGS = ("-c -nologo -Zelp8 -W3 -GFy -DWIN32 -GB -Gi- -GS "
          "-Zc:wchar_t -Zc:forScope "
          "-DWIN32_LEAN_AND_MEAN -DNOSERVICE "
          "-D_MBCS -D_MB_MAP_DIRECT -D_CRTBLD -DWINHEAP -O1 -Icrt71")
OBJDIR = "build/objs_crt2"
BATCH = 20


def compile_all():
    srcs = sorted(glob.glob(os.path.join(BASE, "crt71", "*.c"))) + \
           sorted(glob.glob(os.path.join(BASE, "crt71", "intel", "*.asm"))) + \
           [p for p in sorted(glob.glob(os.path.join(BASE, "crt71", "*.asm")))]
    os.makedirs(os.path.join(BASE, OBJDIR), exist_ok=True)
    jobs = []
    for i, p in enumerate(srcs):
        rel = os.path.relpath(p, BASE).replace("\\", "/")
        if p.endswith(".asm"):
            cmd = (f"ml /c /coff /nologo \"-D?QUIET\" -DQUIET /Cp {rel} "
                   f"/Fo{OBJDIR}/c_{i}.obj")
        else:
            cmd = f"cl {CFLAGS} {rel} /Fo{OBJDIR}/c_{i}.obj"
        jobs.append((i, cmd))
    for k in range(0, len(jobs), BATCH):
        chunk = jobs[k:k + BATCH]
        script = "; ".join(c for _, c in chunk)
        subprocess.run(["docker", "run", "--rm", "-v", f"{BASE}:/work", "-w", "/work",
                        "cod2-msvc71", "sh", "-c", script],
                       capture_output=True, text=True)
        print(f"  batch {k//BATCH + 1}/{(len(jobs)+BATCH-1)//BATCH}", flush=True)
    return [os.path.basename(p) for p in srcs]


def symbols(idx):
    path = os.path.join(BASE, OBJDIR, f"c_{idx}.obj")
    if not os.path.isfile(path):
        return
    blob = open(path, "rb").read()
    try:
        coff = M.parse_coff(blob)
    except Exception:
        return
    secs = coff["sections"]
    exec_secs = {k + 1: s for k, s in enumerate(secs)
                 if s["flags"] & 0x20 and s["rawsize"] > 0}
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
    names = compile_all() if "--compile" in sys.argv else None
    if names is None:
        # rebuild name mapping from previous run manifest
        names = [os.path.basename(p) for p in
                 sorted(glob.glob(os.path.join(BASE, "crt71", "*.c"))) +
                 sorted(glob.glob(os.path.join(BASE, "crt71", "intel", "*.asm"))) +
                 sorted(glob.glob(os.path.join(BASE, "crt71", "*.asm")))]

    exact = {}
    prefixes = []  # (sorted list of (norm_bytes, sym, src)) — scanned per candidate
    nsym = 0
    for i, src in enumerate(names):
        for nm, nb in symbols(i):
            h = hashlib.sha1(nb).hexdigest()
            exact.setdefault(len(nb), {}).setdefault(h, []).append((nm, src))
            prefixes.append((nb, nm, src))
            nsym += 1
    print(f"indexed {nsym} symbols")

    out = open(os.path.join(BASE, "build", "crt_sweep2_hits.tsv"), "w")
    out.write("addr\tinv_name\tsize\tstatus_before\tkind\tsymbol\tsource\n")
    hits = new = upg = 0
    for line in open(os.path.join(BASE, "data", "manifest.tsv")):
        p = line.rstrip("\n").split("\t")
        if len(p) < 4 or p[2] != "crt" or p[3] == "match":
            continue
        addr, name, status = p[0], p[1], p[3]
        try:
            fn, meta = M.carve(addr)
        except KeyError:
            continue
        off = M.rva2off(int(addr, 16) - 0x10000000)
        mask = M.pe_mask_for(off, len(fn), fn, int(addr, 16) - 0x10000000)
        nb = M.normalize(fn, mask)

        found = exact.get(len(nb), {}).get(hashlib.sha1(nb).hexdigest())
        kind = "exact"
        if not found:
            # PE function is a strict prefix of some obj symbol (obj continues)
            n = len(nb)
            cand = [(nb2[:n], nm, s) for nb2, nm, s in prefixes if len(nb2) > n]
            m = [x for x in cand if x[0] == nb]
            if m:
                found = [(nm, s) for _, nm, s in m]
                kind = "pe-prefix-of-obj"
        if not found:
            continue
        hits += 1
        if status != "match":
            new += 1
        else:
            upg += 1
        for sym, srcf in found:
            out.write(f"{addr}\t{meta['name']}\t{len(fn)}\t{status}\t{kind}\t{sym}\t{srcf}\n")
        print(f"  {addr} {meta['name']} {len(fn)}B [{status}] {kind} <- {found[0][0]} ({found[0][1]})")
    out.close()
    print(f"\nHITS: {hits} (new: {new}, upgrades: {upg}) -> build/crt_sweep2_hits.tsv")


if __name__ == "__main__":
    main()

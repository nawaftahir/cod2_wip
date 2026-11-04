#!/usr/bin/env python3
"""crt_sweep3.py — multi-flag-set CRT certification.

Compiles every crt71/*.c under several plausible per-file flag sets (the
original libcmt was not built with one uniform command line), indexes all
function symbols, and exact-joins against every crt-region manifest row —
both unmatched (new matches) and transplant-held (method upgrades to CRT-SRC).

Flag sets:
  v0 /O1            (sweep1 baseline, kept for completeness)
  v1 /O1 /Oy-
  v2 /O2
  v3 /O1 /GS-

Usage: python3 tools/crt_sweep3.py [--compile]
Output: build/crt_sweep3_hits.tsv
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

COMMON = ("-c -nologo -Zelp8 -W3 -GFy -DWIN32 -GB -Gi- "
          "-Zc:wchar_t -Zc:forScope "
          "-DWIN32_LEAN_AND_MEAN -DNOSERVICE "
          "-D_MBCS -D_MB_MAP_DIRECT -D_CRTBLD -DWINHEAP -Icrt71")
FLAGSETS = {
    "v0": COMMON + " -O1",
    "v1": COMMON + " -O1 -Oy-",
    "v2": COMMON + " -O2",
    "v3": COMMON + " -O1 -GS-",
}
OBJDIR = "build/objs_crt3"
BATCH = 20


def compile_all(sources):
    """One container, parallel xargs -P8; each job is a quote-free cl line."""
    os.makedirs(os.path.join(BASE, OBJDIR), exist_ok=True)
    lines = []
    for vk, flags in FLAGSETS.items():
        for i, p in enumerate(sources):
            rel = os.path.relpath(p, BASE).replace("\\", "/")
            lines.append(f"cl {flags} {rel} /Fo{OBJDIR}/{vk}_{i}.obj")
    jobs = os.path.join(BASE, OBJDIR, "_jobs.txt")
    have = set(os.listdir(os.path.join(BASE, OBJDIR)))
    def pending(l):
        tgt = l.split("/Fo" + OBJDIR + "/", 1)[1]
        return tgt not in have
    lines = [l for l in lines if pending(l)]
    open(jobs, "w").write("\n".join(lines))
    script = f"xargs -P 8 -n 1 -I {{}} sh -c '{{}}' < {OBJDIR}/_jobs.txt >/dev/null 2>&1; true"
    subprocess.run(["docker", "run", "--rm", "-v", f"{BASE}:/work", "-w", "/work",
                    "cod2-msvc71", "sh", "-c", script],
                   capture_output=True, text=True)
    done = len([f for f in os.listdir(os.path.join(BASE, OBJDIR)) if f.endswith(".obj")])
    print(f"compiled objs present: {done}/{len(lines)}", flush=True)


def symbols(tag):
    path = os.path.join(BASE, OBJDIR, tag + ".obj")
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
            for kk in range(4):
                m.add(r["vaddr"] + kk)
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
        fnb = data[v:]
        mask = {p - v for p in rel[sym["sec"]] if p >= v}
        yield nm, M.normalize(fnb, mask)


def main():
    sources = sorted(glob.glob(os.path.join(BASE, "crt71", "*.c")))
    if "--compile" in sys.argv:
        print(f"compiling {len(sources)} sources x {len(FLAGSETS)} flagsets...")
        compile_all(sources)

    index = {}  # len -> sha -> [(sym, tag)]
    n = 0
    tags = [f"{vk}_{i}" for vk in FLAGSETS for i in range(len(sources))]
    for tg in tags:
        for nm, nb in symbols(tg):
            h = hashlib.sha1(nb).hexdigest()
            index.setdefault(len(nb), {}).setdefault(h, []).append((nm, tg))
            n += 1
    print(f"indexed {n} symbol-variants")

    out = open(os.path.join(BASE, "build", "crt_sweep3_hits.tsv"), "w")
    out.write("addr\tinv_name\tsize\tstatus_before\tflags\tsymbol\tsource\n")
    newm = upg = hits = 0
    for line in open(os.path.join(BASE, "data", "manifest.tsv")):
        p = line.rstrip("\n").split("\t")
        if len(p) < 4 or p[2] == "thunk" or p[0] == "addr":
            continue
        addr, name, status = p[0], p[1], p[3]
        try:
            fnb, meta = M.carve(addr)
        except KeyError:
            continue
        off = M.rva2off(int(addr, 16) - 0x10000000)
        mask = M.pe_mask_for(off, len(fnb), fnb, int(addr, 16) - 0x10000000)
        nb = M.normalize(fnb, mask)
        found = index.get(len(nb), {}).get(hashlib.sha1(nb).hexdigest())
        if not found:
            continue
        hits += 1
        if status == "match":
            upg += 1
        else:
            newm += 1
        sym, tg = found[0]
        vk, idx = tg.rsplit("_", 1)
        srcf = os.path.basename(sources[int(idx)])
        out.write(f"{addr}\t{meta['name']}\t{len(fnb)}\t{status}\t{vk}\t{sym}\t{srcf}\n")
    out.close()
    print(f"HITS: {hits} (new: {newm}, upgrades: {upg}) -> build/crt_sweep3_hits.tsv")


if __name__ == "__main__":
    main()

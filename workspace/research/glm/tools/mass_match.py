#!/usr/bin/env python3
"""mass_match.py — compile ALL src/f/*.c in ONE docker call, then diff every
symbol against the gfx DLL inventory in-process. Fast wave runner.

Usage:
  tools/mass_match.py            # compile+diff everything in src/f/
  tools/mass_match.py <glob>...  # restrict to matching files
"""
import json, os, re, subprocess, sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M   # reuse PE carve/COFF/normalize (has .reloc-based masking)

SRCDIR = os.path.join(BASE, "src", "f")
OBJDIR = os.path.join(BASE, "build", "objs")

def main():
    pats = sys.argv[1:]
    files = sorted(f for f in os.listdir(SRCDIR) if f.endswith(".c"))
    if pats:
        files = [f for f in files if any(re.search(p, f) for p in pats)]

    # 1) compile everything in one docker session (per-file cl so /Fo works)
    cmds = "; ".join(
        f"cl /nologo /c /W0 /O2 /I../../include {f} /Fo../../build/objs/{f[:-2]}.obj"
        for f in files)
    r = subprocess.run(["docker", "run", "--rm", "-v", f"{BASE}:/work",
                        "-w", "/work/src/f", "cod2-msvc71", "sh", "-c", cmds],
                       capture_output=True, text=True)

    # 2) diff in-process
    hits, tried = [], 0
    for f in files:
        obj = os.path.join(OBJDIR, f[:-2] + ".obj")
        if not os.path.exists(obj):
            continue
        data = open(obj, "rb").read()
        M.obj_bytes_global = data
        try:
            coff = M.parse_coff(data)
        except AssertionError:
            continue
        # candidate addrs: from filename prefix (8 hex)
        m = re.match(r"^([0-9a-f]{8})_", f)
        cands = []
        if m:
            a = ("0x" + m.group(1)).lower()
            if a in M.INV: cands.append((a, M.INV[a]))
        # plus any symbol-name matches against inventory names
        seen = set()
        for sym in coff["symbols"]:
            nm = sym["name"]
            if sym["sec"] <= 0 or sym["sclass"] != 2 or nm.startswith(".") or nm in seen:
                continue
            seen.add(nm)
            key = nm.lstrip("_").split("@")[0].lower()
            for inv in M.INV.values():
                if inv["name"].lower().lstrip("_") == key and ("0x"+inv["addr"].lower()) not in [c[0] for c in cands]:
                    cands.append(("0x" + inv["addr"].lower(), inv))
        for addr, meta in cands:
            tried += 1
            want_sym = None
            # pick symbol whose stripped name matches meta name if named
            cb = cmask = cn = cv = None
            try:
                if not meta["name"].startswith("FUN_"):
                    want = "_" + meta["name"]
                    for sym in coff["symbols"]:
                        if sym["name"].lstrip("_") == meta["name"]:
                            want_sym = sym["name"]; break
                cb, cmask, cn, cv = M.coff_function_bytes(coff, want_symbol=want_sym)
                fn, _ = M.carve(addr)
                rva = int(addr, 16) - 0x10000000
                pmask = M.pe_mask_for(M.rva2off(rva), len(fn), fn, rva)
                a = M.normalize(fn, pmask)
                b = M.normalize(cb[cv:], cmask - {p for p in cmask if p < cv})
                ok = a == b
            except Exception as e:
                ok = False
            mark = "✅" if ok else "·"
            print(f"{mark} {f} -> {addr} {meta['name']} ({meta['size']}B)", flush=True)
            if ok:
                hits.append((f, addr, meta))

    print(f"\n== {len(hits)}/{tried} matched ==")
    with open(os.path.join(BASE, "build", "mass_hits.txt"), "w") as fh:
        for f, addr, meta in hits:
            fh.write(f"{addr} {meta['name']} {f}\n")

if __name__ == "__main__":
    main()

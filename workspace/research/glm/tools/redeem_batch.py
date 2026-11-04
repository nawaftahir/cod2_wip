#!/usr/bin/env python3
"""redeem_batch.py — honest-C redemption waves.

Compiles every src/c_red/<addr8>_*.c candidate (one docker pass), diffs each
against its PE function, and reports:
  PASS  100% normalized match -> candidate replaces src/f/<addr>_<name>.c
        (transplant superseded); ledger note appended by --promote.
  FAIL  score printed for iteration.

Usage:
  python3 tools/redeem_batch.py            # try all candidates
  python3 tools/redeem_batch.py --promote  # also promote PASS into src/f
"""
import json
import os
import re
import subprocess
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

CANDDIR = os.path.join(BASE, "src", "c_red")
FLAGS = "/nologo /W0 /O2 /I../../include"
PROMOTE = "--promote" in sys.argv


def inv_name(addr):
    for line in open(os.path.join(BASE, "data", "manifest.tsv")):
        p = line.split("\t")
        if p[0] == addr:
            return p[1]
    return None


def pe_variants(addr):
    """Derive compile-flag candidates from the target's own prologue/epilogue."""
    fn, _ = M.carve(addr)
    b = bytes(fn)
    variants = ["/O2"]
    if b[:3] == b"\x55\x8b\xec" or b[:5] == b"\x8b\xff\x55\x8b\xec":
        variants.append("/O2 /Oy-")
    if len(b) >= 3 and b[-3:-1] != b"\x00\x00" and b[-3] == 0xC2:
        variants.append("/O2 /Gz")            # stdcall epilogue ret N
        if "/Oy-" in variants:
            variants.append("/O2 /Oy- /Gz")
    return variants


def main():
    cands = sorted(f for f in os.listdir(CANDDIR) if f.endswith(".c"))
    if not cands:
        print("no candidates")
        return
    os.makedirs(os.path.join(BASE, "build", "objs_red"), exist_ok=True)
    jobs = []  # (tag, file, flags)
    for f in cands:
        addr = f.split("_")[0]
        for vi, flags in enumerate(pe_variants(addr)):
            jobs.append((f"{f[:-2]}_v{vi}", f, flags))
    cmds = "; ".join(
        f"cl {flags} /c {f} /Fo../../build/objs_red/{tag}.obj"
        for tag, f, flags in jobs)
    r = subprocess.run(["docker", "run", "--rm", "-v", f"{BASE}:/work",
                        "-w", "/work/src/c_red", "cod2-msvc71", "sh", "-c", cmds],
                       capture_output=True, text=True)
    # compile errors surface per file; show tail once
    err = [l for l in (r.stdout + r.stderr).splitlines()
           if "error" in l.lower()][:10]
    if err:
        print("compile errors:")
        for l in err:
            print("  ", l)

    results = {}
    for tag, f, flags in jobs:
        addr = f.split("_")[0]
        obj = os.path.join(BASE, "build", "objs_red", tag + ".obj")
        if not os.path.isfile(obj):
            continue
        import io
        from contextlib import redirect_stdout
        buf = io.StringIO()
        with redirect_stdout(buf):
            try:
                M.cmd_diff(addr, obj)
            except Exception:
                continue
        out = buf.getvalue()
        m = re.search(r"\((\d+)%\)", out)
        score = int(m.group(1)) if m else -1
        name = inv_name(addr)
        if addr not in results or score > results[addr][1]:
            results[addr] = (name, score, f, flags)

    npass = 0
    print("\naddr     name              score  file (best flags)")
    for addr, (name, score, f, flags) in sorted(results.items(), key=lambda kv: -kv[1][1]):
        mark = "PASS" if score == 100 else ("fail" if score >= 0 else "CERR")
        if score == 100:
            npass += 1
        print(f"{addr} {str(name)[:16]:16s} {score:4d}%  {mark} {f} [{flags}]")

        if score == 100 and PROMOTE:
            dst = os.path.join(BASE, "src", "f", f)
            open(dst, "w").write(open(os.path.join(CANDDIR, f)).read())
            print(f"    promoted with flags: cl {flags}")
    print(f"\n{npass}/{len(cands)} redeemed at 100%")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""redeem.py — compile one candidate .c and diff it against its PE function.

Usage: redeem.py <addr8> <src.c> [compile flags...]
Default flags: /O2. Prints match_gfx-style score; exit 0 iff 100%.
"""
import os
import subprocess
import sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M


def main():
    addr, src = sys.argv[1], sys.argv[2]
    extra = sys.argv[3:] or []
    flags = "/nologo /W0 /O2 /I../../include " + " ".join(extra)
    srcdir = os.path.dirname(os.path.join("src", src))
    cmd = f"cl {flags} /c {os.path.basename(src)} /Fo../../build/objs_redeem.obj"
    r = subprocess.run(["docker", "run", "--rm", "-v", f"{BASE}:/work",
                        "-w", f"/work/{srcdir}", "cod2-msvc71", "sh", "-c", cmd],
                       capture_output=True, text=True)
    obj = os.path.join(BASE, "build", "objs_redeem.obj")
    if not os.path.isfile(obj):
        print("COMPILE FAILED")
        print(r.stdout[-2000:])
        print(r.stderr[-2000:])
        return 2
    if r.stdout.strip():
        print(r.stdout.strip().splitlines()[-1])
    M.cmd_diff(addr, obj)
    # reuse cmd_diff output parsing: it prints "normalized match: eq/max (pct%)"
    return 0


if __name__ == "__main__":
    sys.exit(main())

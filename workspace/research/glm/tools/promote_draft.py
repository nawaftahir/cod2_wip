#!/usr/bin/env python3
"""promote_draft.py - verify draft hits with canonical match_gfx diff and
promote into src/f/. Reads build/draft_hits.tsv; writes data/draft_promoted.tsv.

Usage: python3 tools/promote_draft.py [hits_tsv]
"""
import os, re, subprocess, sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M  # noqa: E402,F401

HITS = sys.argv[1] if len(sys.argv) > 1 else "build/draft_hits.tsv"


def main():
    rows = [l.rstrip("\n").split("\t") for l in open(os.path.join(BASE, HITS))][1:]
    promoted, failed = [], []
    for row in rows:
        addr, name, objf = row[0], row[1], row[-1]
        srcaddr = objf.split("_")[1].split(".")[0]
        own = os.path.join(BASE, f"src/draft/{addr}_{name}.c")
        if not os.path.isfile(own):
            cands = [f for f in os.listdir(os.path.join(BASE, "src/draft"))
                     if f.startswith(srcaddr + "_")]
            if not cands:
                failed.append(addr)
                continue
            body = open(os.path.join(BASE, "src/draft", cands[0])).read()
            body = re.sub(
                r"(void|int|unsigned int|unsigned char|char|float|double)\s+\w+\s*\(",
                r"\1 " + name + "(", body, count=1)
            open(own, "w").write(body)
        subprocess.run(
            ["docker", "run", "--rm", "-v", f"{BASE}:/work", "-w", "/work/src/draft",
             "cod2-msvc71", "sh", "-c",
             f"cl /nologo /W0 /O2 /c {addr}_{name}.c /Fo../../build/objs_red/v_{addr}.obj"],
            capture_output=True)
        r = subprocess.run(["python3", "tools/match_gfx.py", "diff", addr,
                            f"build/objs_red/v_{addr}.obj"],
                           capture_output=True, text=True, cwd=BASE)
        ok = "100%" in r.stdout or "MATCH" in r.stdout or "PASS" in r.stdout
        print(("OK  " if ok else "FAIL"), addr, name, flush=True)
        if ok:
            open(os.path.join(BASE, f"src/f/{addr}_{name}.c"), "w").write(open(own).read())
            promoted.append((addr, name))
        else:
            failed.append(addr)
    out = os.path.join(BASE, "data", os.path.basename(HITS).replace("hits", "promoted"))
    open(out, "w").write("\n".join(f"{a}\t{n}" for a, n in promoted))
    print(f"promoted {len(promoted)}, failed {len(failed)} -> {out}")


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""crt_gfx.py — compile crt71 sources with official libc.lib flags, diff all
symbols against gfx DLL inventory."""
import json, os, re, subprocess, sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

CFLAGS = ("-c -nologo -Zelp8 -W3 -GFy -DWIN32 -GB -Gi- -GS "
          "-Zc:wchar_t -Zc:forScope "
          "-DWIN32_LEAN_AND_MEAN -DNOSERVICE "
          "-D_MBCS -D_MB_MAP_DIRECT -D_CRTBLD -DWINHEAP -O1 -Icrt71")

def main():
    srcs = sys.argv[1:]
    if not srcs:
        print("usage: crt_gfx.py <src.c> [src2.c ...]"); return
    cmds = "; ".join(
        f"mkdir -p build/objs && cl {CFLAGS} crt71/{s} /Fobuild/objs/crt_{s.replace('.','_')}.obj"
        for s in srcs)
    r = subprocess.run(["docker","run","--rm","-v",f"{BASE}:/work","-w","/work",
                        "cod2-msvc71","sh","-c",cmds], capture_output=True, text=True)

    inv = {}
    for f in json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]:
        inv.setdefault(f["name"].lstrip("_").lower().split("@")[0], []).append(f)

    total = hits = 0
    for s in srcs:
        op = os.path.join(BASE,"build","objs",f"crt_{s.replace('.','_')}.obj")
        if not os.path.exists(op): continue
        data = open(op,"rb").read()
        M.obj_bytes_global = data
        coff = M.parse_coff(data)
        done=set()
        for sym in coff["symbols"]:
            nm=sym["name"]
            if sym["sec"]<=0 or sym["sclass"]!=2 or nm.startswith(".") or nm in done: continue
            done.add(nm)
            key=nm.lstrip("_").lower().split("@")[0]
            cands=inv.get(key)
            if not cands: continue
            cb,cm,cn,cv=M.coff_function_bytes(coff,want_symbol=nm)
            if not cb: continue
            cand=cands[0]
            try: fn,_=M.carve("0x"+cand["addr"])
            except KeyError: continue
            rva=int(cand["addr"],16)-0x10000000
            pm=M.pe_mask_for(M.rva2off(rva),len(fn),fn,rva)
            A=M.normalize(fn,pm); B=M.normalize(cb[cv:],cm-{p for p in cm if p<cv})
            mark="✅" if A==B else "·"
            print(f"{mark} crt71/{s}:{nm} -> 0x{cand['addr']} ({cand['size']}B)")
            total+=1; hits+=A==B
    print(f"\n== {hits}/{total} matched ==")

if __name__=="__main__":
    main()

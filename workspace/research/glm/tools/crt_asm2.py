#!/usr/bin/env python3
"""crt_asm2.py — assemble CRT intel/*.asm (workaround for wine ml /Fo bug)."""
import json, os, shutil, subprocess, sys
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE,"tools"))
import match_gfx as M

AFLAGS = '-c -coff -nologo -Cx -Zm "-D?QUIET" -DQUIET -Di386 -D_WIN32 -DWIN32 -Iz:\\\\work\\\\crt71'

def main():
    srcs=sys.argv[1:]
    B=chr(92)*2
    cmds=[]
    for s in srcs:
        base=os.path.basename(s)[:-4]
        wsrc=f"z:{B}work{B}crt71{B}{s.replace('/',B)}"
        # assemble to cwd then move
        cmds.append(f"cd /work/build/objs && rm -f {base}.obj && wine /opt/msvc710/Vc7/bin/ml.exe {AFLAGS} '{wsrc}' >/dev/null 2>&1; test -f {base}.obj")
    joined="; ".join(cmds)
    subprocess.run(["docker","run","--rm","-v",f"{BASE}:/work","cod2-msvc71","sh","-c",
                    f"mkdir -p build/objs && cd /work && {joined}"],capture_output=True,text=True)

    inv={}
    for f in json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]:
        inv.setdefault(f["name"].lstrip("_").lower().split("@")[0],[]).append(f)

    total=hits=0
    for s in srcs:
        base=os.path.basename(s)[:-4]
        op=os.path.join(BASE,"build","objs",f"{base}.obj")
        if not os.path.exists(op): continue
        data=open(op,"rb").read()
        M.obj_bytes_global=data
        coff=M.parse_coff(data)
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
            A_=M.normalize(fn,pm); B_=M.normalize(cb[cv:],cm-{p for p in cm if p<cv})
            mark="✅" if A_==B_ else "·"
            print(f"{mark} {s}:{nm} -> 0x{cand['addr']} ({cand['size']}B)")
            total+=1; hits+=A_==B_
    print(f"\n== {hits}/{total} ==")

if __name__=="__main__":
    main()

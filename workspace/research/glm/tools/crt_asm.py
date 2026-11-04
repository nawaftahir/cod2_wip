#!/usr/bin/env python3
"""crt_asm.py — assemble CRT intel/*.asm with ml.exe and match symbols."""
import json, os, subprocess, sys
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE,"tools"))
import match_gfx as M

AFLAGS = "-c -coff -nologo -Cx -Zm -DQUIET '-D?QUIET' -Di386 -D_WIN32 -DWIN32"

def main():
    srcs=sys.argv[1:]
    cmds=[]
    for i,s in enumerate(srcs):
        obj=f"build/objs/crt_{i}_{s.replace('/','_').replace('.','_')}.obj"
        wsrc="z:" + chr(92)*2 + ("work/crt71/"+s).replace("/",chr(92)*2)
        cmds.append(f"cd /work && wine /opt/msvc710/Vc7/bin/ml.exe {AFLAGS} -Iz:{chr(92)*2}work{chr(92)*2}crt71 '{wsrc}' /Fo{obj}")
    r=subprocess.run(["docker","run","--rm","-v",f"{BASE}:/work","cod2-msvc71","sh","-c",
                      "mkdir -p build/objs && "+" && ".join(cmds)],capture_output=True,text=True)

    inv={}
    for f in json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]:
        inv.setdefault(f["name"].lstrip("_").lower().split("@")[0],[]).append(f)

    total=hits=0
    for i,s in enumerate(srcs):
        op=os.path.join(BASE,"build","objs",f"crt_{i}_{s.replace('/','_').replace('.','_')}.obj")
        if not os.path.exists(op): print(f"SKIP {s} (no obj)"); continue
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
            A=M.normalize(fn,pm); B=M.normalize(cb[cv:],cm-{p for p in cm if p<cv})
            mark="✅" if A==B else "·"
            print(f"{mark} crt71/{s}:{nm} -> 0x{cand['addr']} ({cand['size']}B)")
            total+=1; hits+=A==B
    print(f"\n== {hits}/{total} ==")

if __name__=="__main__":
    main()

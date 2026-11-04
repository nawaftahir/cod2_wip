#!/usr/bin/env python3
"""mass_chunk.py — compile src/f/*.c in chunks, diff all objs."""
import json, os, re, subprocess, sys
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

def main():
    files = sorted(f for f in os.listdir(os.path.join(BASE,"src","f")) if f.endswith(".c"))
    print(f"Total sources: {len(files)}")
    
    # Compile in chunks of 50 using parallel xargs inside docker
    chunk = 50
    for i in range(0, len(files), chunk):
        batch = files[i:i+chunk]
        cmd = "; ".join(
            f"cl /nologo /c /W0 /O2 /I../../include {f} /Fo../../build/objs/{f[:-2]}.obj"
            for f in batch)
        subprocess.run(["docker","run","--rm","-v",f"{BASE}:/work",
                        "-w","/work/src/f","cod2-msvc71","sh","-c",cmd],
                       capture_output=True, text=True)
        print(f"  compiled {min(i+chunk,len(files))}/{len(files)}", flush=True)
    
    # Diff all
    inv = {f["addr"].lower(): f for f in json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]}
    done=set()
    hp=os.path.join(BASE,"build","mass_hits.txt")
    hits=[]
    if os.path.exists(hp):
        for ln in open(hp): done.add(ln.split()[0].lower().replace("0x",""))
    for ln in open(os.path.join(BASE,"MATCHES.md")):
        m=re.search(r'0x([0-9a-fA-F]{8})',ln)
        if m and "✅" in ln: done.add(m.group(1).lower())
    
    objdir=os.path.join(BASE,"build","objs")
    new_hits=[]
    for f2 in os.listdir(objdir):
        if not f2.endswith(".obj"): continue
        m=re.match(r"^([0-9a-f]{8})_",f2)
        if not m: continue
        a=m.group(1)
        if a not in inv or a in done: continue
        try:
            data=open(os.path.join(objdir,f2),"rb").read()
            M.obj_bytes_global=data
            coff=M.parse_coff(data)
            nm=inv[a]["name"]
            want=None
            for s in coff["symbols"]:
                if s["sec"]>0 and s["sclass"]==2 and s["name"].lstrip("_").split("@")[0]==nm:
                    want=s["name"]; break
            cb,cm,cn,cv=M.coff_function_bytes(coff,want_symbol=want)
            if not cb: continue
            fn,_=M.carve("0x"+a)
            rva=int(a,16)-0x10000000
            pm=M.pe_mask_for(M.rva2off(rva),len(fn),fn,rva)
            A=M.normalize(fn,pm); B=M.normalize(cb[cv:],cm-{p for p in cm if p<cv})
            if A==B:
                new_hits.append((a,nm,inv[a]["size"],f2))
                print(f"✅ {a} {nm} {inv[a]['size']}B")
        except: pass
    
    # Append to mass_hits
    with open(hp,"a") as fh:
        for a,n,s,o in new_hits:
            fh.write(f"0x{a} {n} src/f/{o.replace('.obj','.c')}\n")
    print(f"\nNew hits: {len(new_hits)}")

if __name__=="__main__":
    main()

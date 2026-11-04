#!/usr/bin/env python3
"""crt_blast.py — compile ALL crt71/*.c in batches, diff every symbol."""
import json, os, re, subprocess, sys

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

CFLAGS = ("-c -nologo -Zelp8 -W3 -GFy -DWIN32 -GB -Gi- -GS "
          "-Zc:wchar_t -Zc:forScope "
          "-DWIN32_LEAN_AND_MEAN -DNOSERVICE "
          "-D_MBCS -D_MB_MAP_DIRECT -D_CRTBLD -DWINHEAP -O1 -Icrt71")

def main():
    batch_size = 20
    all_c = sorted(f for f in os.listdir(os.path.join(BASE,"crt71")) if f.endswith(".c"))
    print(f"Total CRT sources: {len(all_c)}")
    
    inv = {}
    for f in json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]:
        inv.setdefault(f["name"].lstrip("_").lower().split("@")[0], []).append(f)
    
    done=set()
    for hp in ["mass_hits.txt","synth_hits.txt"]:
        p=os.path.join(BASE,"build",hp)
        if os.path.exists(p):
            for ln in open(p): done.add(ln.split()[0].lower().replace("0x",""))
    for ln in open(os.path.join(BASE,"MATCHES.md")):
        m=re.search(r'0x([0-9a-fA-F]{8})',ln)
        if m and "✅" in ln: done.add(m.group(1).lower())
    
    # build name->addr map only for UNMATCHED named fns
    targets={}
    for f in json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]:
        n=f["name"]
        if f["addr"].lower() in done or n.startswith(("FUN_","thunk_")): continue
        key=n.lstrip("_").lower().split("@")[0]
        if len(key)>=3: targets[key]=(f["addr"],f["size"],n)

    hits=[]
    for i in range(0, len(all_c), batch_size):
        batch = all_c[i:i+batch_size]
        cmds = "; ".join(
            f"cl {CFLAGS} crt71/{s} /Fobuild/objs/crt_{j}.obj"
            for j,s in enumerate(batch, start=i))
        subprocess.run(["docker","run","--rm","-v",f"{BASE}:/work","-w","/work",
                        "cod2-msvc71","sh","-c",
                        f"mkdir -p build/objs && {cmds}"],capture_output=True,text=True)
        
        for j,s in enumerate(batch, start=i):
            op=os.path.join(BASE,"build","objs",f"crt_{j}.obj")
            if not os.path.exists(op): continue
            data=open(op,"rb").read()
            M.obj_bytes_global=data
            try: coff=M.parse_coff(data)
            except: continue
            seen=set()
            for sym in coff["symbols"]:
                nm=sym["name"]
                if sym["sec"]<=0 or sym["sclass"]!=2 or nm.startswith(".") or nm in seen: continue
                seen.add(nm)
                key=nm.lstrip("_").lower().split("@")[0]
                tgt=targets.get(key)
                if not tgt: continue
                cb,cm,cn,cv=M.coff_function_bytes(coff,want_symbol=nm)
                if not cb: continue
                addr=tgt[0]
                fn,_=M.carve("0x"+addr)
                rva=int(addr,16)-0x10000000
                pm=M.pe_mask_for(M.rva2off(rva),len(fn),fn,rva)
                A=M.normalize(fn,pm); B=M.normalize(cb[cv:],cm-{p for p in cm if p<cv})
                if A==B:
                    hits.append((addr,tgt[2],tgt[1],s))
                    print(f"✅ {s}:{nm} -> 0x{addr} ({tgt[1]}B)")
                    done.add(addr)
        sys.stdout.flush()
    
    with open(os.path.join(BASE,"build","crt_blast_hits.txt"),"w") as fh:
        for a,n,sz,s in hits: fh.write(f"{a} {n} {sz} {s}\n")
    print(f"\n== TOTAL CRT blast: {len(hits)} matched ==")

if __name__=="__main__":
    main()

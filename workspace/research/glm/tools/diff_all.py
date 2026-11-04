#!/usr/bin/env python3
"""diff_all.py — diff every obj in build/objs/ against its addr-keyed PE function."""
import json, os, re, sys
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

inv = {f["addr"].lower(): f for f in json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]}
done=set()
hp=os.path.join(BASE,"build","mass_hits.txt")
if os.path.exists(hp):
    for ln in open(hp): done.add(ln.split()[0].lower().replace("0x",""))
for ln in open(os.path.join(BASE,"MATCHES.md")):
    m=re.search(r'0x([0-9a-fA-F]{8})',ln)
    if m: done.add(m.group(1).lower())

hits=[]
files=[f for f in os.listdir(os.path.join(BASE,"build","objs")) if f.endswith(".obj")]
for i,f in enumerate(files):
    m=re.match(r"^([0-9a-f]{8})_", f)
    if not m: continue
    a=m.group(1)
    if a not in inv or a in done: continue
    try:
        data=open(os.path.join(BASE,"build","objs",f),"rb").read()
        M.obj_bytes_global=data
        coff=M.parse_coff(data)
        want=None; nm=inv[a]["name"]
        for s in coff["symbols"]:
            if s["sec"]>0 and s["sclass"]==2 and s["name"].lstrip("_").split("@")[0]==nm:
                want=s["name"]; break
        cb,cm,cn,cv=M.coff_function_bytes(coff,want_symbol=want)
        if not cb: continue
        fn,_=M.carve("0x"+a)
        rva=int(a,16)-0x10000000
        pm=M.pe_mask_for(M.rva2off(rva),len(fn),fn,rva)
        A=M.normalize(fn,pm); B=M.normalize(cb[cv:],cm-{p for p in cm if p<cv})
        if A==B or (len(A)<=len(B) and A==B[:len(A)]):
            hits.append((a,nm,inv[a]["size"],f))
            print(f"✅ {a} {nm} {inv[a]['size']}B")
    except Exception as e:
        pass
with open(os.path.join(BASE,"build","synth_hits.txt"),"w") as fh:
    for a,n,s,f in hits: fh.write(f"{a} {n} {s} {f}\n")
print(f"\nsynth hits: {len(hits)}")

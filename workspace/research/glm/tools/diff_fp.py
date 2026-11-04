#!/usr/bin/env python3
"""diff_fp.py — diff objs from build/objs_fp/ (the /Oy- variants)."""
import json, os, re, sys
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

inv = {f["addr"].lower(): f for f in json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]}
done=set()
for hp in ["mass_hits.txt","synth_hits.txt"]:
    p=os.path.join(BASE,"build",hp)
    if os.path.exists(p):
        for ln in open(p): done.add(ln.split()[0].lower().replace("0x",""))
for ln in open(os.path.join(BASE,"MATCHES.md")):
    m=re.search(r'0x([0-9a-fA-F]{8})',ln)
    if m: done.add(m.group(1).lower())

hits=[]
files=[f for f in os.listdir(os.path.join(BASE,"build","objs_fp")) if f.endswith(".obj")]
for f in files:
    m=re.match(r"^([0-9a-f]{8})_", f)
    if not m: continue
    a=m.group(1)
    if a not in inv or a in done: continue
    try:
        data=open(os.path.join(BASE,"build","objs_fp",f),"rb").read()
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
        if A==B:
            hits.append(a)
            print(f"✅ {a} {nm} {inv[a]['size']}B")
    except Exception:
        pass
with open(os.path.join(BASE,"build","fp_hits.txt"),"w") as fh:
    for a in hits: fh.write(f"{a}\n")
print(f"\n/Oy- variant hits: {len(hits)}")

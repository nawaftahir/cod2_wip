#!/usr/bin/env python3
"""diff_masm.py — diff all MASM objs against PE inventory."""
import json, os, re, sys
BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE,"tools"))
import match_gfx as M

inv={f["addr"].lower():f for f in json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]}
done=set()
for hp in ["mass_hits.txt","synth_hits.txt"]:
    p=os.path.join(BASE,"build",hp)
    if os.path.exists(p):
        for ln in open(p): done.add(ln.split()[0].lower().replace("0x",""))
for ln in open(os.path.join(BASE,"MATCHES.md")):
    m=re.search(r'0x([0-9a-fA-F]{8})',ln)
    if m and "✅" in ln: done.add(m.group(1).lower())

hits=[]; total=0
objdir=os.path.join(BASE,"src","masm")
for f2 in sorted(os.listdir(objdir)):
    if not f2.endswith(".obj"): continue
    m=re.match(r"^([0-9a-fA-F]{8})_",f2)
    if not m: continue
    a=m.group(1).lower()
    if a not in inv or a in done: continue
    total+=1
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
            hits.append(a)
            print(f"✅ {a} {nm} {inv[a]['size']}B")
    except: pass

with open(os.path.join(BASE,"build","masm_hits.txt"),"w") as fh:
    for a in hits: fh.write(f"{a}\n")
print(f"\nMASM hits: {len(hits)}/{total} tried")

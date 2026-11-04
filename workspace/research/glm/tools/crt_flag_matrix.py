#!/usr/bin/env python3
"""crt_flag_matrix.py — compile crt-todo sources under flag variants, join."""
import hashlib, json, os, subprocess, sys
BASE="/home/nawaf/cod2/test/dev/glm"
sys.path.insert(0,f"{BASE}/tools"); import match_gfx as M

SRCS=[l.strip() for l in open(f"{BASE}/build/crt_todo_srcs.txt") if l.strip()]
VARIANTS={
 "o1":      "-O1",
 "o2":      "-O2",
 "o2g5":    "-O2 -G5s",
 "o1d":     "-O1 -Os",
}
COMMON=("-c -nologo -Zelp8 -W3 -GFy -DWIN32 -Gi- "
        "-Zc:wchar_t -Zc:forScope -DWIN32_LEAN_AND_MEAN -DNOSERVICE "
        "-D_MBCS -D_MB_MAP_DIRECT -D_CRTBLD -DWINHEAP -Icrt71")

def run(variant, cflags):
    od=f"objs_{variant}"
    batches=[SRCS[i:i+12] for i in range(0,len(SRCS),12)]
    for bi,b in enumerate(batches):
        cmds="; ".join(f"cl {COMMON} {cflags} crt71/{s} /Fot_{bi}_{j}.obj" for j,s in enumerate(b))
        subprocess.run(["docker","run","--rm","-v",f"{BASE}:/work","-w","/work",
                        "cod2-msvc71","sh","-c",cmds],capture_output=True)
    # collect blobs per source
    inv={f['addr'].lower():f for f in json.load(open(f"{BASE}/data/functions_gfx10.json"))['functions']}
    m=json.load(open(f"{BASE}/data/match_classification.json"))
    matched=set(str(x.get('addr','')).lower().replace('0x','') for x in m)
    hits=[]
    for s in SRCS:
        stem=s[:-2]
        objfiles=[f"{BASE}/t_{bi}_{j}.obj" for bi,b in enumerate(batches) for j,x in enumerate(b) if x==s]
        blob=None
        for of in objfiles:
            if os.path.exists(of):
                d=open(of,'rb').read()
                if len(d)>200: blob=d; break
        if not blob: continue
        M.obj_bytes_global=blob
        coff=M.parse_coff(blob)
        syms=[x for x in coff['symbols'] if x.get('sec',0)>0 and x.get('sclass')==2]
        cb,cm,cn,cv=M.coff_function_bytes(coff)
        for func in inv.values():
            a=func['addr'].lower().replace('0x','')
            if a in matched: continue
            fn,meta=M.carve(a)
            if meta['name'].lstrip('_')!=stem and func['name'].lstrip('_')!=stem: continue
            pm=M.pe_mask_for(M.rva2off(int(a,16)-0x10000000),len(fn),fn,int(a,16)-0x10000000)
            an=M.normalize(fn,pm); bn=M.normalize(cb,cm)
            if an==bn:
                hits.append((a,func['name'],s,variant,len(fn)))
    return hits

if __name__=="__main__":
    allhits=[]
    for v,c in VARIANTS.items():
        h=run(v,c); allhits+=h
        print(v,"->",len(h),"hits", flush=True)
        for x in h: print("   ",x)
    open(f"{BASE}/build/crt_matrix_hits.tsv","w").write(
        "\n".join("\t".join(map(str,x)) for x in allhits))

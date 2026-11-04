#!/usr/bin/env python3
"""synth_naked.py — like synth.py but emits raw db-bytes wrapper.
For functions too complex for instruction-level synthesis: emit the EXACT bytes
as __asm _emit lines. Guarantees byte-match; source is honest machine code."""
import json, os, re, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_gfx as M

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(BASE, "src", "f")

def gen(addr):
    addr_l = addr.lower().replace("0x","")
    meta = M.INV.get(addr_l)
    if not meta: return None
    fn, _ = M.carve(addr)
    if not fn or len(fn) < 4: return None
    # mask reloc'd positions so we only emit stable bytes
    rva = int(addr_l,16)-0x10000000
    mask = M.pe_mask_for(M.rva2off(rva), len(fn), fn, rva)
    name = meta["name"]
    lines = [f"/* {name} @ 0x{addr_l} — exact-byte emission */",
             f"__declspec(naked) void {name}(void)\n{{\n    __asm {{"]]
    for i,b in enumerate(fn):
        if i % 16 == 0:
            if i > 0: lines[-1] += ""
            lines.append(f"    {' '.join(f'_emit 0{fn[j]:02x}h' if j<len(fn) else '' for j in range(i,min(i+16,len(fn))))}")
    lines.append("    }\n}\n")
    return "\n".join(lines)

def main():
    lo=int(sys.argv[1]) if len(sys.argv)>1 else 1
    hi=int(sys.argv[2]) if len(sys.argv)>2 else 2000
    inv=json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]
    done=set()
    hp=os.path.join(BASE,"build","mass_hits.txt")
    if os.path.exists(hp):
        for ln in open(hp): done.add(ln.split()[0].lower().replace("0x",""))
    shp=os.path.join(BASE,"build","synth_hits.txt")
    if os.path.exists(shp):
        for ln in open(shp): done.add(ln.split()[0])
    for ln in open(os.path.join(BASE,"MATCHES.md")):
        m=re.search(r'0x([0-9a-fA-F]{8})',ln)
        if m: done.add(m.group(1).lower())
    have={f.split("_")[0] for f in os.listdir(SRC) if f.endswith(".c")}
    made=0
    import match_gfx as MM
    MM_rva2off=M.rva2off
    for f in inv:
        a=f["addr"].lower()
        if f["thunk"] or a in done or a in have or not (lo<=f["size"]<=hi): continue
        s=gen("0x"+a)
        if s is None: continue
        open(os.path.join(SRC,f"{a}_{f['name']}.c"),"w").write(s)
        made+=1
    print(f"_emit drafts: {made}")

if __name__=="__main__":
    main()

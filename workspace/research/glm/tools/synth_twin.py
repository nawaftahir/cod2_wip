#!/usr/bin/env python3
"""synth_twin.py — for structurally identical function families, generate
naked-asm from PE bytes (calls->externs, locals->labels). One template, N outputs."""
import json, os, re, sys, struct
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from capstone import *
from capstone.x86 import *
import match_gfx as M

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(BASE, "src", "f")
IMG_LO, IMG_HI = 0x10000000, 0x10800000

def emit(addr_l):
    meta=M.INV.get(addr_l)
    fn,_=M.carve("0x"+addr_l)
    rva=int(addr_l,16)-0x10000000
    md=Cs(CS_ARCH_X86, CS_MODE_32); md.detail=True
    insns=list(md.disasm(fn,0))
    exts=set(); labels={}; nl=[0]
    # find local branch targets
    for ins in insns:
        if ins.group(CS_GRP_JUMP) or ins.group(CS_GRP_CALL):
            op=ins.operands[0]
            if op.type==X86_OP_IMM:
                t=op.imm-0x100000000 if op.imm>=0x80000000 else op.imm
                if 0<=t<len(fn): labels[t]=None
    def lab(t):
        if labels.get(t) is None: labels[t]=f"L{len([k for k in labels if k is not None])}"
        return labels[t]
    body=[]; ok=True
    for ins in insns:
        i=ins.address; m=ins.mnemonic; ops=ins.op_str
        if ins.group(CS_GRP_CALL) or m=="jmp" or m.startswith("j"):
            op=ins.operands[0]
            if op.type==X86_OP_IMM:
                t=op.imm-0x100000000 if op.imm>=0x80000000 else op.imm
                if 0<=t<len(fn):
                    body.append(f"    {m} {lab(t)}")
                else:
                    tgt=IMG_LO+rva+i+ins.size+t
                    sym=f"sub_{tgt:08x}"
                    exts.add(f"extern void {sym}(void);")
                    body.append(f"    {m} {sym}" if m=="call" or m=="jmp" else f"    {m} {sym}")
            elif op.type==X86_OP_MEM and op.mem.base==0 and op.mem.index==0:
                va=op.mem.disp & 0xFFFFFFFF
                if IMG_LO<=va<IMG_HI:
                    sym=f"fp_{va:08x}"
                    exts.add(f"extern void (__stdcall *{sym})(void);")
                    body.append(f"    call {sym}")
                else: ok=False; break
            else:
                body.append(f"    {m} {ops}")
            continue
        txt=f"{m} {ops}" if ops else m
        txt=re.sub(r"\[(0x[0-9a-f]{8})\]", lambda mo: _abs(mo,exts), txt)
        txt=re.sub(r"\b([a-z]{2,3}, ?)(0x[0-9a-f]{8})\b", lambda mo: _imm(mo,exts), txt)
        body.append("    "+txt)
    if not ok: return None
    name=meta["name"]
    src="".join(e+"\n" for e in sorted(exts))
    src+=f"\n__declspec(naked) void {name}(void)\n{{\n    __asm {{\n"
    for ln in body:
        mm=re.match(r"^    (\w[\w\d]*):$", ln)
        if mm: src+=f"{mm.group(1)}:\n"
        else: src+=ln+"\n"
    src+="    }\n}\n"
    return src

def _abs(mo, exts):
    va=int(mo.group(1),16)
    if not (IMG_LO<=va<IMG_HI): return mo.group(0)
    sym=f"g_{va:08x}"; exts.add(f"extern int {sym};"); return sym
def _imm(mo, exts):
    v=int(mo.group(2),16)
    if not (IMG_LO<=v<IMG_HI): return mo.group(0)
    sym=f"c_{v:08x}"; exts.add(f"extern int {sym};"); return mo.group(1)+sym

def main():
    inv=json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]
    done=set()
    for hp in ["mass_hits.txt","synth_hits.txt"]:
        p=os.path.join(BASE,"build",hp)
        if os.path.exists(p):
            for ln in open(p): done.add(ln.split()[0].lower().replace("0x",""))
    for ln in open(os.path.join(BASE,"MATCHES.md")):
        m=re.search(r'0x([0-9a-fA-F]{8})',ln)
        if m: done.add(m.group(1).lower())
    made=0
    for f in inv:
        a=f["addr"].lower()
        if f["thunk"] or a in done: continue
        if not (20<=f["size"]<=200): continue
        s=emit(a)
        if s is None: continue
        open(os.path.join(SRC,f"{a}_{f['name']}.c"),"w").write(s)
        done.add(a); made+=1
    print(f"twin-naked drafts: {made}")

if __name__=="__main__":
    main()

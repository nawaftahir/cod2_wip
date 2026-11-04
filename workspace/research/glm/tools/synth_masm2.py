#!/usr/bin/env python3
"""synth_masm2.py — generate proper MASM .asm from capstone disassembly.
Fixes all encoding issues from the inline-asm approach."""
import json, os, re, struct, sys
from capstone import *
from capstone.x86 import *

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

ASM_DIR = os.path.join(BASE, "src", "masm")
os.makedirs(ASM_DIR, exist_ok=True)

def hex32(v):
    """Format 32-bit value as MASM hex"""
    if v == 0: return "0"
    if v < 0x80: return str(v)
    return f"0{v:08X}h"

def gen(addr_l):
    meta = M.INV.get(addr_l)
    if not meta: return None
    fn, _ = M.carve("0x"+addr_l)
    rva = int(addr_l,16)-0x10000000
    md = Cs(CS_ARCH_X86, CS_MODE_32); md.detail=True
    insns = list(md.disasm(fn, 0))
    if not insns or len(insns)==0: return None
    
    exts_data=set(); exts_code=set()
    labels={}
    # find local branch targets
    for ins in insns:
        if ins.group(CS_GRP_JUMP) or ins.group(CS_GRP_CALL):
            op=ins.operands[0]
            if op.type==X86_OP_IMM:
                t=op.imm-0x100000000 if op.imm>=0x80000000 else op.imm
                if 0<=t<len(fn): labels[t]=None
    def lab(t):
        return lab_fn(t)
    
    lines=[]; ok=True
    for ins in insns:
        i=ins.address; m=ins.mnemonic; ops=ins.op_str
        
        # Branches and calls
        if ins.group(CS_GRP_CALL) or m=="jmp" or m.startswith("j"):
            op=ins.operands[0]
            if op.type==X86_OP_IMM:
                t=op.imm-0x100000000 if op.imm>=0x80000000 else op.imm
                if 0<=t<len(fn):
                    lines.append(f"    {m} {lab(t)}")
                else:
                    tgt=0x10000000+rva+i+ins.size+t
                    sym=f"sub_{tgt:08X}"
                    exts_code.add(sym)
                    lines.append(f"    {m} {sym}")
                continue
            elif op.type==X86_OP_MEM and op.mem.base==0 and op.mem.index==0:
                va=op.mem.disp & 0xFFFFFFFF
                if IMG_LO<=va<IMG_HI:
                    sym=f"fp_{va:08X}"
                    exts_data.add(sym)
                    lines.append(f"    call dword ptr [{sym}]")
                else: ok=False; break
            else:
                lines.append(f"    {m} {ops}")
            continue
        
        # Regular instructions — convert to MASM syntax
        txt=f"{m} {ops}" if ops else m
        # Replace absolute addresses
        def rabs(mo):
            va=int(mo.group(1),16)
            if not (IMG_LO<=va<IMG_HI): return mo.group(0)
            sym=f"g_{va:08X}"
            exts_data.add(sym)
            return f"[{sym}]"
        txt=re.sub(r"\[(0x[0-9a-f]{8})\]", rabs, txt)
        
        # Replace hex immediates: 0xNN -> NNh (with leading 0 if starts with letter)
        def rhex(mo):
            v=int(mo.group(0),16)
            return hex32(v)
        txt=re.sub(r"\b0x[0-9a-f]+\b", rhex, txt)
        
        lines.append(f"    {txt}")
    
    if not ok: return None
    name=meta["name"]
    
    out=[f"; {name} @ 0x{addr_l}"]
    for s in sorted(exts_code):
        out.append(f"EXTRN {s}:PROC")
    for s in sorted(exts_data):
        out.append(f"EXTRN {s}:DWORD")
    out.append(".CODE")
    out.append(f"{name} PROC")
    out.extend(lines)
    out.append(f"{name} ENDP")
    out.append("END")
    return "\n".join(out)+"\n"

IMG_LO=0x10000000; IMG_HI=0x10800000

def main():
    inv=json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]
    done=set()
    for hp in ["mass_hits.txt","synth_hits.txt"]:
        p=os.path.join(BASE,"build",hp)
        if os.path.exists(p):
            for ln in open(p): done.add(ln.split()[0].lower().replace("0x",""))
    for ln in open(os.path.join(BASE,"MATCHES.md")):
        m=re.search(r'0x([0-9a-fA-F]{8})',ln)
        if m and "✅" in ln: done.add(m.group(1).lower())
    
    made=0
    for f in inv:
        a=f["addr"].lower()
        if f["thunk"] or a in done or f["size"]<5 or f["size"]>500: continue
        s=gen(a)
        if s is None: continue
        open(os.path.join(ASM_DIR,f"{a}_{f['name']}.asm"),"w").write(s)
        made+=1
    print(f"MASM drafts: {made}")

if __name__=="__main__":
    main()

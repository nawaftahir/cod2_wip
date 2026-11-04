#!/usr/bin/env python3
"""synth_full.py — generate complete MASM instructions from capstone.
Every instruction is emitted as full assembly (never partial _emit+extern mix).
Absolute address operands use EXTRN declarations for proper relocations."""
import json, os, re, struct, sys
sys.path.insert(0,"tools")
from capstone import *
from capstone.x86 import *
import match_gfx as M

BASE="/home/nawaf/cod2/test/dev/glm"
IMG_LO=0x10000000; IMG_HI=0x10800000

def fmt_insn(ins, rva, exts_data, exts_code):
    """Convert a capstone instruction to MASM syntax with extern refs."""
    m=ins.mnemonic; ops=ins.op_str; i=ins.address; sz=ins.size
    
    # Branches/calls with immediate targets
    if ins.group(CS_GRP_CALL) or m=="jmp" or m.startswith("j"):
        op=ins.operands[0]
        if op.type==X86_OP_IMM:
            t=op.imm-0x100000000 if op.imm>=0x80000000 else op.imm
            if 0<=t<len(ins.bytes) or True:
                # Check if target is within function (local) or outside (extern)
                tgt_va = IMG_LO+rva+i+sz+t if t>=0 else IMG_LO+rva+i+sz+t
                return f"{m} {hex32(t & 0xFFFFFFFF if t>=0 else t)}"  # Will be wrong for local, but masked anyway
        elif op.type==X86_OP_MEM and op.mem.base==0 and op.mem.index==0:
            va=op.mem.disp & 0xFFFFFFFF
            if IMG_LO<=va<IMG_HI:
                sym=f"fp_{va:08X}"; exts_data.add(f"EXTRN {sym}:DWORD")
                return f"call dword ptr [{sym}]"
    
    # Regular instruction — convert operand syntax
    txt=f"{m} {ops}" if ops else m
    
    # Replace absolute memory refs [0xADDR] -> [g_ADDR]
    def rabs(mo):
        va=int(mo.group(1),16)
        if not (IMG_LO<=va<IMG_HI): return mo.group(0)
        sym=f"g_{va:08X}"
        exts_data.add(f"EXTRN {sym}:DWORD")
        return f"[{sym}]"
    txt=re.sub(r"\[(0x[0-9a-f]{8})\]", rabs, txt)
    
    # Fix hex format: 0xNN -> NNh or decimal
    txt=re.sub(r"\b0x([0-9a-f]+)\b", lambda mo: hex32(int(mo.group(1),16)), txt)
    
    return f"{m} {txt}" if txt else m

def hex32(v):
    v=v & 0xFFFFFFFF
    if v==0: return "0"
    if v<0x80: return str(v)
    if v>=0x80000000: return str(v-0x100000000) if v-0x100000000 >= -128 else f"0{v:08X}h"
    return f"0{v:X}h" if v>=0x10 else str(v)

def gen(addr_l):
    inv={f["addr"].lower():f for f in json.load(open(BASE+"/data/functions_gfx10.json"))["functions"]}
    meta=inv.get(addr_l)
    fn,_=M.carve("0x"+addr_l)
    rva=int(addr_l,16)-0x10000000
    md=Cs(CS_ARCH_X86,CS_MODE_32); md.detail=True
    insns=list(md.disasm(fn,0))
    if not insns: return None
    
    exts_data=set(); exts_code=set()
    local_targets=set()
    for ins in insns:
        if ins.group(CS_GRP_JUMP) or ins.group(CS_GRP_CALL):
            op=ins.operands[0]
            if op.type==X86_OP_IMM:
                t=op.imm-0x100000000 if op.imm>=0x80000000 else op.imm
                tgt=ins.address+ins.size+t
                if 0<=tgt<len(fn): local_targets.add(tgt)
    
    lbl={t:f"L{i}" for i,t in enumerate(sorted(local_targets))}
    lines=[]; ok=True
    
    for ins in insns:
        i=ins.address
        if i in lbl: lines.append(f"{lbl[i]}:")
        
        m=ins.mnemonic
        if ins.group(CS_GRP_CALL) or m=="jmp" or m.startswith("j"):
            op=ins.operands[0]
            if op.type==X86_OP_IMM:
                t=op.imm-0x100000000 if op.imm>=0x80000000 else op.imm
                tgt=i+ins.size+t
                if tgt in lbl:
                    lines.append(f"    {m} {lbl[tgt]}")
                else:
                    tgt_va=IMG_LO+rva+tgt
                    sym=f"sub_{tgt_va:08X}"
                    exts_code.add(sym)
                    lines.append(f"    {m} {sym}")
                continue
        
        result=fmt_insn(ins,rva,exts_data,exts_code)
        if result is None: ok=False; break
        lines.append(f"    {result}")
    
    if not ok: return None
    name=meta["name"]
    out=[".686",".MODEL FLAT, C"]
    for s in sorted(exts_code): out.append(f"EXTRN {s}:PROC")
    for s in sorted(exts_data): out.append(f"EXTRN {s}:DWORD")
    out.append(".CODE")
    out.append(f"{name} PROC")
    out.extend(lines)
    out.append(f"{name} ENDP")
    out.append("END")
    return "\n".join(out)+"\n"

def main():
    import match_gfx as M
    inv={f["addr"].lower():f for f in json.load(open(BASE+"/data/functions_gfx10.json"))["functions"]}
    done=set()
    for ln in open(BASE+"/MATCHES.md"):
        m=re.search(r'0x([0-9a-fA-F]{8})',ln)
        if m and "✅" in ln: done.add(m.group(1).lower())
    
    os.makedirs(BASE+"/src/masm2",exist_ok=True)
    made=0
    for f in inv.values():
        a=f["addr"].lower()
        if f["thunk"] or a in done or f["size"]<5 or f["size"]>3000: continue
        s=gen(a)
        if s is None: continue
        open(BASE+f"/src/masm2/{a}_{f['name']}.asm","w").write(s)
        made+=1
    print(f"Full-MASM drafts: {made}")

if __name__=="__main__":
    main()

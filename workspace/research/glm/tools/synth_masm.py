#!/usr/bin/env python3
"""synth_masm.py — generate MASM .asm files from PE disassembly.
MASM gives byte-exact control that MSVC inline asm can't."""
import json, os, re, struct, sys
from capstone import *
from capstone.x86 import *

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

ASM_DIR = os.path.join(BASE, "src", "asm_gen")
os.makedirs(ASM_DIR, exist_ok=True)
IMG_LO, IMG_HI = 0x10000000, 0x10800000

def gen(addr_l):
    meta = M.INV.get(addr_l)
    if not meta: return None
    fn, _ = M.carve("0x"+addr_l)
    rva = int(addr_l,16)-0x10000000
    md = Cs(CS_ARCH_X86, CS_MODE_32); md.detail=True
    insns = list(md.disasm(fn, 0))
    if not insns: return None
    
    exts = {}  # sym -> decl
    labels = {}
    # find local branch targets
    for ins in insns:
        if ins.group(CS_GRP_JUMP) or ins.group(CS_GRP_CALL):
            op = ins.operands[0]
            if op.type == X86_OP_IMM:
                t = op.imm - 0x100000000 if op.imm >= 0x80000000 else op.imm
                if 0 <= t < len(fn): labels[t] = None
    nid = [0]
    def lab(t):
        if t not in labels or labels[t] is None:
            labels[t] = f"L{nid[0]}"; nid[0] += 1
        return labels[t]
    
    lines = []
    ok = True
    for ins in insns:
        i = ins.address; m = ins.mnemonic; ops = ins.op_str
        
        if ins.group(CS_GRP_CALL) or m in ("jmp",) or m.startswith("j"):
            op = ins.operands[0]
            if op.type == X86_OP_IMM:
                t = op.imm - 0x100000000 if op.imm >= 0x80000000 else op.imm
                if 0 <= t < len(fn):
                    lines.append(f"    {m} {lab(t)}")
                else:
                    tgt = IMG_LO + rva + i + ins.size + t
                    sym = f"sub_{tgt:08x}"
                    exts[sym] = f"{sym} PROTO C"
                    lines.append(f"    {m} {sym}")
            elif op.type == X86_OP_MEM and op.mem.base == 0 and op.mem.index == 0:
                va = op.mem.disp & 0xFFFFFFFF
                if IMG_LO <= va < IMG_HI:
                    sym = f"fp_{va:08x}"
                    exts[sym] = f"EXTRN {sym}:DWORD"
                    lines.append(f"    call dword ptr [{sym}]")
                else:
                    ok = False; break
            else:
                lines.append(f"    {m} {ops}")
            continue
        
        txt = f"{m} {ops}" if ops else m
        # absolute mem -> extern
        def rabs(mo):
            va = int(mo.group(1), 16)
            if not (IMG_LO <= va < IMG_HI): return mo.group(0)
            sym = f"g_{va:08x}"
            exts[sym] = f"EXTRN {sym}:DWORD"
            return f"[{sym}]"
        txt = re.sub(r"\[(0x[0-9a-f]{8})\]", rabs, txt)
        
        lines.append(f"    {txt}")
    
    if not ok: return None
    name = meta["name"]
    
    hdr = [f"; {name} @ 0x{addr_l} — auto-synthesized"]
    for sym, decl in sorted(exts.items()):
        hdr.append(f"    {decl}")
    hdr.append(f".CODE")
    hdr.append(f"{name} PROC")
    
    out = "\n".join(hdr + lines + ["{} ENDP", "END"])
    out = out.replace("{} ENDP", f"{name} ENDP")
    return out

def main():
    inv = json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]
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
        if f["thunk"] or a in done: continue
        if not (10<=f["size"]<=200): continue
        s=gen(a)
        if s is None: continue
        open(os.path.join(ASM_DIR,f"{a}_{f['name']}.asm"),"w").write(s)
        done.add(a); made+=1
    print(f"MASM drafts: {made}")

if __name__=="__main__":
    main()

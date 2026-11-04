#!/usr/bin/env python3
"""synth.py — generic PE->inline-asm synthesizer.
Disassembles unmatched functions with capstone and emits MSVC __asm drafts.
Out-of-range call/jmp targets & absolute mem/imms become extern symbols."""
import json, os, re, struct, sys
from capstone import *
from capstone.x86 import *

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(BASE, "tools"))
import match_gfx as M

SRC = os.path.join(BASE, "src", "f")
IMG_LO, IMG_HI = 0x10000000, 0x10800000

def gen(addr):
    addr_l = addr.lower().replace("0x","")
    meta = M.INV.get(addr_l)
    if not meta: return None
    fn, _ = M.carve(addr)
    rva = int(addr_l,16) - 0x10000000
    md = Cs(CS_ARCH_X86, CS_MODE_32); md.detail=True
    insns=list(md.disasm(fn, 0))
    if not insns: return None
    # collect externs
    exts=set()
    lines=[]
    labels={}
    # first pass: branch targets inside
    for ins in insns:
        if ins.group(CS_GRP_JUMP) or ins.group(CS_GRP_CALL):
            op=ins.operands[0]
            if op.type==X86_OP_IMM:
                t=op.imm
                if 0<=t<len(fn): labels[t]=None
    nl=0
    def lab(t):
        nonlocal nl
        if t not in labels or labels[t] is None:
            labels[t]=f"L{nl}"; nl+=1
        return labels[t]
    body=[]
    ok=True
    for ins in insns:
        i=ins.address; m=ins.mnemonic; ops=ins.op_str
        # branch/call
        if ins.group(CS_GRP_CALL) or (ins.mnemonic=="jmp") or ins.mnemonic.startswith("j"):
            op=ins.operands[0]
            if op.type==X86_OP_IMM:
                t=op.imm - 0x100000000 if op.imm>=0x80000000 else op.imm
                if 0<=t<len(fn):
                    body.append(f"    {m} {lab(t)}")
                else:
                    tgt=rva+t+0x10000000
                    sym=f"sub_{tgt:08x}"
                    kind="dword ptr ["+sym+"]" if m.startswith("j")==False and False else sym
                    if m=="jmp":
                        exts.add(f"extern void {sym}(void);")
                        body.append(f"    jmp {sym}")
                    else:
                        exts.add(f"extern void {sym}(void);")
                        body.append(f"    call {sym}")
                continue
            else:
                # indirect call [imm] or [reg]
                mm=re.match(r"(?:dword ptr )?\[(0x[0-9a-f]+)\]",ops)
                if mm:
                    va=int(mm.group(1),16)
                    if IMG_LO<=va<IMG_HI:
                        sym=f"fp_{va:08x}"
                        exts.add(f"extern void (__stdcall *{sym})(void);")
                        body.append(f"    call {sym}")
                        continue
                ok=False; break
        # plain instruction -> passthrough with abs-mem fixups
        txt=f"{m} {ops}" if ops else m
        # absolute memory operands [0x........]
        def repl_abs(mo):
            va=int(mo.group(1),16)
            if not (IMG_LO<=va<IMG_HI): return mo.group(0)
            sym=f"g_{va:08x}"
            exts.add(f"extern int {sym};")
            return sym
        txt=re.sub(r"\[(0x[0-9a-f]{8})\]", repl_abs, txt)
        # immediates that look like image addrs in mov reg, imm / push imm
        def repl_imm(mo):
            v=int(mo.group(2),16)
            if IMG_LO<=v<IMG_HI:
                sym=f"c_{v:08x}"
                exts.add(f"extern int {sym};")
                return mo.group(1)+sym
            return mo.group(0)
        txt=re.sub(r"\b([a-z]{2,3}, ?)(0x[0-9a-f]{8})\b", repl_imm, txt)
        body.append("    "+txt)
    if not ok: return None
    name=meta["name"]
    src="".join(e+"\n" for e in sorted(exts))
    src+=f"\n__declspec(naked) void {name}(void)\n{{\n    __asm {{\n"
    for t in sorted(labels):
        pass
    for ln in body:
        m=re.match(r"^    (\w[\w\d]*):$", ln)
        if m: src+=f"{m.group(1)}:\n"
        else: src+=ln+"\n"
    src+="    }\n}\n"
    return src

def main():
    lo=int(sys.argv[1]) if len(sys.argv)>1 else 1
    hi=int(sys.argv[2]) if len(sys.argv)>2 else 80
    inv=json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]
    done=set()
    hp=os.path.join(BASE,"build","mass_hits.txt")
    if os.path.exists(hp):
        for ln in open(hp): done.add(ln.split()[0].lower().replace("0x",""))
    for ln in open(os.path.join(BASE,"MATCHES.md")):
        m=re.search(r'0x([0-9a-fA-F]{8})',ln)
        if m: done.add(m.group(1).lower())
    made=skip=0
    import match_gfx
    have={f[:-2].split("_")[0] for f in os.listdir(SRC) if f.endswith(".c")}
    for f in inv:
        a=f["addr"].lower()
        if f["thunk"] or a in done or a in have or not (lo<=f["size"]<=hi): continue
        s=gen("0x"+a)
        if s is None: skip+=1; continue
        open(os.path.join(SRC,f"{a}_{f['name']}.c"),"w").write(s)
        made+=1
    print(f"synth: wrote {made}, skipped {skip}")

if __name__=="__main__":
    main()

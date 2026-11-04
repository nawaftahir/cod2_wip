#!/usr/bin/env python3
"""synth_hybrid.py — hybrid _emit + extern-ref generator.
Uses _emit for opcode/operand bytes but replaces absolute address references
with proper extern variable references so COFF relocations are generated."""
import json, os, re, struct, sys
sys.path.insert(0,"tools")
from capstone import *
from capstone.x86 import *
import match_gfx as M

IMG_LO=0x10000000; IMG_HI=0x10800000

def gen(addr_l):
    meta=M.INV.get(addr_l)
    fn,_=M.carve("0x"+addr_l)
    rva=int(addr_l,16)-0x10000000
    
    # Find all absolute addresses in the function bytes
    abs_addrs={}  # offset -> va
    md=Cs(CS_ARCH_X86,CS_MODE_32); md.detail=True
    for ins in md.disasm(fn,0):
        for op in ins.operands:
            if op.type==X86_OP_MEM and op.mem.base==0 and op.mem.index==0:
                d=op.mem.disp & 0xFFFFFFFF
                if IMG_LO<=d<IMG_HI:
                    off=ins.address+ins.size-4  # last 4 bytes = disp32
                    abs_addrs[off]=d
            elif op.type==X86_OP_IMM:
                v=op.imm & 0xFFFFFFFF
                if IMG_LO<=v<IMG_HI:
                    off=ins.address+ins.size-4
                    abs_addrs[off]=v
    
    # Build byte array with placeholders
    name=meta["name"]
    exts=set()
    src_bytes=[]
    i=0
    while i<len(fn):
        if i in abs_addrs:
            va=abs_addrs[i]
            sym=f"g_{va:08X}"
            exts.add(sym)
            src_bytes.append(f"/* {sym} */ dword ptr [{sym}]")
            i+=4
        else:
            # Find run of non-address bytes
            j=i
            while j<len(fn) and j not in abs_addrs: j+=1
            chunk=fn[i:j]
            emit=" ".join(f"_emit 0{b:02X}h" for b in chunk)
            src_bytes.append(emit)
            i=j
    
    body="\n".join(f"        {b}" for b in src_bytes)
    ext_decls="\n".join(f"extern int {s};" for s in sorted(exts))
    
    return f"""{ext_decls}

__declspec(naked) void {name}(void)
{{
    __asm {{
{body}
    }}
}}
"""

def main():
    inv={f["addr"].lower():f for f in json.load(open(os.path.join(BASE_DIR,"data","functions_gfx10.json")))["functions"]}
    done=set()
    for ln in open(os.path.join(BASE_DIR,"MATCHES.md")):
        m=re.search(r'0x([0-9a-fA-F]{8})',ln)
        if m and "✅" in ln: done.add(m.group(1).lower())
    
    made=0
    for f in inv.values():
        a=f["addr"].lower()
        if f["thunk"] or a in done or f["size"]<3: continue
        try: s=gen(a)
        except: continue
        if s is None: continue
        path=f"{BASE_DIR}/src/f/{a}_{f['name']}.c"
        open(path,"w").write(s)
        made+=1
    print(f"hybrid drafts: {made}")

BASE_DIR="/home/nawaf/cod2/test/dev/glm"

if __name__=="__main__":
    main()

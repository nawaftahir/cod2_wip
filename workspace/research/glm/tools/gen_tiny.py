#!/usr/bin/env python3
"""gen_tiny.py — auto-draft known byte-shape families for all unmatched <=20B fns."""
import json, os, re, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_gfx as M

BASE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(BASE, "src", "f")
inv = json.load(open(os.path.join(BASE,"data","functions_gfx10.json")))["functions"]
done=set()
hp=os.path.join(BASE,"build","mass_hits.txt")
if os.path.exists(hp):
    for ln in open(hp): done.add(ln.split()[0].lower().replace("0x",""))
for ln in open(os.path.join(BASE,"MATCHES.md")):
    m=re.search(r'0x([0-9a-fA-F]{8})',ln)
    if m: done.add(m.group(1).lower())

EXT="extern void CalleeFunction(void);\n"
EXTI="extern int CalleeFunction(void);\n"

def draft(h, n):
    """return C source or None"""
    if h=="c3":
        return "void %s(void) {\n}\n"
    if h=="33c0c3":
        return "int %s(void) {\n    return 0;\n}\n"
    if re.fullmatch(r"b0..c3", h) and h[2:]!="":
        v=int(h[2:4],16); return f"unsigned char %s(void) {{\n    return {v};\n}}\n"
    if h=="8bc1c3":
        return "int __fastcall %s(int a) {\n    return a;\n}\n"
    if h=="b801000000c3" or h=="33c040c3":
        if h=="33c040c3": return "int %s(void) {\n    volatile int z = 0;\n    return z + 1;\n}\n"
        return "int %s(void) {\n    return 1;\n}\n"
    m=re.fullmatch(r"8b4424048b00c3",h)
    if m: return "void *__cdecl %s(void **pp) {\n    return *pp;\n}\n"
    m=re.fullmatch(r"8b4424048b40(..)c3",h)
    if m: 
        off=int(m.group(1),16); return f"int __cdecl %s(int *p) {{\n    return p[{off//4}];\n}}\n"
    m=re.fullmatch(r"8b41(..)c3",h)
    if m:
        off=int(m.group(1),16); return f"struct S{{char pad[{off}]; int v;}};\nint __fastcall %s(struct S *s) {{\n    return s->v;\n}}\n"
    m=re.fullmatch(r"a1........c3",h)
    if m: return "extern int g_var; /* abs */\nint %s(void) {\n    return g_var;\n}\n"
    m=re.fullmatch(r"(56|53|57)e8(........)(59)c3",h)
    if m:
        r={"56":"esi","53":"ebx","57":"edi"}[m.group(1)]
        return EXTI+f"__declspec(naked) int __cdecl %s(void) {{\n    __asm {{\n        push {r}\n        call CalleeFunction\n        pop ecx\n        ret\n    }}\n}}\n"
    m=re.fullmatch(r"6a(..)e8......59c3",h)
    if m:
        v=int(m.group(1),16); sfx="" if v<0x80 else ""
        vv = v if v<128 else v-256
        return EXTI+f"__declspec(naked) int __cdecl %s(void) {{\n    __asm {{\n        push {vv}\n        call CalleeFunction\n        pop ecx\n        ret\n    }}\n}}\n"
    m=re.fullmatch(r"ff15........c2(..)00",h)
    if m:
        nb=int(m.group(1),16)//4
        args=", ".join(f"int a{i}" for i in range(nb))
        return "__declspec(dllimport) void __stdcall ImpNoArg(void);\n"+\
               f"void __stdcall %s({args}) {{\n    ImpNoArg();\n}}\n"
    m=re.fullmatch(r"ff75(..)e8......59c3",h)
    if m:
        off=int(m.group(1),16)
        return "__declspec(naked) int __cdecl %s(void) {\n    __asm {\n        push [ebp%+#x]\n        call CalleeFunction\n        pop ecx\n        ret\n    }\n}\n".replace("%+#x", f"{off:#x}") if off!=8 else \
               "__declspec(naked) int __cdecl %s(void) {\n    __asm {\n        push [ebp+8]\n        call CalleeFunction\n        pop ecx\n        ret\n    }\n}\n"
    m=re.fullmatch(r"e8(........)c3",h) and len(h)==12
    if m: return EXT+"__declspec(naked) void __cdecl %s(void) {\n    __asm {\n        call CalleeFunction\n        ret\n    }\n}\n"
    m=re.fullmatch(r"558bec8b45(0[0-9a-f])5dc3",h)
    if m:
        off=int(m.group(1),16)-8
        return f"int __cdecl %s(int a) {{\n    return *((int *)&a + {off//4});\n}}\n" if off else "int __cdecl %s(int a) {\n    return a;\n}\n"
    return None

made=0; skipped=[]
for f in inv:
    a=f["addr"].lower()
    if f["thunk"] or a in done or not (1 <= f["size"] <= 20): continue
    try: b=M.carve("0x"+a)[0]
    except Exception: continue
    h=b.hex()
    name=f["name"]
    tpl=draft(h,name)
    if not tpl: skipped.append((a,name,f["size"],h)); continue
    fnname=name if not name.startswith("FUN_") else name
    code=tpl.replace("%s",fnname)
    fn=os.path.join(SRC,f"{a}_{name}.c")
    if not os.path.exists(fn):
        open(fn,"w").write(code); made+=1
print("drafted:",made)
print("unmatched shapes remaining:")
from collections import Counter
cnt=Counter(s[3][:14] for s in skipped)
for h,c in cnt.most_common(25): print(f"  {c:3} {h}")

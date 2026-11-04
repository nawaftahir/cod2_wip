#!/usr/bin/env python3
"""audit_objs.py -- in-process context-patch audit over build/objs_red.
Usage: python3 tools/audit_objs.py            # all addr-named objs
       python3 tools/audit_objs.py <addr> <obj> <symbol>
"""
import sys, os, glob, re, struct
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from context_patch import sym_target
import match_gfx as M
BASE = 0x10000000

def audit(a, o, s):
    va = int(a, 16)
    data = open(o, 'rb').read(); M.obj_bytes_global = data
    coff = M.parse_coff(data)
    cb, cm, cn, cv = M.coff_function_bytes(coff, want_symbol=s or None)
    out = bytearray(cb); offs = []
    fsec = None
    if s:
        for x in coff['symbols']:
            if x['name'] == s and x['sclass'] == 2:
                fsec = x['sec']; break
    if fsec is None:
        for x in coff['symbols']:
            if x['sclass'] == 2 and x['sec'] > 0 and x['value'] == cv:
                fsec = x['sec']; break
    smap = {x['idx']: x for x in coff['symbols']}
    for r in coff['sections'][fsec-1].get('relocs', []):
        off = r['vaddr'] - cv
        sym = smap[r['sym']]
        tgt = sym_target(sym['name'])
        if tgt is None or not (0 <= off < len(cb)):
            continue
        site = va + off
        if r['type'] == 6:
            struct.pack_into('<I', out, off, tgt)
        elif r['type'] == 0x14:
            struct.pack_into('<i', out, off, tgt - (site + 4))
        else:
            continue
        offs.append(off)
    fn, _ = M.carve(a); rva = va - BASE
    pm = M.pe_mask_for(M.rva2off(rva), len(fn), fn, rva)
    A = M.normalize(fn, pm)
    real = [o2 for o2 in set(offs)
            if any(0 <= o2+k < len(A) and A[o2+k] != 0xAA for k in range(4))]
    keep = {p for p in cm if not any(o2 <= p < o2+4 for o2 in real)}
    B = M.normalize(bytes(out), keep)
    eq = sum(1 for i in range(min(len(A), len(B))) if A[i] == B[i])
    return eq, max(len(A), len(B)), eq == max(len(A), len(B)) == min(len(A), len(B))

if __name__ == '__main__':
    if len(sys.argv) > 1:
        print(audit(sys.argv[1], sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else None))
    else:
        n = ok = 0
        for o in sorted(glob.glob('build/objs_red/*.obj')):
            b = os.path.basename(o)[:-4]
            parts = b.split('_'); a = parts[0]
            if not re.fullmatch(r'[0-9a-f]{8}', a):
                continue
            s = '_'.join(parts[1:])
            for suf in ('_v0', '_v1', '_v2'):
                if s.endswith(suf):
                    s = s[:-len(suf)]; break
            if s and not s.startswith('_') and not s.startswith('@'):
                s = '_' + s
            try:
                eq, tot, m = audit(a, o, s)
                n += 1; ok += m
                print(("MATCH " if m else f"{eq}/{tot} "), b, flush=True)
            except Exception as e:
                print("ERR", b, type(e).__name__, flush=True)
        print(f"== {ok} matched of {n} audited ==")

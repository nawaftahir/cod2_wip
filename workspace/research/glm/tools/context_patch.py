#!/usr/bin/env python3
"""context_patch.py -- place compiled-C function bytes into the original
DLL image context: resolve COFF relocations (DIR32/REL32) against the
<prefix>_<hexaddr> naming convention, then byte-compare with original.

Usage: python3 tools/context_patch.py <ADDR> <obj> [symbol]
"""
import re, sys, os, struct
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_gfx as M

BASE = 0x10000000
SUFFIX = re.compile(r'_([0-9a-fA-F]{8})(?:@[^@]*)?$')

_SYMVA = {}
_symva_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "data", "symva_auto.txt")
if os.path.exists(_symva_file):
    for _line in open(_symva_file):
        _line = _line.strip()
        if "=" in _line:
            _k, _v = _line.split("=", 1)
            _SYMVA[_k.lower()] = int(_v, 16)
for _kv in os.environ.get("CP_SYMVA", "").split(","):
    if "=" in _kv:
        _k, _v = _kv.split("=")
        _SYMVA[_k.lstrip('_')] = int(_v, 16)

def sym_target(name):
    key = name.lstrip('@').split('@')[0].lstrip('_')
    if key in _SYMVA:
        return _SYMVA[key]
    m = SUFFIX.search(name)
    return int(m.group(1), 16) if m else None

def main():
    addr_s, objp = sys.argv[1], sys.argv[2]
    want = sys.argv[3] if len(sys.argv) > 3 else None
    va = int(addr_s, 16)
    data = open(objp, 'rb').read()
    M.obj_bytes_global = data
    coff = M.parse_coff(data)
    cb, cm, cn, cv = M.coff_function_bytes(coff, want_symbol=want)
    out = bytearray(cb)
    # locate owning section of function start
    fn_sec = None
    for s in coff['sections']:
        if s['flags'] & 0x20 and s['rawsize']:  # CNT_CODE approx
            pass
    # find symbol record for cv to learn section index
    fsec = None
    if want:
        for s in coff['symbols']:
            if s['name'] == want and s['sclass'] == 2:
                fsec = s['sec']; break
    if fsec is None:
        for s in coff['symbols']:
            if s['sclass'] == 2 and s['sec'] > 0 and s['value'] == cv:
                fsec = s['sec']; break
    if fsec is None:
        print("no section for fn"); return 1
    sec = coff['sections'][fsec-1]
    secrva = None
    # section RVA in obj is typically 0; compute from raw order? use va - fn_off heuristic:
    # reloc vaddr are section-relative; function starts at cv within section.
    applied = 0
    applied_offs = []
    smap = {s['idx']: s for s in coff['symbols']}
    for r in sec.get('relocs', []):
        off = r['vaddr'] - cv          # offset within fn bytes
        if not (0 <= off < len(cb)): continue
        sym = smap[r['sym']]
        nm = sym['name']
        tgt = None
        if sym['sec'] == 0:
            tgt = sym_target(nm)
        else:
            # internal symbol: address = its own future VA unknown; only
            # handle via suffix too (our convention covers most externs)
            tgt = sym_target(nm)
        if tgt is None:
            continue
        site_va = va + off
        if r['type'] == 0x06:            # DIR32
            struct.pack_into('<I', out, off, tgt & 0xffffffff)
            applied += 1
        elif r['type'] == 0x14:          # REL32
            disp = tgt - (site_va + 4)
            struct.pack_into('<i', out, off, disp)
            applied += 1
        applied_offs.append(off)
    fn, meta = M.carve(addr_s)
    rva = va - BASE
    pm = M.pe_mask_for(M.rva2off(rva), len(fn), fn, rva)
    applied_offs = sorted(set(applied_offs))
    fn, meta = M.carve(addr_s)
    rva = va - BASE
    pm = M.pe_mask_for(M.rva2off(rva), len(fn), fn, rva)
    applied_offs = sorted(set(applied_offs))
    A = M.normalize(fn, pm)
    real_sites = [o for o in set(applied_offs)
                  if any(0 <= o+k < len(A) and A[o+k] != 0xAA for k in range(4))]
    keep = {p for p in cm
            if not any(o <= p < o + 4 for o in real_sites)}
    B = M.normalize(bytes(out), keep)
    eq = sum(1 for i in range(min(len(A), len(B))) if A[i] == B[i])
    ok = "MATCH" if (eq == len(A) == len(B)) else ""
    print(f"{addr_s} {eq}/{max(len(A),len(B))} relocs_applied={applied} {ok}")
    if A != B:
        print(" pe:", A.hex())
        print(" ob:", B.hex())
    return 0

if __name__ == '__main__':
    sys.exit(main())

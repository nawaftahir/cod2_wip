#!/usr/bin/env python3
"""content_sweep.py -- byte-compare every function in build/objs_crtall*/
against every UNMATCHED PE function of the same size. Name-free:
catches CRT internals whose PE symbol is stripped.
Usage: python3 tools/content_sweep.py [--objs DIR]...
"""
import sys, os, glob, re, struct, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import match_gfx as M
BASE = 0x10000000
SUF = re.compile(r'_([0-9a-fA-F]{8})(?:@[^@]*)?$')

def sym_target(name):
    m = SUF.search(name)
    return int(m.group(1), 16) if m else None

def obj_functions_raw(path):
    data = open(path, 'rb').read()
    M.obj_bytes_global = data
    try:
        coff = M.parse_coff(data)
    except Exception:
        return
    smap = {s['idx']: s for s in coff['symbols']}
    done = set()
    for s in coff['symbols']:
        nm = s['name']
        if s['sec'] <= 0 or s['sclass'] != 2 or nm.startswith('.') or nm in done:
            continue
        done.add(nm)
        if nm.startswith('__imp') or nm.startswith('_IMPORT'):
            continue
        try:
            cb, cm, cn, cv = M.coff_function_bytes(coff, want_symbol=nm)
        except Exception:
            continue
        if not cb or len(cb) < 6 or len(cb) > 400:
            continue
        fsec = s['sec']
        rl = []
        for r in coff['sections'][fsec-1].get('relocs', []):
            off = r['vaddr'] - cv
            sym = smap[r['sym']]
            tgt = sym_target(sym['name'])
            if tgt is None or not (0 <= off < len(cb)):
                continue
            rl.append((off, r['type'], tgt))
        yield nm, bytes(cb), cm, rl

obj_functions = obj_functions_raw

def main():
    d = json.load(open('data/match_classification.json'))
    rows = d if isinstance(d, list) else d.get('rows') or list(d.values())[0]
    matched = {r['addr'] for r in rows}
    inv = [f for f in json.load(open('data/functions_gfx10.json'))['functions']
           if f['addr'] not in matched]
    # group unmatched PE fns by size
    pe_by_size = {}
    pe_masks = {}
    for f in inv:
        fs = glob.glob(f"build/rawdumps/{f['addr']}_*.asm")
        if not fs:
            continue
        raw = open(fs[0], 'rb').read()
        L = [l.split(None, 1)[1].strip() for l in raw.decode('latin1').strip().splitlines() if l.strip()]
        fn, _ = M.carve(f['addr'])
        if not (6 <= len(fn) <= 400):
            continue
        rva = int(f['addr'], 16) - BASE
        pm = M.pe_mask_for(M.rva2off(rva), len(fn), fn, rva)
        A = M.normalize(fn, pm)
        pe_by_size.setdefault(len(A), []).append((f['addr'], A))
        pe_masks[f['addr']] = pm
    dirs = sys.argv[1:] or ['build/objs_crtall', 'build/objs_crtall2']
    hits = []
    seen_pe = set()
    for od in dirs:
        for op in sorted(glob.glob(od + '/*.obj')):
            base = os.path.basename(op)[:-4]
            for nm, cb, cm0, offs0 in obj_functions_raw(op):
                cands = pe_by_size.get(len(cb))
                if not cands:
                    continue
                for addr, A in cands:
                    if addr in seen_pe:
                        continue
                    va = int(addr, 16)
                    out = bytearray(cb); keep = set(cm0)
                    for off, rtype, tgt in offs0:
                        if rtype == 6:
                            struct.pack_into('<I', out, off, tgt & 0xffffffff)
                        elif rtype == 0x14:
                            struct.pack_into('<i', out, off, tgt - (va + off + 4))
                    # mask sites unless PE side is real there
                    pmset = pe_masks[addr]
                    real_sites = [o for o,_ in offs0
                                  if any(0 <= o+k < len(A) and A[o+k] != 0xAA for k in range(4))]
                    B = M.normalize(bytes(out), keep - {p for p in cm0 for o in real_sites if o <= p < o+4})
                    eq = sum(1 for i in range(len(A)) if A[i] == B[i])
                    if eq >= len(A) - 8:
                        tag = "MATCH" if eq == len(A) else f"{eq}/{len(A)}"
                        print(f"{tag} crt:{base}:{nm} -> pe:{addr}", flush=True)
                        if eq == len(A):
                            hits.append((addr, base, nm)); seen_pe.add(addr)
                        break
    print(f"== {len(hits)} content matches ==")

if __name__ == '__main__':
    main()

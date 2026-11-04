#!/usr/bin/env python3
"""match_gfx.py — per-function matcher for gfx_d3d_mp_x86_s.dll (PE) vs MSVC 7.1 COFF objects.

Pipeline:
  1. carve: extract function bytes from the DLL .text at RVA (from Ghidra inventory)
  2. compile: (externally, via docker cod2-msvc71) TU -> .obj with cl /c
  3. parse COFF .obj: find the function symbol, its section, bytes, relocations
  4. normalize both sides: mask (0xAA) every byte touched by a relocation
     - PE side: .reloc entries (imagebase-fixups) + rel32 call/jmp targets outside the function
     - COFF side: relocation-targeted positions (external syms, section-relative refs)
  5. diff

Usage:
  match_gfx.py carve <addr> ...        print hex of carved function(s)
  match_gfx.py diff <addr> <obj>       normalized diff of obj's first .text symbol vs PE function at addr
"""
import json, struct, subprocess, sys, os

DLL = "/home/nawaf/cod2/test/dev/reverse/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll"
INV = "/home/nawaf/cod2/test/dev/glm/data/functions_gfx10.json"

_d = open(DLL, "rb").read()

def pe_sections():
    pe = struct.unpack("<I", _d[0x3C:0x40])[0]
    nsec = struct.unpack("<H", _d[pe+6:pe+8])[0]
    optsz = struct.unpack("<H", _d[pe+20:pe+22])[0]
    off = pe + 24 + optsz
    secs = {}
    for k in range(nsec):
        s = _d[off+k*40:off+k*40+40]
        name = s[:8].rstrip(b"\0").decode()
        vs, va, rs, ra = struct.unpack("<IIII", s[8:24])
        secs[name] = (va, vs, ra, rs)
    return secs

SECS = pe_sections()

def rva2off(rva):
    for name, (va, vs, ra, rs) in SECS.items():
        if va <= rva < va + max(vs, rs):
            return ra + (rva - va)
    raise ValueError(hex(rva))

def pe_relocs():
    """Return set of file offsets covered by base-relocation fixups (4-byte granularity)."""
    # .reloc directory
    pe = struct.unpack("<I", _d[0x3C:0x40])[0]
    opt = pe + 24
    dd = opt + 96
    rva, sz = struct.unpack("<II", _d[dd+40:dd+48])  # basereloc = data directory index 5
    offs = set()
    if not rva:
        return offs
    o = rva2off(rva)
    end = o + sz
    while o < end:
        page_rva, block_sz = struct.unpack("<II", _d[o:o+8])
        if block_sz == 0:
            break
        n = (block_sz - 8) // 2
        for i in range(n):
            e = struct.unpack("<H", _d[o+8+i*2:o+10+i*2])[0]
            typ = e >> 12
            off_in_page = e & 0xFFF
            if typ == 3:  # HIGHLOW
                offs.add(rva2off(page_rva + off_in_page))
        o += block_sz
    return offs

PE_RELOCS = pe_relocs()

def load_inventory():
    inv = json.load(open(INV))
    return {f["addr"].lower().lstrip("0x"): f for f in inv["functions"]}

INV = load_inventory()

def carve(addr):
    a = int(addr, 16) if isinstance(addr, str) else addr
    rva = a - 0x10000000
    key = "%x" % a
    f = INV.get(key)
    if not f:
        raise KeyError("addr %s not in inventory" % hex(a))
    off = rva2off(rva)
    return _d[off:off+f["size"]], f

# ---------------- COFF ----------------
def parse_coff(obj_bytes):
    """Parse a COFF object: return list of sections + symbols + relocs."""
    machine, nsec, _, symptr, nsym, optsz, _chars = struct.unpack("<HHIIIHH", obj_bytes[:20])
    assert machine == 0x14C, "not x86 COFF"
    secs = []
    so = 20 + optsz
    for k in range(nsec):
        s = obj_bytes[so+k*40:so+k*40+40]
        name = s[:8].rstrip(b"\0").decode("ascii", "replace")
        vs, va, rs, rp = struct.unpack("<IIII", s[8:24])
        nrel, _ = struct.unpack("<HH", s[32:36])
        ptrrel = struct.unpack("<I", s[24:28])[0]
        flags = struct.unpack("<I", s[36:40])[0]
        secs.append({"name": name, "rawsize": rs, "rawptr": rp, "nrel": nrel, "ptrrel": ptrrel, "flags": flags})
    # string table follows symbol table
    strtab_off = symptr + nsym * 18
    strtab_len = struct.unpack("<I", obj_bytes[strtab_off:strtab_off+4])[0]
    strtab = obj_bytes[strtab_off:strtab_off+strtab_len]

    def sym_name(rec):
        z = struct.unpack("<II", rec[:8])
        if z[0] == 0 and z[1] != 0:
            o = strtab_off + z[1]
            end = obj_bytes.index(b"\0", o)
            return obj_bytes[o:end].decode("ascii", "replace")
        return rec[:8].rstrip(b"\0").decode("ascii", "replace")

    syms = []   # (name, value, secnum, type, storageclass, naux)
    i = 0
    raw = obj_bytes[symptr:symptr+nsym*18]
    while i < nsym:
        rec = raw[i*18:(i+1)*18]
        name = sym_name(rec)
        value, secnum, typ, scl, naux = struct.unpack("<IhHBB", rec[8:18])
        syms.append({"name": name, "value": value, "sec": secnum, "sclass": scl, "naux": naux, "idx": i})
        i += 1 + naux

    # relocs per section
    for s in secs:
        s["relocs"] = []
        if s["nrel"]:
            ro = s["ptrrel"]
            for j in range(s["nrel"]):
                vaddr, symidx, typ_r = struct.unpack("<IIH", obj_bytes[ro+j*10:ro+j*10+10])
                s["relocs"].append({"vaddr": vaddr, "sym": symidx, "type": typ_r})
    return {"sections": secs, "symbols": syms}

def coff_function_bytes(coff, want_symbol=None):
    """Return (bytes, mask_positions) of the first/selected external function symbol (static _fn)."""
    # pick symbols in executable sections with sclass 2/3 (external/static), defined, type != 0
    secs = coff["sections"]
    text_secs = [s for s in secs if s["flags"] & 0x20 and s["rawsize"] > 0]  # EXEC
    cand = None
    for sym in coff["symbols"]:
        if sym["sec"] <= 0 or sym["sclass"] not in (2, 3):
            continue
        if sym["naux"]:
            continue
        nm = sym["name"]
        if not nm or nm.startswith("."):
            continue
        if want_symbol and nm != want_symbol:
            continue
        sec = secs[sym["sec"] - 1]
        if sec not in text_secs:
            continue
        cand = (sym, sec)
        if want_symbol:
            break
    if not cand:
        raise KeyError("no function symbol found (want %r)" % want_symbol)
    sym, sec = cand
    data = obj_bytes_global[sec["rawptr"]:sec["rawptr"]+sec["rawsize"]]
    mask = set()
    for r in sec["relocs"]:
        t = r["type"]
        if t in (6,):      # DIR32 — absolute fixup
            for k in range(4):
                mask.add(r["vaddr"] + k)
        elif t == 20:      # REL32 — rel32 displacement fixup
            for k in range(4):
                mask.add(r["vaddr"] + k)
        elif t == 22:      # SECREL32
            for k in range(4):
                mask.add(r["vaddr"] + k)
        elif t == 4:       # REL32 with reloc subtracted — same treatment
            for k in range(4):
                mask.add(r["vaddr"] + k)
    return data, mask, sym["name"], sym["value"]

obj_bytes_global = b""

# ---------------- diff ----------------
def normalize(buf, mask):
    b = bytearray(buf)
    for p in mask:
        if 0 <= p < len(b):
            b[p] = 0xAA
    return bytes(b)

def pe_mask_for(fn_off, size, fn_bytes, fn_rva):
    _intra = os.environ.get("MASK_INTRA") == "1"
    """Mask PE-side: reloc fixups inside range + rel32 branches/calls to outside the function."""
    mask = set()
    for p in PE_RELOCS:
        if fn_off <= p < fn_off + size:
            for k in range(4):
                mask.add(p - fn_off + k)
    # rel32: E8/E9 with 32-bit disp leaving the function.
    # Only trust candidates whose target lands inside .text (real branch range);
    # otherwise instruction bytes (e.g. the e9 inside da e9 fucompp) cause false masks.
    tva, tvs, _, _ = SECS[".text"]
    i = 0
    while i < size - 5:
        op = fn_bytes[i]
        if op in (0xE8, 0xE9):
            disp = struct.unpack("<i", fn_bytes[i+1:i+5])[0]
            target = i + 5 + disp
            if _intra and 0 <= target < size:
                for k in range(4):
                    mask.add(i + 1 + k)
                i += 5
                continue
            if not (0 <= target < size):
                tgt_rva = (fn_rva + i + 5 + disp)
                if tva <= tgt_rva < tva + tvs:
                    for k in range(4):
                        mask.add(i + 1 + k)
            i += 5
            continue
        i += 1
    return mask

def cmd_diff(addr, objpath, want_symbol=None):
    global obj_bytes_global
    fn, meta = carve(addr)
    obj_bytes_global = open(objpath, "rb").read()
    coff = parse_coff(obj_bytes_global)
    cbytes, cmask, cname, cval = coff_function_bytes(coff, want_symbol=want_symbol)
    # COFF function may start at symbol value within its section (COMDAT)
    cfn = cbytes[cval:]
    pe_mask = pe_mask_for(rva2off(int(addr, 16) - 0x10000000), len(fn), fn, int(addr, 16) - 0x10000000)
    a = normalize(fn, pe_mask)
    b = normalize(cfn, cmask - {p for p in cmask if p < cval})
    n = min(len(a), len(b))
    eq = sum(1 for i in range(n) if a[i] == b[i])
    maxlen = max(len(a), len(b))
    score = eq * 100 // maxlen if maxlen else 0
    print(f"{meta['name']} @ {addr} size={len(fn)}  vs  {cname} (obj size={len(cfn)})")
    print(f"normalized match: {eq}/{maxlen} bytes ({score}%)")
    if score < 100:
        for i in range(n):
            if a[i] != b[i]:
                print(f"first diff @ +{i}: pe={a[i]:02x} obj={b[i]:02x}")
                s = max(0, i-8)
                print("pe : " + " ".join(f"{x:02x}" for x in fn[s:i+12]))
                print("obj: " + " ".join(f"{x:02x}" for x in cfn[s:i+12]))
                break
    else:
        if len(a) != len(b):
            print(f"NOTE: length differs pe={len(a)} obj={len(b)} (padding/alignment?)")
        print("MATCH (normalized)")
    return score

def cmd_carve(*addrs):
    for a in addrs:
        fn, meta = carve(a)
        print(f"; {meta['name']} @ {a} size={len(fn)}")
        for i in range(0, len(fn), 16):
            print(" ".join(f"{x:02x}" for x in fn[i:i+16]))

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)
    cmd = sys.argv[1]
    if cmd == "carve":
        cmd_carve(*sys.argv[2:])
    elif cmd == "diff":
        want_symbol = sys.argv[4] if len(sys.argv) > 4 else None
        cmd_diff(sys.argv[2], sys.argv[3], want_symbol=want_symbol)
    else:
        print(__doc__)

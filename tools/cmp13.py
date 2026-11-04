#!/usr/bin/env python3
"""Find functions of a linked test image (map + .reloc) byte-identical in the client, relocations masked."""
import bisect, json, re, sys
import pefile, capstone

img, mapf, target = sys.argv[1:4]
pe = pefile.PE(img)
base = pe.OPTIONAL_HEADER.ImageBase
text = next(s for s in pe.sections if s.Name.startswith(b'.text'))
tdata, tva = text.get_data(), base + text.VirtualAddress
relocs = sorted({base + e.rva for b in getattr(pe, 'DIRECTORY_ENTRY_BASERELOC', []) for e in b.entries if e.type == 3})

cpe = pefile.PE(target)
ctext = next(s for s in cpe.sections if s.Name.startswith(b'.text'))
cdata, cva = ctext.get_data(), cpe.OPTIONAL_HEADER.ImageBase + ctext.VirtualAddress

syms = []
for line in open(mapf, errors='replace'):
    m = re.match(r'\s*0001:[0-9a-f]+\s+(\S+)\s+([0-9a-f]{8}) f', line)
    if m:
        address = int(m.group(2), 16)
        if tva <= address < tva + len(tdata):
            syms.append((address, m.group(1), line.split()[-1]))
syms.sort()
if not relocs:
    # /FIXED image has no .reloc: rebuild it from 4-byte operands that point into the image
    lo, hi = base, base + pe.OPTIONAL_HEADER.SizeOfImage
    md0 = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
    rs = set()
    for k, (va, _, _) in enumerate(syms):
        end = syms[k + 1][0] if k + 1 < len(syms) else tva + len(tdata)
        tabs = []
        for a, n, m, o in md0.disasm_lite(tdata[va - tva:end - tva], va):
            ins = tdata[a - tva:a - tva + n]
            for j in range(n - 4, 0, -1):
                v = int.from_bytes(ins[j:j + 4], 'little')
                if lo <= v < hi and not (m in ('call', 'jmp') and ins[0] in (0xe8, 0xe9)): rs.add(a + j)
            # switch jump table: jmp dword ptr [reg*4+table]
            if n == 7 and m == 'jmp' and ins[0] == 0xff and ins[1] == 0x24:
                x = int.from_bytes(ins[3:7], 'little')
                if va <= x < end: tabs.append(x)
        # jump-table dispatch (ff 24 sib disp32) reached after table data in the middle of the fn: capstone loses sync, scan the raw bytes
        raw = tdata[va - tva:end - tva]
        q = raw.find(b'\xff\x24')
        while q >= 0:
            if q + 7 <= len(raw) and raw[q + 2] & 0xc7 == 0x85:
                v = int.from_bytes(raw[q + 3:q + 7], 'little')
                if lo <= v < hi: rs.add(va + q + 3)
            q = raw.find(b'\xff\x24', q + 1)
        # capstone stops inside table data: mask the in-image dwords from the first table on
        for t in range(min(tabs), end - 3, 4) if tabs else ():
            if lo <= int.from_bytes(tdata[t - tva:t - tva + 4], 'little') < hi: rs.add(t)
    relocs = sorted(rs)

_pairs = None
def pairs():
    # client address per plain name, same table priority as alldiff_lib
    global _pairs
    if _pairs is None:
        _pairs, drop = {}, set()
        g = '/home/nawaf/cod2/test/dev/claude_client/ghidra/'
        for f in ('names_fix.tsv', 'names_k.tsv', 'names_1.0.tsv', 'names_cg.tsv', 'names_loc.tsv'):
            for l in open(g + f):
                r = l.rstrip('\n').split('\t')
                if len(r) > 2 and r[2] == 'drop': drop.add(r[1]); continue
                if len(r) >= 2:
                    a = int(r[0], 16)
                    if r[1] not in _pairs or (_pairs[r[1]] % 16 and not a % 16): _pairs[r[1]] = a
        for k in drop: _pairs.pop(k, None)
    return _pairs

def plain(m):
    if m.startswith('?'):
        p = m[1:].split('@@')[0].split('@')
        if len(p) >= 2 and p[1] and (p[1] + '::' + p[0]) in pairs(): return p[1] + '::' + p[0]
        return p[0]
    return m.lstrip('_')

md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
scanq = []
res, stats = [], {'fns': 0, 'bytes': 0, 'match_fns': 0, 'match_bytes': 0}
for i, (va, name, obj) in enumerate(syms):
    end = syms[i + 1][0] if i + 1 < len(syms) else tva + len(tdata)
    code = tdata[va - tva:end - tva].rstrip(b'\xcc')
    if len(code) < 6:
        continue
    mask = set()
    for r in relocs[bisect.bisect_left(relocs, va):bisect.bisect_left(relocs, va + len(code))]:
        mask.update(range(r - va, r - va + 4))
    # jump tables live inside .text: find "jmp [idx*4+tbl]", mask the entries, skip them when decoding
    pos, tabs = 0, []
    while pos < len(code):
        nxt = None
        for address, size, mnemonic, _ in md.disasm_lite(code[pos:], va + pos):
            offset = address - va
            hit = [e for a, e in tabs if a <= offset < e]
            if hit:
                nxt = max(hit); break
            if mnemonic in ('call', 'jmp') and size == 5 and code[offset] in (0xe8, 0xe9):
                tgt = int.from_bytes(code[offset + 1:offset + 5], 'little', signed=True) + address + 5
                if not va <= tgt < va + len(code):
                    mask.update(range(offset + 1, offset + 5))
            elif mnemonic == 'jmp' and size == 7 and code[offset:offset + 2] == b'\xff\x24' and code[offset + 2] & 0xc7 == 0x85:
                t = int.from_bytes(code[offset + 3:offset + 7], 'little') - va
                n = 0
                while 0 <= t and t + 4 * n + 4 <= len(code) and va <= int.from_bytes(code[t + 4 * n:t + 4 * n + 4], 'little') < va + len(code): n += 1
                if n:
                    tabs.append((t, t + 4 * n))
                    mask.update(range(t, t + 4 * n))
        if nxt is None: break
        pos = nxt
    # longest unmasked run as the search anchor
    best, s = (0, 0), 0
    for k in range(len(code) + 1):
        if k == len(code) or k in mask:
            if k - s > best[1] - best[0]:
                best = (s, k)
            s = k + 1
    stats['fns'] += 1
    stats['bytes'] += len(code)
    lit = code[best[0]:best[1]]
    hits = []
    # short anchors (call-dense fns) still need the full masked compare; cov.py counts unique placements only
    if len(lit) >= 8 or (len(lit) >= 4 and len(code) - len(mask) >= 16):
        p = cdata.find(lit)
        while p >= 0 and len(hits) < 64:
            st = p - best[0]
            w = cdata[st:st + len(code)]
            if st >= 0 and len(w) == len(code) and all(w[k] == code[k] for k in range(len(code)) if k not in mask):
                hits.append(hex(cva + st))
            p = cdata.find(lit, p + 1)
    paired = False
    if not hits and not (len(lit) >= 8 or (len(lit) >= 4 and len(code) - len(mask) >= 16)):
        # anchor too short to search: compare at the name-paired client address instead
        ca = pairs().get(plain(name))
        if ca is not None and (ca % 16 == 0 or ':' in obj):
            w = cdata[ca - cva:ca - cva + len(code)]
            nb = cdata[ca - cva + len(code):ca - cva + len(code) + 1]
            if len(w) == len(code) and (nb == b'\xcc' or (ca + len(code)) % 16 == 0) and \
                    all(w[k] == code[k] for k in range(len(code)) if k not in mask):
                hits, paired = [hex(ca)], True
    if not hits and len(code) - len(mask) >= 3 and not (len(lit) >= 8 or (len(lit) >= 4 and len(code) - len(mask) >= 16)):
        scanq.append((len(res), code, frozenset(mask), obj))
    if hits:
        stats['match_fns'] += 1
        stats['match_bytes'] += len(code)
    res.append({'name': name, 'obj': obj, 'size': len(code), 'hits': hits, **({'paired': 1} if paired else {})})

# short call-dense fns with no name pair: masked scan of the client, accepted only when the number of
# aligned candidates equals the number of our fns with the same masked body (twins), so a shape shared
# with unrelated fns is never credited
grp = {}
for idx, code, mask, obj in scanq:
    grp.setdefault((len(code), bytes(0 if k in mask else c for k, c in enumerate(code))), []).append((idx, code, mask, obj))
for (n, kb), xs in grp.items():
    idx, code, mask, obj = xs[0]
    pat = b''.join(b'.' if k in mask else re.escape(code[k:k + 1]) for k in range(n))
    cand = []
    for m in re.finditer(b'(?=' + pat + b')', cdata, re.S):
        q = m.start()
        nb = cdata[q + n:q + n + 1]
        if (q + cva) % 16 == 0 and (nb == b'\xcc' or (q + n + cva) % 16 == 0):
            cand.append(hex(cva + q))
    if cand and len(cand) == len(xs):
        for idx, _, _, _ in xs:
            res[idx]['hits'], res[idx]['scan'] = cand, 1
            stats['match_fns'] += 1; stats['match_bytes'] += n

# import thunks (jmp [IAT], 4 of 6 bytes relocated): pair by imported name
def iat(p):
    m = {}
    for d in getattr(p, 'DIRECTORY_ENTRY_IMPORT', []):
        for e in d.imports:
            m[e.address] = (d.dll.decode().lower(), (e.name or b'#%d' % e.ordinal).decode().lstrip('_'))
    return m
oiat, ciat, cth = iat(pe), iat(cpe), {}
for k in range(len(cdata) - 5):
    if cdata[k] == 0xff and cdata[k + 1] == 0x25:
        n = ciat.get(int.from_bytes(cdata[k + 2:k + 6], 'little'))
        if n: cth.setdefault(n, []).append(cva + k)
for r in res:
    if r['hits'] or r['size'] != 6 or '.dll' not in r['obj'].lower(): continue
    va = next(v for v, n, o in syms if n == r['name'])
    code = tdata[va - tva:va - tva + 6]
    n = oiat.get(int.from_bytes(code[2:], 'little')) if code[:2] == b'\xff\x25' else None
    if n and len(cth.get(n, [])) == 1:
        r['hits'], r['thunk'] = [hex(cth[n][0])], 1
        stats['match_fns'] += 1; stats['match_bytes'] += 6

json.dump(res, open(sys.argv[4] if len(sys.argv) > 4 else 'cmp.json', 'w'), indent=0)
print(stats, 'client .text', len(cdata))

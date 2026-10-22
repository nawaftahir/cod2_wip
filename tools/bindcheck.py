#!/usr/bin/env python3
"""Binding-verified coverage of a closed (non-/FORCE) link against the original DLL.

A function counts only if, at its unique masked placement:
  - its code equals the target byte for byte outside relocated operands, and the
    target has the same abs32 relocation sites (from both .reloc tables);
  - its extent is exact: the target byte after it is padding or a known function start;
  - every relocated operand binds consistently program-wide: one target address per
    our symbol+offset base, one symbol per target address, .rdata/.data contents equal;
  - every import operand names the same DLL!function in both import tables;
  - every external call/jump target is itself a verified function (fixpoint).

usage: bindcheck.py ours.dll ours.map anchor.dll cmp.json [--exclude objregex] [--json out] [--pdb ours.pdb]
"""
import bisect, json, re, sys
import pefile, capstone
from string_literal import string_equal, string_size

args = sys.argv[1:]
img, mapf, anchor, cmpf = args[:4]
exclude = re.compile(args[args.index('--exclude') + 1]) if '--exclude' in args else None
out = args[args.index('--json') + 1] if '--json' in args else None
pdb = args[args.index('--pdb') + 1] if '--pdb' in args else None
ours = img
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))


def load(path):
    pe = pefile.PE(path)
    base = pe.OPTIONAL_HEADER.ImageBase
    relocs = {base + e.rva for b in getattr(pe, 'DIRECTORY_ENTRY_BASERELOC', []) for e in b.entries if e.type == 3}
    imports = {}
    for d in getattr(pe, 'DIRECTORY_ENTRY_IMPORT', []):
        for i in d.imports:
            imports[i.address] = (d.dll.decode().lower(), i.name.decode() if i.name else f'#{i.ordinal}')
    secs = [(base + s.VirtualAddress, s.Misc_VirtualSize, s.get_data(), s.Name.rstrip(b'\0').decode()) for s in pe.sections]
    return pe, base, relocs, imports, secs


def read(secs, va, n):
    for s, size, data, _ in secs:
        if s <= va and va + n <= s + size:
            o = va - s
            return data[o:o + n] + b'\0' * max(0, o + n - len(data))
    return None


def secname(secs, va):
    return next((nm for s, size, _, nm in secs if s <= va < s + size), None)


ope, obase, orel, oimp, osecs = load(img)
ape, abase, arel, aimp, asecs = load(anchor)
otext = next(s for s in osecs if s[3] == '.text')
atext = next(s for s in asecs if s[3] == '.text')
orelocbytes = {p + i for p in orel for i in range(4)}
arelocbytes = {p + i for p in arel for i in range(4)}


def overlaps_reloc(address, size, relocbytes):
    return any(address + i in relocbytes for i in range(size))

# every symbol with its object, for resolving relocation targets
syms, contribution_sizes = [], {}
for line in open(mapf, errors='replace'):
    m = re.match(r'\s*[0-9a-f]{4}:[0-9a-f]{8}\s+(\S+)\s+([0-9a-f]{8})\s+(f\s+)?(?:i\s+)?(\S+)\s*$', line)
    if m and int(m.group(2), 16) >= obase + 0x1000:
        syms.append((int(m.group(2), 16), m.group(1), m.group(4), bool(m.group(3))))
if pdb:
    # the map omits file-static data; the PDB has it
    import pdbsyms
    have = {s[0] for s in syms}
    for va, kind, name, mod in pdbsyms.syms(ours, pdb):
        if kind in ('ldata', 'gdata') and name and va not in have:
            lib = mod.lower().endswith('.lib') or '\\lib\\' in mod.lower()
            syms.append((va, name, 'LIB:' + mod if lib else '?' + mod, False)); have.add(va)
    named = sorted(have)
    for va, size, flags, mod in pdbsyms.contributions(ours, pdb):
        i = bisect.bisect_left(named, va)
        if (secname(osecs, va) not in ('.rdata', '.data') or
                i < len(named) and named[i] < va + size):
            continue
        name = f'$pdb_contribution${mod}@{va:x}'
        syms.append((va, name, '?' + mod, False))
        contribution_sizes[name] = size
syms.sort()
svas = [s[0] for s in syms]
starts = {}
for va, name, obj, isfn in syms:
    starts.setdefault(va, (name, obj))


def resolve(va):
    i = bisect.bisect_right(svas, va) - 1
    if i < 0:
        return None
    s = syms[i]
    nxt = next((v for v in svas[i + 1:] if v > s[0]), None)
    size = (nxt - s[0]) if nxt else 0
    if s[1] in contribution_sizes:
        count = contribution_sizes[s[1]]
        if va - s[0] >= count:
            return None
        size = min(size, count) if size else count
    if s[1].startswith('??_C@'):
        count = string_size(s[1])
        if count is None or va - s[0] >= count:
            return None
        size = min(size, count) if size else count
    return s[1], va - s[0], s[0], size


glm = json.load(open(__import__('os').path.join(__import__('os').path.dirname(__import__('os').path.abspath(__file__)), '../../glm/data/functions_gfx10.json')))['functions']
astarts = set(int(f['addr'], 16) for f in glm)


md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)


def call_targets(path, lo, n):
    # direct call targets in the anchor's code: function starts GLM's inventory may lack
    import os, hashlib
    cache = os.path.join(os.path.dirname(os.path.abspath(__file__)), '../target/build', hashlib.sha1(open(path, 'rb').read()).hexdigest()[:16] + '.calls.json')
    try:
        return set(json.load(open(cache)))
    except (OSError, ValueError):
        pass
    code = read(asecs, lo, n)
    out, off = set(), 0
    while off < n:  # linear sweep; resync one byte past undecodable bytes
        last = off
        for ins in md.disasm(code[off:off + 65536], lo + off):
            if ins.bytes[0] == 0xe8 and ins.size == 5 and not overlaps_reloc(ins.address, ins.size, arelocbytes):
                t = ins.address + 5 + int.from_bytes(ins.bytes[1:], 'little', signed=True)
                if lo <= t < lo + n:
                    out.add(t)
            off = ins.address + ins.size - lo
        if off == last:
            off += 1
    try:
        json.dump(sorted(out), open(cache, 'w'))
    except OSError:
        pass
    return out



md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
allc = {r['name']: r for r in json.load(open(cmpf))}
fnva = {name: va for va, name, obj, isfn in syms if isfn}
cands = {n: r for n, r in allc.items() if len(r['hits']) == 1}
# A function whose masked bytes occur several times is placed by a placed caller's call target.
# Short functions (too little unmasked code for an anchor search) have no hits; a caller places
# them too, if the masked bytes agree at the call target.
multi = {fnva[n]: r for n, r in allc.items() if len(r['hits']) != 1 and n in fnva}


def masked_eq(va, t, n):
    code, tcode = read(osecs, va, n), read(asecs, t, n)
    if code is None or tcode is None:
        return False
    mask = set()
    for k in range(n):
        if va + k in orel:
            mask.update(range(k, k + 4))
    for ins in md.disasm(code, va):
        if ins.bytes[0] in (0xe8, 0xe9) and ins.size == 5 or ins.size == 6 and ins.bytes[0] == 0x0f and 0x80 <= ins.bytes[1] <= 0x8f:
            if not va <= ins.address + ins.size + int.from_bytes(ins.bytes[-4:], 'little', signed=True) < va + n:
                mask.update(range(ins.address - va + ins.size - 4, ins.address - va + ins.size))
    return all(code[k] == tcode[k] for k in range(n) if k not in mask)

changed = True
while changed and multi:
    changed = False
    for n, r in list(cands.items()):
        va, t = fnva.get(n), int(r['hits'][0], 16)
        if va is None:
            continue
        code, tcode = read(osecs, va, r['size']), read(asecs, t, r['size'])
        for ins in md.disasm(code, va):
            if ins.bytes[0] in (0xe8, 0xe9) and ins.size == 5 and not overlaps_reloc(ins.address, ins.size, orelocbytes):
                ot = ins.address + 5 + int.from_bytes(ins.bytes[1:], 'little', signed=True)
                k = ins.address - va
                tt = t + k + 5 + int.from_bytes(tcode[k + 1:k + 5], 'little', signed=True)
                m = multi.get(ot)
                if m and m['name'] not in cands and (hex(tt) in m['hits'] or not m['hits'] and masked_eq(ot, tt, m['size'])):
                    cands[m['name']] = dict(m, hits=[hex(tt)])
                    changed = True


def closed_end(code, va, n):
    # the matched bytes end in ret/jmp and no internal branch reaches past them, so the
    # target function (same bytes, same rel8/rel32 displacements) cannot continue either
    last, end = None, va
    mdd = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
    mdd.detail = True
    for ins in mdd.disasm(code, va):
        last, end = ins, ins.address + ins.size
        if ins.group(capstone.CS_GRP_JUMP) and ins.operands and ins.operands[0].type == capstone.x86.X86_OP_IMM:
            tgt = ins.operands[0].imm
            # rel32 exits are checked as calls by the fixpoint; a short jump must stay inside
            if ins.size == 2 and not va <= tgt < va + n:
                return False
    return end == va + n and last is not None and last.mnemonic in ('ret', 'jmp')


acalls = call_targets(anchor, atext[0], atext[1])
# our next function placed right after this one also bounds its extent
placed = {int(r['hits'][0], 16) for r in cands.values()}
placedat = {fnva[n]: int(r['hits'][0], 16) for n, r in cands.items() if n in fnva}
results = {}
for name, r in cands.items():
    va = fnva.get(name)
    if va is None:
        continue
    t = int(r['hits'][0], 16)
    n = r['size']
    code = read(osecs, va, n)
    tcode = read(asecs, t, n)
    why = []
    # extent: target continues with padding or a known function start
    nb = read(asecs, t + n, 1)
    if not (t + n in astarts or t + n in acalls or t + n in placed or closed_end(code, va, n) or nb in (b'\xcc', b'\x90') or t + n >= atext[0] + atext[1]):
        why.append('extent')
    binds, calls = [], []
    for k in range(n):
        if va + k in orel:
            if t + k not in arel:
                why.append(f'reloc@{k:x}')
                continue
            ov = int.from_bytes(code[k:k + 4], 'little')
            tv = int.from_bytes(tcode[k:k + 4], 'little')
            if ov in oimp or tv in aimp:
                if oimp.get(ov) != aimp.get(tv):
                    why.append(f'import@{k:x}')
                continue
            binds.append((ov, tv))
    for k in range(n):
        if t + k in arel and va + k not in orel:
            why.append(f'treloc@{k:x}')
    for ins in md.disasm(code, va):
        if ins.bytes[0] in (0xe8, 0xe9) and ins.size == 5 or ins.bytes[0] == 0x0f and ins.size == 6 and 0x80 <= ins.bytes[1] <= 0x8f:
            if overlaps_reloc(ins.address, ins.size, orelocbytes):
                continue
            ot = int.from_bytes(ins.bytes[-4:], 'little', signed=True) + ins.address + ins.size
            if va <= ot < va + n:
                continue
            k = ins.address - va
            tt = int.from_bytes(tcode[k + ins.size - 4:k + ins.size], 'little', signed=True) + t + k + ins.size
            calls.append((ot, tt))
    results[name] = dict(va=va, t=t, n=n, obj=r['obj'], why=why, binds=binds, calls=calls)

# program-wide binding consistency
# A displacement just below a symbol (x[i - 1]) resolves into its predecessor; move it to the
# successor only when a non-negative reference elsewhere pins the successor to the same anchor base.
pos = {}
for r in results.values():
    for ov, tv in r['binds']:
        res = resolve(ov)
        if res and res[1] > 0:
            pos.setdefault(res[2], set()).add(tv - res[1])


def resolve_bind(ov, tv, fb=()):
    res = resolve(ov)
    if res:
        i = bisect.bisect_right(svas, ov)
        if i < len(svas) and svas[i] - ov <= 64 and pos.get(svas[i]) == {tv + svas[i] - ov} and pos.get(res[2]) != {tv - res[1]}:
            n = svas[i]
            nxt = next((v for v in svas[i + 1:] if v > n), None)
            return starts[n][0], ov - n, n, (nxt - n) if nxt else 0
        # one past the end (loop bound over an array) lands on the next symbol; move it back when
        # the same function also references the array start at the matching retail base
        if res[1] == 0 and fb:
            p = svas[bisect.bisect_left(svas, ov) - 1] if bisect.bisect_left(svas, ov) else None
            if p is not None and (p, tv - (ov - p)) in fb:
                return starts[p][0], ov - p, p, ov - p
        # one past the end of a member (&arr[n].field) lands a few bytes into the next symbol;
        # move it back when the function references that array at the same layout delta
        # (small globals may sit between the array and that address, so look a few symbols back)
        if res[1] < 64 and fb and not res[0].startswith(('__real@', '__xmm@', '??_C@')):
            j = bisect.bisect_left(svas, res[2])
            for k in range(j - 1, max(j - 5, -1), -1):
                p, q = svas[k], svas[k + 1]
                if not starts[p][0].startswith(('__real@', '__xmm@', '??_C@')) and any(p <= ob < q and tb - ob == tv - ov for ob, tb in fb):
                    return starts[p][0], ov - p, p, ov - p
    return res


symobj = {n: o for _, n, o, _ in syms}


def islib(sym):
    return ':' in symobj.get(sym, '') or symobj.get(sym) == '<common>'


base0, trunc = {}, {}
for r in results.values():
    for ov, tv in r['binds']:
        res = resolve(ov)
        if res and res[1] == 0:
            base0.setdefault(res[0], set()).add(tv)
fwd, rev = {}, {}
for name, r in results.items():
    for ov, tv in r['binds']:
        res = resolve_bind(ov, tv, set(r['binds']))
        if not res:
            r['why'].append(f'unresolved {ov:x}')
            continue
        sym, off, sva, size = res
        if off > 0 and islib(sym) and base0.get(sym, {tv - off}) != {tv - off}:
            # past the end of library data, into an unnamed static: bind the exact address instead,
            # and compare the symbol's data only up to there
            trunc[sym] = min(trunc.get(sym, off), off)
            sym, off, sva, size = f'{sym}+{off:x}', 0, ov, 0
        fwd.setdefault(sym, set()).add(tv - off)
        rev.setdefault(tv - off, set()).add(sym)
        r.setdefault('syms', []).append((sym, sva, size, tv - off))
# Library objects hold unnamed statics (no map/PDB symbol) right after named data, so references
# into them resolve to the preceding library symbol with several bases. Split those into one
# pseudo-symbol per base; each still binds one-to-one. Our own sources stay strict.
# The retail image holds duplicate copies of some literal constants; each copy is still content-checked.
literal = lambda s: s.startswith(('__real@', '__xmm@', '??_C@'))
split = {s for s, v in fwd.items() if len(v) > 1 and (islib(s) or literal(s))}
if split:
    fwd, rev = {}, {}
    for r in results.values():
        new = []
        for sym, sva, size, tbase in r.get('syms', []):
            if sym in split:
                sym = f'{sym}#{tbase:x}'
            fwd.setdefault(sym, set()).add(tbase)
            rev.setdefault(tbase, set()).add(sym)
            new.append((sym, sva, size, tbase))
        r['syms'] = new
bad = {s for s, v in fwd.items() if len(v) > 1} | {s for v in rev.values() if len(v) > 1 and not all('#' in x for x in v) for s in v}
datacache = {}
nested_forward, nested_reverse, nested_done = {}, {}, set()


def interior_code(op, tp):
    """A compiler label must keep its exact offset inside one matched function."""
    owners = [row for row in results.values()
              if row['va'] < op < row['va'] + row['n']
              and row['t'] + op - row['va'] == tp]
    if len(owners) != 1:
        return False
    owner = owners[0]
    code = read(osecs, owner['va'], owner['n'])
    if not any(ins.address == op for ins in md.disasm(code, owner['va'])):
        return False
    r['calls'].append((owner['va'], owner['t']))
    return True


def nested_data(op, tp):
    """Compare a relocated pointer's complete named data-object graph."""
    resolved = resolve(op)
    if resolved is None:
        return False
    sym, off, sva, size = resolved
    tbase = tp - off
    if fwd.get(sym, {tbase}) != {tbase} or rev.get(tbase, {sym}) != {sym}:
        return False
    if nested_forward.setdefault(sym, tbase) != tbase:
        return False
    if nested_reverse.setdefault(tbase, sym) != sym:
        return False
    if secname(osecs, sva) not in ('.rdata', '.data') or secname(asecs, tbase) not in ('.rdata', '.data'):
        return False
    if literal(sym):
        if sym.startswith('??_C@') and '+' not in sym:
            size = string_size(sym)
            return (size is not None and off < size
                    and string_equal(sym, read(osecs, sva, size), read(asecs, tbase, size)))
        a, b = read(osecs, op, 256), read(asecs, tp, 256)
        return a is not None and b is not None and a.split(b'\0')[0] == b.split(b'\0')[0]
    if size <= 0 or size > 1048576:
        return False
    key = (sva, tbase, size)
    if key in nested_done:
        return True
    a, b = read(osecs, sva, size), read(asecs, tbase, size)
    if a is None or b is None:
        return False
    nested_done.add(key)
    try:
        k = 0
        while k < size:
            if (sva + k in orel) != (tbase + k in arel):
                return False
            if sva + k in orel:
                if k + 4 > size:
                    return False
                p = int.from_bytes(a[k:k + 4], 'little')
                q = int.from_bytes(b[k:k + 4], 'little')
                if secname(osecs, p) == '.text':
                    if secname(asecs, q) != '.text':
                        return False
                    if not (placedat.get(p) == q or p not in placedat and
                            p in multi and masked_eq(p, q, multi[p]['size']) or interior_code(p, q)):
                        return False
                    r['calls'].append((p, q))
                elif not nested_data(p, q):
                    return False
                k += 4
            else:
                if a[k] != b[k]:
                    return False
                k += 1
        return True
    finally:
        nested_done.remove(key)


for name, r in results.items():
    for sym, sva, size, tbase in r.get('syms', []):
        if sym in bad:
            r['why'].append(f'bind {sym}')
            continue
        if sym in datacache:
            ok = datacache[sym]
        else:
            ok = True
            if sym.startswith('??_C@') and '+' not in sym:
                count = string_size(sym)
                ok = (secname(osecs, sva) in ('.rdata', '.data')
                      and secname(asecs, tbase) in ('.rdata', '.data')
                      and count is not None
                      and string_equal(sym, read(osecs, sva, count), read(asecs, tbase, count)))
            elif secname(osecs, sva) != '.text' and size and ('#' not in sym or literal(sym)):
                size = min(size, trunc.get(sym, size))
                a, b = read(osecs, sva, size), read(asecs, tbase, size)
                sec = secname(osecs, sva)
                if sec in ('.rdata', '.data') and a is not None and not sym.startswith('__imp_'):
                    # compare up to the symbol's initialized bytes; trailing alignment padding may hold neighbours
                    body = a.rstrip(b'\0') or a[:1]
                    ok = b is not None
                    k = 0
                    while ok and k < len(body):
                        if sva + k in orel:
                            # pointer table entry: target must be relocated too and point at equal C strings
                            op = int.from_bytes(a[k:k + 4], 'little')
                            tp = int.from_bytes(b[k:k + 4], 'little')
                            if secname(osecs, op) == '.text':
                                # code pointer: the function there must be placed at the target's pointee
                                ok = tbase + k in arel and (placedat.get(op) == tp or op not in placedat and
                                                            op in multi and masked_eq(op, tp, multi[op]['size']) or
                                                            interior_code(op, tp))
                            else:
                                ok = tbase + k in arel and nested_data(op, tp)
                            k += 4
                        else:
                            ok = body[k] == b[k]
                            k += 1
            datacache[sym] = ok
        if not ok:
            r['why'].append(f'data {sym}')

# fixpoint over direct calls
# A library (CRT/SDK) callee is identified like an import: its body is placed, masked-identical, at
# the retail call target. Its own data/binding closure is library accounting, reported separately.
def libbound(r):
    return ':' in r['obj'] and not any(w == 'extent' or w.startswith(('reloc@', 'treloc@', 'import@')) for w in r['why'])


byva = {r['va']: (name, r) for name, r in results.items()}


def jump_dest(code, va):
    if code is None or len(code) != 5 or code[0] != 0xe9:
        return None
    return va + 5 + int.from_bytes(code[1:], 'little', signed=True)


def thunkbound(ova, tva):
    """Accept a missing five-byte jump thunk only when its placed destination agrees."""
    odest = jump_dest(read(osecs, ova, 5), ova)
    tdest = jump_dest(read(asecs, tva, 5), tva)
    if odest is None or tdest is None:
        return False
    placed = byva.get(odest)
    return bool(placed and placed[1]['t'] == tdest and (not placed[1]['why'] or libbound(placed[1])))


changed = True
while changed:
    changed = False
    for name, r in results.items():
        if r['why']:
            continue
        for ot, tt in r['calls']:
            callee = byva.get(ot)
            if not callee and thunkbound(ot, tt):
                continue
            if not callee or callee[1]['t'] != tt or callee[1]['why'] and (':' in r['obj'] or not libbound(callee[1])):
                r['why'].append(f'call {starts.get(ot, ("?",))[0]}')
                changed = True
                break

ok = {n: r for n, r in results.items() if not r['why']}
src = {n: r for n, r in ok.items() if ':' not in r['obj'] and not (exclude and exclude.search(r['obj']))}
lib = {n: r for n, r in ok.items() if ':' in r['obj']}
total = atext[1]
sb = sum(r['n'] for r in src.values())
lb = sum(r['n'] for r in lib.values())
print(f'verified source {len(src)} fns {sb} B = {100 * sb / total:.3f}% | library {len(lib)} fns {lb} B = {100 * lb / total:.3f}% | of {total}')
if out:
    json.dump({n: dict(t=hex(r['t']), n=r['n'], obj=r['obj'], why=r['why'][:4]) for n, r in results.items()}, open(out, 'w'), indent=0)

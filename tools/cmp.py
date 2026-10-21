#!/usr/bin/env python3
"""Find functions of a linked test image (map + .reloc) byte-identical in the client, relocations masked."""
import json, re, sys
import pefile, capstone

img, mapf, target = sys.argv[1:4]
pe = pefile.PE(img)
base = pe.OPTIONAL_HEADER.ImageBase
text = next(s for s in pe.sections if s.Name.startswith(b'.text'))
tdata, tva = text.get_data(), base + text.VirtualAddress
relocs = {base + e.rva for b in getattr(pe, 'DIRECTORY_ENTRY_BASERELOC', []) for e in b.entries if e.type == 3}

cpe = pefile.PE(target)
ctext = next(s for s in cpe.sections if s.Name.startswith(b'.text'))
cdata, cva = ctext.get_data(), cpe.OPTIONAL_HEADER.ImageBase + ctext.VirtualAddress

syms = []
for line in open(mapf, errors='replace'):
    m = re.match(r'\s*0001:[0-9a-f]+\s+(\S+)\s+([0-9a-f]{8}) f', line)
    if m:
        syms.append((int(m.group(2), 16), m.group(1), line.split()[-1]))
syms.sort()

md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)

def trim_padding(raw, va):
    # Only inspect the fallthrough prefix; later bytes may be switch data.
    code = raw.rstrip(b'\xcc')
    limit = len(code)
    for ins in md.disasm(code, va):
        if ins.mnemonic in ('ret', 'retf', 'int3'):
            break
        op = ins.bytes[0]
        if ins.size == 2 and (op == 0xeb or 0x70 <= op <= 0x7f):
            delta = int.from_bytes(ins.bytes[-1:], 'little', signed=True)
        elif ins.size == 5 and op == 0xe9 or ins.size == 6 and op == 0x0f and 0x80 <= ins.bytes[1] <= 0x8f:
            delta = int.from_bytes(ins.bytes[-4:], 'little', signed=True)
        else:
            if ins.mnemonic == 'jmp':
                break
            continue
        target = ins.address + ins.size + delta - va
        if len(code) <= target < len(raw) and raw[target] == 0xcc:
            limit = max(limit, target + 1)
        if ins.mnemonic == 'jmp':
            break
    return raw[:limit]

res, stats = [], {'fns': 0, 'bytes': 0, 'match_fns': 0, 'match_bytes': 0}
for i, (va, name, obj) in enumerate(syms):
    end = syms[i + 1][0] if i + 1 < len(syms) else tva + min(len(tdata), text.Misc_VirtualSize)
    code = trim_padding(tdata[va - tva:end - tva], va)
    if len(code) < 6:
        continue
    mask = set()
    for r in relocs:
        if va <= r < va + len(code):
            mask.update(range(r - va, r - va + 4))
    for ins in md.disasm(code, va):
        # external rel32 call/jmp/jcc: the displacement depends on layout
        if ins.size == 5 and ins.bytes[0] in (0xe8, 0xe9) or ins.size == 6 and ins.bytes[0] == 0x0f and 0x80 <= ins.bytes[1] <= 0x8f:
            tgt = int.from_bytes(ins.bytes[-4:], 'little', signed=True) + ins.address + ins.size
            if not va <= tgt < va + len(code):
                mask.update(range(ins.address - va + ins.size - 4, ins.address - va + ins.size))
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
        while p >= 0 and len(hits) < 8:
            st = p - best[0]
            w = cdata[st:st + len(code)]
            if st >= 0 and len(w) == len(code) and all(w[k] == code[k] for k in range(len(code)) if k not in mask):
                hits.append(hex(cva + st))
            p = cdata.find(lit, p + 1)
    if hits:
        stats['match_fns'] += 1
        stats['match_bytes'] += len(code)
    res.append({'name': name, 'obj': obj, 'size': len(code), 'hits': hits})

json.dump(res, open(sys.argv[4] if len(sys.argv) > 4 else 'cmp.json', 'w'), indent=0)
print(stats, 'target .text', len(cdata))

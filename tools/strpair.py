#!/usr/bin/env python3
"""Pair our linked functions with target functions by the string literals they reference.
usage: strpair.py our.dll our.map target.dll glm_functions.json > pairs.tsv   (name  target-addr  shared-strings)"""
import json, re, sys, collections, pefile, capstone

def image(path):
    pe = pefile.PE(path)
    return pe, pe.OPTIONAL_HEADER.ImageBase, pe.get_memory_mapped_image()

def cstr(mem, base, va):
    o = va - base
    if not 0 <= o < len(mem):
        return None
    e = mem.find(b'\0', o, o + 256)
    s = mem[o:e] if e > o else b''
    return s.decode() if len(s) >= 4 and all(32 <= c < 127 or c in (9, 10) for c in s) else None

def strings_of(mem, base, text_va, code, va):
    out = set()
    md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
    md.detail = True
    for ins in md.disasm(code, va):
        for op in ins.operands:
            v = op.imm if op.type == capstone.x86.X86_OP_IMM else (op.mem.disp if op.type == capstone.x86.X86_OP_MEM else None)
            if v and v > base:
                s = cstr(mem, base, v & 0xffffffff)
                if s:
                    out.add(s)
    return out

ours, tgt, tgt_fns = sys.argv[1], sys.argv[3], json.load(open(sys.argv[4]))['functions']
pe, base, mem = image(ours)
syms = sorted((int(m.group(2), 16), m.group(1)) for m in
              (re.match(r'\s*0001:\S+\s+(\S+)\s+([0-9a-f]{8}) f', l) for l in open(sys.argv[2], errors='replace')) if m)
text = next(s for s in pe.sections if s.Name.startswith(b'.text'))
tend = base + text.VirtualAddress + text.Misc_VirtualSize
our_s = {}
for i, (va, name) in enumerate(syms):
    end = syms[i + 1][0] if i + 1 < len(syms) else tend
    st = strings_of(mem, base, 0, mem[va - base:end - base], va)
    if st:
        our_s[name] = st
tpe, tbase, tmem = image(tgt)
tgt_s = {}
for f in tgt_fns:
    if f['thunk']:
        continue
    a = int(f['addr'], 16)
    st = strings_of(tmem, tbase, 0, tmem[a - tbase:a - tbase + f['size']], a)
    if st:
        tgt_s[a] = st
owner = collections.defaultdict(set)
for a, st in tgt_s.items():
    for s in st:
        owner[s].add(a)
for name, st in sorted(our_s.items()):
    votes = collections.Counter()
    for s in st:
        if len(owner.get(s, ())) == 1:
            votes[next(iter(owner[s]))] += 1
    if votes:
        (a, n), = votes.most_common(1)
        print('%s\t%x\t%d\t%d' % (name, a, n, len(st)))

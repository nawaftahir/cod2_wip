#!/usr/bin/env python3
"""Evidence-only direct-call census for a specific list of retail functions.

Decode actual Ghidra-inventoried function spans, not an unaligned raw .text byte scan.
This does not assign ABI ownership or grant any source match credit.
"""
import bisect
import csv
import sys
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
from capstone.x86 import X86_OP_IMM
sys.path.insert(0, 'tools')
import match_radiant as m

path = sys.argv[1]
targets = {int(x.strip(), 16) for x in open(path) if x.strip() and not x.startswith('#')}
rows = list(csv.DictReader(open('data/tu_map.tsv'), delimiter=chr(9)))
tu = {int(r['addr'], 16): r['tu'] for r in rows}
md = Cs(CS_ARCH_X86, CS_MODE_32)
md.detail = True
hits = {t: [] for t in targets}
for key, meta in sorted(m.FUNCTIONS.items(), key=lambda kv: int(kv[0], 16)):
    start = int(key, 16)
    code, _ = m.carve(key)
    for inst in md.disasm(code, start):
        if inst.mnemonic not in ('call', 'jmp') or not inst.operands or inst.operands[0].type != X86_OP_IMM:
            continue
        target = inst.operands[0].imm
        if target in hits:
            hits[target].append((start, inst.address, inst.mnemonic, inst.op_str, tu.get(start, '?')))
for target in sorted(targets):
    print('CENSUS target=%#010x callers=%d' % (target, len(hits[target])))
    for start, address, mnemonic, operand, source in hits[target][:100]:
        print('  caller=%#010x site=%#010x instruction=%s %s source=%s' % (start, address, mnemonic, operand, source))

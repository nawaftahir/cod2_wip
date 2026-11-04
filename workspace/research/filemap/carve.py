#!/usr/bin/env python3
"""Carve compiled code into functions at alignment padding (MSVC /O2 pads every function to 16 with CC).
A function = a 16-aligned start after padding .. last byte before the next padding run. Jump tables that
follow a function (pointers into it) stay with it. Range: LO HI. Prints stats vs the Ghidra inventory and
writes workspace/research/filemap/carved.tsv (addr size in_inventory)."""
import bisect, os, struct, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from ev import read, secs, funcs

lo, hi = int(sys.argv[1], 16), int(sys.argv[2], 16)
code = read(lo, hi - lo)
inv = {a: s for a, s in funcs if lo <= a < hi}
starts = []
a = 0
while a < len(code):
    if code[a] in (0xCC,):
        a += 1
        continue
    # a block starts here; it must be 16-aligned unless it continues a function (jump table / data)
    starts.append(a)
    # run to the next CC run that reaches a 16-byte boundary
    b = a
    while b < len(code):
        if code[b] == 0xCC:
            c = b
            while c < len(code) and code[c] == 0xCC:
                c += 1
            if (lo + c) % 16 == 0 or c >= len(code):
                break
            b = c
        else:
            b += 1
    a = b
# split blocks where a function ends exactly on a 16-byte boundary (no padding): at known starts, call
# targets and pointers from data, and after a ret/jmp when a frame prologue (push ebp; mov ebp,esp) follows
from capstone import Cs, CS_ARCH_X86, CS_MODE_32
targets = set(inv)
for j in range(len(code) - 5):
    if code[j] == 0xE8:
        targets.add((lo + j + 5 + struct.unpack_from("<i", code, j + 1)[0]) & 0xFFFFFFFF)
for sec in (".rdata", ".data"):
    l2, h2, sd = secs[sec]
    blob = read(l2, sd["raw"])
    targets.update(struct.unpack_from("<I", blob, o)[0] for o in range(0, len(blob) - 3, 4))
md = Cs(CS_ARCH_X86, CS_MODE_32)
split = set(starts)
for i, s0 in enumerate(starts):
    e = starts[i + 1] if i + 1 < len(starts) else len(code)
    bounds = {ins.address + ins.size - lo for ins in md.disasm(code[s0:e], lo + s0)}
    for t in range(s0 + 16 - (lo + s0) % 16, e, 16):
        # only at an instruction boundary: a pointer value can land mid-instruction by chance
        if (lo + t in targets and t in bounds) or (lo + t in inv and (code[t:t + 3] == b"\x55\x8b\xec" or lo <= struct.unpack_from("<I", code, t - 4)[0] < lo + t)):
            split.add(t)
    # after a ret/jmp on a 16-byte boundary a new function starts if no earlier branch reaches past it
    reach = 0
    for ins in md.disasm(code[s0:e], lo + s0):
        end = ins.address + ins.size - lo
        if ins.mnemonic.startswith("j") and ins.op_str.startswith("0x"):
            reach = max(reach, int(ins.op_str, 16) - lo)
        if end < e and (lo + end) % 16 == 0 and ins.mnemonic in ("ret", "jmp") and \
                (code[end:end + 3] == b"\x55\x8b\xec" or reach < end) and \
                struct.pack("<I", lo + end) not in code[s0:e]:   # not a switch case of this block's table
            split.add(end)
            reach = 0
starts = sorted(split)

def body(s, e):
    # decode s..e; the body ends after the last instruction that is not int3 padding
    end, last = s, None
    for ins in md.disasm(code[s:e], lo + s):
        if ins.mnemonic != "int3":
            end, last = ins.address + ins.size - lo, ins.mnemonic
    return end, last

blocks = []
i = 0
while i < len(starts):
    s = starts[i]
    j = i + 1
    while True:
        e = starts[j] if j < len(starts) else len(code)
        end, last = body(s, e)
        # a cut inside an instruction or a block that runs on: merge with the next block
        if j < len(starts) and (end > e or last not in ("ret", "jmp", "call", "int3")) and \
                lo + starts[j] not in inv and code[e - 1] == 0xCC:
            j += 1
            continue
        break
    blocks.append((lo + s, min(end, e) - s))
    i = j
bs = {a: s for a, s in blocks}
unaligned = [a for a, s in blocks if a % 16]
miss_inv = [a for a in inv if a not in bs]
print("blocks %d  unaligned %d  inventory %d  inventory starts not at a block %d  new blocks %d" % (
    len(blocks), len(unaligned), len(inv), len(miss_inv), len([a for a in bs if a not in inv])))
print("inventory starts inside blocks (Ghidra split or wrong):", " ".join("%x" % a for a in miss_inv[:20]))
print("unaligned blocks:", " ".join("%x" % a for a in unaligned[:20]))
with open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "carved.tsv"), "w") as f:
    f.write("addr\tsize\tin_inventory\n")
    for a, s in blocks:
        f.write("0x%08x\t%d\t%s\n" % (a, s, "yes" if a in inv else "no"))

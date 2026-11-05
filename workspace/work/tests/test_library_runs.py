#!/usr/bin/env python3
"""closed_run and interior_call: one good case and broken ones for each rule."""
from pathlib import Path
import capstone

gfx = Path(__file__).resolve().parents[3]
text = (gfx / 'tools/bindcheck.py').read_text()


def part(start):
    i = text.index(start)
    return text[i:text.index('\n\n\n', i)]


closed_end = part('def closed_end(')
closed_run = part('def closed_run(')
interior_call = part('def interior_call(')
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)

# f1: ret; f2: jmp short back to f1 (leaves f2, stays in the object block)
ours = b'\xc3\xeb\xfd'


def run(target, obj2='LIB:a.obj', arel=frozenset()):
    def read(sections, address, count):
        data, base = (ours, 0x2000) if sections == 'ours' else (target, 0x5000)
        return data[address - base:address - base + count]
    allc = {'f1': {'obj': 'LIB:a.obj', 'size': 1}, 'f2': {'obj': obj2, 'size': 2}}
    fnva = {'f1': 0x2000, 'f2': 0x2001}
    ctx = dict(capstone=capstone, read=read, osecs='ours', asecs='target', allc=allc, fnva=fnva,
               atva={v: k for k, v in fnva.items()},
               atend={v + allc[k]['size']: k for k, v in fnva.items()},
               orel=set(), arel=set(arel),
               masked_eq=lambda va, t, n: read('ours', va, n) == read('target', t, n))
    exec(closed_end + '\n\n' + closed_run, ctx)
    return ctx['closed_run']('f2', 0x2001, 0x5001, 2)


assert run(ours)
assert not run(b'\xc3\xeb\xfe')                  # bytes differ
assert not run(ours, obj2='LIB:b.obj')           # neighbour is another object
assert not run(ours, arel={0x5000})              # relocations differ

# owner: mov eax, ecx; ret (label at the ret)
code = b'\x8b\xc1\xc3'


def call(op, tp, why=(), lib=False):
    owner = {'va': 0x2000, 'n': 3, 't': 0x5000, 'why': list(why)}
    ctx = dict(results={'owner': owner}, libbound=lambda r: lib, md=md, osecs='ours',
               read=lambda s, a, n: code[a - 0x2000:a - 0x2000 + n])
    exec(interior_call, ctx)
    return ctx['interior_call'](op, tp)


assert call(0x2002, 0x5002)
assert not call(0x2002, 0x5003)                  # wrong retail offset
assert not call(0x2001, 0x5001)                  # inside an instruction
assert not call(0x2002, 0x5002, why=['call x'])  # owner not bound
assert call(0x2002, 0x5002, why=['call x'], lib=True)
print('PASS: closed_run object blocks and interior_call labels, with byte/object/reloc/offset/boundary/owner negatives')

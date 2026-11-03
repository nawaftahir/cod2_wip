"""Resolve full ambiguous API bodies using the actual pointer-placement loop."""
import ast
from pathlib import Path
import struct
import capstone

gfx = Path(__file__).resolve().parents[3]
tree = ast.parse((gfx / 'tools/bindcheck.py').read_text())
helpers = [n for n in tree.body if isinstance(n, ast.FunctionDef)
           and n.name in ('masked_eq', 'api_pointer_places', 'callee_placement')]
loop = next(n for n in tree.body if isinstance(n, ast.While) and 'jpeg_pointers' in ast.unparse(n))
source, target, child, destination = 0x10001000, 0x10002000, 0x10003000, 0x10004000
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)


def run(size=79, hits=None, boundary=True, wrong_size=False, mismatch=False, missing_reloc=False):
    own = b'\xc7\x05' + struct.pack('<II', 0x20000000, child) + b'\xc3'
    other = b'\xc7\x05' + struct.pack('<II', 0x20000100, destination) + b'\xc3'
    body = b'\x90' * (size - 1) + b'\xc3'
    blocks = {'own': [(source, own), (child, body)],
              'target': [(target, other), (destination, (b'\x91' + body[1:]) if mismatch else body)]}
    def read(section, address, count):
        for base, data in blocks[section]:
            if base <= address and address + count <= base + len(data):
                return data[address-base:address-base+count]
        return None
    ns = dict(md=md, read=read, osecs='own', asecs='target',
              orel={source+2, source+6}, arel=set() if missing_reloc else {target+2, target+6},
              orelocbytes=set(), instructions=lambda decoder, code, va, rel: decoder.disasm(code, va),
              overlaps_reloc=lambda *args: False,
              secname=lambda section, address: '.data' if address >= 0x20000000 else '.text',
              glm=[dict(addr=f'{destination:x}', size=size+int(wrong_size))] if boundary else [],
              changed=True, fnva={'_GetRefAPI': source, '?callback@@': child},
              cands={'_GetRefAPI': dict(name='_GetRefAPI', obj='ref_api.obj', size=len(own), hits=[hex(target)])},
              multi={child: dict(name='?callback@@', obj='r_init.obj', size=size,
                                 hits=[hex(destination), hex(destination+256)] if hits is None else hits)})
    exec(compile(ast.Module(body=helpers + [loop], type_ignores=[]), '<actual-api-placement>', 'exec'), ns)
    return ns['cands'].get('?callback@@')


assert run()['hits'] == [hex(destination)]
assert run(size=33)['hits'] == [hex(destination)]
assert run(size=8, hits=[])['hits'] == [hex(destination)]
assert not run(hits=[])
assert not run(hits=[hex(destination+256)])
assert not run(boundary=False)
assert not run(wrong_size=True)
assert not run(mismatch=True)
assert not run(missing_reloc=True)
print('PASS: full API ambiguity resolved; raw-hit, full-byte, relocation and exact-boundary gates retained')

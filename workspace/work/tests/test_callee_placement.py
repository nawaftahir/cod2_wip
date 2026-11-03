"""Existing ambiguous hits can be distinguished by their direct callees."""
import ast
from pathlib import Path
import struct
import capstone

tree = ast.parse((Path(__file__).resolve().parents[3] / 'tools/bindcheck.py').read_text())
helper = next(n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name == 'callee_placement')
va, first, second, own_callee, target_callee = 0x1000, 0x2000, 0x3000, 0x4000, 0x5000
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)


def run(destinations=(target_callee, target_callee+256), known=True, relocation=False, missing=False, matching=True):
    def body(address, destination):
        return b'\xe8' + struct.pack('<i', destination-address-5) + b'\xc3'
    blocks = {'ours': {va: body(va, own_callee)},
              'target': {first: body(first, destinations[0]), second: body(second, destinations[1])}}
    if missing:
        del blocks['target'][first]
    ns = dict(read=lambda section, address, count: blocks[section].get(address),
              osecs='ours', asecs='target', md=md, orelocbytes=set(),
              masked_eq=lambda *args: matching,
              instructions=lambda decoder, code, address, rel: decoder.disasm(code, address),
              overlaps_reloc=lambda *args: relocation)
    exec(compile(ast.Module(body=[helper], type_ignores=[]), '<actual-callee-placement>', 'exec'), ns)
    return ns['callee_placement'](va, dict(size=6, hits=[hex(first), hex(second)]),
                                  {own_callee: target_callee} if known else {})


assert run() == hex(first)
assert run((target_callee+256, target_callee)) == hex(second)
assert run((target_callee, target_callee)) is None
assert run((target_callee+256, target_callee+512)) is None
assert run(known=False) is None
assert run(relocation=True) is None
assert run(missing=True) is None
assert run(matching=False) is None
print('PASS: exact direct-callee narrowing; ambiguity, wrong callees, missing code and relocated instructions rejected')

"""Exercise the actual JPEG callback discovery loop, including rejection paths."""
import ast
from pathlib import Path
import struct
import capstone

gfx = Path(__file__).resolve().parents[3]
tree = ast.parse((gfx / 'tools/bindcheck.py').read_text())
helpers = [n for n in tree.body if isinstance(n, ast.FunctionDef) and n.name in
           ('masked_eq', 'immediate_pointer_places', 'padded_callback')]
loop = next(n for n in tree.body if isinstance(n, ast.While)
            and 'jpeg_pointers' in ast.unparse(n))
source, target, child, destination = 0x10001000, 0x10002000, 0x10003000, 0x10004000
md = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)

def run(pair=None, child_code=b'\xb0\x01\xc3', target_code=None, prefix=b'\xcc', suffix=b'\xcc',
        missing=False, ambiguous=False, wrong_obj=False, missing_target=False, wrong_section=False):
    own = b'\xb8'+struct.pack('<I', child)
    other = b'\xb8'+struct.pack('<I', destination)
    if ambiguous:
        own += b'\xb9'+struct.pack('<I', child)
        other += b'\xb9'+struct.pack('<I', destination+16)
    if pair:
        own, other = pair
    blocks = {'own': [(source, own), (child, child_code)],
              'target': [(target, other), (destination-1, prefix+(target_code or child_code)+suffix),
                         (destination+15, b'\xcc'+child_code+b'\xcc')]}
    def read(section, address, size):
        for base, data in blocks[section]:
            if base <= address and address+size <= base+len(data):
                return data[address-base:address-base+size]
        return None
    orels = {source+1} if not missing else set()
    arels = set() if missing_target else {target+1}
    if ambiguous:
        orels.add(source+6); arels.add(target+6)
    ns = dict(md=md, read=read, orel=orels, arel=arels, orelocbytes=set(),
              instructions=lambda decoder, code, va, rel: decoder.disasm(code, va),
              osecs='own', asecs='target', secname=lambda section, address: '.data' if wrong_section else '.text',
              overlaps_reloc=lambda *args: False, glm=[], changed=True,
              fnva={'?R_SaveJpg@@':source},
              cands={'?R_SaveJpg@@':dict(name='?R_SaveJpg@@',obj='r_jpeg.obj',size=len(own),hits=[hex(target)])},
              multi={child:dict(name='?callback@@',obj='other.obj' if wrong_obj else 'r_jpeg.obj',
                                size=len(child_code),hits=[])})
    exec(compile(ast.Module(body=helpers, type_ignores=[]), '<actual-helpers>', 'exec'), ns)
    exec(compile(ast.Module(body=[loop], type_ignores=[]), '<actual-placement-loop>', 'exec'), ns)
    return '?callback@@' in ns['cands']

assert run()
assert not run(missing=True)
assert not run(missing_target=True)
assert not run(wrong_section=True)
assert not run(ambiguous=True)
assert not run(wrong_obj=True)
assert not run(prefix=b'\x90')
assert not run(suffix=b'\x90')
assert not run(target_code=b'\xb0\x00\xc3')
assert not run(child_code=b'\xeb\x00\xc3')
assert not run(child_code=b'\x90'*32+b'\xc3')
assert not run(pair=(b'\xb8'+struct.pack('<I',child), b'\xb9'+struct.pack('<I',destination)))
assert not run(pair=(b'\xa1'+struct.pack('<I',child), b'\xa1'+struct.pack('<I',destination)))
print('PASS: actual callback discovery; ambiguity, missing reloc, wrong opcode/object/body, padding, branches and oversize rejected')

ns=dict(md=md,osecs='own',asecs='target',secname=lambda *args:'.text')
exec(compile(ast.Module(body=helpers,type_ignores=[]),'<actual-store-helper>','exec'),ns)
own=b'\xc7\x44\x24\x08'+struct.pack('<I',child)
other=b'\xc7\x44\x24\x08'+struct.pack('<I',destination)
place=ns['immediate_pointer_places']
assert place(own,other,source,target,{source+4},{target+4})==[(child,destination)]
assert place(own,other[:3]+b'\x0c'+other[4:],source,target,{source+4},{target+4})==[]
assert place(own,other[:4],source,target,{source+4},{target+4})==[]
print('PASS: stack-field immediate store, changed destination and truncated instruction checks')

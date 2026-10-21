"""Check every reconstructed DX7 table field against the pinned retail image."""
import hashlib
from pathlib import Path
import re
import struct

import pefile

work = Path(__file__).resolve().parents[1]
gfx = work.parents[1]
anchor = gfx.parent / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
assert hashlib.sha256(anchor.read_bytes()).hexdigest() == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
pe = pefile.PE(str(anchor), fast_load=True)
source = (work / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()

def table(name, owner=source):
    start = owner.index(name)
    return owner[start:owner.index('\n};', start)]

options = re.findall(r'\{ "([^"]+)", offsetof\(MaterialPassDx7, (\w+)\) \}',
                     table('PassOptionDx7 s_passOptionsDx7'))
assert len(options) == 5
for index, (name, field) in enumerate(options):
    address, offset = struct.unpack('<II', pe.get_data(0x190250 + 8 * index, 8))
    assert pe.get_string_at_rva(address - 0x10000000).decode('ascii') == name == field
    assert offset == 4 + index

operators = re.findall(r'\{ "([^"]+)", (\d+), (\d+), MTL_TEXFUNC_VALID_BOTH \}',
                       table('MtlTextureFunctionDx7 s_textureFuncsDx7'))
assert len(operators) == 21
for index, (name, enumerant, count) in enumerate(operators):
    address, value, arguments, valid = struct.unpack('<IIII', pe.get_data(0x190100 + 16 * index, 16))
    assert pe.get_string_at_rva(address - 0x10000000).decode('ascii') == name
    assert (value, arguments, valid) == (int(enumerant), int(count), 3)
assert operators[0] == ('select', '1', '1')
print('PASS: all376 DX7 table bytes,26 names/offsets/operators/counts/validity fields against retail')

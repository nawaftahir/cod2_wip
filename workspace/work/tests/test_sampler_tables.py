"""Compare every actual C sampler-table field with the pinned retail tables."""
import hashlib
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parents[3] / "tools"))
from renderer_paths import retail_anchor
import struct
import subprocess
import tempfile
import pefile

target = Path(__file__).resolve().parents[2]
anchor = target.parents[1] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
assert hashlib.sha256(anchor.read_bytes()).hexdigest() == '4553b22daff76e1f628d7ba16fda840b8ba415ae5024072b279fe8b820f634f6'
pe = pefile.PE(str(anchor))
base = pe.OPTIONAL_HEADER.ImageBase
tables = [('s_lightSamplers', 0x1018eb58, 2), ('s_lightmapSamplers', 0x1018eb80, 7),
          ('s_lightGridSamplers', 0x1018ec0c, 2), ('s_codeSamplers', 0x1018ec38, 18),
          ('s_lightConsts', 0x1018eed0, 5), ('s_cameraConsts', 0x1018ef38, 5),
          ('s_nearPlaneConsts', 0x1018efa0, 4), ('s_lightGridConsts', 0x1018eff0, 4),
          ('s_codeConsts', 0x1018f040, 75), ('s_defaultCodeSamplers', 0x1018eda0, 15),
          ('s_defaultCodeConsts', 0x1018f620, 22)]
expected = []
for name, address, count in tables:
    for i in range(count):
        text, value, child, size, stride = struct.unpack('<5I', pe.get_data(address - base + 20*i, 20))
        label = pe.get_string_at_rva(text-base).decode('ascii') if text else '-'
        assert bool(text) == (i < count-1)
        expected.append(f'{label}|{value}|{child:x}|{size}|{stride}')

header = (target / 'work/src/gfx_d3d/r_material_state_tables.h').read_text()
header = header[:header.index('// PINNED PC 1.0 material state names')]
types = (target / 'src/opencod2/headers/common_types.h').read_text()
enum = types[types.index('enum MaterialTextureSource {'):types.index('enum MaterialVertexDeclType {')]
program = '#include <cstdint>\n#include <cstdio>\n#include <cassert>\n' + enum + '''
struct CodeSamplerSource { const char *name;MaterialTextureSource source;const CodeSamplerSource *subtable;int arrayCount,arrayStride; };
struct CodeConstantSource { const char *name;unsigned char source;const CodeConstantSource *subtable;int arrayCount,arrayStride; };
''' + header + '''
unsigned childAddress(intptr_t pointer) {
    if(!pointer)return 0;
'''
for name, address, count in tables:
    program += f'    if(pointer==(intptr_t){name})return 0x{address:x};\n'
program += '    assert(false);return 0;\n}\nint main() {\n'
for name, address, count in tables:
    program += f'    static_assert(sizeof({name})/sizeof({name}[0])=={count},"table size");\n'
    program += f'    for(const auto &row:{name})printf("%s|%u|%x|%d|%d\\n",row.name?row.name:"-",row.source,childAddress((intptr_t)row.subtable),row.arrayCount,row.arrayStride);\n'
program += '}\n'
with tempfile.TemporaryDirectory(prefix='gfx_sampler_tables_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    actual = subprocess.check_output([binary], text=True).splitlines()
assert actual == expected, [(a, b) for a, b in zip(actual, expected) if a != b]
print('PASS: all 159 sampler/constant rows, names, sources, child bindings, counts and strides match retail')

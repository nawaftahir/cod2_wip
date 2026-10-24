"""Both backend header views must use the retail PC matrix frame stride."""
from pathlib import Path
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
common = (work.parent / 'src/opencod2/headers/cod2_defs.h').read_text()
sdk = (work / 'src/gfx_d3d/rb_backend.h').read_text()
anchor = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
def instructions(address, size):
    return [(i.mnemonic, i.op_str) for i in decoder.disasm(anchor.get_data(address-anchor.OPTIONAL_HEADER.ImageBase,size),address)]
startup = instructions(0x10012f80,169)
backend_init = instructions(0x10033f80,64)
assert ('mov','dword ptr [0x10764558], eax') in startup
assert ('mov','edi, 0x1072da00') in backend_init
assert ('mov','ecx, 0xdad8') in backend_init
assert 0xdad8*4 == 0x36b60
assert ('mov','dword ptr [0x10730554], eax') in backend_init
assert ('mov','dword ptr [0x10730558], eax') in backend_init


def declaration(text, name):
    start = text.index('struct ' + name + '\n') if 'struct ' + name + '\n' in text else text.index('struct ' + name + ' {')
    end = text.index('};', start) + 2
    if name == 'GfxCodeMatrix':
        end = text.index(';', text.index('}', start)) + 1
    return text[start:end]


common_matrix = declaration(common, 'GfxCodeMatrix')
sdk_matrix = declaration(sdk, 'GfxCodeMatrix').replace('struct GfxCodeMatrix', 'struct __attribute__((aligned(16))) GfxCodeMatrix', 1)
common_frames = declaration(common, 'GfxCodeMatrices')
sdk_frames = declaration(sdk, 'GfxCodeMatrices')
prefix = '#include <cstddef>\ntypedef unsigned char Bool;\nstruct D3DMATRIX {float m[4][4];};\n#define COD2_ALIGNED(n) __attribute__((aligned(n)))\n'
checks = '''
static_assert(sizeof(GfxCodeMatrix)==0x110,"matrix size");
static_assert(alignof(GfxCodeMatrix)==16,"matrix alignment");
static_assert(sizeof(GfxCodeMatrices)==0xcd0,"PC frame stride");
static_assert(offsetof(GfxCodeMatrices,world)==16,"first matrix");
static_assert(offsetof(GfxCodeMatrices,worldOutdoorLookup)==0xbc0,"last matrix");
static_assert(0x1072dee0+3*sizeof(GfxCodeMatrices)==0x10730550,"retail stack level");
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_layout_') as directory:
    for label, matrix, frames in [('common',common_matrix,common_frames),('sdk',sdk_matrix,sdk_frames)]:
        program = prefix + matrix + '\n' + frames + '\n' + checks
        result = subprocess.run(['g++','-m32','-std=c++11','-x','c++','-c','-','-o',str(Path(directory)/'layout.o')],input=program,text=True,capture_output=True)
        assert result.returncode == 0, (label,result.stderr)
        wrong = program.replace('GfxCodeMatrix worldOutdoorLookup;', 'GfxCodeMatrix worldOutdoorLookup; GfxCodeMatrix extraOglMatrix;')
        result = subprocess.run(['g++','-m32','-std=c++11','-x','c++','-c','-','-o',str(Path(directory)/'layout.o')],input=wrong,text=True,capture_output=True)
        assert result.returncode != 0 and 'PC frame stride' in result.stderr, (label,result.stderr)
records = (work / 'src/gfx_d3d/r_scene_records.h').read_text()
record_checks = r'''
static_assert(sizeof(GfxSceneDef)==16,"scene size");
static_assert(offsetof(GfxSceneDef,floatTime)==4,"scene time");
static_assert(offsetof(GfxSceneDef,entityCount)==8,"scene count");
static_assert(offsetof(GfxSceneDef,entities)==12,"scene entities");
static_assert(sizeof(GfxLodParms)==20,"LOD size");
static_assert(offsetof(GfxLodParms,scale)==12,"LOD scale");
static_assert(offsetof(GfxLodParms,bias)==16,"LOD bias");
'''
with tempfile.TemporaryDirectory(prefix='gfx_scene_layout_') as directory:
    for label, header in [('common',common),('sdk',records)]:
        program = '#include <cstddef>\nstruct GfxEntity;typedef float vec3_t[3];\n'
        program += declaration(header,'GfxSceneDef') + '\n' + declaration(header,'GfxLodParms') + '\n' + record_checks
        result = subprocess.run(['g++','-m32','-std=c++11','-x','c++','-c','-','-o',str(Path(directory)/'layout.o')],input=program,text=True,capture_output=True)
        assert result.returncode == 0, (label,result.stderr)
        wrong = program.replace('float floatTime;', 'double floatTime;')
        result = subprocess.run(['g++','-m32','-std=c++11','-x','c++','-c','-','-o',str(Path(directory)/'layout.o')],input=wrong,text=True,capture_output=True)
        assert result.returncode != 0, (label,result.stderr)
print('PASS: common/SDK matrix and typed scene/LOD schemas agree on PC sizes/offsets; extra OGL field and wrong-width time rejected')

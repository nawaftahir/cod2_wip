"""Actual procedural image helpers, cube directions and face upload ownership."""
from pathlib import Path
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_image_load_obj.cpp').read_text()
source = (text[text.index('// PINNED 1000fbd0/'):text.index('void R_LoadJpg(')] +
          text[text.index('// PINNED 1000fce0/'):text.index('static unsigned int Image_CountMipmapsForFile(')])
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
decoder.detail = True
registers, axes = {}, {}
for instruction in decoder.disasm(retail.get_data(0x10160, 0xa5), 0x10010160):
    operands = instruction.operands
    if instruction.mnemonic == 'mov':
        dest, value = operands
        if dest.type == capstone.CS_OP_REG and value.type == capstone.CS_OP_IMM:
            registers[dest.reg] = value.imm
        elif dest.type == capstone.CS_OP_MEM and dest.mem.base == capstone.x86.X86_REG_ESP:
            offset = dest.mem.disp
            if 0x64 <= offset <= 0xa8:
                axes[(offset - 0x64) // 4] = value.imm if value.type == capstone.CS_OP_IMM else registers[value.reg]
    elif instruction.mnemonic == 'xor' and operands[0].reg == operands[1].reg:
        registers[operands[0].reg] = 0
assert [axes[i] for i in range(18)] == [0,5,3,1,4,3,2,0,4,3,0,5,4,0,3,5,1,3]
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <vector>
typedef unsigned char byte;
void VectorCopy(const float *v,float *out) {memcpy(out,v,3*sizeof(float));}
void VectorScale(const float *v,float s,float *out) {for(int i=0;i<3;++i)out[i]=s*v[i];}
void VectorMA(const float *v,float s,const float *b,float *out) {for(int i=0;i<3;++i)out[i]=v[i]+s*b[i];}
enum D3DFORMAT {D3DFMT_A8R8G8B8=21,D3DFMT_L8=50};
enum D3DCUBEMAP_FACES {D3DCUBEMAP_FACE_POSITIVE_X};
struct GfxImage {int token;} image;
struct Setup {int width,height,depth,flags;D3DFORMAT format;} setup;
struct Upload {int face;const byte *address;std::vector<byte> bytes;};
std::vector<Upload> uploads;
bool setupDone;
void Image_Setup(GfxImage *target,int w,int h,int d,int flags,unsigned usage,D3DFORMAT format) {
    assert(target==&image&&!setupDone&&usage==0);setupDone=true;
    setup={w,h,d,flags,format};
}
void Image_UploadData(GfxImage *target,D3DFORMAT format,D3DCUBEMAP_FACES face,unsigned level,const byte *pixels) {
    assert(target==&image&&setupDone&&format==setup.format&&level==0);
    int count=setup.width*setup.height*(format==D3DFMT_L8?1:4);
    Upload u={int(face),pixels,std::vector<byte>(pixels,pixels+count)};uploads.push_back(u);
}
void Image_BuildSpecularityMap(float shift,byte *pixels) {
    assert(shift==0.0f&&!setupDone);
    for(int i=0;i<8192;++i)pixels[i]=byte(i*37);
}
int resolution,pixelCalls,userExpected;
byte *base;
void directionPixel(const float *dir,int user,byte *pixel) {
    assert(!setupDone&&user==userExpected&&pixel==base+pixelCalls*4);
    int face=pixelCalls/(resolution*resolution);
    int row=(pixelCalls/resolution)%resolution,col=pixelCalls%resolution;
    float s=-1.0f+(2.0f*col+1.0f)/resolution;
    float t=-1.0f+(2.0f*row+1.0f)/resolution;
    float expected[6][3]={{1,-t,-s},{-1,-t,s},{s,1,t},{s,-1,-t},{s,-t,1},{-s,-t,-1}};
    for(int j=0;j<3;++j)assert(fabs(dir[j]-expected[face][j])<0.00002f);
    for(int j=0;j<4;++j)pixel[j]=byte(pixelCalls*13+j);
    ++pixelCalls;
}
void Image_GetLightGridWeightsForVector(const float *dir,int user,byte *pixel) {
    if(!base)base=pixel;
    directionPixel(dir,user,pixel);
}
void Image_GetSunHalfAngleForVector(const float *dir,int user,byte *pixel) {
    directionPixel(dir,user,pixel);
}
std::vector<byte> hunk;
int allocations,frees;
void *allocate(int size) {
    assert(size==98304&&!setupDone);++allocations;hunk.assign(size+8,0xa5);
    base=hunk.data()+4;return base;
}
void release(void *pixels) {
    assert(pixels==base&&uploads.size()==6&&pixelCalls==24576);++frees;
    for(int i=0;i<4;++i)assert(hunk[i]==0xa5&&hunk[hunk.size()-1-i]==0xa5);
}
struct {void *(*Hunk_AllocateTempMemoryInternal)(int);void (*Hunk_FreeTempMemory)(void *);} ri={allocate,release};
'''+source+r'''
void reset() {uploads.clear();setupDone=false;pixelCalls=0;base=0;}
int main() {
    int cases=0;
    for(unsigned b:{0u,1u,128u,255u})for(unsigned g:{0u,63u,255u})
    for(unsigned r:{0u,127u,255u})for(unsigned a:{0u,128u,255u}) {
        reset();Image_GenerateSolidColor(&image,r,g,b,a);
        assert(setup.width==1&&setup.height==1&&setup.depth==1&&setup.flags==3);
        assert(setup.format==D3DFMT_A8R8G8B8&&uploads.size()==1);
        assert(uploads[0].bytes==std::vector<byte>({byte(b),byte(g),byte(r),byte(a)}));++cases;
    }
    reset();Image_GenerateSpecularity(&image);
    assert(setup.width==32&&setup.height==256&&setup.depth==1&&setup.flags==3);
    assert(setup.format==D3DFMT_L8&&uploads.size()==1);
    for(int i=0;i<8192;++i)assert(uploads[0].bytes[i]==byte(i*37));++cases;
    for(int size:{0,1,2,3,16,32,64})for(int user:{0,1,12345}) {
        reset();resolution=size;userExpected=user;
        std::vector<byte> guarded(size*size*24+8,0xa5);base=guarded.data()+4;
        Image_GenerateCubemapFunction(&image,base,size,user,directionPixel);
        assert(pixelCalls==6*size*size);
        assert(setup.width==size&&setup.height==size&&setup.depth==1&&setup.flags==7);
        assert(uploads.size()==6&&setup.format==D3DFMT_A8R8G8B8);
        for(int face=0;face<6;++face) {
            assert(uploads[face].face==face&&uploads[face].address==base+face*size*size*4);
            for(int i=0;i<size*size*4;++i)assert(uploads[face].bytes[i]==byte(((face*size*size+i/4)*13)+i%4));
        }
        for(int i=0;i<4;++i)assert(guarded[i]==0xa5&&guarded[guarded.size()-1-i]==0xa5);
        ++cases;
    }
    for(int subMap:{0,1,19}) {
        reset();resolution=32;userExpected=subMap;
        Image_GenerateLightGridWeights(&image,subMap);
        assert(pixelCalls==6144&&uploads.size()==6);++cases;
    }
    reset();resolution=64;userExpected=0;allocations=frees=0;
    Image_GenerateSunHalfAngle(&image);
    assert(allocations==1&&frees==1);++cases;
    printf("PASS: %d actual procedural image routes, BGRA, L8, six axes, texel centers, guards and submap forwarding\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_procedural_images_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)

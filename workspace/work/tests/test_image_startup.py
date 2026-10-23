"""Actual image startup, shared owners and renderer-dependent builtin registration."""
from pathlib import Path
import subprocess
import tempfile
import capstone
import pefile

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
ops = [(i.mnemonic,i.op_str) for i in decoder.disasm(retail.get_data(0xd880,124),0x1000d880)]
assert ops[-1] == ('ret','')
for expected in [('cmp','edi, 0x10'),('mov','byte ptr [0x101d1be8], 0x32'),
                 ('mov','byte ptr [0x101d1be9], 0'),('mov','dword ptr [0x101d1bec], ecx')]:
    assert expected in ops, expected
text = (work / 'src/gfx_d3d/r_init.cpp').read_text()
source = text[text.index('void R_RegisterBuiltinImages('):]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <string>
#include <vector>
#include <stdexcept>
#include <initializer_list>
typedef unsigned char byte;
struct GfxImage {int id;} images[32];
struct Texture {const char *name;byte samplerState,semantic,padding[2];union{GfxImage *image;void *water;}u;};
struct {
    GfxImage *whiteImage,*blackImage,*identityNormalMapImage,*specularityImage;
    GfxImage *lightGridWeightsImage[2],*lightmapWeightsImage,*waterColorImage,*rawImage;
    Texture rawTexdef;int untouched;
} rgp;
struct {byte samplerState[16];} dxState;
struct {struct {int integer;} current;} renderer;
const decltype(renderer) *r_rendererInUse=&renderer;
std::vector<std::string> registrations;
int samplers,picmip,rawAlloc,errorAt,overrideRenderer;bool changeWhite;
GfxImage *Image_Register(const char *name,int track,int semantic) {
    assert(!track&&semantic==1&&samplers==0&&!rawAlloc);
    registrations.push_back(name);int index=registrations.size();
    if(index==errorAt)throw std::runtime_error("expected image error");
    if(index==2&&overrideRenderer>=0)renderer.current.integer=overrideRenderer;
    return &images[index];
}
void R_SetPicmip(){assert(registrations.empty()&&!samplers&&!rawAlloc);++picmip;}
void RB_SetSampler(int index,byte state,GfxImage *image) {
    assert(picmip==1&&index==samplers&&index<16&&!rawAlloc);
    assert(state==dxState.samplerState[index]&&image==rgp.whiteImage);
    dxState.samplerState[index]^=0x40;
    if(index<15)dxState.samplerState[index+1]^=0x80;
    if(changeWhite)rgp.whiteImage=&images[16+index];++samplers;
}
GfxImage *Image_AllocProg(int id,int category){assert(picmip==1&&samplers==16&&id==12&&category==4);++rawAlloc;return &images[0];}
'''+source+r'''
void reset(int mode) {
    registrations.clear();samplers=picmip=rawAlloc=errorAt=0;
    memset(&rgp,0x5a,sizeof(rgp));renderer.current.integer=mode;
    for(int index=0;index<16;++index)dxState.samplerState[index]=index*7+1;
}
int main() {
    int cases=0;
    for(int mode:{0,1,2,3})for(overrideRenderer=-1;overrideRenderer<4;++overrideRenderer)
    for(int mutate=0;mutate<2;++mutate) {
        reset(mode);auto before=rgp;changeWhite=mutate;
        R_InitImages();
        bool dx7=(overrideRenderer<0?mode:overrideRenderer)==2;
        std::vector<std::string> expected={"$white","$black"};
        if(dx7)expected.push_back("$watercolor");
        else for(const char *name:{"$identitynormalmap","$specularity","$lightgridweights0","$lightgridweights1","$lightmapweights"})expected.push_back(name);
        assert(registrations==expected&&picmip==1&&samplers==16&&rawAlloc==1);
        assert(rgp.whiteImage==&images[changeWhite?31:1]&&rgp.blackImage==&images[2]);
        if(dx7) {
            assert(rgp.waterColorImage==&images[3]&&rgp.identityNormalMapImage==before.identityNormalMapImage);
            assert(rgp.specularityImage==before.specularityImage&&rgp.lightmapWeightsImage==before.lightmapWeightsImage);
            assert(!memcmp(rgp.lightGridWeightsImage,before.lightGridWeightsImage,sizeof(rgp.lightGridWeightsImage)));
        } else {
            assert(rgp.waterColorImage==before.waterColorImage&&rgp.identityNormalMapImage==&images[3]);
            assert(rgp.specularityImage==&images[4]&&rgp.lightmapWeightsImage==&images[7]);
            assert(rgp.lightGridWeightsImage[0]==&images[5]&&rgp.lightGridWeightsImage[1]==&images[6]);
        }
        assert(rgp.rawImage==&images[0]&&rgp.rawTexdef.samplerState==0x32&&!rgp.rawTexdef.semantic&&rgp.rawTexdef.u.image==&images[0]);
        assert(rgp.rawTexdef.name==before.rawTexdef.name&&!memcmp(rgp.rawTexdef.padding,before.rawTexdef.padding,2));
        assert(rgp.untouched==before.untouched);++cases;
    }
    for(int mode:{1,2})for(int error:{1,2}) {
        reset(mode);auto before=rgp;errorAt=error;overrideRenderer=-1;bool caught=false;
        try{R_InitImages();}catch(const std::runtime_error&){caught=true;}
        assert(caught&&picmip==1&&!samplers&&!rawAlloc&&registrations.size()==(unsigned)error);
        assert(rgp.blackImage==before.blackImage);
        assert(rgp.whiteImage==(error==1?before.whiteImage:&images[1]));++cases;
    }
    printf("PASS: %d actual image startup routes, DX7/DX9 branch,16 live samplers, raw publication, untouched fields and error order\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_image_startup_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

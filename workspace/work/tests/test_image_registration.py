"""Actual ten-builtin dispatch and file/cache registration paths."""
from pathlib import Path
import subprocess
import tempfile
import pefile
import capstone

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
decoder.detail = True
names = set()
for instruction in decoder.disasm(retail.get_data(0x108a0,519),0x100108a0):
    if instruction.mnemonic != 'mov':
        continue
    destination,value = instruction.operands
    if destination.type == capstone.CS_OP_REG and destination.reg == capstone.x86.X86_REG_EDI and value.type == capstone.CS_OP_IMM:
        if 0x10180000 <= value.imm < 0x101a0000:
            names.add(retail.get_string_at_rva(value.imm-0x10000000).decode())
assert names == {'$white','$black','$identitynormalmap','$specularity','$outdoor',
                 '$lightmapweights','$lightgridweights0','$lightgridweights1','$watercolor','$sunhalfangle'}
text = (work / 'src/gfx_d3d/r_image_load_obj.cpp').read_text()
builtin = text[text.index('GfxImage *Image_LoadBuiltin('):]
text = (work / 'src/gfx_d3d/r_image.cpp').read_text()
register = text[text.index('GfxImage *Image_Register('):text.index('IDirect3DSurface9 *Image_GetSurface(')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <stdexcept>
#include <initializer_list>
typedef unsigned char byte;
enum {ERR_DROP=1};
struct GfxImage {int unused;} allocated,cached;
const char *expectedName;
int expectedTrack,expectedSemantic,allocations,generator,errors,logs,lookups,fileLoads;
bool hit,loadSuccess,throwError;
GfxImage *Image_FindExisting(const char *name){assert(name==expectedName);++lookups;return hit?&cached:0;}
GfxImage *Image_Alloc(const char *name,int category,int semantic,int track) {
    assert(name==expectedName&&track==expectedTrack);
    assert(category==(name[0]=='$'?1:3));
    assert(semantic==(name[0]=='$'?(byte)expectedSemantic:expectedSemantic));++allocations;return &allocated;
}
void mark(GfxImage *image,int id){assert(image==&allocated&&allocations==1&&!generator);generator=id;}
void Image_GenerateSolidColor(GfxImage *image,byte b,byte g,byte r,byte a) {
    if(!strcmp(expectedName,"$white")){assert(b==255&&g==255&&r==255&&a==255);mark(image,1);}
    else if(!strcmp(expectedName,"$black")){assert(!b&&!g&&!r&&a==255);mark(image,2);}
    else {assert(!strcmp(expectedName,"$identitynormalmap")&&b==255&&g==128&&r==128&&a==128);mark(image,3);}
}
void Image_GenerateSpecularity(GfxImage *i){mark(i,4);}
void R_CreateOutdoorImage(GfxImage *i){mark(i,5);}
void Image_LoadLightmapWeights(GfxImage *i){mark(i,6);}
void Image_GenerateLightGridWeights(GfxImage *i,int sub){assert(sub==(!strcmp(expectedName,"$lightgridweights1")));mark(i,7+sub);}
void Image_GenerateWaterColor(GfxImage *i,byte b,byte g,byte r){assert(b==77&&g==64&&r==51);mark(i,9);}
void Image_GenerateSunHalfAngle(GfxImage *i){mark(i,10);}
void Com_Printf(const char *format,...) {
    assert(!strcmp(format,"ERROR: Unknown built-in image '%s'"));
    va_list args;va_start(args,format);assert(va_arg(args,const char*)==expectedName);va_end(args);++logs;
}
bool Image_LoadFromFile(GfxImage *i){assert(i==&allocated&&allocations==1);++fileLoads;return loadSuccess;}
void R_Error(int code,const char *format,...) {
    assert(code==1&&!strcmp(format,"failed to load image '%s'"));
    va_list args;va_start(args,format);assert(va_arg(args,const char*)==expectedName);va_end(args);++errors;
    if(throwError)throw std::runtime_error("expected");
}
'''+builtin+register+r'''
void reset(const char *name){expectedName=name;allocations=generator=errors=logs=lookups=fileLoads=0;}
int main() {
    const char *names[]={"$white","$black","$identitynormalmap","$specularity","$outdoor",
        "$lightmapweights","$lightgridweights0","$lightgridweights1","$watercolor","$sunhalfangle"};
    int cases=0;
    for(int index=0;index<10;++index)for(int track:{5,700})for(int semantic:{-1,1,257}) {
        reset(names[index]);expectedTrack=track;expectedSemantic=semantic;hit=false;
        assert(Image_Register(names[index],track,semantic)==&allocated);
        assert(lookups==1&&allocations==1&&generator==index+1&&!errors&&!logs&&!fileLoads);++cases;
    }
    for(const char *name:{"file","","$white","$unknown"})for(int cache=0;cache<2;++cache)
    for(int success=0;success<2;++success)for(int throws=0;throws<2;++throws) {
        reset(name);expectedTrack=5;expectedSemantic=257;hit=cache;loadSuccess=success;throwError=throws;
        bool failure=!hit&&((name[0]=='$'&&strcmp(name,"$white"))||(name[0]!='$'&&!loadSuccess));
        bool threw=false;GfxImage *result=0;
        try{result=Image_Register(name,5,257);}catch(const std::runtime_error&){threw=true;}
        assert(threw==(failure&&throwError)&&errors==int(failure)&&lookups==1);
        if(!threw)assert(result==(hit?&cached:failure?0:&allocated));
        assert(allocations==(!hit&&(name[0]!='$'||!strcmp(name,"$white"))));
        assert(fileLoads==(!hit&&name[0]!='$'));
        assert(logs==(!hit&&name[0]=='$'&&strcmp(name,"$white")!=0));++cases;
    }
    printf("PASS: %d actual builtin/file/cache image routes, semantic narrowing, identity alpha, allocation and error ownership\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_image_registration_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

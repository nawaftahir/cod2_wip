"""Actual material reload/picmip commands and live white-sampler binding."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
material = (work / 'src/gfx_d3d/r_material.cpp').read_text()
local = (work / 'src/gfx_d3d/r_local.h').read_text()

def declaration(text, name):
    start = text.index('struct ' + name + '\n{')
    return text[start:text.index('\n};', start)+3] + '\n'

types = ''.join(declaration(local, name) for name in ['Picmip', 'CardMemory', 'GfxImage'])
permanent = (work / 'src/gfx_d3d/r_permanent.h').read_text()
types += declaration(permanent, 'MaterialTextureDef') + declaration(material, 'Material')
source = (material[material.index('void Image_Reload('):material.index('// PINNED 100171f0/81:')] +
          material[material.index('Bool Image_LoadFromFile('):material.index('struct BuiltInMaterialTable')])
state = (work / 'src/gfx_d3d/rb_state.cpp').read_text()
binding = state[state.index('void RB_BindWhiteImages()'):state.index('void RB_InitImages()')]
image = (work / 'src/gfx_d3d/r_image.cpp').read_text()
picmip = image[image.index('void Image_PicmipForSemantic('):image.index('// PINNED: retail 0x1000c910;')]
program = r'''
#include <cassert>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <string>
#include <vector>
#include <stdexcept>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;
struct GfxImage;struct MaterialWaterDef;
union GfxTexture {void *basemap;};
''' + types + r'''
GfxImage images[4];Material m;MaterialTextureDef textures[8];Material *table[1024];
struct {int picmip,picmipBump,picmipSpec;} imageGlobals;
int wanted,argc,finds,setCalls,binds,releases,loads,errors;bool hit,failLoad,changeCount,changeWhite;
std::vector<GfxImage*> reloaded;
std::vector<std::string> prints;
struct {byte samplerState[16];} dxState;
struct {GfxImage *whiteImage;} rgp;
void RB_SetSampler(int index,byte sampler,GfxImage *image) {
    assert(index==binds&&sampler==dxState.samplerState[index]&&image==rgp.whiteImage);++binds;
    if(changeWhite&&index==0){rgp.whiteImage=&images[1];memset(dxState.samplerState+1,0x77,15);}
}
''' + binding + picmip + r'''
void Image_Reload(GfxImage *image) {assert(!finds||binds==16);reloaded.push_back(image);if(changeCount)m.textureCount=0;}
void Image_Release(GfxImage *image) {assert(image>=images&&image<images+4&&image->picmip.platform[0]==1);++releases;}
Bool Image_LoadFromFile(GfxImage *image) {
    assert(image->picmip.platform[0]==(image->noPicmip?0:wanted)&&releases==loads+1);++loads;return !failLoad;
}
void R_SetPicmip() {++setCalls;imageGlobals.picmip=imageGlobals.picmipBump=imageGlobals.picmipSpec=wanted;}
Material **R_GetMaterialHashTable(){return table;}
Material *Material_FindRegistered(const char *name) {assert(!strcmp(name,"requested"));++finds;return hit?&m:0;}
int count(){return argc;}
const char *arg(int index){assert(index==1);return "requested";}
void print(int channel,const char *format,...) {
    assert(channel==0);char out[256];va_list args;va_start(args,format);vsnprintf(out,sizeof(out),format,args);va_end(args);prints.push_back(out);
}
struct {int (*Cmd_Argc)();const char *(*Cmd_Argv)(int);void (*Printf)(int,const char*,...);} ri={count,arg,print};
char *va(const char *format,...) {
    static char out[256];va_list args;va_start(args,format);vsnprintf(out,sizeof(out),format,args);va_end(args);return out;
}
enum errorParm_t {ERR_DROP=1};
void R_Error(errorParm_t code,const char *format,...) {
    assert(code==ERR_DROP&&!strcmp(format,"failed to load image '%s'"));++errors;throw std::runtime_error("drop");
}
''' + source + r'''
void reset() {
    memset(images,0,sizeof(images));memset(&m,0,sizeof(m));memset(textures,0,sizeof(textures));memset(table,0,sizeof(table));
    m.textureCount=8;m.textures=textures;reloaded.clear();prints.clear();
    finds=setCalls=binds=releases=loads=errors=0;failLoad=changeCount=changeWhite=false;
    rgp.whiteImage=&images[0];for(int i=0;i<16;++i)dxState.samplerState[i]=i;
    for(int i=0;i<4;++i){images[i].name="image";images[i].semantic=2;images[i].picmip.platform[0]=1;images[i].picmip.platform[1]=99;}
    int order[8]={1,3,1,0,2,3,0,2};
    for(int i=0;i<8;++i){textures[i].semantic=i==4?5:1;textures[i].u.image=i==6?0:&images[order[i]];}
}
int main() {
    static_assert(sizeof(GfxImage)==36&&sizeof(Material)==68&&sizeof(MaterialTextureDef)==12,"PC image/material layout");int cases=0;
    for(int mutate=0;mutate<2;++mutate) {
        reset();changeCount=mutate;Material_ReloadTextures(&m);
        assert(reloaded.size()==4);for(int i=0;i<4;++i)assert(reloaded[i]==&images[3-i]);++cases;
    }
    for(argc=0;argc<4;++argc)for(int found=0;found<2;++found) {
        reset();hit=found;changeWhite=true;Material_ReloadTextures_f();
        if(argc!=2)assert(!finds&&!binds&&reloaded.empty()&&prints.size()==1&&prints[0]=="Usage: reloadmaterialtextures <materialname>\n");
        else if(!hit)assert(finds==1&&!binds&&reloaded.empty()&&prints.size()==1&&prints[0]=="ReloadMaterialTextures: Material 'requested' is not currently loaded.\n");
        else assert(finds==1&&binds==16&&prints.empty()&&reloaded.size()==4);
        ++cases;
    }
    for(wanted=0;wanted<4;++wanted)for(int fixed=0;fixed<2;++fixed)for(int fail=0;fail<2;++fail) {
        reset();failLoad=fail;
        for(auto &image:images)image.noPicmip=fixed;
        table[0]=table[1023]=&m;bool caught=false;
        try{R_ApplyPicmip_f();}catch(const std::runtime_error&){caught=true;}
        bool changes=fixed||wanted!=1;assert(setCalls==1&&caught==bool(changes&&fail));
        if(!changes)assert(!releases&&!loads&&!errors&&images[0].picmip.platform[1]==99);
        else if(fail)assert(releases==1&&loads==1&&errors==1);
        else {
            assert(releases==4&&loads==4&&!errors);
            for(auto &image:images)assert(image.picmip.platform[0]==(fixed?0:wanted)&&image.picmip.platform[1]==(fixed?0:2));
        }
        ++cases;
    }
    printf("PASS: %d actual material command routes, address-ordered unique reloads, live sampler/white state, hash lookup, picmip platform-zero guard and failure ownership\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_material_commands_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

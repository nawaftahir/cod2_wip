"""Exercise real binary fixup, file ownership and material registration source."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('GfxImage *Image_Register('):]
material = (work / 'src/gfx_d3d/r_material.cpp').read_text()
register = material[material.index('Material *Material_Register('):material.index('void RB_SetFVF(')]
types = (work.parents[0] / 'src/opencod2/headers/common_types.h').read_text()

def declaration(name):
    start = types.index('struct ' + name + ' {')
    return types[start:types.index('\n};', start) + 3] + '\n'

declarations = ''.join(declaration(name) for name in [
    'MaterialConstantDefObj', 'MaterialInfo', 'MaterialTechniqueSet',
    'MaterialTextureDef', 'MaterialWaterDef', 'WaterWritable', 'water_t', 'Material'])
program = r'''
#include <cassert>
#include <cstdint>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <string>
#include <vector>
#include <stdexcept>
typedef unsigned char byte;
typedef float vec2_t[2];typedef float vec4_t[4];
typedef byte GfxSamplerState;typedef byte TextureSemantic;
typedef int fileHandle_t;
struct complex_t;struct water_t;struct MaterialWaterDef;struct MaterialTextureDef;
struct MaterialTechniqueSet;struct Material;
struct GfxImage {} image;
struct MaterialTechnique {} technique;
typedef struct MaterialConstantDefObj MaterialConstantDef;
union MaterialTextureDefInfo {GfxImage *image;MaterialWaterDef *water;};
''' + declarations + r'''
MaterialTechniqueSet set;water_t waterMap;
struct {struct {int integer;} current;} renderer;
auto r_rendererInUse=&renderer;
std::vector<std::string> events;
std::string failIntern;
bool imageFail,waterFail,setFail,validateFail,hit,loadFail;
int validationCalls,images,waters,expectedTrack=7,fileLength,readResult;
byte buffer[1024];Material *m=(Material*)buffer;
Material loaded,defaultMaterial,duplicate;
Material *table[1024];
struct {const Material *defaultMaterial;} rgp;
enum {ERR_FATAL=0};
void Com_Printf(const char *format,...) {
    char out[256];va_list args;va_start(args,format);vsnprintf(out,sizeof(out),format,args);va_end(args);
    events.push_back(out);
}
int Com_sprintf(char *out,unsigned length,const char *format,...) {
    va_list args;va_start(args,format);int n=vsnprintf(out,length,format,args);va_end(args);return n;
}
const char *Material_RegisterString(const char *name) {
    events.push_back(std::string("intern:")+name);return failIntern==name?0:name;
}
GfxImage *Image_Register(const char *name,int track,int semantic) {
    assert(!strcmp(name,"image")&&track==expectedTrack&&semantic!=5);++images;
    return imageFail?0:&image;
}
water_t *R_LoadWaterSetup(const water_t *water) {
    assert(water->M==3&&water->N==3&&water->Lx==11&&water->Lz==13&&water->gravity==800);
    assert(water->windvel==17&&water->winddir[0]==19&&water->winddir[1]==23);
    assert(water->amplitude==29&&!water->image);++waters;return waterFail?0:&waterMap;
}
MaterialTechniqueSet *Material_LoadCachedTechniqueSet(const char *name) {
    assert(!strcmp(name,"set"));events.push_back("techset");return setFail?0:&set;
}
bool Material_ValidateTechnique(const Material *in,const char *name,const MaterialTechnique *tech) {
    assert(in==m&&!strcmp(name,"set")&&tech==&technique);++validationCalls;return !validateFail;
}
int openFile(const char *path,int *handle,int unique) {
    assert(!strncmp(path,"materials/",10)&&unique==1);*handle=42;events.push_back("open");return fileLength;
}
void closeFile(int handle) {assert(handle==42);events.push_back("close");}
void *allocate(int length) {assert(length==1024);events.push_back("alloc");return buffer;}
int readFile(void *ptr,int length,int handle) {
    assert(ptr==buffer&&length==1024&&handle==42);events.push_back("read");return readResult;
}
struct {int (*FS_FOpenFileRead)(const char*,int*,int);void (*FS_FCloseFile)(int);
    void *(*Hunk_AllocInternal)(int);int (*FS_Read)(void*,int,int);} ri={openFile,closeFile,allocate,readFile};
''' + source.replace('Material *Material_LoadBinary(', 'Material *Actual_LoadBinary(') + r'''
Material **R_GetMaterialHashTable() {return table;}
void Material_FindHashSlot(const char *name,unsigned short *slot,bool *found) {
    assert(!strcmp(name,"requested"));events.push_back("lookup");*slot=37;*found=hit;
}
Material *Material_LoadBinary(const char *name,int track) {
    assert(!strcmp(name,"requested")&&track==expectedTrack);events.push_back("load");return loadFail?0:&loaded;
}
void Material_AddToTable(Material *value,unsigned short slot) {
    assert(value==&loaded&&slot==37);events.push_back("add");
}
Material *Material_Duplicate(const Material *value,const char *name) {
    assert(value==&defaultMaterial&&!strcmp(name,"requested"));events.push_back("duplicate");return &duplicate;
}
void R_Error(int code,const char *message) {
    assert(code==ERR_FATAL&&!strcmp(message,"couldn't load material '$default'"));throw std::runtime_error("fatal");
}
''' + register + r'''
void reset(int semantic=1) {
    memset(buffer,0,sizeof(buffer));memset(&set,0,sizeof(set));
    events.clear();failIntern.clear();imageFail=waterFail=setFail=validateFail=false;
    validationCalls=images=waters=0;renderer.current.integer=0;
    m->info.name=(const char*)400;m->info.refImageName=0;
    m->textureCount=m->constantCount=1;m->textures=(MaterialTextureDef*)80;
    m->constants=(MaterialConstantDef*)104;m->techniqueSet=(MaterialTechniqueSet*)440;
    auto *texture=(MaterialTextureDef*)(buffer+80);texture->name=(const char*)420;
    texture->semantic=semantic;texture->samplerState=0x5a;texture->u.image=(GfxImage*)460;
    auto *constant=(MaterialConstantDef*)(buffer+104);constant->name=(const char*)430;
    for(int i=0;i<4;++i)constant->literal[i]=float(31+i);
    strcpy((char*)buffer+400,"material");strcpy((char*)buffer+420,"texture");
    strcpy((char*)buffer+430,"constant");strcpy((char*)buffer+440,"set");strcpy((char*)buffer+460,"image");
    if(semantic==5) {
        texture->u.water=(MaterialWaterDef*)160;auto *water=(MaterialWaterDef*)(buffer+160);
        water->textureWidth=65539;water->horizontalWorldLength=11;water->verticalWorldLength=13;
        water->windSpeed=17;water->windDirection[0]=19;water->windDirection[1]=23;water->amplitude=29;
    }
    set.name="set";set.techniques[0]=set.techniques[33]=&technique;
}
int main() {
    int cases=0;
    for(int mode:{0,2})for(int semantic:{1,3,4,5})for(int failure=0;failure<7;++failure) {
        reset(semantic);renderer.current.integer=mode;
        if(failure==1)imageFail=true;if(failure==2)waterFail=true;
        if(failure==3)failIntern="texture";if(failure==4)failIntern="constant";
        if(failure==5)setFail=true;if(failure==6)validateFail=true;
        bool skip=mode==2&&(semantic==3||semantic==4);
        bool expected=!(failure==4||failure==5||failure==6||(failure==1&&semantic!=5&&!skip)||(failure==2&&semantic==5));
        assert(Material_FixupBinary(m,expectedTrack)==expected);
        auto *texture=(MaterialTextureDef*)(buffer+80);
        assert(m->info.name==(const char*)buffer+400&&m->info.refImageName==(const char*)buffer);
        assert(m->textures==texture&&texture->samplerState==0x5a);
        assert(texture->name==(failure==3?0:(const char*)buffer+420));
        assert(images==int(semantic!=5&&!skip)&&waters==int(semantic==5));
        if(skip)assert(!texture->u.image);
        if(semantic==5)assert(texture->u.water==(MaterialWaterDef*)(buffer+160));
        if(expected) {
            assert(m->constants==(MaterialConstantDef*)(buffer+104)&&m->techniqueSet==&set&&validationCalls==2);
            for(int i=0;i<4;++i)assert(m->constants[0].literal[i]==float(31+i));
        }
        if(failure==6)assert(validationCalls==1);
        ++cases;
    }
    reset();m->textureCount=m->constantCount=0;m->textures=0;m->constants=0;
    assert(Material_FixupBinary(m,7)&&m->textures==(MaterialTextureDef*)buffer&&m->constants==(MaterialConstantDef*)buffer);++cases;
    for(int length:{-1,0,1024})for(const char *name:{"sample","$default"})for(int fail=0;fail<2;++fail) {
        reset();fileLength=length;readResult=-1;setFail=fail;
        Material *result=Actual_LoadBinary(name,7);assert(result==(length>0&&!fail?m:0));
        if(length<0)assert(events.size()==size_t(name[0]=='$'?1:2)&&events[0]=="open");
        if(!length)assert(events.size()==3&&events[1]=="close");
        if(length>0)assert(events[0]=="open"&&events[1]=="alloc"&&events[2]=="read"&&events[3]=="close"&&events[4]=="intern:texture");
        ++cases;
    }
    for(int cached=0;cached<2;++cached)for(int missing=0;missing<2;++missing)for(int haveDefault=0;haveDefault<2;++haveDefault) {
        events.clear();hit=cached;loadFail=missing;rgp.defaultMaterial=haveDefault?&defaultMaterial:0;table[37]=&loaded;
        bool caught=false;Material *result=0;
        try{result=Material_Register("requested",7);}catch(const std::runtime_error&){caught=true;}
        assert(caught==bool(!cached&&missing&&!haveDefault));
        if(cached)assert(result==&loaded&&events.size()==1);
        else if(!missing)assert(result==&loaded&&events.back()=="add"&&events.size()==3);
        else if(haveDefault)assert(result==&duplicate&&events.size()==4&&events[2]=="^3WARNING: Could not find material 'requested'\n"&&events[3]=="duplicate");
        else assert(events.size()==2);
        ++cases;
    }
    printf("PASS: %d actual material fixup/load/register routes, PC layouts, DX7 skips, water, partial failures and permanent ownership\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_material_binary_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)

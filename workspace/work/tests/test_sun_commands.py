"""Actual sun serialization, loading, command gates and field publication."""
from pathlib import Path
import json
import re
import struct
import subprocess
import tempfile
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_sky.cpp').read_text()
load = (work / 'src/gfx_d3d/r_sky_load_obj.cpp').read_text()
source = text[text.index('const char *sunDvarNames[]'):] + load[load.index('// PINNED 100291c0/'):]
declarations = text[text.index('const dvar_t *r_sunsprite_shader;'):text.index('void R_RegisterSunDvars()')]
names = re.findall(r'const dvar_t \*(\w+);', declarations)
assert len(names) == 21
common = (work.parent / 'src/opencod2/headers/common_types.h').read_text()
start = common.index('struct sunflare_t {')
sun = common[start:common.index('\n};', start)+3]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
expected = [retail.get_string_at_rva(struct.unpack('<I', retail.get_data(0x1a5a38+i*4,4))[0]-0x10000000).decode() for i in range(21)]
program = r'''
#include <cassert>
#include <cstddef>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <cmath>
#include <cfenv>
#include <string>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef float vec3_t[3];
struct Material {} spriteMaterial,flareMaterial,defaultMaterial;
''' + sun + r'''
struct GfxWorld {byte prefix[0x160];sunflare_t sun;} world;
struct {Material *defaultMaterial;GfxWorld *world;} rgp;
struct dvar_t {union {const char *string;float value;float *vector;Bool enabled;} current;} values[21],cheats;
const dvar_t *sv_cheats=&cheats;
''' + declarations + r'''
const dvar_t **slots[]={''' + ','.join('&'+n for n in names) + r'''};
const char *expectedNames[]={''' + ','.join(json.dumps(s) for s in expected) + r'''};
float angles[3]={30,60,90};char argument[]="sample";char file[]="sun-file";
sunflare_t *expectedSun;
int argc,readLength,materials,rounds,vectors,reads,parses,frees,saves,writes;
bool parseSuccess,saveSuccess;
std::vector<std::string> events,prints;
void checkNames(const char **names,int count) {
    assert(count==21);for(int i=0;i<21;++i)assert(!strcmp(names[i],expectedNames[i]));
}
char *va(const char *format,...) {
    static char buffer[256];va_list args;va_start(args,format);vsnprintf(buffer,sizeof(buffer),format,args);va_end(args);return buffer;
}
void message(const char *format,va_list args) {char buffer[256];vsnprintf(buffer,sizeof(buffer),format,args);prints.push_back(buffer);}
void print(int channel,const char *format,...) {assert(channel==0);va_list args;va_start(args,format);message(format,args);va_end(args);}
void Com_Memset(void *dest,int value,int size){memset(dest,value,size);}
void I_strncpyz(char *dest,const char *src,int size){strncpy(dest,src,size-1);dest[size-1]=0;}
void Com_Printf(const char *format,...) {va_list args;va_start(args,format);message(format,args);va_end(args);}
int count(){return argc;}
char *arg(int index){assert(index==1);return argument;}
Material *Material_Register(const char *name,int track) {
    assert(track==6);++materials;if(!strcmp(name,"sprite"))return &spriteMaterial;assert(!strcmp(name,"flare"));return &flareMaterial;
}
int I_fround(float value) {++rounds;return lrint((double)value+1.0/(1<<30));}
void AngleVectors(const float *input,float *forward,float *right,float *up) {
    assert(input==angles&&forward==expectedSun->sunFxPosition&&!right&&!up);++vectors;
    forward[0]=31;forward[1]=37;forward[2]=41;events.push_back("populate");
}
int readFile(const char *path,void **out) {assert(!strcmp(path,"sun/sample.sun"));++reads;*out=file;events.push_back("read");return readLength;}
void freeFile(void *data) {
    assert(data==file&&events.back()==(parseSuccess?"populate":"parse"));++frees;events.push_back("free");
}
int parse(const char **names,int n,const char *buffer,const char *path) {
    checkNames(names,n);assert(buffer==file&&!strcmp(path,"sun/sample.sun"));++parses;events.push_back("parse");return parseSuccess;
}
int serialize(const char **names,int n,char *buffer,int size) {
    checkNames(names,n);assert(size==8192);++saves;strcpy(buffer,"saved\n");events.push_back("save");return saveSuccess;
}
int writeFile(const char *path,const void *buffer,int size) {
    assert(!strcmp(path,"sun/sample.sun")&&size==6&&!memcmp(buffer,"saved\n",6)&&events.back()=="save");
    ++writes;events.push_back("write");return -1;
}
struct {int (*Cmd_Argc)();char *(*Cmd_Argv)(int);void (*Printf)(int,const char*,...);
    int (*FS_ReadFile)(const char*,void**);void (*FS_FreeFile)(void*);
    int (*Com_LoadDvarsFromBuffer)(const char**,int,const char*,const char*);
    int (*Com_SaveDvarsToBuffer)(const char**,int,char*,int);int (*FS_WriteFile)(const char*,const void*,int);
} ri={count,arg,print,readFile,freeFile,parse,serialize,writeFile};
''' + source + r'''
void reset() {
    for(int i=0;i<21;++i){*slots[i]=&values[i];values[i].current.value=float(i+1);}
    values[0].current.string="sprite";values[2].current.string="flare";values[20].current.vector=angles;
    int indices[6]={8,9,13,14,18,19};float times[6]={0.0005f,0.0015f,0.0025f,1.2345f,3.1405f,0};
    for(int i=0;i<6;++i)values[indices[i]].current.value=times[i];
    memset(&world.sun,0x5a,sizeof(world.sun));expectedSun=&world.sun;
    rgp.defaultMaterial=&defaultMaterial;rgp.world=&world;
    materials=rounds=vectors=reads=parses=frees=saves=writes=0;events.clear();prints.clear();
}
int main() {
    int cases=0;
    for(int rounding:{FE_TONEAREST,FE_DOWNWARD,FE_UPWARD,FE_TOWARDZERO})for(int emptySprite=0;emptySprite<2;++emptySprite)for(int emptyFlare=0;emptyFlare<2;++emptyFlare) {
        reset();fesetround(rounding);if(emptySprite)values[0].current.string="";if(emptyFlare)values[2].current.string="";
        R_SetSunFromDvars(expectedSun);auto &s=world.sun;
        assert(s.hasValidData==1&&materials==2-emptySprite-emptyFlare&&rounds==6&&vectors==1);
        assert(s.spriteMaterial==(emptySprite?&defaultMaterial:&spriteMaterial)&&s.flareMaterial==(emptyFlare?&defaultMaterial:&flareMaterial));
        assert(s.spriteSize==2&&s.flareMinSize==2&&s.flareMaxSize==3&&s.flareMaxAlpha==8);
        assert(s.blindMaxDarken==13&&s.glareMaxLighten==18&&s.sunFxPosition[0]==31&&s.sunFxPosition[1]==37&&s.sunFxPosition[2]==41);
        int indices[6]={4,6,10,11,15,16};float actual[6]={s.flareMinDot,s.flareMaxDot,s.blindMinDot,s.blindMaxDot,s.glareMinDot,s.glareMaxDot};
        for(int i=0;i<6;++i)assert(fabs(actual[i]-cos((float)(values[indices[i]].current.value*0.017453292f)))<0.000001);
        int timeIndices[6]={8,9,13,14,18,19};int times[6]={s.flareFadeInTime,s.flareFadeOutTime,s.blindFadeInTime,s.blindFadeOutTime,s.glareFadeInTime,s.glareFadeOutTime};
        for(int i=0;i<6;++i)assert(times[i]==lrint((double)(float)(values[timeIndices[i]].current.value*1000.0f)+1.0/(1<<30)));
        assert(((byte*)&s)[1]==0x5a&&((byte*)&s)[2]==0x5a&&((byte*)&s)[3]==0x5a);++cases;
    }
    fesetround(FE_TONEAREST);
    for(argc=0;argc<4;++argc)for(int cheat=0;cheat<2;++cheat)for(int loaded=0;loaded<2;++loaded)
    for(int length:{-1,0,8})for(int success=0;success<2;++success) {
        reset();readLength=length;cheats.current.enabled=cheat;rgp.world=loaded?&world:0;parseSuccess=success;
        byte before[96];memcpy(before,&world.sun,96);R_LoadSun_f();
        bool load=argc==2&&cheat&&loaded;assert(reads==int(load));
        if(!load)assert(prints.size()==1&&!parses&&!frees&&!vectors);
        else if(readLength<0)assert(prints.size()==1&&!parses&&!frees&&!vectors);
        else assert(prints.empty()&&parses==1&&frees==1&&vectors==int(success));
        if(!vectors)assert(!memcmp(before,&world.sun,96));++cases;
    }
    for(argc=0;argc<4;++argc)for(int cheat=0;cheat<2;++cheat)for(int loaded=0;loaded<2;++loaded)for(int success=0;success<2;++success) {
        reset();cheats.current.enabled=cheat;rgp.world=loaded?&world:0;saveSuccess=success;R_SaveSun_f();
        assert(saves==int(argc==2)&&writes==int(argc==2&&success)&&prints.size()==size_t(argc!=2)&&!reads&&!vectors);++cases;
    }
    printf("PASS: %d actual sun routes, 21 retail dvar names, PC layout, rounding modes, material track/defaults, parse/free order and load/save command gates\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_sun_commands_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-frounding-math','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

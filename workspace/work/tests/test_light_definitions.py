"""Actual packed light loading, single registry ownership and default/error paths."""
from pathlib import Path
import subprocess
import tempfile
import pefile
import capstone

work = Path(__file__).resolve().parents[1]
retail = pefile.PE(str(work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'))
assert retail.get_string_at_rva(0x1942b4) == b'lights/%s'
assert retail.get_string_at_rva(0x194250) == b'light_dynamic'
decoder = capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
ops = [(i.mnemonic,i.op_str) for i in decoder.disasm(retail.get_data(0x14c60,243),0x10014c60)]
assert ops[-1] == ('ret','')
at = ops.index(('push','0x10194260'))
assert ops[at-1:at+3] == [('push','eax'),('push','0x10194260'),('push','1'),('call','0x100138c0')]
header = (work / 'src/gfx_d3d/r_light.h').read_text().replace('#pragma once','')
text = (work / 'src/gfx_d3d/r_light.cpp').read_text()
load = (work / 'src/gfx_d3d/r_light_load_obj.cpp').read_text()
source = load[load.index('// PINNED 10015090/'):] + text[text.index('struct LightGlobals'):text.index('// Point-light scene gathering.')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdarg>
#include <cctype>
#include <strings.h>
#include <string>
#include <vector>
#include <map>
#include <stdexcept>
#include <initializer_list>
typedef unsigned char byte;
enum {ERR_DROP=1};
struct GfxImage {} cookieImage,attenImage;
'''+header+r'''
std::map<std::string,std::vector<byte>> files;
std::vector<std::vector<byte>> blocks;
std::vector<std::string> reads,images;
int freed,errors,prints;
byte emptyFile;
int Read(const char *path,void **buffer) {
    reads.push_back(path);auto found=files.find(path);if(found==files.end())return -1;
    *buffer=found->second.empty()?&emptyFile:found->second.data();return found->second.size();
}
void Free(void *buffer) {
    bool owned=buffer==&emptyFile;
    for(auto &file:files)owned|=buffer==file.second.data();assert(owned);++freed;
}
void *Alloc(int size) {assert(size>0);blocks.push_back(std::vector<byte>(size,0x5a));return blocks.back().data();}
void Print(int channel,const char *format,...) {
    assert(channel==0&&(!strcmp(format,"Loaded light defs:\n")||!strcmp(format,"%s\n")));++prints;
}
struct {int (*FS_ReadFile)(const char*,void**);void (*FS_FreeFile)(void*);void *(*Hunk_AllocInternal)(int);void (*Printf)(int,const char*,...);} ri={Read,Free,Alloc,Print};
char *va(const char *format,...) {static char out[512];va_list args;va_start(args,format);vsnprintf(out,sizeof(out),format,args);va_end(args);return out;}
GfxImage *Image_Register(const char *name,int semantic,int track) {
    assert(track==5&&semantic==1);images.push_back(name);return images.size()==1?&cookieImage:&attenImage;
}
char *I_strlwr(char *name){for(char *p=name;*p;++p)*p=tolower((unsigned char)*p);return name;}
int _stricmp(const char *left,const char *right){return strcasecmp(left,right);}
void R_Error(int code,const char *format,...) {
    assert(code==1);va_list args;va_start(args,format);
    if(!strcmp(format,"Can't load light def %s; %i unique light defs already loaded"))assert(va_arg(args,int)==64);
    else {assert(!strcmp(format,"Can't load the default light def '%s'"));assert(!_stricmp(va_arg(args,const char*),"light_dynamic"));}
    va_end(args);++errors;throw std::runtime_error("expected retail error");
}
'''+source+r'''
std::vector<byte> packed(int type,const char *cookie,const char *atten) {
    std::vector<byte> data={(byte)type,17};
    data.insert(data.end(),cookie,cookie+strlen(cookie)+1);data.push_back(255);
    data.insert(data.end(),atten,atten+strlen(atten)+1);return data;
}
void reset() {files.clear();blocks.clear();blocks.reserve(256);reads.clear();images.clear();freed=errors=prints=0;memset(&lightGlobals,0,sizeof(lightGlobals));}
int main() {
    int cases=0;
    for(int type:{0,1,255})for(const char *cookie:{"","cookie/ABC"})for(const char *atten:{"","atten/DEF"}) {
        reset();files["lights/MiXeD"]=packed(type,cookie,atten);
        GfxLightDef *def=R_LoadLightDef("MiXeD");
        assert(def&&def->type==type&&!strcmp(def->name,"mixed"));
        assert(blocks.size()==2&&blocks[0].size()==24&&blocks[1].size()==6&&freed==1);
        assert(def->cookie.samplerState==17&&def->attenuation.samplerState==255);
        assert(bool(def->cookie.image)==bool(*cookie)&&bool(def->attenuation.image)==bool(*atten));
        assert(images.size()==bool(*cookie)+bool(*atten));assert(!lightGlobals.count&&!errors);++cases;
    }
    for(int empty=0;empty<2;++empty) {
        reset();if(empty)files["lights/missing"]={};assert(!R_LoadLightDef("missing"));
        assert(freed==empty&&blocks.empty()&&reads.size()==1);++cases;
    }
    reset();files["lights/Foo"]=packed(1,"cookie","");auto *first=R_RegisterLightDef("Foo");
    assert(first&&lightGlobals.count==1&&R_RegisterLightDef("fOO")==first&&reads.size()==1);
    files["lights/light_dynamic"]=packed(2,"","");auto *fallback=R_RegisterLightDef("missing");
    assert(fallback!=first&&!strcmp(fallback->name,"light_dynamic")&&lightGlobals.count==2);
    auto readCount=reads.size();assert(R_RegisterLightDef("missing")==fallback&&reads.size()==readCount+1&&lightGlobals.count==2);cases+=3;
    for(const char *name:{"missing","LIGHT_DYNAMIC"}) {
        reset();bool caught=false;try{R_RegisterLightDef(name);}catch(const std::runtime_error&){caught=true;}
        assert(caught&&errors==1&&lightGlobals.count==0&&reads.size()==(!strcmp(name,"missing")?2:1));++cases;
    }
    reset();GfxLightDef existing[64]={};std::string labels[64];
    for(int index=0;index<64;++index){labels[index]="light"+std::to_string(index);existing[index].name=labels[index].c_str();lightGlobals.defs[index]=&existing[index];}
    lightGlobals.count=64;assert(R_RegisterLightDef("LIGHT63")==&existing[63]&&reads.empty());
    bool caught=false;try{R_RegisterLightDef("new");}catch(const std::runtime_error&){caught=true;}
    assert(caught&&errors==1&&prints==65&&reads.empty()&&lightGlobals.count==64);cases+=2;
    printf("PASS: %d actual light routes, packed layout, empty/missing files, hunk ownership, case-insensitive registry, fallback and exact capacity error call\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_light_definitions_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

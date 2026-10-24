"""Actual two-pass entity loading, classname reservation, heap strings and publication."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_bsp_load_obj.cpp').read_text()
source = text[text.index('// PINNED 10003880: both passes'):text.index('// PINNED 10003f90')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <strings.h>
#include <cstdarg>
#include <string>
#include <vector>
#include <initializer_list>
#define __forceinline inline
#define _stricmp strcasecmp
typedef unsigned char byte;typedef unsigned char Bool;
enum errorParm_t {ERR_FATAL,ERR_DROP};
struct Failure {};
void R_Error(errorParm_t code,const char *format,...) {assert(code==ERR_DROP&&format[0]==21);throw Failure();}
struct GfxStaticModelInstance {byte data[96];};
struct GfxWorld {int smodelCount;GfxStaticModelInstance *smodelInsts;} s_world;
struct lump_t {int filelen,fileofs;};
struct dheader_t {int magic,version;lump_t lumps[39];};
struct GfxBspLoad {const dheader_t *header;const byte *fileBase;};
std::vector<int> events;
std::vector<std::string> counted,loaded;
std::vector<void*> allocations;
int modelBytes,tempBytes,expectedModels,parseCalls;
void *tempAlloc(int size) {assert(events.empty()&&size==tempBytes);events.push_back(1);void *p=malloc(size?size:1);allocations.push_back(p);return p;}
void *alloc(int size) {assert(events.size()==1&&size==expectedModels*96);events.push_back(2);modelBytes=size;void *p=malloc(size?size:1);allocations.push_back(p);return p;}
void clear() {assert(events.back()==5);events.push_back(6);}
struct {void *(*Hunk_AllocateTempMemoryInternal)(int);void *(*Hunk_AllocInternal)(int);void (*Hunk_ClearTempMemory)();} ri={tempAlloc,alloc,clear};
char *Com_Parse(const char **text) {
    static char token[1024];++parseCalls;
    if(!*text||!**text){*text=0;token[0]=0;return token;}
    size_t n=strlen(*text);assert(n<sizeof(token));memcpy(token,*text,n+1);*text+=n+1;return token;
}
const char *find(const char *(*vars)[2],int count,const char *key) {
    for(int i=1;i<count;++i)if(!strcmp(vars[i][0],key))return vars[i][1];return "";
}
Bool R_IsValidStaticModel(const char *(*vars)[2],int count,void*,void*) {
    const char *name=find(vars,count,"model");counted.push_back(name);return strcmp(name,"skip")!=0;
}
void R_LoadMiscModel(const char *(*vars)[2],int count) {
    assert(events.back()==3);const char *name=find(vars,count,"model");loaded.push_back(name);
    if(strcmp(name,"skip"))++s_world.smodelCount;
}
void R_PrepareStaticModelLightingCache(GfxWorld *world,int count) {
    assert(world==&s_world&&world->smodelCount==0&&count==expectedModels&&events.back()==2);
    assert(world->smodelInsts==allocations[1]);events.push_back(3);
}
void R_FinishStaticModelLightingCache(GfxWorld *world) {
    assert(world==&s_world&&world->smodelCount==expectedModels&&events.back()==3);events.push_back(4);
}
void R_BuildCellAabbTrees() {assert(events.back()==4);events.push_back(5);}
''' + source + r'''
void run(const std::vector<std::string> &tokens,int models,int misc,bool error=false) {
    for(void *p:allocations)free(p);allocations.clear();events.clear();counted.clear();loaded.clear();parseCalls=0;
    std::string bytes(128,'x');for(auto &token:tokens){bytes+=token;bytes+='\0';}bytes+='\0';
    dheader_t header={};tempBytes=int(bytes.size())-128;header.lumps[37]={tempBytes,128};
    GfxBspLoad load={&header,(const byte*)bytes.data()};s_world={79,(GfxStaticModelInstance*)0x1234};expectedModels=models;
    bool threw=false;try{R_LoadEntities(&load);}catch(Failure&){threw=true;}
    assert(threw==error);
    if(!error) {
        assert((events==std::vector<int>{1,2,3,4,5,6}));
        assert(s_world.smodelCount==models&&modelBytes==models*96);
        assert(counted.size()==size_t(misc)&&loaded.size()==size_t(misc)&&counted==loaded);
    } else assert(events==std::vector<int>{1});
}
int main() {
    run({},0,0);
    run({"{","classname","worldspawn","}","{","classname","misc_model","model","one","}"},1,1);
    run({"{","model","one","classname","MISC_MODEL","}","{","classname","misc_model","model","skip","}",
        "{","classname","misc_model","model","two","}"},2,3);
    run({"{","classname","worldspawn","classname","misc_model","model","one","}"},1,1);
    run({"{","model","missing_class","}"},0,0,true);
    run({"{","ClassName","misc_model","model","wrong_case","}"},0,0,true);
    std::vector<std::string> tokens={"{","classname","misc_model","model","one"};
    for(int i=1;i<63;++i){tokens.push_back("key"+std::to_string(i));tokens.push_back("value"+std::to_string(i));}
    tokens.push_back("}");run(tokens,1,1);
    tokens.pop_back();tokens.push_back("overflow");tokens.push_back("value");tokens.push_back("}");run(tokens,0,0,true);
    for(void *p:allocations)free(p);
    puts("PASS: actual two-pass entities, classname slot/case/duplicates, shared token-buffer copies, model count/allocation, invalid filtering, 63-key limit and publication/cleanup order");
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_static_model_entities_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

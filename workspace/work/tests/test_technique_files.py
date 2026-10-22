"""Actual DX7/DX9 technique-file source, pass caps, ownership and header writes."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('// PINNED 1001b810..'):text.index('// PINNED 1001bde0:')]
program = r'''
#include <cassert>
#include <cstdint>
#include <cstring>
#include <cstdio>
#include <cstdarg>
#include <string>
#include <vector>
typedef unsigned char byte;
typedef byte Bool;
struct MaterialPassDx9 {byte data[28];};
struct MaterialPassDx7 {byte data[92];};
union MaterialPassArray {MaterialPassDx9 dx9[1];MaterialPassDx7 dx7[1];};
struct MaterialTechnique {const char *name;unsigned short flags,passCount;MaterialPassArray passArray;};
static_assert(sizeof(void*)==4&&__builtin_offsetof(MaterialTechnique,passArray)==8,"PC header");
bool dx7,readFailure;
int position,passCalls,failPass,allocations,begins,ends,frees;
std::vector<std::string> tokens,warnings,events;
std::vector<byte> allocated;
const char expectedName[]="sample";
char fileData[]="fixture";
int Com_sprintf(char *dest,unsigned size,const char *format,...) {
    va_list args;va_start(args,format);int n=vsnprintf(dest,size,format,args);va_end(args);return n;
}
void Com_ScriptWarning(const char *format,...) {
    char out[256];va_list args;va_start(args,format);vsnprintf(out,sizeof(out),format,args);va_end(args);warnings.push_back(out);
}
int readFile(const char *path,void **out) {
    assert(!strcmp(path,dx7?"materials_dx7/techniques/sample.tech":"materials/techniques/sample.tech"));
    events.push_back("read");if(readFailure)return -1;*out=fileData;return 0;
}
void freeFile(void *ptr) {assert(ptr==fileData&&ends==1);++frees;events.push_back("free");}
void *allocate(int size) {assert(frees==1&&ends==1);++allocations;allocated.assign(size,0xcc);events.push_back("alloc");return allocated.data();}
struct {int (*FS_ReadFile)(const char *,void **);void (*FS_FreeFile)(void *);void *(*Hunk_AllocInternal)(int);} ri={readFile,freeFile,allocate};
void Com_BeginParseSession(const char *path) {assert(strstr(path,"sample.tech"));++begins;events.push_back("begin");}
void Com_SetScriptWarningPrefix(const char *prefix) {assert(!strcmp(prefix,"^1ERROR: "));}
void Com_SetSpaceDelimited(int enabled) {assert(enabled==0);}
void Com_EndParseSession() {assert(begins==1);++ends;events.push_back("end");}
const char *Com_Parse(const char **) {return position<int(tokens.size())?tokens[position++].c_str():"";}
int Com_MatchToken(const char **text,const char *match,int warning) {assert(warning==1);return !strcmp(Com_Parse(text),match);}
Bool Material_LoadPassDx9(const char **text,MaterialPassDx9 *pass,byte *flags) {
    assert(!dx7&&!strcmp(Com_Parse(text),"pass"));memset(pass,0x30+passCalls,sizeof(*pass));
    *flags|=1<<passCalls;++passCalls;return passCalls!=failPass;
}
Bool Material_LoadPassDx7(const char **text,MaterialPassDx7 *pass) {
    assert(dx7&&!strcmp(Com_Parse(text),"pass"));memset(pass,0x30+passCalls,sizeof(*pass));++passCalls;return passCalls!=failPass;
}
'''+source+r'''
int main() {
    int cases=0;
    for(int mode=0;mode<2;++mode)for(int passes=0;passes<=5;++passes)for(int failure=0;failure<4;++failure) {
        dx7=mode;readFailure=failure==1;position=passCalls=allocations=begins=ends=frees=0;
        warnings.clear();events.clear();tokens.clear();failPass=failure==2?1:0;
        for(int i=0;i<passes;++i) {tokens.push_back("{");tokens.push_back("pass");tokens.push_back(failure==3&&i==0?"bad":"}");}
        MaterialTechnique *tech=dx7?Material_LoadTechniqueDx7(expectedName):Material_LoadTechniqueDx9(expectedName);
        bool success=!readFailure&&passes>0&&failure==0;assert(bool(tech)==success);
        if(readFailure)assert(begins==0&&ends==0&&frees==0&&warnings.size()==1&&!allocations);
        else {
            assert(begins==1&&ends==1&&frees==1);
            if(success) {
                int count=passes>4?4:passes;unsigned stride=dx7?92:28;
                assert(allocations==1&&passCalls==count&&tech->passCount==count&&!strcmp(tech->name,expectedName));
                assert(allocated.size()==8+count*stride+sizeof(expectedName));
                assert((const byte*)tech->name==allocated.data()+8+count*stride);
                assert(tech->flags==(dx7?0xcccc:(1<<count)-1));
                for(int i=0;i<count;++i)for(unsigned j=0;j<stride;++j)assert(allocated[8+i*stride+j]==0x30+i);
                assert(position==count*3&&warnings.empty());
            } else assert(!allocations);
        }
        ++cases;
    }
    for(int mode=0;mode<2;++mode) {
        dx7=mode;readFailure=false;position=passCalls=allocations=begins=ends=frees=0;events.clear();warnings.clear();tokens={"bad"};failPass=0;
        assert(!(dx7?Material_LoadTechniqueDx7(expectedName):Material_LoadTechniqueDx9(expectedName)));
        assert(passCalls==0&&frees==1&&ends==1&&warnings.size()==1);++cases;
    }
    printf("PASS: %i actual DX7/DX9 technique-file routes, four-pass cap, read/parse failures, frees-before-allocation and untouched DX7 flags\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_techniques_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)

"""Actual technique-set grouping, renderer selection, cache and error ownership."""
from pathlib import Path
import subprocess
import tempfile
import pefile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('// PINNED 1001bde0:'):]
source = text[text.index('int Material_TechniqueTypeForName('):text.index('struct MtlLoadGlob')] + source
material = (work / 'src/gfx_d3d/r_material.cpp').read_text()
source = material[material.index('extern const byte g_useTechnique'):material.index('static IDirect3DVertexDeclaration9 *Material_BuildVertexDecl')] + source
anchor = work.parents[2] / 'cod2engineold/binaries/windows/1.0/gfx_d3d_mp_x86_s.dll'
mask = pefile.PE(str(anchor)).get_data(0x18eb34, 34)
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
#include <cstdarg>
#include <string>
#include <vector>
typedef unsigned char byte;
typedef byte Bool;
struct MaterialTechnique {} cachedTechnique,loadedTechnique;
struct MaterialTechniqueSet {const char *name;MaterialTechnique *techniques[34];};
MaterialTechniqueSet cachedSet;
static_assert(sizeof(MaterialTechniqueSet)==140,"PC techset");
struct {struct {int integer;} current;} renderer;
auto r_rendererInUse=&renderer;
int cursor,begins,ends,frees,allocations,findCalls,loadCalls,insertCalls;
bool readFailure,loadFailure,cacheHit;
bool setCacheHit;
int setFindCalls,setInsertCalls;
std::vector<std::string> tokens,warnings,prints;
std::vector<byte> memory;
char fileData[]="fixture";
const char setName[]="sample";
int readFile(const char *path,void **out) {
    assert(!strcmp(path,renderer.current.integer==2?"materials_dx7/techniquesets/sample.techset":"materials/techniquesets/sample.techset"));
    if(readFailure)return -1;*out=fileData;return 0;
}
void freeFile(void *ptr) {assert(ptr==fileData&&ends==1);++frees;}
void *allocate(int size) {assert(begins==0&&size==140+sizeof(setName));++allocations;memory.assign(size,0xcc);return memory.data();}
struct {int (*FS_ReadFile)(const char *,void **);void (*FS_FreeFile)(void *);void *(*Hunk_AllocInternal)(int);} ri={readFile,freeFile,allocate};
int Com_sprintf(char *dest,unsigned size,const char *format,...) {
    va_list args;va_start(args,format);int n=vsnprintf(dest,size,format,args);va_end(args);return n;
}
void message(std::vector<std::string> &out,const char *format,va_list args) {
    char text[256];vsnprintf(text,sizeof(text),format,args);out.push_back(text);
}
void Com_ScriptWarning(const char *format,...) {va_list args;va_start(args,format);message(warnings,format,args);va_end(args);}
void Com_Printf(const char *format,...) {va_list args;va_start(args,format);message(prints,format,args);va_end(args);}
const char *Com_Parse(const char **) {return cursor<int(tokens.size())?tokens[cursor++].c_str():"";}
int Com_MatchToken(const char **text,const char *value,int warning) {assert(warning==1);return !strcmp(Com_Parse(text),value);}
void Com_BeginParseSession(const char *path) {assert(strstr(path,"sample.techset")&&allocations==1);++begins;}
void Com_EndParseSession() {assert(begins==1);++ends;}
void Com_SetScriptWarningPrefix(const char *prefix) {assert(!strcmp(prefix,"^1ERROR: "));}
void Com_SetSpaceDelimited(int enabled) {assert(!enabled);}
void Com_SetKeepStringQuotes(int enabled) {assert(enabled==1);}
MaterialTechnique *Material_FindTechnique(const char *name) {assert(!strcmp(name,"tech"));++findCalls;return cacheHit?&cachedTechnique:0;}
void Material_SetTechnique(const char *name,MaterialTechnique *tech) {assert(!strcmp(name,"tech")&&tech==&loadedTechnique);++insertCalls;}
MaterialTechnique *Material_LoadTechniqueDx9(const char *name) {assert(!strcmp(name,"tech")&&renderer.current.integer!=2);++loadCalls;return loadFailure?0:&loadedTechnique;}
MaterialTechnique *Material_LoadTechniqueDx7(const char *name) {assert(!strcmp(name,"tech")&&renderer.current.integer==2);++loadCalls;return loadFailure?0:&loadedTechnique;}
MaterialTechniqueSet *Material_FindTechniqueSet(const char *name) {assert(!strcmp(name,setName));++setFindCalls;return setCacheHit?&cachedSet:0;}
void Material_SetTechniqueSet(const char *name,MaterialTechniqueSet *set) {assert(!strcmp(name,setName)&&set==(MaterialTechniqueSet*)memory.data());++setInsertCalls;}
'''+source+r'''
void reset() {
    cursor=begins=ends=frees=allocations=findCalls=loadCalls=insertCalls=0;readFailure=loadFailure=false;
    setCacheHit=false;setFindCalls=setInsertCalls=0;
    tokens.clear();warnings.clear();prints.clear();memory.clear();
}
int main() {
    const byte pinnedMask[34]={'''+','.join(map(str,mask))+r'''};
    assert(!memcmp(g_useTechnique,pinnedMask,34));
    assert(Material_TechniqueTypeForName("\"sky\"")==1&&Material_TechniqueTypeForName("sky")==34);
    int cases=0;
    for(int rendererMode : {0,2})for(int hit=0;hit<2;++hit)for(int scenario=0;scenario<12;++scenario) {
        reset();renderer.current.integer=rendererMode;cacheHit=hit;
        bool success=false;
        switch(scenario) {
        case 0:tokens={"\"sky\"",":","tech",";"};success=true;break;
        case 1:tokens={"\"fakelight normal\"",":","tech",";"};success=true;break;
        case 2:tokens={"\"fakelight normal\"",":","\"sky\"",":","tech",";"};success=true;break;
        case 3:tokens={"\"sky\"",":"};success=true;break;
        case 4:tokens={"\"unknown\"",":","tech",";"};break;
        case 5:tokens={"tech",";"};break;
        case 6:tokens={"\"sky\"","bad"};break;
        case 7:tokens={"\"sky\"",":","tech"};break;
        case 8:for(int i=0;i<34;++i){tokens.push_back("\"sky\"");tokens.push_back(":");}tokens.push_back("tech");tokens.push_back(";");success=true;break;
        case 9:for(int i=0;i<35;++i){tokens.push_back("\"sky\"");tokens.push_back(":");}break;
        case 10:tokens={"\"sky\"",":","tech",";"};loadFailure=true;success=hit;break;
        case 11:readFailure=true;break;
        }
        MaterialTechniqueSet *set=Material_LoadTechniqueSet(setName);assert(bool(set)==success);
        if(readFailure)assert(!begins&&!ends&&!frees&&!allocations&&prints.size()==1&&warnings.empty());
        else {
            assert(begins==1&&ends==1&&frees==1&&allocations==1);
            if(success) {
                assert(!strcmp(set->name,setName)&&(const byte*)set->name==memory.data()+140);
                MaterialTechnique *expected=hit?&cachedTechnique:&loadedTechnique;
                if(scenario==0||scenario==2||scenario==8||scenario==10)assert(set->techniques[1]==expected);
                if(scenario==2)assert(set->techniques[27]==expected);
                assert(set->techniques[33]==(MaterialTechnique*)0xcccccccc);
            }
            if(scenario==1||scenario==3)assert(!findCalls&&!loadCalls&&!insertCalls);
            if(findCalls)assert(findCalls==1&&loadCalls==int(!hit)&&insertCalls==int(!hit&&!loadFailure));
        }
        ++cases;
    }
    for(int scenario=0;scenario<3;++scenario) {
        reset();setCacheHit=scenario==0;readFailure=scenario==2;cacheHit=false;
        tokens={"\"sky\"",":","tech",";"};
        MaterialTechniqueSet *set=Material_LoadCachedTechniqueSet(setName);
        assert(setFindCalls==1);
        if(scenario==0)assert(set==&cachedSet&&!allocations&&!begins&&!setInsertCalls);
        else if(scenario==1)assert(set&&allocations==1&&frees==1&&setInsertCalls==1);
        else assert(!set&&!allocations&&!begins&&!setInsertCalls);
        ++cases;
    }
    printf("PASS: %i actual technique-set routes, pinned 34-byte mask, quoted labels, inactive/mixed groups, 34-label cap, both caches and original error ownership\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_techsets_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)

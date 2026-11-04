"""Actual PC vertex routes and complete DX9 pass loading, including partial writes."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('// PINNED 10018f90:'):text.index('// PINNED 1001b810..')]
material = (work / 'src/gfx_d3d/r_material.cpp').read_text()
builder = material[material.index('// PINNED 10016740:'):material.index('void Material_ReloadAll()')]
program = r'''
#define Com_ParseInternal Com_Parse

#include <cassert>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <cstdarg>
#include <climits>
#include <algorithm>
#include <string>
#include <vector>
typedef unsigned char byte;
#define __declspec(x)
typedef byte Bool;
struct MaterialStreamRouting {byte source,dest;};
struct MaterialStateMap {} state;
struct MaterialShader {} vertexShader,pixelShader;
struct MaterialShaderArgument {} vertexArg,pixelArg;
struct IDirect3DVertexDeclaration9 {} handles[4];
struct stream_source_info_t {byte Stream,Offset,Type;};
stream_source_info_t s_streamSourceInfo[4][7];
struct MaterialVertexDeclaration {
    MaterialStreamRouting *routingData;int streamCount;IDirect3DVertexDeclaration9 *decl[4];
} declaration,alternate;
struct MaterialPassDx9 {
    MaterialStateMap *stateMap;MaterialVertexDeclaration *vertexDecl;MaterialShader *vertexShader,*pixelShader;
    unsigned short vertexArgCount,pixelArgCount;MaterialShaderArgument *vertexArgs,*pixelArgs;
};
static_assert(sizeof(MaterialPassDx9)==28,"PC pass");
std::vector<std::string> tokens,warnings;
std::vector<MaterialStreamRouting> captured;
std::vector<int> stages;
unsigned cursor;int onLineCalls,allocations,buildCalls,failStage;
bool reused,replaceDeclaration;
const char **expectedText;
MaterialVertexDeclaration **activeDeclaration;
const char *Com_Parse(const char **text) {assert(text==expectedText);while(cursor<tokens.size()&&tokens[cursor]=="\n")++cursor;return cursor<tokens.size()?tokens[cursor++].c_str():"";}
char *Com_ParseOnLine(const char **text) {++onLineCalls;return (char*)Com_Parse(text);}
void Com_UngetTokenInternal() {assert(cursor);--cursor;}
int Com_ParseInt(const char **text) {return atoi(Com_Parse(text));}
void Com_ScriptWarning(const char *format,...) {
    char out[256];va_list args;va_start(args,format);vsnprintf(out,sizeof(out),format,args);va_end(args);warnings.push_back(out);
}
int Com_MatchToken(const char **text,const char *match,int warn) {
    assert(warn==1);return !strcmp(Com_Parse(text),match);
}
MaterialVertexDeclaration *Material_AllocVertexDecl(MaterialStreamRouting *routes,int count,Bool *existing) {
    ++allocations;assert(count<16);captured.assign(routes,routes+count);*existing=reused;return &declaration;
}
IDirect3DVertexDeclaration9 *Material_BuildVertexDecl(const MaterialStreamRouting *routes,int count,const stream_source_info_t *table) {
    int type=buildCalls++;assert(type<4&&table==s_streamSourceInfo[type]);
    MaterialVertexDeclaration *current=*activeDeclaration;
    assert(routes==current->routingData&&count==current->streamCount);
    if(replaceDeclaration&&type==0)*activeDeclaration=&alternate;
    return &handles[type];
}
'''+builder+r'''
Bool Material_LoadPassStateMap(const char **text,MaterialStateMap **out) {
    assert(text==expectedText);stages.push_back(1);if(failStage==1)return 0;*out=&state;return 1;
}
MaterialShader *Material_LoadPassShader(const char **text,int type) {
    assert(text==expectedText);stages.push_back(type?4:2);if(failStage==(type?4:2))return 0;return type?&pixelShader:&vertexShader;
}
Bool Material_SetPassShaderArguments(const char **text,const MaterialShader *shader,byte *flags,unsigned short *count,MaterialShaderArgument **args) {
    assert(text==expectedText);int stage=shader==&vertexShader?3:5;stages.push_back(stage);
    *flags|=stage==3?1:2;*count=stage==3?2:3;*args=stage==3?&vertexArg:&pixelArg;return failStage!=stage;
}
'''+source+r'''
void setup(const char **text) {
    expectedText=text;cursor=0;onLineCalls=allocations=buildCalls=failStage=0;
    tokens.clear();warnings.clear();captured.clear();stages.clear();reused=false;replaceDeclaration=false;
    memset(&declaration,0,sizeof(declaration));memset(&alternate,0,sizeof(alternate));
}
void route(const char *dest,const char *src) {
    const char *parts[]={"vertex",".",dest,"=","code",".",src,";"};
    tokens.insert(tokens.end(),parts,parts+8);
}
int main() {
    const char *text="input";int cases=0;
    for(const char *name : {"position","normal","color","texcoord","bad"})for(int i : {-1,0,1,7,8,254,INT_MIN,INT_MAX}) {
        setup(&text);tokens={"[",std::to_string(i),"]"};byte dest=0xcc;
        Bool result=Material_ParseStreamDestination(&text,name,&dest);
        if(!strcmp(name,"position"))assert(result&&dest==0&&cursor==0);
        else if(!strcmp(name,"normal"))assert(result&&dest==1&&cursor==0);
        else if(!strcmp(name,"bad"))assert(!result&&dest==0xcc&&warnings.size()==1);
        else {int base=!strcmp(name,"color")?2:4;int bound=base==2?2:8;
            assert(result&&dest==(byte)((byte)i+base)&&cursor==3);assert(warnings.size()==unsigned(i<0||i>=bound));}
        ++cases;
    }
    for(const char *name : {"position","normal","color","tangent","binormal","texcoord","bad"}) {
        setup(&text);tokens={"[","1","]"};byte src=0xcc;
        Bool result=Material_ParseStreamSource(&text,name,&src);
        const char *names[]={"position","normal","color","tangent","binormal","texcoord","bad"};
        const int codes[]={0,1,2,6,5,4,-1};int j=0;while(strcmp(name,names[j]))++j;
        assert(result==(codes[j]>=0));if(result)assert(src==codes[j]);else assert(src==0xcc);
        ++cases;
    }
    for(unsigned count=0;count<=16;++count)for(int reuse=0;reuse<2;++reuse) {
        setup(&text);reused=reuse;for(unsigned i=0;i<count;++i)route(i%2?"normal":"position",i%3?"tangent":"normal");
        tokens.push_back("vertexShader");MaterialPassDx9 pass={};activeDeclaration=&pass.vertexDecl;
        Bool result=Material_LoadPassVertexDecl(&text,&pass);
        if(count==16)assert(!result&&allocations==0&&warnings.size()==1&&cursor==128);
        else {
            assert(result&&pass.vertexDecl==&declaration&&captured.size()==count);
            assert(cursor==count*8&&allocations==1&&buildCalls==(reuse?0:4)&&onLineCalls==0);
            for(unsigned i=1;i<count;++i)assert(captured[i-1].source<captured[i].source||
                (captured[i-1].source==captured[i].source&&captured[i-1].dest<=captured[i].dest));
        }
        ++cases;
    }
    setup(&text);route("position","normal");tokens.insert(tokens.begin()+6,"\n");tokens.push_back("vertexShader");
    {MaterialPassDx9 pass={};activeDeclaration=&pass.vertexDecl;
     assert(Material_LoadPassVertexDecl(&text,&pass)&&captured.size()==1&&onLineCalls==0&&cursor==9);++cases;}
    for(int bad=0;bad<8;++bad) {
        setup(&text);route("position","normal");tokens[bad]="bad";MaterialPassDx9 pass={};activeDeclaration=&pass.vertexDecl;
        Bool result=Material_LoadPassVertexDecl(&text,&pass);
        if(bad==0)assert(result&&captured.empty());else assert(!result&&!allocations);
        ++cases;
    }
    setup(&text);replaceDeclaration=true;MaterialVertexDeclaration *pointer=&declaration;activeDeclaration=&pointer;
    Material_BuildVertexDecls(&pointer);assert(pointer==&alternate&&buildCalls==4);
    for(int i=0;i<4;++i)assert(alternate.decl[i]==&handles[i]);++cases;
    for(int failure=0;failure<=5;++failure) {
        setup(&text);tokens={"vertexShader","pixelShader"};failStage=failure;
        MaterialPassDx9 pass={};activeDeclaration=&pass.vertexDecl;byte flags=0;
        Bool result=Material_LoadPassDx9(&text,&pass,&flags);assert(result==(failure==0));
        assert(stages.size()==unsigned(failure?failure:5));
        if(failure==1)assert(!allocations&&!pass.stateMap);else assert(pass.stateMap==&state&&allocations==1);
        if(!failure||failure>=3)assert(pass.vertexShader==&vertexShader);
        if(!failure||failure>=5)assert(pass.pixelShader==&pixelShader);
        if(!failure)assert(flags==3&&pass.vertexArgCount==2&&pass.pixelArgCount==3&&pass.vertexArgs==&vertexArg&&pass.pixelArgs==&pixelArg);
        ++cases;
    }
    printf("PASS: %i actual DX9 stream/pass routes, sorting, warning-only bounds, 16-route rejection, cache reuse, four device declarations and partial writes\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_dx9_pass_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)

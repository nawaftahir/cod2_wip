"""Actual serialized argument-list parser and COM-wrapper lifetime/error paths."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('unsigned int Material_FindShaderConstant('):text.index('// PINNED 100198c0:')]
source += text[text.index('// PINNED 1001a160:'):]
program = r'''
#include <cassert>
#include <cstdint>
#include <cstddef>
#include <cstring>
#include <cstdio>
#include <cstdlib>
#include <cstdarg>
#include <string>
#include <vector>
#include <initializer_list>
#define __stdcall
typedef unsigned char Bool;
typedef unsigned char byte;
typedef uint32_t DWORD;
typedef uint32_t ULONG;
typedef int32_t HRESULT;
struct GUID { DWORD value[4]; };
typedef const void *LPCVOID;
struct D3DXSHADER_CONSTANTTABLE { DWORD Size,Creator,Version,Constants,ConstantInfo,Flags,Target; };
struct D3DXSHADER_CONSTANTINFO { DWORD Name;uint16_t RegisterSet,RegisterIndex,RegisterCount,Reserved;DWORD TypeInfo,DefaultValue; };
struct TypeInfo { uint16_t Class,Type,Rows,Columns,Elements,StructMembers;DWORD StructMemberInfo; };
typedef TypeInfo D3DXSHADER_TYPEINFO;
struct ShaderConstantRouting { const char *name;byte firstElem,elemCount;const D3DXSHADER_CONSTANTINFO *constantInfo;const D3DXSHADER_TYPEINFO *typeInfo; };
struct MaterialShaderArgument { uint16_t type,dest;union { int codeSampler; } u; };
struct MaterialShader { const char *name;void (*program)(); };
struct Blob { D3DXSHADER_CONSTANTTABLE table;D3DXSHADER_CONSTANTINFO info[256];TypeInfo types[256];char names[256][32]; } blob;
std::vector<std::string> tokens,messages,prefixes;unsigned position;
int unknownPrints,undefinedPrints,defaultCalls,parseCalls;
const char **expectedText;
const char *Com_Parse(const char **text) { assert(text==expectedText);return position<tokens.size()?tokens[position++].c_str():""; }
void Com_ScriptWarning(const char *format,...) {
    char buffer[512];va_list args;va_start(args,format);vsnprintf(buffer,sizeof(buffer),format,args);va_end(args);messages.push_back(buffer);
}
int Com_MatchToken(const char **text,const char *match,int warning) { assert(warning==1);bool ok=!strcmp(Com_Parse(text),match);if(!ok)Com_ScriptWarning("token mismatch\n");return ok; }
void Com_SetScriptWarningPrefix(const char *prefix) { prefixes.push_back(prefix); }
void Com_SkipRestOfLine(const char **text) { assert(text==expectedText);while(position<tokens.size()&&tokens[position++]!="EOL"){} }
void Com_Printf(const char *format,...) { assert(!strcmp(format,"  %s\n")||!strcmp(format,"%i constant(s) were undefined\n"));++undefinedPrints; }
int testPrintf(const char *format,...) { assert(!strcmp(format,"*WARNING*: constant '%s' is not used by shader '%s'\n"));++unknownPrints;return 0; }
Bool Material_ParseShaderArgument(const char **text,ShaderConstantRouting *routing,MaterialShaderArgument *arg) {
    ++parseCalls;
    assert(routing->constantInfo==&blob.info[(arg->dest-2)/3]);
    assert((void*)routing->typeInfo==&blob.types[(arg->dest-2)/3]);
    if(!Com_MatchToken(text,"=",1))return 0;
    const char *value=Com_Parse(text);if(!strcmp(value,"bad"))return 0;
    arg->type=(!strcmp(value,"sun")||!strcmp(value,"scene"))?3:1;
    arg->u.codeSampler=!strcmp(value,"sun")?14:!strcmp(value,"scene")?15:77;return 1;
}
Bool Material_DefaultShaderArgument(const char *name,ShaderConstantRouting *,MaterialShaderArgument *arg) {
    ++defaultCalls;if(strncmp(name,"auto",4))return 0;
    arg->type=1;arg->u.codeSampler=88;return 1;
}
MaterialShaderArgument allocated[256];int allocations;
void *allocate(int bytes) { assert(bytes>0&&bytes<=sizeof(allocated)&&bytes%8==0);++allocations;return allocated; }
struct { void *(*Hunk_AllocInternal)(int); } ri={allocate};
#define printf testPrintf
'''+source+r'''
#undef printf
HRESULT sdkResult;int sdkCalls,bufferCalls,releases;
struct MockTable : ShaderConstantTableInterface {
    HRESULT __stdcall QueryInterface(const GUID &,void **) {return 0;}
    ULONG __stdcall AddRef() {return 1;}
    ULONG __stdcall Release() {++releases;return 0;}
    void *__stdcall GetBufferPointer() {++bufferCalls;return &blob.table;}
} comTable;
extern "C" HRESULT __stdcall D3DXGetShaderConstantTable(const DWORD *,ShaderConstantTableInterface **output) {++sdkCalls;*output=&comTable;return sdkResult;}
extern "C" const char *__stdcall DXGetErrorDescription9A(HRESULT result) {assert(result==sdkResult&&result<0);return "test SDK error";}
void setup(int count) {
    memset(&blob,0,sizeof(blob));blob.table.Constants=count;blob.table.ConstantInfo=offsetof(Blob,info);
    for(int i=0;i<count;++i) {
        snprintf(blob.names[i],sizeof(blob.names[i]),"value%i",i);
        blob.info[i].Name=(byte*)blob.names[i]-(byte*)&blob;
        blob.info[i].TypeInfo=(byte*)&blob.types[i]-(byte*)&blob;
        blob.info[i].RegisterIndex=i*3+2;
    }
    memset(allocated,0xcc,sizeof(allocated));tokens.clear();messages.clear();prefixes.clear();position=0;
    parseCalls=defaultCalls=unknownPrints=undefinedPrints=allocations=sdkCalls=bufferCalls=releases=0;sdkResult=0;
}
int main() {
    static_assert(sizeof(MaterialShaderArgument)==8,"retail argument stride");
    const char *cursor="";expectedText=&cursor;
    for(int count:{0,1,4,256}) {
        setup(count);tokens={"{"};
        for(int i=count-1;i>=0;--i) {tokens.push_back(blob.names[i]);tokens.push_back("=");tokens.push_back(i==0?"sun":i==1?"scene":"value");tokens.push_back(";");}
        tokens.push_back("}");byte flags=0xa0;
        assert(Material_ParseShaderArguments(&cursor,"shader",&blob.table,&flags,allocated));
        assert(parseCalls==count&&!defaultCalls&&messages.empty());
        assert(flags==(count==0?0xa0:count==1?0xa1:0xa3));
        for(int i=0;i<count;++i)assert(allocated[i].dest==(count-1-i)*3+2);
    }
    setup(2);strcpy(blob.names[0],"autoColor");tokens={"{","value1","=","value",";","}"};byte flags=0x80;
    assert(Material_ParseShaderArguments(&cursor,"shader",&blob.table,&flags,allocated));
    assert(parseCalls==1&&defaultCalls==1&&allocated[0].dest==5&&allocated[1].dest==2&&flags==0x80);
    setup(1);tokens={"{","unused","=","skip","EOL","value0","=","sun",";","}"};flags=0;
    assert(Material_ParseShaderArguments(&cursor,"shader",&blob.table,&flags,allocated));
    assert(unknownPrints==1&&messages.size()==1&&prefixes.size()==2&&prefixes[0]=="^3WARNING: "&&prefixes[1]=="^1ERROR: "&&flags==1);
    for(int failure=0;failure<5;++failure) {
        setup(1);flags=0x80;
        if(failure==0)tokens={"{"};
        if(failure==1)tokens={"{","value0","=","value",";","value0","=","value",";","}"};
        if(failure==2)tokens={"{","value0","=","bad",";","}"};
        if(failure==3)tokens={"{","value0","=","sun","bad","}"};
        if(failure==4)tokens={"{","}"};
        assert(!Material_ParseShaderArguments(&cursor,"shader",&blob.table,&flags,allocated));
        assert(flags==0x80);
        if(failure==4)assert(undefinedPrints==2&&defaultCalls==1);
        if(failure==1)assert(parseCalls==1);
    }
    for(int count:{0,1,255,256})for(int mode=0;mode<3;++mode) {
        setup(count);tokens={"{","}"};if(mode==1)sdkResult=-1;if(mode==2)tokens={"bad"};
        unsigned short argumentCount=999;MaterialShaderArgument *args=(MaterialShaderArgument*)(uintptr_t)1;
        MaterialShader shader={"shader",nullptr};flags=0x80;
        bool success=Material_SetPassShaderArguments(&cursor,&shader,&flags,&argumentCount,&args);
        assert(success==(mode==0&&(count==0||count==256)));
        assert(sdkCalls==1&&releases==(mode!=1)&&bufferCalls==(mode!=1));
        if(mode==1)assert(argumentCount==999&&args==(MaterialShaderArgument*)(uintptr_t)1&&allocations==0);
        else {
            assert(argumentCount==(byte)count&&allocations==((byte)count!=0));
            assert(args==((byte)count?allocated:nullptr));
        }
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_shader_argument_list_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual argument-list parser through256 entries, defaults/errors/flags;12 source COM wrapper paths (byte match still required)')

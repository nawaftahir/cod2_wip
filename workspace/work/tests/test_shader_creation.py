"""Actual PC shader creation, SDK inputs, header fields and original cleanup."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_material_shader.cpp').read_text()
source = text[text.index('extern "C" HRESULT __stdcall IncludeClass_Close('):]
header = (work / 'src/gfx_d3d/r_material_shader.h').read_text().replace('#pragma once', '')
program = r'''
#include <cassert>
#include <cstdint>
#include <cstring>
#include <cstdio>
#include <cstdarg>
#include <string>
#include <vector>
#define __stdcall __attribute__((stdcall))
typedef unsigned char byte;
typedef uint32_t DWORD;
typedef int32_t HRESULT;
typedef int D3DXINCLUDE_TYPE;
enum { _PC_24=0x20000, _MCW_PC=0x30000, _MCW_EM=0x8001f };
struct IDirect3DVertexShader9 {} vertex;
struct IDirect3DPixelShader9 {} pixel;
'''+header+r'''
static_assert(sizeof(MaterialShader)==16,"PC header");
struct ID3DXBuffer {
    std::vector<byte> bytes;
    int releases=0;
    void *GetBufferPointer() {return bytes.data();}
    unsigned GetBufferSize() {return bytes.size();}
    unsigned Release() {return ++releases;}
} codeBuffer,messageBuffer,constantBuffer;
typedef ID3DXBuffer ID3DXConstantTable;
struct ID3DXInclude {};
struct D3DXMACRO {const char *Name,*Definition;};
int typeInput,versionInput,stage,compileCalls,deviceCalls,fpCalls,allocations;
bool cached,hasCode,hasMessages,hasConstants;
HRESULT compileResult,deviceResult;
std::string expectedName,expectedProfile;
std::vector<std::string> prints,warnings;
std::vector<byte> memory;
const char cachedText[]="shader source";
bool Material_FindCachedShaderText(const char *name,const char **text,int *size) {
    assert(expectedName==name);if(!cached)return false;*text=cachedText;*size=sizeof(cachedText)-1;return true;
}
extern "C" HRESULT __stdcall IncludeClass_Open(const void *,D3DXINCLUDE_TYPE,const char *,const void *,const void **,unsigned *) {return 0;}
void message(std::vector<std::string> &out,const char *format,va_list args) {
    char text[512];vsnprintf(text,sizeof(text),format,args);out.push_back(text);
}
void Com_Printf(const char *format,...) {va_list args;va_start(args,format);message(prints,format,args);va_end(args);}
void Com_ScriptWarning(const char *format,...) {va_list args;va_start(args,format);message(warnings,format,args);va_end(args);}
int Com_sprintf(char *dest,unsigned size,const char *format,...) {
    va_list args;va_start(args,format);int n=vsnprintf(dest,size,format,args);va_end(args);return n;
}
const char *DXGetErrorDescription9A(HRESULT result) {assert(result<0);return "SDK error";}
unsigned _clearfp() {assert(compileCalls==1&&fpCalls==0);++fpCalls;return 0;}
unsigned _controlfp(unsigned value,unsigned mask) {
    assert(fpCalls==1?(value==_PC_24&&mask==_MCW_PC):(fpCalls==2&&value==_MCW_EM&&mask==_MCW_EM));++fpCalls;return 0;
}
void *allocate(int size) {
    assert(size==int(16+codeBuffer.bytes.size()+expectedName.size()+1));++allocations;
    memory.assign(size,0xcc);return memory.data();
}
struct {void *(*Hunk_AllocInternal)(int);} ri={allocate};
struct Device {
    HRESULT CreateVertexShader(const DWORD *program,IDirect3DVertexShader9 **out) {
        assert((byte*)program==memory.data()+16&&!(byte)typeInput);++deviceCalls;*out=&vertex;return deviceResult;
    }
    HRESULT CreatePixelShader(const DWORD *program,IDirect3DPixelShader9 **out) {
        assert((byte*)program==memory.data()+16&&(byte)typeInput);++deviceCalls;*out=&pixel;return deviceResult;
    }
} device;
struct {Device *device;} dx={&device};
HRESULT D3DXCompileShader(const char *,unsigned,const D3DXMACRO *,ID3DXInclude *,const char *,const char *,DWORD,ID3DXBuffer **,ID3DXBuffer **,ID3DXConstantTable **);
'''+source+r'''
HRESULT D3DXCompileShader(const char *text,unsigned size,const D3DXMACRO *defines,ID3DXInclude *include,
    const char *entry,const char *profile,DWORD flags,ID3DXBuffer **code,ID3DXBuffer **messages,ID3DXConstantTable **constants) {
    ++compileCalls;assert(text==cachedText&&size==sizeof(cachedText)-1&&flags==0);
    assert(!strcmp(defines[0].Name,"PC")&&!strcmp(defines[0].Definition,"")&&!defines[1].Name&&!defines[1].Definition);
    assert(expectedProfile==profile&&!strcmp(entry,typeInput?"ps_main":"vs_main"));
    const ShaderIncludeVtable *vtable=*(const ShaderIncludeVtable **)include;
    assert(vtable->Open==IncludeClass_Open&&vtable->Close(include,cachedText)==0);
    *code=hasCode?&codeBuffer:0;*messages=hasMessages?&messageBuffer:0;*constants=hasConstants?&constantBuffer:0;
    return compileResult;
}
int main() {
    int cases=0;
    for(int type : {0,1,256})for(int version : {11,20,30,-1})for(unsigned size : {4u,20u,65540u})
    for(int scenario=0;scenario<7;++scenario) {
        typeInput=type;versionInput=version;expectedName="example.hlsl";
        char profile[32];snprintf(profile,sizeof(profile),type?"ps_%i_%i":"vs_%i_%i",version/10,version%10);expectedProfile=profile;
        codeBuffer.bytes.resize(size);for(unsigned i=0;i<size;++i)codeBuffer.bytes[i]=byte(i*37);
        messageBuffer.bytes={'w','a','r','n',0};
        codeBuffer.releases=constantBuffer.releases=messageBuffer.releases=0;
        compileCalls=deviceCalls=fpCalls=allocations=0;warnings.clear();prints.clear();
        cached=scenario!=0;hasCode=scenario!=2;hasConstants=scenario!=3;hasMessages=scenario%2;
        compileResult=scenario==1?-1:0;deviceResult=scenario==4?-2:0;
        MaterialShader *shader=Material_CreateShader(expectedName.c_str(),type,version);
        if(!cached) {assert(!shader&&compileCalls==0&&warnings.size()==1);}
        else {
            assert(compileCalls==1&&fpCalls==3&&messageBuffer.releases==int(hasMessages));
            assert(prints.size()==unsigned(hasMessages));
            if(scenario==1)assert(!shader&&!allocations&&!deviceCalls&&!codeBuffer.releases&&!constantBuffer.releases);
            else if(!hasCode)assert(!shader&&!allocations&&!deviceCalls&&constantBuffer.releases==1);
            else if(!hasConstants)assert(!shader&&!allocations&&!deviceCalls&&codeBuffer.releases==1);
            else if(deviceResult<0)assert(!shader&&allocations==1&&deviceCalls==1&&!codeBuffer.releases&&!constantBuffer.releases);
            else {
                assert(shader&&allocations==1&&deviceCalls==1&&codeBuffer.releases==1&&constantBuffer.releases==1);
                assert(shader->shaderType==(byte)type&&shader->shaderVersion==(byte)version);
                assert(shader->programLen==((unsigned short)size>>2));
                assert(!memcmp(shader->program,codeBuffer.bytes.data(),size)&&!strcmp(shader->name,expectedName.c_str()));
                assert((const byte*)shader->name==memory.data()+16+size&&warnings.empty());
            }
        }
        ++cases;
    }
    printf("PASS: %i actual shader creation routes, SDK macros/profiles/includes, FP restoration, ushort length and original failure cleanup\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_shader_creation_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)

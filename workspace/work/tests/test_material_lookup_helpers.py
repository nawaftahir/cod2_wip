"""Exercise actual array-index parsing, scalar sampler and serialized constant lookup."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
end = text.rfind('\n', 0, text.index('Bool Material_CodeSamplerSource_r(')) + 1
source = text[text.index('Bool Material_ParseArrayOffset('):end]
source += text[text.index('// PINNED 10019700:'):text.index('// PINNED 100198c0:')]
source = source.replace('__declspec(noinline) ', '')
program = r'''
#include <cassert>
#include <cstring>
#include <cstdint>
#include <cstdarg>
#include <initializer_list>
typedef unsigned char Bool;
struct CodeSamplerSource { const char *name;int source;const CodeSamplerSource *subtable;int arrayCount,arrayStride; };
struct MaterialShaderArgument { uint16_t type,dest;union { int codeSampler; } u; };
struct D3DXSHADER_CONSTANTTABLE { uint32_t Size,Creator,Version,Constants,ConstantInfo,Flags,Target; };
struct D3DXSHADER_CONSTANTINFO { uint32_t Name;uint16_t set,index,count,reserved;uint32_t type,value; };
int opened,closed,indexValue,matches,parses,warnings,expectedMax,prints;
const char **expectedText;const char *expectedName,*expectedShader;
int Com_MatchToken(const char **text,const char *token,int warning) {
    assert(text==expectedText&&warning==1);++matches;
    if(!strcmp(token,"["))return opened;
    assert(!strcmp(token,"]"));return closed;
}
int Com_ParseInt(const char **text) { assert(text==expectedText);++parses;return indexValue; }
void Com_ScriptWarning(const char *format,...) {
    assert(!strcmp(format,"array index must be in range [0, %i]\n"));++warnings;
    va_list args;va_start(args,format);assert(va_arg(args,int)==expectedMax);va_end(args);
}
int testPrintf(const char *format,...) {
    assert(!strcmp(format,"*WARNING*: constant '%s' is not used by shader '%s'\n"));++prints;
    va_list args;va_start(args,format);
    assert(va_arg(args,const char*)==expectedName&&va_arg(args,const char*)==expectedShader);
    va_end(args);return 0;
}
#define printf testPrintf
'''+source+r'''
int main() {
    const char *cursor="[ index ]";expectedText=&cursor;
    for(opened=0;opened<2;++opened)for(closed=0;closed<2;++closed)
    for(int max=0;max<5;++max)for(indexValue=-1;indexValue<6;++indexValue)
    for(int stride:{0,1,4,-3}) {
        int offset=777;matches=parses=warnings=0;expectedMax=max-1;
        bool valid=indexValue>=0&&indexValue<max,success=opened&&valid&&closed;
        assert(Material_ParseArrayOffset(&cursor,max,stride,&offset)==success);
        assert(offset==(success?indexValue*stride:777));
        assert(parses==opened&&matches==1+(opened&&valid));
        assert(warnings==(opened&&!valid));
    }
    const CodeSamplerSource child[]={{nullptr,0,nullptr,0,0}};
    const CodeSamplerSource sources[]={
        {"nested",7,child,0,0},{"array",8,0,2,1},{"value",17,0,0,0},
        {"nested",29,0,0,0},{nullptr,0,0,0,0}};
    for(const char *name:{"nested","array","value","missing","VALUE",""}) {
        MaterialShaderArgument argument={0x1234,0x5678,{777}};
        int expected=!strcmp(name,"nested")?29:(!strcmp(name,"value")?17:777);
        assert(Material_FindScalarSamplerSource(name,sources,&argument)==(expected!=777));
        assert(argument.type==0x1234&&argument.dest==0x5678&&argument.u.codeSampler==expected);
    }
    struct Blob { D3DXSHADER_CONSTANTTABLE table;D3DXSHADER_CONSTANTINFO info[3];char names[3][16]; } blob={};
    const char *names[3]={"alpha","beta","gamma"};
    for(int i=0;i<3;++i) {
        strcpy(blob.names[i],names[i]);
        blob.info[i].Name=(uint32_t)((char*)blob.names[i]-(char*)&blob);
    }
    expectedShader="pinned_shader";
    for(unsigned int count=0;count<=3;++count)
    for(int query=0;query<4;++query) {
        blob.table.Constants=count;prints=0;expectedName=query<3?names[query]:"unknown";
        unsigned int expected=(unsigned int)query<count?(unsigned int)query:~0u;
        Blob before=blob;
        assert(Material_FindShaderConstant(expectedShader,&blob.table,blob.info,expectedName)==expected);
        assert(prints==(expected==~0u)&&!memcmp(&blob,&before,sizeof(blob)));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_material_helpers_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 560 array parse/range cases, scalar-only sampler lookup and 16 serialized constant lookups')

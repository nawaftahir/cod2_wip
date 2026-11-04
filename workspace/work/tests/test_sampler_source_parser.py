"""Exercise actual sampler parsers and pinned tables; behavior is not byte-match proof."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('Bool Material_ParseArrayOffset('):text.index('// PINNED 10019700:')]
source = source.replace('__declspec(noinline) ', '')
tables = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_state_tables.h').read_text()
tables = tables[:tables.index('// PINNED PC 1.0 material state names')]
types = (Path(__file__).resolve().parents[2] / 'src/opencod2/headers/common_types.h').read_text()
enum = types[types.index('enum MaterialTextureSource {'):types.index('enum MaterialVertexDeclType {')]
program = r'''
#define Com_ParseInternal Com_Parse

#include <cassert>
#include <cstring>
#include <cstdlib>
#include <cstdint>
#include <cstdarg>
#include <vector>
#include <initializer_list>
typedef unsigned char Bool;
struct CodeSamplerSource { const char *name;int source;const CodeSamplerSource *subtable;int arrayCount,arrayStride; };
struct CodeConstantSource { const char *name;unsigned char source;const CodeConstantSource *subtable;int arrayCount,arrayStride; };
struct MaterialShaderArgument { uint16_t type,dest;union { int codeSampler;const char *name; } u; };
std::vector<const char*> tokens;unsigned int position;int warnings;
const char **expectedText;
const char *Material_RegisterString(const char *name) { return !strcmp(name,"null")?nullptr:name; }
const char *Com_Parse(const char **text) {
    assert(text==expectedText);
    const char *token=position<tokens.size()?tokens[position++]:"";
    *text=token;return token;
}
int Com_MatchToken(const char **text,const char *match,int warning) {
    assert(warning==1);return !strcmp(Com_Parse(text),match);
}
int Com_ParseInt(const char **text) { return atoi(Com_Parse(text)); }
void Com_ScriptWarning(const char *format,...) {
    ++warnings;va_list args;va_start(args,format);
    if(!strcmp(format,"unknown sampler source '%s'\n"))assert(va_arg(args,const char*)!=nullptr);
    else if(!strcmp(format,"expected 'sampler' or 'material', found '%s' instead\n"))
        assert(va_arg(args,const char*)!=nullptr);
    else {
        assert(!strcmp(format,"array index must be in range [0, %i]\n"));
        int max=va_arg(args,int);assert(max==1||max==3);
    }
    va_end(args);
}
'''+enum+tables+source+r'''
int main() {
    const CodeSamplerSource leaves[]={{"leaf",5,0,0,0},{nullptr,0,0,0,0}};
    CodeSamplerSource roots[]={
        {"value",7,0,0,0},{"items",10,0,4,0},
        {"branch",0,leaves,0,0},{"branchArray",0,leaves,2,0},
        {nullptr,0,0,0,0}};
    for(int offset:{-20,0,100})for(int stride:{0,1,8})for(int test=0;test<11;++test) {
        roots[1].arrayStride=roots[3].arrayStride=stride;
        int expected=777,warningCount=0;
        switch(test) {
        case 0:tokens={".","value"};expected=offset+7;break;
        case 1:tokens={".","items","[","2","]"};expected=offset+2*stride+10;break;
        case 2:tokens={".","branch",".","leaf"};expected=offset+5;break;
        case 3:tokens={".","branchArray","[","1","]",".","leaf"};expected=offset+stride+5;break;
        case 4:tokens={".","missing"};warningCount=1;break;
        case 5:tokens={"value"};break;
        case 6:tokens={".","items","[","-1","]"};warningCount=1;break;
        case 7:tokens={".","items","[","4","]"};warningCount=1;break;
        case 8:tokens={".","items","[","2","nope"};break;
        case 9:tokens={".","branch",".","missing"};warningCount=1;break;
        case 10:tokens={".","branchArray","[","2","]",".","leaf"};warningCount=1;break;
        }
        const char *cursor="";expectedText=&cursor;position=warnings=0;
        MaterialShaderArgument argument={0x1234,0x5678,{777}};
        CodeSamplerSource before[5];memcpy(before,roots,sizeof(roots));
        assert(Material_CodeSamplerSource_r(&cursor,offset,roots,&argument)==(expected!=777));
        assert(argument.type==0x1234&&argument.dest==0x5678&&argument.u.codeSampler==expected);
        assert(warnings==warningCount&&!memcmp(before,roots,sizeof(roots)));
    }
    for(int test=0;test<10;++test) {
        int expected=777,type=0x1234,warningCount=0;
        const char *name=nullptr;
        switch(test) {
        case 0:tokens={"sampler",".","white"};type=3;expected=1;break;
        case 1:tokens={"sampler",".","light","[","1","]",".","attenuation"};type=3;expected=18;break;
        case 2:tokens={"sampler",".","lightGrid",".","weights","[","1","]"};type=3;expected=6;break;
        case 3:tokens={"sampler",".","lightmap",".","traditional"};type=3;expected=8;break;
        case 4:tokens={"sampler",".","missing"};type=3;warningCount=1;break;
        case 5:tokens={"sampler",".","light","[","2","]"};type=3;warningCount=1;break;
        case 6:tokens={"material",".","diffuseMap"};type=4;name="diffuseMap";break;
        case 7:tokens={"material","bad"};break;
        case 8:tokens={"material",".","null"};type=4;break;
        case 9:tokens={"texture"};warningCount=1;break;
        }
        const char *cursor="";expectedText=&cursor;position=warnings=0;
        MaterialShaderArgument argument={0x1234,0x5678,{777}};
        assert(Material_ParseSamplerSource(&cursor,&argument)==(name||expected!=777));
        assert(argument.type==type&&argument.dest==0x5678&&warnings==warningCount);
        if(name)assert(!strcmp(argument.u.name,name));
        else if(test==8)assert(argument.u.name==nullptr);
        else assert(argument.u.codeSampler==expected);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_sampler_source_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 99 nested sampler cases and 10 real-table caller/error paths; not byte-match proof')

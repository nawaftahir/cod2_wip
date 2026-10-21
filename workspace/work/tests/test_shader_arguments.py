"""Actual default lookups, byte-narrowed row selection and shader-type dispatch."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('Bool Material_FindScalarSamplerSource('):text.index('// PINNED 10019400:')]
source += text[text.index('// PINNED 10019e10:'):text.index('// PINNED 1001a160:')]
header = (work / 'src/gfx_d3d/r_material_state_tables.h').read_text()
header = header[:header.index('// PINNED PC 1.0 material state names')]
types = (work.parents[0] / 'src/opencod2/headers/common_types.h').read_text()
enum = types[types.index('enum MaterialTextureSource {'):types.index('enum MaterialVertexDeclType {')]
program = r'''
#include <cassert>
#include <cstring>
#include <cstdlib>
#include <cstdint>
#include <cstdarg>
#include <string>
#include <vector>
#include <initializer_list>
typedef unsigned char Bool;
typedef unsigned char byte;
struct D3DXSHADER_TYPEINFO { uint16_t Class,Type,Rows,Columns,Elements; };
struct D3DXSHADER_CONSTANTINFO { uint16_t RegisterCount; };
struct ShaderConstantRouting { const char *name;byte firstElem,elemCount;const D3DXSHADER_CONSTANTINFO *constantInfo;const D3DXSHADER_TYPEINFO *typeInfo; };
struct CodeSamplerSource { const char *name;int source;const CodeSamplerSource *subtable;int arrayCount,arrayStride; };
struct CodeConstantSource { const char *name;byte source;const CodeConstantSource *subtable;int arrayCount,arrayStride; };
struct MaterialShaderArgument { uint16_t type,dest;union { int codeSampler;struct { uint16_t index;byte firstRow,rowCount; } codeConst; } u; };
std::vector<std::string> tokens;unsigned position;int warnings,ungets,constantCalls,samplerCalls;
const char **expectedText;bool parseResult;
const char *Com_Parse(const char **text) { assert(text==expectedText);return position<tokens.size()?tokens[position++].c_str():""; }
int Com_ParseInt(const char **text) { return atoi(Com_Parse(text)); }
void Com_UngetToken() { assert(position>0);--position;++ungets; }
int Com_MatchToken(const char **text,const char *match,int warning) { assert(warning==1);bool ok=!strcmp(Com_Parse(text),match);warnings+=!ok;return ok; }
void Com_ScriptWarning(const char *format,...) { assert(format&&*format);++warnings; }
Bool Material_ParseConstantSource(const char **text,const ShaderConstantRouting *,MaterialShaderArgument *) { assert(text==expectedText);++constantCalls;return parseResult; }
Bool Material_ParseSamplerSource(const char **text,MaterialShaderArgument *) { assert(text==expectedText);++samplerCalls;return parseResult; }
'''+enum+header+source+r'''
int main() {
    D3DXSHADER_TYPEINFO type={};D3DXSHADER_CONSTANTINFO info={260};
    ShaderConstantRouting routing={"",99,4,&info,&type};
    for(int matrixClass:{2,3})for(const char *name:{"eyePosition","ambientColor","filterTap","worldMatrix","lightPosition1","camera","missing"}) {
        type.Class=matrixClass;
        int expected=!strcmp(name,"eyePosition")?139:!strcmp(name,"ambientColor")?158:!strcmp(name,"filterTap")?163:
            !strcmp(name,"worldMatrix")?(matrixClass==3?190:188):!strcmp(name,"lightPosition1")?132:777;
        MaterialShaderArgument arg={0x1234,0x5678,{}};arg.u.codeConst={777,7,9};
        assert(Material_FindDefaultConstantSource(name,&routing,&arg)==(expected!=777));
        assert(arg.type==1&&arg.dest==0x5678&&arg.u.codeConst.index==expected);
        assert(arg.u.codeConst.firstRow==(expected==777?7:0));
        assert(arg.u.codeConst.rowCount==(expected==777?9:4));
        assert(routing.firstElem==99&&routing.elemCount==4);
    }
    int arrayCases=0;
    for(int elements:{1,4,300,1024})for(int first:{-1,0,2,4,255,256,300})for(int mode=0;mode<4;++mode) {
        ++arrayCases;type.Elements=elements;routing.firstElem=99;routing.elemCount=88;
        const char *cursor="";expectedText=&cursor;position=warnings=ungets=0;
        int end=first+1;byte narrowed=(byte)first;bool success;
        if(mode==0)tokens={"="};
        else if(mode==1)tokens={"[",std::to_string(first),"]"};
        else if(mode==2)tokens={"[",std::to_string(first),",",std::to_string(end),"]"};
        else tokens={"[",std::to_string(first),"bad"};
        int expectedCount=88;
        if(mode==0) {success=true;expectedCount=(byte)elements;}
        else if(narrowed>=elements||mode==3)success=false;
        else if(mode==1) {success=true;expectedCount=1;}
        else {success=end>=narrowed&&end<elements;if(success)expectedCount=(byte)(end-narrowed+1);}
        assert(Material_ParseShaderArgumentArray(&cursor,&routing)==success);
        assert(routing.firstElem==(mode==0?0:narrowed)&&routing.elemCount==expectedCount);
        assert(ungets==(mode==0)&&warnings==!success);
    }
    assert(arrayCases==112);
    for(int cls:{0,1,3})for(int kind:{3,10,11,12,13,14,99})for(bool result:{false,true}) {
        type={uint16_t(cls),uint16_t(kind),0,0,4};routing.firstElem=99;routing.elemCount=88;
        const char *cursor="";expectedText=&cursor;tokens={"="};position=warnings=ungets=constantCalls=samplerCalls=0;parseResult=result;
        bool sampler=kind==10||kind==12||kind==13||kind==14,supported=sampler||kind==3;
        MaterialShaderArgument arg={0x1234,0x5678,{}};arg.u.codeConst={777,7,9};
        assert(Material_ParseShaderArgument(&cursor,&routing,&arg)==(supported&&result));
        assert(constantCalls==(kind==3)&&samplerCalls==sampler&&warnings==!supported);
        assert(routing.firstElem==0&&routing.elemCount==(cls==1?4:1));
        assert(arg.type==0x1234&&arg.dest==0x5678&&arg.u.codeConst.index==777);
    }
    for(int kind:{3,10,11,12,13,14,99})for(int cls:{0,1,3}) {
        type={uint16_t(cls),uint16_t(kind),0,0,4};routing.name=kind==3?"worldMatrix":"lightmapSamplerR";routing.firstElem=99;routing.elemCount=88;
        MaterialShaderArgument arg={0x1234,0x5678,{}};arg.u.codeConst={777,7,9};
        bool sampler=kind==10||kind==12||kind==13||kind==14;
        assert(Material_DefaultShaderArgument(routing.name,&routing,&arg)==(kind==3||sampler));
        assert(routing.firstElem==0&&routing.elemCount==(cls==1?4:1));
        assert(arg.type==(kind==3?1:sampler?3:0x1234)&&arg.dest==0x5678);
        if(kind==3)assert(arg.u.codeConst.index==(cls==3?190:188)&&arg.u.codeConst.firstRow==0&&arg.u.codeConst.rowCount==4);
        else if(sampler)assert(arg.u.codeSampler==8);
        else assert(arg.u.codeConst.index==777&&arg.u.codeConst.firstRow==7&&arg.u.codeConst.rowCount==9);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_shader_arguments_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 14 lookup,112 narrowed-array,42 explicit-dispatch and21 default-dispatch cases')

"""Exercise actual constant parsers, real tables, matrix routing and error side effects."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
end = text.rfind('\n', 0, text.index('Bool Material_CodeSamplerSource_r(')) + 1
source = text[text.index('Bool Material_ParseArrayOffset('):end]
source += text[text.index('Bool Material_ParseLiteralVector('):text.index('int Material_TechniqueTypeForName(')]
source += text[text.index('Bool Material_ParseConstantArrayOffset('):text.index('// PINNED 10019e10:')]
source = source.replace('__declspec(noinline) ', '')
tables = (work / 'src/gfx_d3d/r_material_state_tables.h').read_text()
tables = tables[tables.index('// PINNED PC 1.0 code-constant'):tables.index('// PINNED 0x1018eda0.')]
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
typedef unsigned char byte;
struct D3DXSHADER_TYPEINFO { uint16_t Class; };
struct D3DXSHADER_CONSTANTINFO { uint16_t RegisterCount; };
struct ShaderConstantRouting { byte firstElem,elemCount;const D3DXSHADER_CONSTANTINFO *constantInfo;const D3DXSHADER_TYPEINFO *typeInfo; };
struct CodeConstantSource { const char *name;byte source;const CodeConstantSource *subtable;int arrayCount,arrayStride; };
struct MaterialShaderArgument {
    uint16_t type,dest;
    union { const float *literalConst;const char *name;struct { uint16_t index;byte firstRow,rowCount; } codeConst; } u;
};
std::vector<const char*> tokens;unsigned position;int warnings,ungets,registeredLiterals,registeredNames;
const char **expectedText;bool failRegistration;float savedLiteral[4];
const char *Com_Parse(const char **text) { assert(text==expectedText);return position<tokens.size()?tokens[position++] : ""; }
int Com_ParseInt(const char **text) { return atoi(Com_Parse(text)); }
void Com_UngetToken() { assert(position>0);--position;++ungets; }
int Com_MatchToken(const char **text,const char *match,int warning) { assert(warning==1);bool ok=!strcmp(Com_Parse(text),match);warnings+=!ok;return ok; }
void Com_ScriptWarning(const char *format,...) { assert(format&&*format);++warnings; }
Bool Material_ParseVector(const char **text,int count,float *value) {
    if(!Com_MatchToken(text,"(",1))return 0;
    for(int i=0;i<count;++i) { value[i]=atof(Com_Parse(text));if(i+1<count&&!Com_MatchToken(text,",",1))return 0; }
    return Com_MatchToken(text,")",1)!=0;
}
const float *Material_RegisterLiteral(const float *value) { ++registeredLiterals;memcpy(savedLiteral,value,sizeof(savedLiteral));return failRegistration?nullptr:savedLiteral; }
const char *Material_RegisterString(const char *name) { ++registeredNames;return failRegistration?nullptr:name; }
'''+tables+source+r'''
int main() {
    for(int matrixClass:{2,3})for(int count:{1,2,3,4})for(int test=0;test<17;++test) {
        D3DXSHADER_TYPEINFO type={(uint16_t)matrixClass};D3DXSHADER_CONSTANTINFO info={260};
        ShaderConstantRouting routing={0,(byte)count,&info,&type};
        const char *cursor="";expectedText=&cursor;position=warnings=ungets=registeredLiterals=registeredNames=0;failRegistration=false;
        MaterialShaderArgument arg={0x1234,0x5678,{}};arg.u.codeConst={777,7,9};
        bool success=true;int index=777,first=7,rows=9,expectedType=1,expectedWarnings=0,expectedUngets=0;
        switch(test) {
        case 0:tokens={"constant",".","camera",".","position"};index=139;first=0;rows=count;break;
        case 1:tokens={"constant",".","light","[","1","]",".","color"};index=134;first=0;rows=count;break;
        case 2:tokens={"constant",".","lightGrid",".","colorsB","[","1",",","3","]"};
            if(count==1)tokens={"constant",".","lightGrid",".","colorsB","[","1","]"};
            if(count==1||count==3) { index=151;first=0;rows=count; }else {success=false;expectedWarnings=1;}break;
        case 3:tokens={"constant",".","filterTap","[","2",",","4","]"};
            if(count==3) {index=165;first=0;rows=count;}else {success=false;expectedWarnings=1;}break;
        case 4:tokens={"constant",".","filterTap",";"};
            if(count>1) {index=163;first=0;rows=count;expectedUngets=1;}else {success=false;expectedWarnings=1;}break;
        case 5:tokens={"constant",".","worldMatrix",";"};index=matrixClass==3?190:188;first=0;rows=4;expectedUngets=1;break;
        case 6:tokens={"constant",".","worldMatrix","[","3","]"};index=matrixClass==3?190:188;first=3;rows=1;break;
        case 7:tokens={"constant",".","worldMatrix","[","4","]"};index=matrixClass==3?190:188;success=false;expectedWarnings=1;break;
        case 8:tokens={"constant",".","worldMatrix","bad"};success=false;expectedWarnings=1;break;
        case 9:tokens={"constant",".","missing"};success=false;expectedWarnings=1;break;
        case 10:tokens={"constant",".","light","[","-1","]"};success=false;expectedWarnings=1;break;
        case 11:tokens={"float2","(","3",",","4",")"};expectedType=0;
            if(count>1) {success=false;expectedWarnings=1;expectedType=0x1234;}break;
        case 12:tokens={"material",".","tint"};expectedType=2;
            if(count>1) {success=false;expectedWarnings=1;expectedType=0x1234;}break;
        case 13:tokens={"float1","(","3",")"};expectedType=0;failRegistration=true;success=false;
            if(count>1) {expectedWarnings=1;expectedType=0x1234;}break;
        case 14:tokens={"material","bad"};expectedType=0x1234;success=false;expectedWarnings=1;break;
        case 15:tokens={"nonsense"};expectedType=0x1234;success=false;expectedWarnings=1;break;
        case 16:tokens={"constant",".","worldMatrix","[","2","bad"};index=matrixClass==3?190:188;first=2;rows=1;success=false;expectedWarnings=1;break;
        }
        assert(Material_ParseConstantSource(&cursor,&routing,&arg)==success);
        assert(arg.type==expectedType&&arg.dest==0x5678&&warnings==expectedWarnings&&ungets==expectedUngets);
        if(test==11&&count==1) { assert(arg.u.literalConst==savedLiteral&&savedLiteral[0]==3&&savedLiteral[1]==4&&savedLiteral[2]==0&&savedLiteral[3]==1); }
        else if(test==12&&count==1)assert(!strcmp(arg.u.name,"tint"));
        else if(test==13&&count==1)assert(arg.u.literalConst==nullptr);
        else assert(arg.u.codeConst.index==index&&arg.u.codeConst.firstRow==first&&arg.u.codeConst.rowCount==rows);
        assert(registeredLiterals==((test==11||test==13)&&count==1));
        assert(registeredNames==(test==12&&count==1));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_code_constants_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 136 actual constant-parser paths, typed hierarchy, arrays, matrix transpose/rows, literals and failure writes')

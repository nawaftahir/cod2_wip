"""Exercise actual material state conditions, rule copying and the257th-rule limit."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('static const MtlStateMapBitName *Material_ParseStateValue('):text.index('static void Material_FixupRgbBlend(')]
program = r'''
#define Com_ParseInternal Com_Parse

#include <cassert>
#include <cstring>
#include <cstdlib>
#include <cstdarg>
#include <cstdio>
#include <string>
#include <vector>
#include <initializer_list>
typedef unsigned char Bool;
static Bool Material_MatchToken(const char **text, const char *match);
enum MtlParseSuccess { MTL_PARSE_SUCCESS,MTL_PARSE_NO_MATCH,MTL_PARSE_ERROR };
struct MtlStateMapBitName { const char *name;int bits; };
struct MtlStateMapBitGroup { const char *name;const MtlStateMapBitName *bitNames;int stateBitsMask[2]; };
struct MaterialStateMapRule { int stateBitsMask[2],stateBitsValue[2],stateBitsSet[2],stateBitsClear[2]; };
struct MaterialStateMapRuleSet { int ruleCount;MaterialStateMapRule rules[1]; };
const MtlStateMapBitName names[]={{"one",1},{"two",2},{0,0}};
const MtlStateMapBitGroup s_stateMapSrcBitGroup[]={{"mode",names,{3,0}},{"color",names,{0,3}},{0,0,{0,0}}};
const MtlStateMapBitGroup single[]={{"value",names,{3,0}},{0,0,{0,0}}};
const MtlStateMapBitGroup pair[]={{"left",names,{3,0}},{"right",names,{0,3}},{0,0,{0,0}}};
std::vector<std::string> tokens,messages;unsigned position;bool unget;
const char *Com_Parse(const char **) { if(unget){unget=false;--position;}return position<tokens.size()?tokens[position++].c_str():""; }
void Com_UngetToken() { assert(position&&!unget);unget=true; }
void Com_ScriptWarning(const char *format,...) {
    char buffer[256];va_list args;va_start(args,format);vsnprintf(buffer,sizeof(buffer),format,args);va_end(args);messages.push_back(buffer);
}
int Com_MatchToken(const char **text,const char *match,int warning) {
    assert(warning==1);bool matched=!strcmp(Com_Parse(text),match);if(!matched)Com_ScriptWarning("mismatch\n");return matched;
}
void *allocate(int size) { return malloc(size); }
struct { void *(*Hunk_AllocInternal)(int); } ri={allocate};
void Com_Memcpy(void *out,const void *in,int size) { memcpy(out,in,size); }
'''+source+r'''
void run(std::initializer_list<const char *> input,bool expected,int count=0,bool both=false) {
    tokens.clear();for(auto token:input)tokens.push_back(token);position=0;unget=false;messages.clear();
    const char *cursor="";const MaterialStateMapRuleSet *out=nullptr;
    assert(bool(Material_ParseRuleSet(&cursor,"test",both?pair:single,&out))==expected);
    if(expected) {
        assert(out&&out->ruleCount==count&&messages.empty());
        for(int i=0;i<count;++i) {
            assert(out->rules[i].stateBitsSet[0]==(both?1:0));
            assert(out->rules[i].stateBitsClear[0]==(both?~3:~0));
            if(both)assert(out->rules[i].stateBitsSet[1]==2&&out->rules[i].stateBitsClear[1]==~3);
        }
        if(count==2) {
            assert(out->rules[0].stateBitsMask[0]==3&&out->rules[0].stateBitsMask[1]==0);
            assert(out->rules[0].stateBitsValue[0]==1&&out->rules[0].stateBitsValue[1]==0);
            assert(out->rules[1].stateBitsMask[0]==0&&out->rules[1].stateBitsMask[1]==3);
            assert(out->rules[1].stateBitsValue[0]==0&&out->rules[1].stateBitsValue[1]==2);
        }
        free((void*)out);
    } else assert(!out&&!messages.empty());
}
int main() {
    run({"test","{","default",":","passthrough",";","}"},true,1);
    run({"test","{","mode","==","one",":","color","==","two",":","passthrough",";","}"},true,2);
    run({"test","{","mode","==","one",":","color","==","two",":","one",",","two",";","}"},true,2,true);
    run({"test","{","mode","==","one","&&","color","==","two",":","one",",","two",";","}"},true,1,true);
    run({"wrong"},false);run({"test","wrong"},false);run({"test","{","}"},false);
    run({"test","{","default","wrong"},false);
    run({"test","{","mode","wrong"},false);
    run({"test","{","mode","==","missing"},false);
    run({"test","{","mode","==","one","wrong"},false);
    run({"test","{","mode","==","one","&&","missing"},false);
    run({"test","{","mode","==","one",":","}"},false);
    run({"test","{","passthrough",";","}"},false);
    run({"test","{","default",":","missing",";","}"},false);
    run({"test","{","default",":","one","wrong"},false);
    run({"test","{","default",":","one","wrong"},false,0,true);
    for(int count:{1,2,255,256,257}) {
        tokens={"test","{"};
        for(int i=0;i<count;++i) {
            for(auto token:{"default",":","passthrough",";"})tokens.push_back(token);
        }
        tokens.push_back("}");position=0;unget=false;messages.clear();
        const char *cursor="";const MaterialStateMapRuleSet *out=nullptr;
        assert(bool(Material_ParseRuleSet(&cursor,"test",single,&out))==(count<=256));
        if(count<=256){assert(out->ruleCount==count);free((void*)out);}else assert(!out&&messages.size()==1);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_state_rules_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual state rules, conditional chains, grouped values, copy semantics, errors and256/257 bounds')

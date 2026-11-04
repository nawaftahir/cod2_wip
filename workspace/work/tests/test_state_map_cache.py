"""Exercise the real state-map cache/load wrapper, including failed-load retention."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('MaterialStateMap *Material_LoadCachedStateMap('):text.index('bool Material_FindCachedShaderText(')]
program = r'''
#define Com_ParseInternal Com_Parse

#include <cassert>
#include <cstring>
#include <map>
#include <string>
#include <vector>
struct MaterialStateMap { const char *name; } first={"first"},second={"second"};
typedef unsigned char Bool;
std::vector<std::string> tokens;
unsigned cursor;
int warnings;
const char *Com_Parse(const char **) { return cursor<tokens.size()?tokens[cursor++].c_str():""; }
int Com_MatchToken(const char **text,const char *match,int warning) {
    assert(warning==1);bool ok=!strcmp(Com_Parse(text),match);warnings+=!ok;return ok;
}
void Com_ScriptWarning(const char *message) {
    assert(!strcmp(message,"missing stateMap filename\n"));++warnings;
}
std::map<std::string,MaterialStateMap*> cache;
std::vector<std::string> calls;
MaterialStateMap *loadResult;
const char *expectedName;
MaterialStateMap *Material_FindStateMap(const char *name) {
    assert(name==expectedName);calls.push_back("find");
    auto found=cache.find(name);return found==cache.end()?nullptr:found->second;
}
MaterialStateMap *Material_LoadStateMap(const char *name) {
    assert(name==expectedName);calls.push_back("load");return loadResult;
}
void Material_SetStateMap(const char *name,MaterialStateMap *map) {
    assert(name==expectedName&&map==loadResult&&map);calls.push_back("set");cache[name]=map;
}
'''+source+r'''
int main() {
    expectedName="first";cache["first"]=&first;loadResult=&second;
    assert(Material_LoadCachedStateMap(expectedName)==&first);
    assert(calls==std::vector<std::string>({"find"}));
    calls.clear();expectedName="second";loadResult=nullptr;
    assert(!Material_LoadCachedStateMap(expectedName));
    assert(calls==std::vector<std::string>({"find","load"}));
    assert(cache.size()==1&&cache["first"]==&first);
    calls.clear();loadResult=&second;
    assert(Material_LoadCachedStateMap(expectedName)==&second);
    assert(calls==std::vector<std::string>({"find","load","set"}));
    calls.clear();loadResult=nullptr;
    assert(Material_LoadCachedStateMap(expectedName)==&second);
    assert(calls==std::vector<std::string>({"find"})&&cache.size()==2);
    calls.clear();cache["second"]=nullptr;
    assert(!Material_LoadCachedStateMap(expectedName)&&cache["second"]==nullptr);
    assert(calls==std::vector<std::string>({"find","load"}));
    for(int problem=0;problem<6;++problem) {
        tokens={"stateMap","second",";"};cursor=0;warnings=0;calls.clear();cache.clear();
        if(problem==0)tokens[0]="wrong";
        if(problem==1)tokens[1]="";
        if(problem==2)tokens[1]=";";
        if(problem==4)tokens[2]="wrong";
        expectedName=tokens[1].c_str();loadResult=problem==3?nullptr:&second;
        MaterialStateMap *out=&first;const char *input="";
        assert(bool(Material_LoadPassStateMap(&input,&out))==(problem==5));
        if(problem<3)assert(out==&first&&calls.empty()&&warnings==1);
        else if(problem==3)assert(!out&&cache.empty()&&!warnings);
        else assert(out==&second&&cache["second"]==&second&&warnings==(problem==4));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_state_map_cache_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: state-map cache/load and pass syntax,output retention,failed loads and semicolons')

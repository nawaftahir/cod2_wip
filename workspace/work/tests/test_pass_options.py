"""Exercise the real five-option DX7 parser, including partial writes on errors."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('// PINNED10190250:'):text.index('// PINNED10018370:')]
program = r'''
#define Com_ParseInternal Com_Parse

#include <cassert>
#include <cstddef>
#include <cstring>
#include <string>
#include <vector>
typedef unsigned char Bool;
typedef unsigned char byte;
struct MaterialPassDx7 {
    unsigned stateMap;Bool gridLighting,projectToInfinity,ambientLighting,objectiveGlow,fogToBlack;
    byte after[43];
};
struct PassOptionDx7 { const char *name;size_t valueOffset; };
std::vector<std::string> tokens;unsigned cursor;int warnings,ungets;
const char *Com_Parse(const char **) { return cursor<tokens.size()?tokens[cursor++].c_str():""; }
int Com_MatchToken(const char **text,const char *match,int warning) {
    assert(warning==1);bool equal=!strcmp(Com_Parse(text),match);warnings+=!equal;return equal;
}
void Com_UngetToken() { assert(cursor);--cursor;++ungets; }
'''+source+r'''
int main() {
    const char *names[]={"gridLighting","projectToInfinity","ambientLighting","objectiveGlow","fogToBlack"};
    for(unsigned mask=0;mask<32;++mask) {
        tokens.clear();cursor=0;warnings=ungets=0;
        for(int i=4;i>=0;--i)if(mask&(1u<<i)) {
            tokens.push_back(names[i]);tokens.push_back("(");tokens.push_back(")");tokens.push_back(";");
        }
        tokens.push_back("texture");tokens.push_back("following");
        MaterialPassDx7 pass;memset(&pass,0xa5,sizeof(pass));
        const char *input="";assert(Material_LoadPassOptionsDx7(&input,&pass));
        assert(!warnings&&ungets==1&&tokens[cursor]=="texture");
        assert(pass.stateMap==0xa5a5a5a5);
        for(int i=0;i<5;++i)assert(((byte*)&pass)[4+i]==bool(mask&(1u<<i)));
        for(byte value:pass.after)assert(value==0xa5);
    }
    for(int bad=0;bad<3;++bad) {
        tokens={"ambientLighting","(",")",";","gridLighting","(",")",";","texture"};
        tokens[5+bad]="bad";cursor=0;warnings=ungets=0;
        MaterialPassDx7 pass;memset(&pass,0xa5,sizeof(pass));const char *input="";
        assert(!Material_LoadPassOptionsDx7(&input,&pass));
        assert(warnings==1&&!ungets&&cursor==6u+bad);
        assert(pass.ambientLighting==1&&!pass.gridLighting&&!pass.projectToInfinity);
        assert(!pass.objectiveGlow&&!pass.fogToBlack);
    }
    tokens={"fogToBlack","(",")",";","fogToBlack","(",")",";","}"};
    cursor=0;warnings=ungets=0;MaterialPassDx7 pass={};const char *input="";
    assert(Material_LoadPassOptionsDx7(&input,&pass)&&pass.fogToBlack==1);
    assert(cursor==8&&ungets==1&&!warnings);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_pass_options_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS:32 DX7 option combinations,duplicates,token retention,syntax errors and untouched pass bytes')

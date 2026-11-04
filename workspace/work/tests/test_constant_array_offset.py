"""Check the real constant-array parser, including partial writes on later errors."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('Bool Material_ParseConstantArrayOffset('):text.index('// PINNED 10019a80:')]
program = r'''
#define Com_ParseInternal Com_Parse

#include <cassert>
#include <cstring>
#include <cstdlib>
#include <cstdarg>
#include <vector>
#include <initializer_list>
typedef unsigned char Bool;
struct ShaderConstantRouting { unsigned char elemCount; };
struct CodeConstantSource { const char *name;int arrayCount; };
std::vector<const char*> tokens;unsigned position;int warnings,ungets;
const char **expectedText;
const char *Com_Parse(const char **text) { assert(text==expectedText);return position<tokens.size()?tokens[position++] : ""; }
int Com_ParseInt(const char **text) { return atoi(Com_Parse(text)); }
void Com_UngetToken() { assert(position>0);--position;++ungets; }
int Com_MatchToken(const char **text,const char *match,int warning) { assert(warning==1);return !strcmp(Com_Parse(text),match); }
void Com_ScriptWarning(const char *format,...) { assert(format&&*format);++warnings; }
'''+source+r'''
int main() {
    for(int count:{0,1,2,4})for(unsigned char requested:{0,1,2,4})for(int test=0;test<7;++test) {
        const char *cursor="";expectedText=&cursor;position=warnings=ungets=0;
        ShaderConstantRouting routing={requested};CodeConstantSource source={"colors",count};
        int offset=777,expected=777,expectedWarnings=0;bool success=false;
        switch(test) {
        case 0:tokens={"next"};success=requested<=count;expected=success?0:777;expectedWarnings=!success;break;
        case 1:tokens={"[","-1","]"};expectedWarnings=1;break;
        case 2:tokens={"[","4","]"};expectedWarnings=1;break;
        case 3:tokens={"[","0",",","1","]"};break;
        case 4:tokens={"[","0",",","3","]"};break;
        case 5:tokens={"[","0","bad"};break;
        case 6:tokens={"[","0",",","1","bad"};break;
        }
        if(test>=3) {
            if(!count)expectedWarnings=1;
            else {
                expected=0;
                if(requested>1) {
                    if(test==3||test==4||test==6) {
                        int ending=test==4?3:1;
                        expectedWarnings=ending!=requested-1;
                        success=!expectedWarnings&&test!=6;
                    }
                }
            }
        }
        assert(Material_ParseConstantArrayOffset(&cursor,&routing,&source,&offset)==success);
        assert(offset==expected&&warnings==expectedWarnings&&ungets==(test==0));
        if(test==0)assert(position==0);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_constant_array_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 112 constant-array range, implicit/unget, syntax, ending-index and partial-write cases')

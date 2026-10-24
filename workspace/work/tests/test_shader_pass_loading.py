"""Real version parser -> shader cache -> compiler -> cache insertion path."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_material_load_obj.cpp').read_text()
source = text[text.index('// PINNED 1001a810:'):text.index('// PINNED 1001a920:')]
program = r'''
#include <cassert>
#include <cmath>
#include <cstdio>
#include <vector>
struct MaterialShader {} cachedShader,createdShader;
float versionInput;
int typeInput,versionExpected,route;
const char filename[]="test.hlsl";
const char **expectedText;
std::vector<int> calls;
float Com_ParseFloat(const char **text) {assert(text==expectedText);calls.push_back(1);return versionInput;}
const char *Com_Parse(const char **text) {assert(text==expectedText);calls.push_back(2);return filename;}
__attribute__((noinline)) int I_fround(float value) {return int(floor(double(value)+0.5));}
MaterialShader *Material_FindShader(const char *name,int type,int version) {
    assert(name==filename&&type==typeInput&&version==versionExpected);calls.push_back(3);return route==0?&cachedShader:0;
}
MaterialShader *Material_CreateShader(const char *name,int type,int version) {
    assert(name==filename&&type==typeInput&&version==versionExpected);calls.push_back(4);return route==1?0:&createdShader;
}
void Material_SetShader(const char *name,int type,int version,MaterialShader *shader) {
    assert(name==filename&&type==typeInput&&version==versionExpected&&shader==&createdShader);calls.push_back(5);
}
'''+source+r'''
int main() {
    int cases=0;
    for(float version : {-1.0f,1.1f,2.0f,2.05f,2.1f,3.0f})for(int type : {0,1})for(int mode=0;mode<3;++mode) {
        volatile float scaled=version*10.0f;
        versionInput=version;versionExpected=int(floor(double(scaled)+0.5));typeInput=type;route=mode;calls.clear();
        const char *text="input";expectedText=&text;
        MaterialShader *shader=Material_LoadPassShader(&text,type);
        if(mode==0)assert(shader==&cachedShader&&calls==std::vector<int>({1,2,3}));
        else if(mode==1)assert(!shader&&calls==std::vector<int>({1,2,3,4}));
        else assert(shader==&createdShader&&calls==std::vector<int>({1,2,3,4,5}));
        ++cases;
    }
    printf("PASS: %i actual shader parse/cache/create routes, no version clamp, cache hits and failed compilation\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_shader_pass_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)

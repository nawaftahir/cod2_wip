"""Check the actual string append, allocation, padding and terminator behavior."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_debug.cpp').read_text()
source = text[text.index('void R_AddDebugString('):text.index('void R_AddScaledDebugString(')]
program = r'''
#include <cassert>
#include <cstring>
#include <algorithm>
#include <initializer_list>
struct trDebugString_t { float xyz[3],color[4],scale;char text[96]; };
static_assert(sizeof(trDebugString_t)==128,"retail string stride");
struct DebugGlobals { trDebugString_t *strings;int stringCount,stringLimit; };
trDebugString_t strings[8];int calls,limit;
void *allocate(int bytes) { assert(bytes==limit*128);++calls;return strings; }
struct { void *(*Z_MallocInternal)(int); } ri={allocate};
void VectorCopy(const float *a,float *b) { memcpy(b,a,12); }
void VectorCopy4(const float *a,float *b) { memcpy(b,a,16); }
'''+source+r'''
int main() {
    const float origin[3]={1.0f,-2.0f,3.0f},color[4]={0.25f,0.5f,-1.0f,2.0f};
    const float scale=-0.0f;
    for(int existing=0;existing<2;++existing)
    for(int oldCount=0;oldCount<4;++oldCount)
    for(limit=0;limit<=4;++limit)
    for(int length:{0,1,94,95,96,128,200}) {
        char input[201];for(int i=0;i<length;++i)input[i]='a'+i%26;input[length]=0;
        memset(strings,0x5a,sizeof(strings));trDebugString_t expected[8];
        memcpy(expected,strings,sizeof(strings));
        bool accepted=oldCount+1<=limit;
        if(accepted) {
            auto &entry=expected[oldCount];
            memcpy(entry.xyz,origin,12);memcpy(entry.color,color,16);
            memcpy(&entry.scale,&scale,4);memset(entry.text,0,96);
            memcpy(entry.text,input,std::min(95,length));
        }
        DebugGlobals debug={existing?strings:nullptr,oldCount,limit};calls=0;
        R_AddDebugString(&debug,origin,color,scale,input);
        assert(debug.stringCount==oldCount+(accepted?1:0));
        assert(calls==(!existing&&accepted?1:0));
        assert(debug.strings==((existing||accepted)?strings:nullptr));
        assert(!memcmp(strings,expected,sizeof(strings)));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_debug_strings_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 280 string cases, truncation/padding, terminator, signed-zero scale and untouched records')

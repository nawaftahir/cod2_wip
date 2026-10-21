"""Exercise the actual texture-detail policy at every memory threshold."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_image.cpp').read_text()
start = text.index('void R_SetPicmip()\n{')
source = text[start:text.index('\n}', start) + 2]
program = r'''
#include <cassert>
#include <cstdarg>
#include <cstring>
#include <climits>
struct dvar_t { union { int integer; bool enabled; } current; } vars[5];
const dvar_t *r_picmip_manual=vars,*r_picmip=vars+1,*r_picmip_bump=vars+2,
    *r_picmip_spec=vars+3,*r_rendererInUse=vars+4;
struct { int picmip,picmipBump,picmipSpec; } imageGlobals;
unsigned textureMemory,systemMemory;int written[3],writes,prints;
unsigned R_AvailableTextureMemory() { return textureMemory; }
int GetInt(const char *name) { assert(!strcmp(name,"sys_sysMB"));return (int)systemMemory; }
void SetInt(const dvar_t *var,int value) {
    assert(writes<3&&var==vars+1+writes);written[writes++]=value;
}
void Printf(int channel,const char *,...) { assert(!channel);++prints; }
struct { int (*Dvar_GetInt)(const char *);void (*Dvar_SetInt)(const dvar_t *,int);
    void (*Printf)(int,const char *,...); } ri={GetInt,SetInt,Printf};
'''+source+r'''
int main() {
    const unsigned memories[]={0,27,28,29,99,100,101,119,120,121,129,130,131,
        149,150,151,189,190,191,239,240,241,299,300,301,UINT_MAX};
    const unsigned systems[]={0,383,384,385,479,480,481,UINT_MAX};
    int cases=0;
    for(int manual=0;manual<2;++manual)for(int renderer=1;renderer<=3;++renderer)
    for(unsigned gpu:memories)for(unsigned ram:systems) {
        vars[0].current.enabled=manual!=0;vars[4].current.integer=renderer;
        vars[1].current.integer=-1;vars[2].current.integer=3;vars[3].current.integer=4;
        textureMemory=gpu;systemMemory=ram;writes=prints=0;
        imageGlobals.picmip=imageGlobals.picmipBump=imageGlobals.picmipSpec=-99;
        int expected[3];bool reduced=false;
        if(manual) { expected[0]=-1;expected[1]=3;expected[2]=4; }
        else {
            if(renderer==2) {
                expected[0]=expected[1]=expected[2]=gpu>=100?0:gpu>=28?1:2;
            } else {
                expected[0]=gpu>=190?0:gpu>=120?1:2;
                expected[1]=gpu>=240?0:gpu>=130?1:2;
                expected[2]=gpu>=300?0:gpu>=150?1:2;
            }
            int minimum=renderer==2?(ram>=384?0:1):(ram>=480?0:ram>=384?1:2);
            for(int &value:expected)if(value<minimum) { value=minimum;reduced=true; }
        }
        R_SetPicmip();assert(writes==3&&prints==2+(reduced?1:0));
        assert(imageGlobals.picmip==expected[0]&&imageGlobals.picmipBump==expected[1]
            &&imageGlobals.picmipSpec==expected[2]);
        for(int i=0;i<3;++i)assert(written[i]==expected[i]);
        ++cases;
    }
    assert(cases==1248);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_picmip_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 1248 texture-detail policies, unsigned thresholds, manual override and dvar writes')

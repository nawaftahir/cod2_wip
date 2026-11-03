"""Exercise the actual PC transparency probe, including positive HRESULTs."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_init.cpp').read_text()
source = text[text.index('static Bool R_CheckTransparencyMsaa('):text.index('void R_StoreDirect3DCaps(')]
program = r'''
#include <cassert>
#include <cstdio>
#include <initializer_list>
typedef unsigned UINT;
typedef unsigned char Bool;
typedef unsigned D3DFORMAT;
enum {D3DDEVTYPE_HAL=1,D3DFMT_A8R8G8B8=21,D3DRTYPE_SURFACE=1};
#define MAKEFOURCC(a,b,c,d) ((unsigned)(a)|((unsigned)(b)<<8)|((unsigned)(c)<<16)|((unsigned)(d)<<24))
struct {struct {int integer;} current;} samples;
auto r_aaSamples = &samples;
int calls, result;
struct Adapter {
    int CheckDeviceFormat(UINT index,int type,int format,int usage,int resource,D3DFORMAT check) {
        ++calls;
        assert(index==7 && type==1 && format==21 && usage==0 && resource==1);
        assert(check==0x41415353);
        return result;
    }
} adapter;
struct {Adapter *d3d9;} dx={&adapter};
''' + source + r'''
int main() {
    int cases=0;
    for(int count:{-1,0,1,2,4,16})for(int status:{-2147467259,-1,0,1,2}) {
        samples.current.integer=count;result=status;calls=0;
        Bool supported=R_CheckTransparencyMsaa(7);
        assert(calls==(count!=1));
        assert(supported==((count!=1)&&(status==0)));
        ++cases;
    }
    printf("PASS: %d actual transparency probes, exact COM arguments, single-sample bypass and strict S_OK\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_transparency_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

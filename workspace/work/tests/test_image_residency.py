"""Actual image registry traversal, retail comparator, feedback drawing and command."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
local = (work / 'src/gfx_d3d/r_local.h').read_text()
image_types = local[local.index('union GfxTexture'):local.index('// Stringized after expansion')]
image = (work / 'src/gfx_d3d/r_image.cpp').read_text()
registry = image[image.index('// PINNED1000d480:'):image.index('// PINNED1000c7c0:')]
source = (work / 'src/gfx_d3d/rb_imagetouch.cpp').read_text()
source = source[source.index('// PINNED 10035850:'):]
backend = (work / 'src/gfx_d3d/rb_backend.h').read_text().replace('#pragma once','').replace('__declspec(align(16)) struct','struct alignas(16)')
commands = (work / 'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once','')
permanent = (work / 'src/gfx_d3d/r_permanent.h').read_text().replace('#pragma once','')
header = (work / 'src/gfx_d3d/r_image_registry.h').read_text().replace('#pragma once','')
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
command = text[text.index('// PINNED 10031ef0:'):text.index('// Backend presentation.')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <vector>
#include <algorithm>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef int GfxRenderTargetId;
typedef void IDirect3DBaseTexture9;typedef void IDirect3DTexture9;typedef void IDirect3DVolumeTexture9;typedef void IDirect3DCubeTexture9;
struct D3DMATRIX {float m[4][4];};struct D3DVIEWPORT9 {unsigned X,Y,Width,Height;float MinZ,MaxZ;};
''' + image_types + backend + commands + permanent + header + r'''
struct Material {int id;} materials[2]={{1},{2}};
r_backEndGlobals_t backEnd;r_global_permanent_t rgp;GfxImage g_imageProgs[13],images[2048];
struct {GfxImage *imageHashTable[2048];} imageGlobals;
struct Packet {GfxCmdHeader header;byte payload[28];} original={{33,4},{}},alternate={{33,12},{}},finalCommand={{33,20},{}};GfxRenderCommandExecState *live;
int mutation,draws,ends,throwAt;std::vector<GfxImage *> expected;struct Failure {};
void RB_DrawStretchPic(const Material *material,float x,float y,float w,float h,float s0,float t0,float s1,float t1,unsigned color) {
    assert((unsigned)draws<expected.size()&&backEnd.currentFeedbackImage==expected[draws]);
    assert(material==&materials[mutation&&draws?1:0]&&!x&&!y&&w==8&&h==8&&!s0&&!t0&&s1==1&&t1==1&&color==0xffffffff);
    assert(draws==ends);++draws;
    if(mutation){rgp.feedbackReplaceMaterial=&materials[1];live->cmd=&alternate;}
    if(throwAt==draws)throw Failure();
}
void RB_EndSurface() {
    assert(draws==ends+1&&backEnd.currentFeedbackImage==expected[ends]);++ends;
    if(mutation==2)live->cmd=&finalCommand;
}
''' + registry + source + command + r'''
int main() {
    int comparisons=0,walks=0,aborts=0;
    GfxImage a={},b={};GfxImage *pa=&a,*pb=&b;
    for(int sa=0;sa<256;++sa)for(int sb=0;sb<256;++sb)for(int difference:{-4096,0,4096}) {
        a.semantic=sa;b.semantic=sb;a.cardMemory.platform[0]=8192;b.cardMemory.platform[0]=8192+difference;
        int want=!sb?-1:!sa?1:difference?difference:sa-sb;
        assert(RB_CompareTouchImages(&pa,&pb)==want);++comparisons;
    }
    for(int count:{0,1,2,7,31,64,513,2048})for(int pattern=0;pattern<3;++pattern)for(mutation=0;mutation<3;++mutation)for(int useCommand=0;useCommand<2;++useCommand) {
        memset(&imageGlobals,0,sizeof(imageGlobals));expected.clear();
        for(int i=0;i<count;++i){GfxImage &v=images[i];memset(&v,0,sizeof(v));v.mapType=i%5;v.semantic=pattern==0?0:pattern==1?i%7?i%255+1:0:i%255+1;v.cardMemory.platform[0]=i*97;
            imageGlobals.imageHashTable[i]=i%17==0?g_imageProgs+i%13:&v;
            if(i%17&&v.semantic&&v.mapType==3)expected.push_back(&v);
        }
        std::sort(expected.begin(),expected.end(),[](const GfxImage *a,const GfxImage *b){return a->cardMemory.platform[0]>b->cardMemory.platform[0];});
        GfxRenderCommandExecState state={&original,1,{&original,&alternate}};live=&state;
        backEnd.currentFeedbackImage=&images[0];rgp.feedbackReplaceMaterial=&materials[0];draws=ends=throwAt=0;
        if(useCommand)RB_TouchAllImagesCmd(&state);else RB_TouchAllImages();
        assert(!backEnd.currentFeedbackImage&&draws==(int)expected.size()&&draws==ends);
        const void *base=expected.empty()||!mutation?(void *)&original:mutation==1?(void *)&alternate:(void *)&finalCommand;
        assert(state.cmd==(useCommand?(const byte *)base+((const GfxCmdHeader *)base)->byteCount:base));
        assert(state.stackPos==1&&state.retCmd[0]==&original&&state.retCmd[1]==&alternate);++walks;
        if(!expected.empty()){
            GfxRenderCommandExecState failureState={&original,0,{0,0}};live=&failureState;rgp.feedbackReplaceMaterial=&materials[0];draws=ends=0;throwAt=1;
            try {RB_TouchAllImagesCmd(&failureState);assert(false);}catch(Failure&){}
            assert(draws==1&&!ends&&backEnd.currentFeedbackImage==expected[0]);
            assert(failureState.cmd==(mutation?(void *)&alternate:(void *)&original));++aborts;
        }
    }
    printf("PASS: %d actual comparator cases, %d registry/command traversals and %d interrupted draws; program-image exclusion, eligible memory order, live material/cursor and feedback publication\n",comparisons,walks,aborts);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_image_residency_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-I',str(work / 'src/gfx_d3d'),'-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

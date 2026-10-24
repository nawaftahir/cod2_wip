"""Actual 2D command records, surface transitions, early counts and rotated geometry."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('// Backend 2D commands.'):text.index('// Backend light, stencil, shadow and clip commands.')]
header = (work / 'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once','')
tess = (work / 'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once','')
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cmath>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef int GfxRenderTargetId;
struct GfxViewport {int x,y,width,height;};
struct Material {int id;} a={1},b={2},c={3},other={4};
''' + header + tess + r'''
GfxTess tess;
struct {byte projection2D;} backEnd;
struct {int renderTargetWidth,renderTargetHeight;} dxState;
union Command {GfxCmdStretchPic stretch;GfxCmdStretchPicRotate rotate;GfxCmdDrawQuadPic quad;GfxCmdDrawFullScreenColoredQuad full;byte bytes[128];} original,alternate,finalCommand;
GfxRenderCommandExecState *live;int kind,mutation,sets,ends,begins,overflows,base,firstIndex;
const Material *wantedMaterial;
unsigned short indices[0x100008];
struct Vertex {int index;float x,y,s,t;unsigned color;};std::vector<Vertex> vertices;
struct Stretch {const Material *material;float x,y,w,h,s0,t0,s1,t1;unsigned color;} stretch;
unsigned color(){return kind?original.rotate.color:original.quad.color;}
void setColor(unsigned value){if(kind)original.rotate.color=value;else original.quad.color=value;}
void RB_Set2D(){++sets;backEnd.projection2D=1;if(mutation==1){original.quad.material=&b;live->cmd=&alternate;}}
void RB_EndSurface(){++ends;tess.vertexCount=tess.indexCount=tess.optimizedIndexCount=0;if(mutation==2){original.quad.material=&c;live->cmd=&alternate;}}
void RB_BeginSurface(const Material *m,int technique,int lightmap){assert(m==wantedMaterial&&technique==3&&lightmap==31);++begins;tess.material=m;tess.techType=3;tess.vertexCount=tess.indexCount=0;}
void RB_TessOverflow(){++overflows;tess.vertexCount=7;tess.indexCount=10;if(mutation==3){live->cmd=&alternate;if(kind){original.rotate.x=-19;original.rotate.y=23;original.rotate.w=28;original.rotate.h=42;original.rotate.rotation=45;}else for(int i=0;i<4;++i){original.quad.verts[i][0]=i*13-9;original.quad.verts[i][1]=i*7+3;}}}
void FastSinCos(float value,float *s,float *co){*s=sinf(value);*co=cosf(value);}
void RB_SetVertex2D(int index,float x,float y,float s,float t,unsigned value){assert(tess.vertexCount==base+4&&tess.indexCount==firstIndex+6);vertices.push_back({index,x,y,s,t,value});if(mutation==4&&vertices.size()==1){live->cmd=&finalCommand;setColor(0x88776655);}}
void RB_DrawStretchPic(const Material *m,float x,float y,float w,float h,float s0,float t0,float s1,float t1,unsigned value){stretch={m,x,y,w,h,s0,t0,s1,t1,value};live->cmd=&alternate;}
''' + source + r'''
bool close(float a,double b){return std::fabs(a-b)<.001;}
int main() {
    int quads=0,rotations=0,wrappers=0;
    const float angles[]={-45,0,30,90,180,359};
    for(kind=0;kind<2;++kind)for(int projected=0;projected<2;++projected)for(int match=0;match<3;++match)
    for(int initialVertex:{0,5446,5447})for(int initialIndex:{0,0x100000-6,0x100000-5})for(int optimized=0;optimized<2;++optimized)
    for(mutation=0;mutation<5;++mutation)for(int angle=0;angle<(kind?6:1);++angle) {
        memset(&original,0,sizeof(original));memset(&alternate,0,sizeof(alternate));memset(&finalCommand,0,sizeof(finalCommand));
        ((GfxCmdHeader *)&original)->byteCount=kind?48:44;((GfxCmdHeader *)&alternate)->byteCount=64;((GfxCmdHeader *)&finalCommand)->byteCount=96;
        original.quad.material=&a;
        if(kind){original.rotate.x=12;original.rotate.y=-6;original.rotate.w=40;original.rotate.h=18;original.rotate.s0=.1f;original.rotate.t0=.2f;original.rotate.s1=.7f;original.rotate.t1=.8f;original.rotate.rotation=angles[angle];}
        else for(int i=0;i<4;++i){original.quad.verts[i][0]=i*9-3;original.quad.verts[i][1]=i*i*7+2;}
        setColor(0xff15a237);backEnd.projection2D=projected;
        wantedMaterial=!projected&&mutation==1?&b:&a;
        tess.material=match==0?&other:wantedMaterial;tess.techType=match==1?7:3;tess.vertexCount=initialVertex;tess.indexCount=initialIndex;tess.optimizedIndexCount=optimized?6:0;tess.indices=indices;
        bool mismatch=match!=2;bool overflow=!mismatch&&(initialVertex+4>5450||initialIndex+6>0x100000);
        base=mismatch?0:overflow?7:initialVertex;firstIndex=mismatch?0:overflow?10:initialIndex;
        for(int i=0;i<7;++i)indices[firstIndex+i]=0xa6a6;
        if(firstIndex)indices[firstIndex-1]=0xb7b7;
        GfxRenderCommandExecState state={&original,1,{&a,&b}};live=&state;sets=ends=begins=overflows=0;vertices.clear();
        if(kind)RB_StretchPicRotateCmd(&state);else RB_DrawQuadPicCmd(&state);
        assert(sets==!projected&&begins==mismatch&&ends==(mismatch&&(initialIndex||optimized))&&overflows==overflow);
        assert(vertices.size()==4&&tess.vertexCount==base+4&&tess.indexCount==firstIndex+6);
        unsigned short wanted[]={static_cast<unsigned short>(base+3),static_cast<unsigned short>(base),static_cast<unsigned short>(base+2),static_cast<unsigned short>(base+2),static_cast<unsigned short>(base),static_cast<unsigned short>(base+1)};
        assert(!memcmp(indices+firstIndex,wanted,sizeof(wanted))&&indices[firstIndex+6]==0xa6a6&&(!firstIndex||indices[firstIndex-1]==0xb7b7));
        const void *end=mutation==4?(void *)&finalCommand:(!projected&&mutation==1)||(mismatch&&(initialIndex||optimized)&&mutation==2)||(overflow&&mutation==3)?(void *)&alternate:(void *)&original;
        assert(state.cmd==(const byte *)end+((const GfxCmdHeader *)end)->byteCount&&state.stackPos==1&&state.retCmd[0]==&a&&state.retCmd[1]==&b);
        double radians=(float)(original.rotate.rotation*0.017453292f),co=std::cos(radians),si=std::sin(radians);
        for(int i=0;i<4;++i) {
            auto v=vertices[i];assert(v.index==base+i&&v.color==(mutation==4&&i?0x88776655u:0xff15a237u));
            if(kind) {
                double hx=original.rotate.w*.5,hy=original.rotate.h*.5,xx=i==0||i==3?-hx:hx,yy=i<2?-hy:hy;
                assert(close(v.x,original.rotate.x+hx+co*xx-si*yy)&&close(v.y,original.rotate.y+hy+si*xx+co*yy));
                assert(v.s==(i==0||i==3?original.rotate.s0:original.rotate.s1)&&v.t==(i<2?original.rotate.t0:original.rotate.t1));
            } else assert(v.x==original.quad.verts[i][0]&&v.y==original.quad.verts[i][1]&&v.s==(i==1||i==2?1:0)&&v.t==(i>=2?1:0));
        }
        if(kind)++rotations;else ++quads;
    }
    for(int full=0;full<2;++full)for(int width:{-32,0,1280})for(int height:{0,720}) {
        memset(&original,0,sizeof(original));memset(&alternate,0,sizeof(alternate));((GfxCmdHeader *)&alternate)->byteCount=64;
        original.stretch.material=&a;
        if(full){original.full.s0=.1f;original.full.t0=.2f;original.full.s1=.7f;original.full.t1=.8f;original.full.color=0x1234abcd;}
        else{original.stretch.x=17;original.stretch.y=-8;original.stretch.w=31;original.stretch.h=42;original.stretch.s0=.1f;original.stretch.t0=.2f;original.stretch.s1=.7f;original.stretch.t1=.8f;original.stretch.color=0x1234abcd;}
        dxState.renderTargetWidth=width;dxState.renderTargetHeight=height;GfxRenderCommandExecState state={&original,0,{0,0}};live=&state;
        if(full)RB_DrawFullScreenColoredQuadCmd(&state);else RB_StretchPicCmd(&state);
        assert(stretch.material==&a&&stretch.color==0x1234abcd);
        const float *inputUV=full?&original.full.s0:&original.stretch.s0;
        assert(!memcmp(&stretch.s0,inputUV,16));
        assert(stretch.x==(full?0:17)&&stretch.y==(full?0:-8)&&stretch.w==(full?width:31)&&stretch.h==(full?height:42));
        assert(state.cmd==(byte *)&alternate+64);++wrappers;
    }
    printf("PASS: %d quad,%d rotated and%d wrapper routes; captured records, surface/overflow boundaries, early counts, live color/advance and finite geometry with mocked trig/surfaces\n",quads,rotations,wrappers);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_2d_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

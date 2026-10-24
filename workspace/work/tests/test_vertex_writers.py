"""Check actual DX7/DX9 vertex writers and every byte outside the selected slot."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('void RB_SetVertex2D(', text.index('// PINNED 1002e470:')):text.index('// name unconfirmed: write a lit +Z-facing')]
program = r'''
#include <cassert>
#include <cstring>
#include <limits>
#include <initializer_list>
typedef unsigned int GfxColor;
struct GfxVertex {
    float xyzw[4],normal[3];GfxColor color;float texCoord[2],binormal[3],tangent[3];
};
struct GfxVertexDx7 { float xyz[3],normal[3];GfxColor color;float texCoord[2]; };
static_assert(sizeof(GfxVertex)==64&&sizeof(GfxVertexDx7)==36,"retail strides");
struct alignas(16) GfxTess { char vertexData[4096]; } tess;
struct { struct { int integer; } current; } renderer;
const decltype(renderer) *r_rendererInUse=&renderer;
'''+source+r'''
int main() {
    for(int mode:{1,2,3})for(int index=0;index<32;++index)
    for(float w:{.5f,1.0f,-2.0f,0.0f,-0.0f,
                 std::numeric_limits<float>::infinity(),std::numeric_limits<float>::quiet_NaN()})
    for(int kind=0;kind<4;++kind) {
        renderer.current.integer=mode;
        GfxColor color=0x81234567u+index;
        float x=index-5.0f,y=index*.25f,z=-index*.5f,s=.125f,t=-.75f;
        const float normal[3]={kind==2?-3.0f:0.0f,kind==2?.5f:0.0f,kind==2?7.0f:1.0f};
        memset(&tess,0x5a,sizeof(tess));GfxTess expected=tess;
        if(mode==2) {
            GfxVertexDx7 v;
            float inv=(kind==1||kind==2)?1.0f/w:1.0f;
            v.xyz[0]=x*inv;v.xyz[1]=y*inv;v.xyz[2]=kind?inv*z:0.0f;
            memcpy(v.normal,normal,12);v.color=color;v.texCoord[0]=s;v.texCoord[1]=t;
            memcpy(expected.vertexData+index*36,&v,sizeof(v));
        } else {
            GfxVertex v;
            v.xyzw[0]=x;v.xyzw[1]=y;v.xyzw[2]=kind?z:0;v.xyzw[3]=(kind==1||kind==2)?w:1;
            memcpy(v.normal,normal,12);v.color=color;v.texCoord[0]=s;v.texCoord[1]=t;
            v.tangent[0]=1;v.tangent[1]=0;v.tangent[2]=0;
            v.binormal[0]=0;v.binormal[1]=1;v.binormal[2]=0;
            memcpy(expected.vertexData+index*64,&v,sizeof(v));
        }
        if(kind==0)RB_SetVertex2D(index,x,y,s,t,color);
        else if(kind==1)RB_SetVertex4D(index,x,y,z,w,s,t,&color);
        else if(kind==2)RB_SetLitVertex4D(index,x,y,z,w,normal[0],normal[1],normal[2],s,t,&color);
        else RB_SetVertex3D(index,x,y,z,s,t,&color);
        assert(!memcmp(&tess,&expected,sizeof(tess)));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_vertex_writers_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 2,688 vertex cases, DX7/DX9 strides, W edge cases and all untouched bytes')

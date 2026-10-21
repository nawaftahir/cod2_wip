"""Run the actual initializer with the real 32-bit renderer cache layout."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent.parent / 'src'
source = (packet / 'gfx_d3d/rb_state.cpp').read_text()
header = (packet / 'gfx_d3d/r_local.h').read_text()

def body(text, declaration):
    start = text.index(declaration)
    brace = text.index('{', start)
    end, depth = brace + 1, 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end]

program = r'''
#include <cassert>
#include <cstring>
#include <vector>
typedef unsigned char Bool;
typedef unsigned int DWORD,D3DCOLOR;
typedef int D3DFOGMODE;
struct GfxImage;
struct IDirect3DSurface9;
struct IDirect3DIndexBuffer9;
struct IDirect3DVertexBuffer9;
struct IDirect3DPixelShader9;
struct IDirect3DVertexShader9;
struct IDirect3DVertexDeclaration9;
struct D3DVIEWPORT9 { unsigned X,Y,Width,Height;float MinZ,MaxZ; };
'''
for declaration in ('enum GfxRenderTargetId', 'enum GfxViewportBehavior', 'struct DxState\n'):
    program += body(header, declaration) + ';\n'
program += r'''
DxState dxState;
struct GfxViewport { int x,y,width,height; };
struct { GfxViewport sceneViewport;unsigned char defaultSamplerState; } backEnd;
struct { int width,height; } vidConfig;
struct { struct { int integer; } current; } textureMode;
const decltype(textureMode) *r_textureMode=&textureMode;
std::vector<int> events;
void RB_SetAnisotropy() {
 const unsigned char expected[5]={1,2,6,10,11};
 assert(backEnd.defaultSamplerState==expected[textureMode.current.integer]);
 assert(dxState.refStateBits[0]==0&&dxState.renderTargetWidth==0);
 events.push_back(1);
}
void RB_SetRenderTarget(GfxRenderTargetId id) {
 assert(id==R_RENDERTARGET_FRAME_BUFFER&&dxState.renderTargetId==R_RENDERTARGET_NONE);
 assert(dxState.viewport.Width==(unsigned)vidConfig.width&&dxState.viewport.Height==(unsigned)vidConfig.height);
 assert(dxState.viewport.X==0&&dxState.viewport.Y==0&&dxState.viewport.MinZ==0&&dxState.viewport.MaxZ==1);
 assert(dxState.refStateBits[0]==0x18128812&&dxState.activeStateBits[0]==0x19128912);
 dxState.renderTargetId=id;dxState.renderTargetWidth=vidConfig.width+17;
 dxState.renderTargetHeight=vidConfig.height+19;events.push_back(2);
}
void RB_SetInitialDx7State() {
 assert(!dxState.viewportIsNull);events.push_back(3);
 dxState.fog.end=1;dxState.fog.density=1;
}
'''
default_start = source.index('static const unsigned char defaultSamplerStateTable')
program += source[default_start:source.index('void RB_InitSceneViewport()', default_start)]
program += body(source, 'void RB_SetInitialState()')
program += r'''
int main() {
 static_assert(sizeof(void*)==4&&sizeof(DxState)==0x2170,"retail cache layout");
 const int sizes[][2]={{640,480},{1024,768},{1,1},{1937,1103}};
 for(const auto &size:sizes)for(int mode=0;mode<5;++mode) {
  std::memset(&dxState,0xcc,sizeof(dxState));std::memset(&backEnd,0xcc,sizeof(backEnd));
  vidConfig.width=size[0];vidConfig.height=size[1];textureMode.current.integer=mode;events.clear();
  RB_SetInitialState();
  assert((events==std::vector<int>{1,2,3}));
  assert(backEnd.sceneViewport.x==0&&backEnd.sceneViewport.y==0);
  assert(backEnd.sceneViewport.width==size[0]&&backEnd.sceneViewport.height==size[1]);
  assert(dxState.refStateBits[1]==(int)0xe00e0007u&&dxState.activeStateBits[1]==(int)0xe00e0007u);
  assert(dxState.renderTargetWidth==size[0]+17&&dxState.renderTargetHeight==size[1]+19);
  assert(dxState.textureColorArg==1&&dxState.textureFactor==0xffffffffu);
  assert(dxState.fog.end==1&&dxState.fog.density==1&&!dxState.viewportIsNull);
  for(unsigned char value:dxState.reservedTail)assert(value==0);
  for(int i=0;i<16;++i)assert(!dxState.samplerImage[i]&&dxState.samplerState[i]==1);
  for(unsigned i=0;i<sizeof(dxState.vertexShaderConsts);++i)
   assert(((const unsigned char*)dxState.vertexShaderConsts)[i]==0xff);
  for(unsigned i=0;i<sizeof(dxState.pixelShaderConsts);++i)
   assert(((const unsigned char*)dxState.pixelShaderConsts)[i]==0xff);
 }
}
'''
with tempfile.TemporaryDirectory(prefix='codex_initial_state_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual initializer, retail-sized32-bit cache, all5 sampler defaults, state/call order, scene dimensions and8192 invalid cache bytes')

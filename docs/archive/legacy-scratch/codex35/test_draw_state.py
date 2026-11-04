"""Execute actual shader/declaration caches and the primary triangle draw gates."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/rb_state.cpp').read_text()
source = source[source.index('// PINNED 10038430'):source.index('void RB_SetFVF(')]
header = (packet / 'src/gfx_d3d/r_local.h').read_text()
start = header.index('#define R_DX_STRING')
macro = header[start:header.index('// opencod2 common_types.h', start)]
program = r'''
#include <cassert>
#include <vector>
struct IDirect3DPixelShader9 {};
struct IDirect3DVertexShader9 {};
struct IDirect3DVertexDeclaration9 {};
enum { D3DPT_TRIANGLELIST=4 };
struct dvar_t { struct { int integer; } current; } floorDvar,capDvar;
const dvar_t *r_drawPrimFloor=&floorDvar,*r_drawPrimCap=&capDvar;
struct { bool projection2D; } backEnd;
struct { IDirect3DPixelShader9 *pixelShader;IDirect3DVertexShader9 *vertexShader;
 IDirect3DVertexDeclaration9 *vertexDecl;unsigned fvf; } dxState;
int alwaysfails,retries,logs;
void RB_LogPrint(const char *) { ++logs; }
struct Draw { int base,first;unsigned count,start,prims; };
struct Device {
 int pixelCalls=0,vertexCalls=0,declCalls=0;
 IDirect3DPixelShader9 *pixelSeen=0;
 IDirect3DVertexShader9 *vertexSeen=0;
 IDirect3DVertexDeclaration9 *declSeen=0;
 std::vector<Draw> draws;
 void retry() { if(retries) { --retries;alwaysfails=1; } else alwaysfails=0; }
 void SetPixelShader(IDirect3DPixelShader9 *s) { ++pixelCalls;pixelSeen=s;retry(); }
 void SetVertexShader(IDirect3DVertexShader9 *s) { ++vertexCalls;vertexSeen=s;retry(); }
 void SetVertexDeclaration(IDirect3DVertexDeclaration9 *d) { ++declCalls;declSeen=d;retry(); }
 void DrawIndexedPrimitive(int type,int base,unsigned first,unsigned count,unsigned start,unsigned prims) {
  assert(type==4);draws.push_back({base,int(first),count,start,prims});retry();
 }
} device;
struct { Device *device; } dx={&device};
'''
program += macro + source
program += r'''
int main() {
 IDirect3DPixelShader9 pixel;IDirect3DVertexShader9 vertex;IDirect3DVertexDeclaration9 decl;
 RB_ChangePixelShader(0);RB_ChangeVertexShader(0);RB_ChangeVertexDeclaration(0);
 assert(logs==0);
 RB_ChangePixelShader(&pixel);RB_ChangeVertexShader(&vertex);dxState.fvf=338;
 RB_ChangeVertexDeclaration(&decl);
 assert(device.pixelCalls==1&&device.vertexCalls==1&&device.declCalls==1&&logs==3);
 assert(dxState.pixelShader==&pixel&&dxState.vertexShader==&vertex&&dxState.vertexDecl==&decl&&dxState.fvf==0);
 RB_ChangePixelShader(&pixel);RB_ChangeVertexShader(&vertex);dxState.fvf=123;
 RB_ChangeVertexDeclaration(&decl);assert(logs==3&&dxState.fvf==123);
 retries=2;RB_ChangePixelShader(0);assert(device.pixelCalls==4&&dxState.pixelShader==0);
 RB_ChangeVertexShader(0);RB_ChangeVertexDeclaration(0);
 assert(!dxState.vertexShader&&!dxState.vertexDecl&&!dxState.fvf);
 GfxDrawPrimArgs args={3,12,4,{{-7,9}}};
 floorDvar.current.integer=5;RB_DrawIndexedPrimitive(&args);assert(device.draws.empty());
 floorDvar.current.integer=4;capDvar.current.integer=4;RB_DrawIndexedPrimitive(&args);
 assert(device.draws.size()==1);
 const Draw &d=device.draws[0];assert(d.base==-7&&d.first==3&&d.count==12&&d.start==9&&d.prims==4);
 capDvar.current.integer=3;RB_DrawIndexedPrimitive(&args);assert(device.draws.size()==1);
 capDvar.current.integer=0;RB_DrawIndexedPrimitive(&args);assert(device.draws.size()==2);
 capDvar.current.integer=-1;RB_DrawIndexedPrimitive(&args);assert(device.draws.size()==2);
 backEnd.projection2D=true;floorDvar.current.integer=100;capDvar.current.integer=1;
 retries=1;RB_DrawIndexedPrimitive(&args);assert(device.draws.size()==4);
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_draw_state_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual shader/declaration caches, null transitions, retries, triangle gates and 2D bypass')

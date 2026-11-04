"""Exercise actual view/projection cache invalidation and DX7 device routing."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/rb_state.cpp').read_text()
header = (packet / 'src/gfx_d3d/rb_backend.h').read_text()

def body(text, declaration):
    start = text.index(declaration)
    brace = text.index('{', start)
    depth, end = 1, brace + 1
    while depth:
        depth += (text[end] == '{') - (text[end] == '}')
        end += 1
    return text[start:end]

program = r'''
#include <cassert>
#include <cstring>
typedef unsigned char Bool;
#define __declspec(x)
#define R_DX_CALL(x) do { x; } while (0)
struct D3DMATRIX { float m[4][4]; };
struct D3DVIEWPORT9 { unsigned int X,Y,Width,Height;float MinZ,MaxZ; };
const int D3DTS_VIEW=2,D3DTS_PROJECTION=3;
'''
for name in ['GfxCodeMatrix', 'GfxCodeMatrices', 'GfxViewParms']:
    declaration = ('__declspec(align(16)) ' if name == 'GfxCodeMatrix' else '') + 'struct ' + name + '\n'
    program += body(header, declaration) + ';\n'
program += r'''
struct { GfxCodeMatrices codeMatrixStack[3];int codeMatrixStackLevel; } backEnd;
struct dvar_t { struct { int integer; } current; } renderer;
const dvar_t *r_rendererInUse=&renderer;
struct Device {
    int count,which[4];D3DMATRIX values[4];
    void SetTransform(int kind,const D3DMATRIX *matrix) {
        assert(count<4);which[count]=kind;values[count++]=*matrix;
    }
} device;
struct { Device *device; } dx={&device};
'''
for declaration in ['static GfxCodeMatrices *RB_GetActiveCodeMatrices()',
                    'static void RB_InvalidateCodeMatrix(',
                    'static void RB_ValidatePrimaryCodeMatrix(',
                    'static bool RB_UsingDx7Renderer()',
                    'static __declspec(noinline) void RB_CopyViewParmsMatrices(',
                    'void RB_ProjectionMatrixChanged()',
                    'void RB_SetMatricesForView(']:
    program += body(source, declaration) + '\n'
program += r'''
void valid(const GfxCodeMatrix &m,int a,int b,int c,int d) {
    assert(m.valid[0]==a && m.valid[1]==b && m.valid[2]==c && m.valid[3]==d);
}
int main() {
    for(int level=0;level<3;++level)for(int mode=1;mode<=2;++mode) {
        memset(&backEnd,0x5a,sizeof(backEnd));backEnd.codeMatrixStackLevel=level;
        renderer.current.integer=mode;device.count=0;
        GfxViewParms input={};
        for(int r=0;r<4;++r)for(int c=0;c<4;++c) {
            input.viewMatrix.m[r][c]=r*4+c+1;
            input.projectionMatrix.m[r][c]=r*4+c+101;
            input.viewProjectionMatrix.m[r][c]=r*4+c+201;
            input.inverseViewProjectionMatrix.m[r][c]=r*4+c+301;
        }
        GfxCodeMatrices before=backEnd.codeMatrixStack[level];
        RB_SetMatricesForView(&input);
        GfxCodeMatrices &m=backEnd.codeMatrixStack[level];
        assert(!memcmp(&m.view.matrix[0],&input.viewMatrix,64));
        assert(!memcmp(&m.projection.matrix[0],&input.projectionMatrix,64));
        assert(!memcmp(&m.viewProjection.matrix[0],&input.viewProjectionMatrix,64));
        assert(!memcmp(&m.viewProjection.matrix[1],&input.inverseViewProjectionMatrix,64));
        valid(m.view,1,0,0,0);valid(m.projection,1,0,0,0);
        valid(m.viewProjection,1,1,0,0);valid(m.worldView,0,0,0,0);
        valid(m.worldViewProjection,0,0,0,0);valid(m.normalizedWorldViewProjection,0,0,0,0);
        assert(!memcmp(&m.world,&before.world,sizeof(m.world)));
        assert(!memcmp(&m.shadowLookupMatrix,&before.shadowLookupMatrix,sizeof(m.shadowLookupMatrix)));
        assert(device.count==(mode==2 ? 2:0));
        if(mode==2) {
            assert(device.which[0]==2 && device.which[1]==3);
            assert(!memcmp(&device.values[0],&input.viewMatrix,64));
            assert(!memcmp(&device.values[1],&input.projectionMatrix,64));
        }
        device.count=0;RB_ProjectionMatrixChanged();
        valid(m.projection,1,0,0,0);valid(m.viewProjection,0,0,0,0);
        valid(m.worldViewProjection,0,0,0,0);valid(m.normalizedWorldViewProjection,0,0,0,0);
        assert(device.count==(mode==2 ? 1:0));
        if(mode==2)assert(device.which[0]==3 && !memcmp(&device.values[0],&input.projectionMatrix,64));
        for(int other=0;other<3;++other)if(other!=level) {
            const unsigned char *p=(const unsigned char *)&backEnd.codeMatrixStack[other];
            for(unsigned int i=0;i<sizeof(GfxCodeMatrices);++i)assert(p[i]==0x5a);
        }
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_view_matrices_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual view/projection copies, cache flags, three stack levels and DX7 routing')

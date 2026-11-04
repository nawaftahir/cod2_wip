"""Exercise the actual DX7/DX9 tessellation-quad initializers."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
source = (packet / 'src/gfx_d3d/rb_sky.cpp').read_text()
source = '\n'.join(line for line in source.splitlines() if not line.startswith('#include'))
tess_header = (packet / 'src/gfx_d3d/rb_tess.h').read_text()
source = tess_header + '\n' + source
header = (packet / 'src/universal/com_math.h').read_text()
helper = ''
for name in ('VectorSet', 'Vector2Set'):
    start = header.index('TU_STATIC void ' + name + '(')
    helper += header[start:header.index('}', start) + 1] + '\n'
program = ('#include <cassert>\n#include <cstring>\ntypedef float vec3_t[3];\ntypedef float vec2_t[2];\n'
           '#define TU_STATIC static inline\n' + helper + source + r'''
int main() {
    unsigned short indices[32];GfxColor color; color.packed=0x12345678;
    const float uv[4][2]={{0,0},{1,0},{1,1},{0,1}};
    const int order[6]={3,0,2,2,0,1};
    for(int start=0;start<3;++start)for(int dx7=0;dx7<2;++dx7) {
        std::memset(&tess,0xcc,sizeof(tess));
        std::memset(indices,0xcc,sizeof(indices));
        tess.indices=indices;tess.indexCount=3;tess.vertexCount=start;
        if(dx7) {
            GfxVertexDx7 *verts=RB_SetTessQuadDx7(color);
            assert(verts==(GfxVertexDx7*)tess.vertexData+start);
            for(int v=0;v<4;++v) {
                assert(verts[v].normal[0]==0 && verts[v].normal[1]==0 && verts[v].normal[2]==1);
                assert(verts[v].color.packed==color.packed);
                assert(verts[v].texCoord[0]==uv[v][0] && verts[v].texCoord[1]==uv[v][1]);
                for(int c=0;c<12;++c)assert(((unsigned char*)verts[v].xyz)[c]==0xcc);
            }
        } else {
            GfxVertex *verts=RB_SetTessQuad(color);
            assert(verts==(GfxVertex*)tess.vertexData+start);
            for(int v=0;v<4;++v) {
                assert(verts[v].normal[0]==0 && verts[v].normal[1]==0 && verts[v].normal[2]==1);
                assert(verts[v].color.packed==color.packed);
                assert(verts[v].texCoord[0]==uv[v][0] && verts[v].texCoord[1]==uv[v][1]);
                for(int c=0;c<3;++c) {
                    assert(verts[v].binormal[c]==(c==1));
                    assert(verts[v].tangent[c]==(c==0));
                }
                for(int c=0;c<16;++c)assert(((unsigned char*)verts[v].xyzw)[c]==0xcc);
            }
        }
        assert(tess.vertexCount==start+4 && tess.indexCount==9);
        for(int i=0;i<6;++i)assert(indices[i+3]==start+order[i]);
        for(int i=0;i<3;++i)assert(indices[i]==0xcccc);
        for(int i=9;i<32;++i)assert(indices[i]==0xcccc);
    }
}
''')
with tempfile.TemporaryDirectory(prefix='codex35_sky_quad_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual DX7/DX9 quad indices, normals, packed color, UVs, tangent space and untouched positions')

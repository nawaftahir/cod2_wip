"""Exercise actual quaternion conversion and DX7 vertex transfer on the host."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
target = next(p for p in packet.parents if (p / 'src/opencod2/headers/common_types.h').is_file())
types = (target / 'src/opencod2/headers/common_types.h').read_text()

def body(source, declaration):
    start = source.index(declaration)
    brace = source.index('{', start)
    depth, end = 1, brace + 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

program = '''
#include <cassert>
#include <cmath>
#include <cstring>
typedef unsigned char byte;
typedef float vec2_t[2];
typedef float vec3_t[3];
struct XVertexBuffer;
struct DObjAnimMat_s { float quat[4], trans[3], transWeight; };
struct DObjSkelMat_s { float axis[3][4], origin[4]; };
typedef DObjAnimMat_s DObjAnimMat;
typedef DObjSkelMat_s DObjSkelMat;
'''
for declaration in ('union GfxColor {', 'struct GfxVertexDx7 {', 'struct XVertexInfo_s {'):
    program += body(types, declaration) + ';\n'
program += 'typedef XVertexInfo_s XVertexInfo;\n'
math = (packet / 'src/universal/com_math.h').read_text()
program += body(math, 'TU_STATIC void VectorScale(').replace('TU_STATIC', 'static') + '\n'
program += body(math, 'TU_STATIC void VectorCopy(').replace('TU_STATIC', 'static') + '\n'
program += body((packet / 'src/gfx_d3d/r_model.cpp').read_text(),
                'void R_ConvertAnimMatToSkelMat(') + '\n'
source = (packet / 'src/gfx_d3d/r_xsurface.cpp').read_text()
program += body(source, 'void XSurfaceTransferDx7(const XVertexBuffer *surfVerts, GfxVertexDx7 *verts, int vertCount)\n{')
program += r'''
void close(float a,float b) { assert(std::fabs(a-b)<0.00001f); }
int main() {
    static_assert(sizeof(XVertexInfo)==64,"input stride");
    static_assert(sizeof(GfxVertexDx7)==36,"output stride");
    DObjAnimMat mat={{0,0,0,1},{3,5,7},2}; DObjSkelMat out;
    for(int turn=0;turn<3;++turn) {
        if(turn==1) mat.quat[2]=mat.quat[3]=std::sqrt(0.5f);
        if(turn==2) mat.transWeight=0;
        R_ConvertAnimMatToSkelMat(&mat,&out);
        for(int i=0;i<3;++i) for(int j=0;j<4;++j) {
            float expected=j==i ? 1.f : 0.f;
            if(turn==1 && i<2 && j<2) expected=(i==0 && j==1)?1.f:(i==1 && j==0)?-1.f:0.f;
            close(out.axis[i][j],expected);
        }
        for(int i=0;i<3;++i) close(out.origin[i],mat.trans[i]);
        close(out.origin[3],1);
    }
    XVertexInfo input[5]={}; GfxVertexDx7 vertices[7];
    for(int i=0;i<5;++i) {
        for(int j=0;j<3;++j) { input[i].offset[j]=10*i+j;input[i].normal[j]=100+10*i+j; }
        for(int j=0;j<4;++j) input[i].color[j]=i*4+j;
        input[i].texCoordX=i+0.25f;input[i].texCoordY=i+0.5f;
    }
    const int counts[]={-1,0,1,4,5};
    for(int count:counts) {
        memset(vertices,0xa5,sizeof(vertices));
        XSurfaceTransferDx7((const XVertexBuffer *)input,vertices+1,count);
        for(int i=0;i<7;++i) {
            if(i>=1 && i<=count) {
                for(int j=0;j<3;++j) { close(vertices[i].xyz[j],input[i-1].offset[j]);close(vertices[i].normal[j],input[i-1].normal[j]); }
                assert(!memcmp(vertices[i].color.array,input[i-1].color,4));
                close(vertices[i].texCoord[0],input[i-1].texCoordX);close(vertices[i].texCoord[1],input[i-1].texCoordY);
            } else for(byte b:reinterpret_cast<byte (&)[36]>(vertices[i])) assert(b==0xa5);
        }
    }
}
'''
with tempfile.TemporaryDirectory(prefix='codex35_model_transfer_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-std=c++11','-O2','-fno-strict-aliasing','-x','c++','-','-o',binary],
                   input=program,text=True,check=True)
    subprocess.run([binary],check=True)
print('PASS: actual matrix conversion and DX7 transfer; zero/negative/unrolled/tail counts')

"""Exercise the actual polygon append body, allocation order and both limits."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_debug.cpp').read_text()
source = text[text.index('void R_AddDebugPolygon('):text.index('void R_AddDebugLine(')]
program = r'''
#include <cassert>
#include <cstring>
typedef float vec3_t[3];
struct GfxDebugPoly { float color[4]; int firstVert,vertCount; };
static_assert(sizeof(GfxDebugPoly)==24,"retail polygon stride");
struct DebugGlobals {
    vec3_t *verts; int vertCount,vertLimit;
    GfxDebugPoly *polys; int polyCount,polyLimit;
};
GfxDebugPoly polygons[8]; vec3_t vertices[32];
int calls,polyLimit,vertLimit;
void *allocate(int size) {
    ++calls;
    if(calls==1) { assert(size==polyLimit*24);return polygons; }
    assert(calls==2 && size==vertLimit*12);return vertices;
}
struct { void *(*Z_MallocInternal)(int); } ri={allocate};
'''+source+r'''
int main() {
    const float color[4]={0.125f,-2.0f,3.0f,0.75f};
    vec3_t points[5];
    for(int i=0;i<5;++i)for(int j=0;j<3;++j)points[i][j]=i*4+j+0.5f;
    for(int existing=0;existing<2;++existing)
    for(int oldVerts=0;oldVerts<4;++oldVerts)
    for(int oldPolys=0;oldPolys<3;++oldPolys)
    for(int count=0;count<=5;++count)
    for(vertLimit=0;vertLimit<=9;++vertLimit)
    for(polyLimit=0;polyLimit<=4;++polyLimit) {
        memset(polygons,0x5a,sizeof(polygons));
        memset(vertices,0x39,sizeof(vertices));
        GfxDebugPoly beforePolys[8];vec3_t beforeVerts[32];
        memcpy(beforePolys,polygons,sizeof(polygons));
        memcpy(beforeVerts,vertices,sizeof(vertices));
        DebugGlobals debug={existing?vertices:nullptr,oldVerts,vertLimit,
                            existing?polygons:nullptr,oldPolys,polyLimit};
        calls=0;R_AddDebugPolygon(&debug,color,count,points);
        bool accepted=oldVerts+count<=vertLimit && oldPolys+1<=polyLimit;
        assert(debug.vertCount==oldVerts+(accepted?count:0));
        assert(debug.polyCount==oldPolys+(accepted?1:0));
        assert(calls==(accepted&&!existing?2:0));
        if(accepted) {
            assert(debug.polys==polygons && debug.verts==vertices);
            GfxDebugPoly expected;
            memcpy(expected.color,color,sizeof(color));
            expected.firstVert=oldVerts;expected.vertCount=count;
            memcpy(beforePolys+oldPolys,&expected,sizeof(expected));
            memcpy(beforeVerts+oldVerts,points,count*sizeof(vec3_t));
        } else {
            assert(debug.polys==(existing?polygons:nullptr));
            assert(debug.verts==(existing?vertices:nullptr));
        }
        assert(!memcmp(beforePolys,polygons,sizeof(polygons)));
        assert(!memcmp(beforeVerts,vertices,sizeof(vertices)));
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_debug_polygons_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 7,200 polygon append/limit cases, allocation order, metadata and untouched storage')

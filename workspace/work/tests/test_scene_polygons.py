"""Exercise the actual polygon callback and its shared draw-surface helper."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_scene.cpp').read_text()
helper = text[text.index('static void R_AddDrawSurf('):text.index('// PINNED 10023ed0/')]
callback = text[text.index('void R_AddPolyToScene('):text.index('// PINNED 10024610/')]
program = r'''
#include <cassert>
#include <cstring>
#include <cstdio>
enum surfaceType_t {SF_POLY=1};
struct Material {struct {unsigned sortedIndex;} info;};
struct GfxWorldVertex {unsigned words[17];};
struct srfPoly_t {
    surfaceType_t surfaceType; Material *material;
    unsigned short lmapIndex,vertCount; GfxWorldVertex *verts;
};
struct GfxDrawSurf {unsigned sort;const surfaceType_t *surface;};
struct GfxBackEndData {
    int drawSurfCount; GfxDrawSurf drawSurfs[65536];
    int polyCount; srfPoly_t polys[2048];
    int polyVertCount; GfxWorldVertex polyVerts[8193];
} backend;
GfxBackEndData *frontEndDataOut=&backend;
struct {int polyCount,drawSurfCount;} scene;
struct {bool registered;} rg;
struct {Material *defaultMaterial;} rgp;
struct {struct {bool enabled;} current;} sortDvar;
auto fx_sort=&sortDvar;
'''+helper+callback+r'''
int main() {
    static_assert(sizeof(srfPoly_t)==16 && sizeof(GfxWorldVertex)==68,"PC polygon layout");
    static GfxWorldVertex input[8193];
    for(unsigned i=0;i<8193;++i)
        for(unsigned j=0;j<17;++j)input[i].words[j]=i*17+j;
    Material fallback={{11}}, explicitMaterial={{7}};
    rgp.defaultMaterial=&fallback;
    int cases=0;
    const int counts[]={0,1,3,8192,8193,65535,65536,65537,-65535};
    const int starts[]={0,1,8191,8192};
    const int polys[]={0,2047,2048};
    const int draws[]={0,65535,65536};
    const int scenePolys[]={-2049,-1,0,2047,2048};
    for(int enabled=0;enabled<2;++enabled)
    for(int useDefault=0;useDefault<2;++useDefault)
    for(int count:counts)for(int start:starts)for(int poly:polys)
    for(int draw:draws)for(int scenePoly:scenePolys) {
        memset(&backend,0xa5,sizeof(backend));
        backend.polyCount=poly;backend.polyVertCount=start;backend.drawSurfCount=draw;
        scene.polyCount=scenePoly;scene.drawSurfCount=19;rg.registered=enabled;
        Material *material=useDefault?&fallback:&explicitMaterial;
        const unsigned short lmap=65535;
        int narrowed=(unsigned short)count;
        R_AddPolyToScene(useDefault?0:material,lmap,count,input);
        bool accepted=enabled&&start+narrowed<=8192&&poly<2048;
        assert(backend.polyCount==poly+accepted);
        assert(backend.polyVertCount==start+(accepted?narrowed:0));
        assert(scene.polyCount==scenePoly+accepted);
        bool appended=accepted&&draw<65536;
        assert(backend.drawSurfCount==draw+appended);
        assert(scene.drawSurfCount==19+appended);
        if(accepted) {
            const srfPoly_t &p=backend.polys[poly];
            assert(p.surfaceType==SF_POLY&&p.material==material);
            assert(p.lmapIndex==lmap&&p.vertCount==narrowed);
            assert(p.verts==&backend.polyVerts[start]);
            assert(!memcmp(p.verts,input,narrowed*sizeof(*input)));
            for(unsigned word:backend.polyVerts[start+narrowed].words)assert(word==0xa5a5a5a5u);
        } else {
            for(unsigned word:backend.polyVerts[start].words)assert(word==0xa5a5a5a5u);
        }
        if(appended) {
            const GfxDrawSurf &d=backend.drawSurfs[draw];
            unsigned expected=(((material->info.sortedIndex*32u+lmap)<<12)
                +(scenePoly%2048+2048))*16+SF_POLY;
            assert(d.sort==expected&&d.surface==&backend.polys[poly].surfaceType);
        }
        ++cases;
    }
    rg.registered=true;backend.polyCount=0;backend.polyVertCount=0;
    backend.drawSurfCount=0;scene.polyCount=0;
    int highCount=65537;
    R_AddPolyToScene(&explicitMaterial,-1,highCount,input);
    assert(backend.polys[0].lmapIndex==65535&&backend.polys[0].vertCount==1);
    surfaceType_t effectType=(surfaceType_t)2;
    sortDvar.current.enabled=true;
    R_AddDrawSurf(&explicitMaterial,4097,3,&effectType);
    assert(backend.drawSurfs[1].sort==((((1u<<10)+7)*32+3)*16+2));
    printf("PASS: %d actual polygon routes, limits, copies, fallback and signed sort keys\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_scene_polygons_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-m32', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)

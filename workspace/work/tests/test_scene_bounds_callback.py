"""Check the actual public bounds callback and scene-index routing."""
from pathlib import Path
import subprocess
import tempfile

source = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_scene.cpp').read_text()
source = source[source.index('// PC 1.0 10023d40'):source.index('GfxScene scene;')]
program = r'''
#include <cassert>
#include <cstring>
#define __declspec(x)
struct GfxEntity { char bytes[116]; } entities[18];
struct GfxSceneEntity { char bytes[52]; } records[16];
struct { struct { GfxEntity *entities; } def; GfxSceneEntity *sceneEnts; } scene;
GfxSceneEntity *observedRecord; const GfxEntity *observedEntity; int calls;
void R_UpdateXModelBounds(GfxSceneEntity *record,const GfxEntity *entity) {
    observedRecord=record;observedEntity=entity;++calls;
}
'''+source+r'''
int main() {
    memset(entities,0x5a,sizeof(entities));memset(records,0x39,sizeof(records));
    for(int base=0;base<=2;++base) for(int i=0;i<16;++i) {
        scene.def.entities=entities+base;scene.sceneEnts=records;
        calls=0;R_UpdateGfxEntityBoundsCmd(entities+base+i);
        assert(calls==1&&observedRecord==records+i&&observedEntity==entities+base+i);
        calls=0;R_UpdateGfxEntityBounds(entities+base+i);
        assert(calls==1&&observedRecord==records+i&&observedEntity==entities+base+i);
    }
    for(const auto &entity:entities)for(char value:entity.bytes)assert(value==0x5a);
    for(const auto &record:records)for(char value:record.bytes)assert(value==0x39);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_bounds_callback_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 96 actual callback/worker routes, nonzero scene bases and untouched records')

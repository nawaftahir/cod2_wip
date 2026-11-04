"""Actual material image lookup: pointer keys, overrides and water upload."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/rb_shade.cpp').read_text()
source = text[text.index('void RB_ApplyImageOverride('):text.index('// PINNED PC 1.0 code samplers;')]
source += text[text.index('// PINNED 10038920:'):text.index('// PINNED 10039980:')]
program = r'''
#include <cassert>
#include <cstdio>
#define __forceinline inline
typedef unsigned char byte;
struct GfxImage { int mapType; } original,white,black,normal,sentinel;
struct dvar_t { struct {int integer;} current; } colorMode,normalMode,specularMode;
const dvar_t *r_colorMap=&colorMode,*r_normalMap=&normalMode,*r_specularMap=&specularMode;
struct {GfxImage *whiteImage,*blackImage,*identityNormalMapImage;} rgp={&white,&black,&normal};
struct water_t {GfxImage *image;} water;
struct WaterDef {water_t *map;} waterDef={&water};
struct MaterialTextureDef {const char *name;byte samplerState,semantic;union {GfxImage *image;WaterDef *water;} u;};
struct Material {int textureCount;MaterialTextureDef *textures;} material;
struct {Material *material;} tess={&material};
int uploads;
void RB_UploadWaterTexture(GfxImage *image,water_t *map) {assert(image==&original&&map==&water);++uploads;}
''' + source + r'''
int main() {
    char key[]="texture",equalText[]="texture";
    MaterialTextureDef textures[3]={};material.textures=textures;material.textureCount=3;
    textures[1].name=key;textures[1].samplerState=0x32;
    int cases=0;
    for(int semantic=0;semantic<8;++semantic)
    for(int mapType=1;mapType<=5;++mapType)
    for(int mode=-1;mode<=3;++mode) {
        colorMode.current.integer=normalMode.current.integer=specularMode.current.integer=mode;
        original.mapType=mapType;water.image=&original;textures[1].semantic=semantic;
        if(semantic==5)textures[1].u.water=&waterDef;else textures[1].u.image=&original;
        GfxImage *image=&sentinel;byte sampler=0x99;uploads=0;
        RB_GetMaterialImage(key,&image,&sampler);
        GfxImage *expected=&original;int expectedSampler=0x32;
        if(mapType==3) {
            if((semantic==2||semantic==4)&&(mode==1||mode==2)) {
                expected=mode==1?&white:&black;expectedSampler=1;
            }
            if(semantic==3&&mode==1){expected=&normal;expectedSampler=1;}
            if(semantic==5)expectedSampler=6;
        }
        assert(image==expected&&sampler==expectedSampler);
        assert(uploads==(mapType==3&&semantic==5));
        image=&sentinel;sampler=0x99;
        RB_GetMaterialImage(equalText,&image,&sampler);
        assert(image==&sentinel&&sampler==0x99);++cases;
    }
    material.textureCount=0;GfxImage *image=&sentinel;byte sampler=0x99;
    RB_GetMaterialImage(key,&image,&sampler);assert(image==&sentinel&&sampler==0x99);
    std::printf("PASS: %d material-image routes, pointer-key misses and empty table\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_material_image_') as directory:
    source_path=Path(directory)/'test.cpp';binary=Path(directory)/'test'
    source_path.write_text(program)
    subprocess.run(['g++','-std=c++11','-O2',str(source_path),'-o',str(binary)],check=True)
    subprocess.run([str(binary)],check=True)

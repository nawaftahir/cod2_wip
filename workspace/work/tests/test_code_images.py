"""Exercise the actual code-image switch, including world and entity guards."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/rb_shade.cpp').read_text()
start = text.index('static void RB_GetCodeImage(')
source = text[start:text.index('\nextern const dvar_t *r_colorMap', start)]
program = r'''
#include <cassert>
#include <cstdarg>
typedef unsigned char byte;
struct GfxImage { int id; } images[48];
struct LightDef { struct { GfxImage *image;byte samplerState; } attenuation; } lightDefs[2];
struct World { GfxImage *smodelLightingImage,*outdoorImage,*skyImage;
    byte skySamplerState;GfxImage *lightmaps[32][4]; } world;
struct GfxEntity { int reType,renderFx; } entity;
struct Material { const char *name; } material={"test"};
struct { World *world;union { struct { GfxImage *whiteImage,*blackImage,*identityNormalMapImage,
    *specularityImage,*spare,*spare2,*spare3,*lightmapWeightsImage; };GfxImage *codeImages[8]; };
    GfxImage *waterColorImage,*sunHalfAngleImage; } rgp;
struct { struct { GfxImage *image; } renderTargets[13]; } dx;
struct { int lmapIndex;Material *material; } tess;
struct { GfxEntity *currentEntity;GfxImage *currentFeedbackImage;
    int resolvedPostSunTarget,resolvedSceneTarget;struct { LightDef *def; } light[2]; } backEnd;
struct dvar_t { struct { bool enabled; } current; } enabled,lightMap;
const dvar_t *sc_enable=&enabled,*r_lightMap=&lightMap;
enum { ERR_FATAL,ERR_DROP };
int overrides,errorCode;const char *errorText;
void Com_Error(int code,const char *format,...) { errorCode=code;errorText=format;throw 1; }
void R_Error(int code,const char *format,...) { errorCode=code;errorText=format;throw 1; }
void RB_ApplyImageOverride(const dvar_t *var,GfxImage **image,byte *state) {
    assert(var==r_lightMap&&image&&state&&*state==0x32);++overrides;
}
'''+source+r'''
int main() {
    for(int i=0;i<48;++i)images[i].id=i;
    for(int i=0;i<8;++i)rgp.codeImages[i]=images+i;
    for(int i=0;i<13;++i)dx.renderTargets[i].image=images+10+i;
    rgp.waterColorImage=images+30;rgp.sunHalfAngleImage=images+31;
    world.smodelLightingImage=images+32;world.outdoorImage=images+33;
    world.skyImage=images+34;world.skySamplerState=0x43;
    for(int i=0;i<4;++i)world.lightmaps[3][i]=images+35+i;
    for(int i=0;i<2;++i) { lightDefs[i].attenuation.image=images+39+i;
        lightDefs[i].attenuation.samplerState=byte(70+i);backEnd.light[i].def=lightDefs+i; }
    rgp.world=&world;backEnd.currentEntity=&entity;backEnd.currentFeedbackImage=images+41;
    backEnd.resolvedPostSunTarget=1;backEnd.resolvedSceneTarget=2;
    tess.lmapIndex=3;tess.material=&material;
    const int expected[]={1,0,2,3,32,5,6,7,35,36,37,38,14,41,11,12,34,39,40,0,33,16,31,30,-1,-1};
    for(int code=0;code<26;++code) {
        GfxImage *out=images+47;byte state=0xfe;overrides=0;
        RB_GetCodeImage(code,&out,&state);
        assert(out==(expected[code]<0?nullptr:images+expected[code]));
        int want=code<3?1:code==4?0x72:code==16?0x43:code==17?70:code==18?71:code==21?0x31:code>=24?0:0x32;
        assert(state==want&&overrides==(code>=8&&code<=11));
    }
    for(int type=0;type<5;++type)for(int flags:{0,0x100})for(bool on:{false,true}) {
        entity.reType=type;entity.renderFx=flags;enabled.current.enabled=on;
        GfxImage *out;byte state;RB_GetCodeImage(19,&out,&state);
        assert(out==((on&&(type>2||(flags&0x100)))?images+13:rgp.whiteImage)&&state==0x32);
    }
    for(int code:{4,16,20}) {
        rgp.world=nullptr;GfxImage *out=images+47;byte state=0xfe;errorText=nullptr;
        try { RB_GetCodeImage(code,&out,&state);assert(false); } catch(int) {}
        assert(errorCode==ERR_DROP&&errorText&&out==images+47&&state==0xfe);
    }
    rgp.world=&world;tess.lmapIndex=31;
    for(int code=8;code<=11;++code) {
        GfxImage *out=images+47;byte state=0xfe;
        try { RB_GetCodeImage(code,&out,&state);assert(false); } catch(int) {}
        assert(errorCode==ERR_FATAL&&out==images+47&&state==0xfe);
    }
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_code_images_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    '-include', 'initializer_list', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: actual code-image switch, sampler states, shadow entity routing and fatal guards')

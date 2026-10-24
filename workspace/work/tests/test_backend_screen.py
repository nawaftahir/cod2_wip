"""Actual screen copy/save/blur/blend routing with live COM and command callbacks."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/rb_backend.cpp').read_text()
source = text[text.index('// Backend screen copy, shadow blur and saved-screen commands.'):text.index('// Backend stencil-plane and triangle geometry.')]
source = source.replace('#include "r_permanent.h"','').replace('#include <math.h>','')
local = (work / 'src/gfx_d3d/r_local.h').read_text()
a = local.index('#define R_DX_STRING(call)')
z = local.index('} while (alwaysfails)',a) + len('} while (alwaysfails)')
macro = local[a:z]
backend = (work / 'src/gfx_d3d/rb_backend.h').read_text().replace('#pragma once','').replace('__declspec(align(16)) struct','struct alignas(16)')
commands = (work / 'src/gfx_d3d/rb_commands.h').read_text().replace('#pragma once','')
permanent = (work / 'src/gfx_d3d/r_permanent.h').read_text().replace('#pragma once','')
tess = (work / 'src/gfx_d3d/rb_tess.h').read_text().replace('#pragma once','')
image = (work / 'src/gfx_d3d/r_image.cpp').read_text()
a = image.index('IDirect3DSurface9 *Image_GetSurface(')
image = image[a:image.index('void R_SetPicmip()',a)]
assert 'GetSurfaceLevel' in image and 'return surface;' in image
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cmath>
#include <cstdint>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;typedef byte Bool;typedef int HRESULT;typedef int GfxRenderTargetId;
struct D3DMATRIX {float m[4][4];};struct D3DVIEWPORT9 {unsigned X,Y,Width,Height;float MinZ,MaxZ;};
struct IDirect3DSurface9 {int id;unsigned Release();} surfaces[2]={{0},{1}},targets[2]={{2},{3}};
struct Texture {int id;HRESULT GetSurfaceLevel(unsigned,IDirect3DSurface9 **);} textures[2]={{0},{1}};
struct GfxImage {int mapType;struct {Texture *map;} texture;} images[2]={{3,{&textures[0]}},{3,{&textures[1]}}};
struct Material {int id;} materials[4]={{0},{1},{2},{3}};
''' + backend + commands + permanent + tess + r'''
enum {D3DTEXF_LINEAR=2,R_RENDERTARGET_SAVED_SCREEN=7,R_RENDERTARGET_SHADOWCOOKIE_BLUR=5};
struct Device {HRESULT StretchRect(IDirect3DSurface9 *,void *,IDirect3DSurface9 *,void *,int);} devices[2];
struct {Device *device;struct {GfxImage *image;} renderTargets[13];} dx;
struct {int renderTargetWidth,renderTargetHeight;IDirect3DSurface9 *renderTargetSurface;} dxState;
r_backEndGlobals_t backEnd;r_global_permanent_t rgp;GfxTess tess;
struct dvar_t {struct {int integer;} current;} blur,otherBlur;
const dvar_t *sc_blur=&blur;
struct Packet {GfxCmdBlendSavedScreen cmd;byte spare[52];} original,alternate,finalCommand;
GfxRenderCommandExecState *live;const void *cursorBase;
int mode,mutation,retry,alwaysfails,stageTry,copies,draws,ends,sets,rounds,roundResult;char stage;
int copyWidth,copyHeight;GfxImage *copyImage;IDirect3DSurface9 *imageSurface;
float roundValue;unsigned drawColor;std::vector<char> events;
void cursor(const void *packet){live->cmd=packet;cursorBase=packet;}
void RB_LogPrint(const char *message) {
    char next=0;
    if(!strcmp(message,"image->texture.map->GetSurfaceLevel( 0, &surface )\n"))next='G';
    if(!strcmp(message,"dx.device->StretchRect( dxState.renderTargetSurface, 0, imageSurface, 0, D3DTEXF_LINEAR )\n"))next='T';
    if(!strcmp(message,"imageSurface->Release()\n"))next='R';assert(next);
    if(next!=stage){stageTry=0;if(next=='G'){++copies;copyWidth=dxState.renderTargetWidth;copyHeight=dxState.renderTargetHeight;}}
    stage=next;++stageTry;events.push_back(stage);
}
HRESULT Texture::GetSurfaceLevel(unsigned level,IDirect3DSurface9 **out) {
    assert(stage=='G'&&!level);if(mode==1||mode==2)assert(&images[id]==dx.renderTargets[mode==1?7:5].image);copyImage=&images[id];*out=&surfaces[(id+stageTry)&1];imageSurface=*out;
    alwaysfails=stageTry<=retry;
    if(!alwaysfails&&mutation==1){dx.device=&devices[1];dxState.renderTargetSurface=&targets[1];dxState.renderTargetWidth+=17;dxState.renderTargetHeight+=11;dx.renderTargets[5].image=&images[1-id];cursor(&alternate);}
    return -11;
}
HRESULT Device::StretchRect(IDirect3DSurface9 *src,void *srcRect,IDirect3DSurface9 *dst,void *dstRect,int filter) {
    assert(stage=='T'&&this==dx.device&&src==dxState.renderTargetSurface&&!srcRect&&dst==imageSurface&&!dstRect&&filter==2);
    alwaysfails=stageTry<=retry;if(alwaysfails&&mutation==1){dx.device=this==&devices[0]?&devices[1]:&devices[0];dxState.renderTargetSurface=src==&targets[0]?&targets[1]:&targets[0];}return -12;
}
unsigned IDirect3DSurface9::Release() {
    assert(stage=='R'&&this==imageSurface);alwaysfails=stageTry<=retry;
    if(!alwaysfails&&mutation==1){rgp.shadowCookieBlurMaterial=&materials[1];backEnd.sceneDef.time=1234;cursor(&finalCommand);}
    return 0;
}
void RB_EndSurface(){++ends;events.push_back('E');tess.indexCount=tess.optimizedIndexCount=0;
    if(!draws&&mutation==2){sc_blur=&otherBlur;otherBlur.current.integer=1;dx.renderTargets[5].image=&images[1];dx.renderTargets[7].image=&images[0];backEnd.sceneDef.time=20;rgp.savedScreenTime=0;original.cmd.fadeMsec=100;cursor(&alternate);}}
void RB_Set2D(){++sets;events.push_back('S');backEnd.projection2D=1;
    if(mutation==3){backEnd.sceneDef.time=50;rgp.savedScreenTime=10;original.cmd.fadeMsec=200;dxState.renderTargetWidth=-32;dxState.renderTargetHeight=0;cursor(&finalCommand);}}
int I_fround(float value){++rounds;roundValue=value;roundResult=(int)std::lrintl((long double)value+1.0L/(1u<<30));return roundResult;}
void RB_DrawStretchPic(const Material *material,float x,float y,float w,float h,float s0,float t0,float s1,float t1,unsigned color) {
    events.push_back('D');
    if(mode==2){assert(material==rgp.shadowCookieBlurMaterial&&backEnd.currentFeedbackImage==copyImage&&x==1&&y==1&&w==float(copyWidth)-2&&h==float(copyHeight)-2&&color==0xffffffff);
        float low=draws&1?.00390625f:.01171875f,high=draws&1?.98828125f:.99609375f;
        assert(s0==low&&t0==low&&s1==high&&t1==high);
        if(mutation==3){sc_blur=&otherBlur;otherBlur.current.integer=0;cursor(&alternate);}
    }else{assert(mode==3&&material==rgp.shellShockMaterial&&backEnd.currentFeedbackImage==dx.renderTargets[7].image&&!x&&!y&&w==float(dxState.renderTargetWidth)&&h==float(dxState.renderTargetHeight)&&!s0&&!t0&&s1==1&&t1==1);drawColor=color;}
    ++draws;tess.indexCount=6;tess.vertexCount=4;
}
''' + macro + '\n' + image + source + r'''
void reset(int which,int pending,int change,int attempts,GfxRenderCommandExecState &state) {
    mode=which;mutation=change;retry=attempts;alwaysfails=stageTry=copies=draws=ends=sets=rounds=0;stage=0;events.clear();
    memset(&backEnd,0,sizeof(backEnd));memset(&rgp,0,sizeof(rgp));
    original.cmd.header.byteCount=12;alternate.cmd.header.byteCount=32;finalCommand.cmd.header.byteCount=48;
    state={&original,1,{&original,&alternate}};live=&state;cursorBase=&original;
    dx.device=&devices[0];dx.renderTargets[5].image=&images[0];dx.renderTargets[7].image=&images[1];
    dxState.renderTargetWidth=641;dxState.renderTargetHeight=359;dxState.renderTargetSurface=&targets[0];
    rgp.shadowCookieBlurMaterial=&materials[0];rgp.shellShockMaterial=&materials[3];rgp.savedScreenTime=-77;backEnd.sceneDef.time=17;
    backEnd.currentFeedbackImage=&images[0];sc_blur=&blur;otherBlur.current.integer=1;
    tess.indexCount=pending&1?6:0;tess.optimizedIndexCount=pending&2?6:0;
}
void advance(const GfxRenderCommandExecState &state){assert(state.cmd==(const byte *)cursorBase+((const GfxCmdHeader *)cursorBase)->byteCount&&state.stackPos==1&&state.retCmd[0]==&original&&state.retCmd[1]==&alternate);}
void copyEvents(int count){int get=0,stretch=0,release=0;for(char e:events){get+=e=='G';stretch+=e=='T';release+=e=='R';}assert(copies==count&&get==count*(retry+1)&&stretch==get&&release==get);}
int main() {
    int copyCases=0,saveCases=0,blurCases=0,blendCases=0;
    GfxRenderCommandExecState state;
    for(int pending=0;pending<4;++pending)for(int change=0;change<4;++change)for(int attempts=0;attempts<3;++attempts) {
        reset(0,pending,change,attempts,state);RB_CopyBackBufferToSurface(&images[0]);copyEvents(1);assert(!ends&&!sets&&!draws&&state.cmd==cursorBase&&backEnd.currentFeedbackImage==&images[0]);++copyCases;
        reset(1,pending,change,attempts,state);RB_SaveScreenCmd(&state);copyEvents(1);assert(ends==(pending!=0)&&!sets&&!draws&&rgp.savedScreenTime==(change==1?1234:pending&&change==2?20:17));advance(state);++saveCases;
    }
    for(int pending=0;pending<4;++pending)for(int change=0;change<4;++change)for(int attempts=0;attempts<3;++attempts)for(int count:{-1,0,1,2,4}) {
        reset(2,pending,change,attempts,state);blur.current.integer=count;
        int iterations=pending&&change==2?1:count>0?change==3?1:count:0;
        RB_BlurShadowCookieCmd(&state);copyEvents(iterations*2);assert(draws==iterations*2&&ends==draws+(pending!=0)&&!sets);assert(events.empty()||events.back()=='E');advance(state);++blurCases;
    }
    const int times[][2]={{0,0},{1,0},{50,0},{100,0},{300,0},{-1,0},{(-2147483647-1),2147483647},{2147483647,(-2147483647-1)}};
    for(int pending=0;pending<4;++pending)for(int change=0;change<4;++change)for(int projected=0;projected<2;++projected)for(const auto &time:times)for(int fade:{-1,0,1,100,300,1000}) {
        reset(3,pending,change,0,state);backEnd.projection2D=projected;backEnd.sceneDef.time=time[0];rgp.savedScreenTime=time[1];original.cmd.fadeMsec=fade;
        RB_BlendSavedScreenCmd(&state);int elapsed=(int)((uint32_t)backEnd.sceneDef.time-(uint32_t)rgp.savedScreenTime);bool valid=elapsed>=0&&elapsed<original.cmd.fadeMsec;
        assert(!copies&&ends==(pending!=0)&&sets==!projected&&rounds==valid&&draws==valid);
        if(valid){double alpha=std::exp(std::log((double).01f)*(double(elapsed)/original.cmd.fadeMsec));if(alpha>.99f)alpha=.99f;assert(std::fabs(roundValue-alpha*255)<.0001);
            unsigned expectedColor=(unsigned(byte(roundResult))<<24)|0xffffff;assert(drawColor==expectedColor&&tess.indexCount==6&&backEnd.currentFeedbackImage==dx.renderTargets[7].image);
        }else assert(backEnd.currentFeedbackImage==&images[0]);advance(state);++blendCases;
    }
    printf("PASS: %d actual copies, %d saves, %d blur commands and %d blends; real Image_GetSurface, retries/logs, captured dimensions/image, fresh material/time, live blur pointer, wrapped ticks, high-byte alpha and full UVs\n",copyCases,saveCases,blurCases,blendCases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_backend_screen_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-I',str(work / 'src/gfx_d3d'),'-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

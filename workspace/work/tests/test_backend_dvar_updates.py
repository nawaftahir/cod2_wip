"""Actual backend dvar updates and specularity rebuild, with live callback state."""
from pathlib import Path
import subprocess
import tempfile

work=Path(__file__).resolve().parents[1]
text=(work/'src/gfx_d3d/rb_backend.cpp').read_text()
updates=text[text.index('void RB_UpdateBackendDvars()'):text.index('// PINNED PC text drawing, 10032370..10032c92.')]
text=(work/'src/gfx_d3d/r_image.cpp').read_text()
rebuild=text[text.index('void Image_RebuildCosinePowerMap(float shift)'):]
text=(work/'src/gfx_d3d/rb_state.cpp').read_text()
sampler=text[text.index('static const unsigned char defaultSamplerStateTable[]'):text.index('void RB_InitSceneViewport()')]
program=r'''
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <cstring>
#include <cstdio>
#include <vector>
#include <initializer_list>
typedef unsigned char byte;
typedef unsigned int DWORD;typedef int D3DFORMAT;typedef int D3DPOOL;typedef int D3DCUBEMAP_FACES;
const int D3DFMT_L8=50,D3DPOOL_MANAGED=1,D3DCUBEMAP_FACE_POSITIVE_X=0;
struct dvar_t {byte pad[7];bool modified;union {int integer;float value;} current;};
dvar_t vars[5],alternate[5],renderer;
const dvar_t *r_textureMode=&vars[0],*r_anisotropy=&vars[1],*r_cosinePowerMapShift=&vars[2],*r_outdoorFeather=&vars[3],*r_aaAlpha=&vars[4];
const dvar_t *r_rendererInUse=&renderer;
const dvar_t **slots[5]={&r_textureMode,&r_anisotropy,&r_cosinePowerMapShift,&r_outdoorFeather,&r_aaAlpha};
struct {float codeConsts[59][4];byte defaultSamplerState;} backEnd;
struct {bool hasTransparencyMsaa;} dx;
struct {int activeStateBits[2];} dxState;
struct GfxImage;
struct Resource {int id;unsigned Release();} originalResource={1},replacementResource={2},createdResource={3};
struct GfxImage {int mapType;union {Resource *basemap;} texture;int track,memory[2],guard;} images[2];
struct {GfxImage *specularityImage;} rgp;
int alwaysfails=0,clearMode,imageMode,anisotropyCalls,alphaCalls,clearCalls,alphaBits,lastAnisotropy;
int unbindCalls,releaseCalls,createCalls,kernelCalls,uploadCalls;
float wantedShift;
std::vector<int> calls;
unsigned bits(float x){unsigned n;memcpy(&n,&x,4);return n;}
void recordImage(int event){calls.push_back(event);}
void RB_UnbindImage(const GfxImage *image){
 assert(image==images);++unbindCalls;recordImage(10);
 if(imageMode==1)rgp.specularityImage=images+1;
}
unsigned Resource::Release(){
 assert(this==(imageMode==1?&replacementResource:&originalResource));
 ++releaseCalls;recordImage(11);
 if(imageMode==2)rgp.specularityImage=images+1;
 return 0;
}
void Image_Create2DTexture(GfxImage *image,int w,int h,int mip,DWORD usage,D3DFORMAT format,D3DPOOL pool){
 assert(image==rgp.specularityImage&&!image->texture.basemap);
 assert(w==32&&h==256&&mip==1&&usage==0&&format==50&&pool==1);
 ++createCalls;recordImage(12);image->mapType=imageMode==5?4:3;image->texture.basemap=&createdResource;
 if(imageMode==3)rgp.specularityImage=images+1;
}
void Image_BuildSpecularityMap(float shift,byte *pixels){
 assert(bits(shift)==bits(wantedShift));++kernelCalls;recordImage(13);
 for(int i=0;i<8192;++i)pixels[i]=(byte)(i*7+(bits(shift)>>8));
 if(imageMode==4)rgp.specularityImage=images+1;
}
void Image_UploadData(GfxImage *image,D3DFORMAT format,D3DCUBEMAP_FACES face,unsigned mip,const byte *pixels){
 assert(image==rgp.specularityImage&&format==50&&face==0&&mip==0);
 ++uploadCalls;recordImage(14);
 for(int i=0;i<8192;++i)assert(pixels[i]==(byte)(i*7+(bits(wantedShift)>>8)));
}
void clearModified(const dvar_t *var){
 int index=-1;for(int i=0;i<5;++i)if(*slots[i]==var)index=i;
 assert(index>=0&&var->modified);++clearCalls;calls.push_back(index);
 const_cast<dvar_t *>(var)->modified=false;
 if(clearMode==1)*slots[index]=alternate+index;
 if(index==0&&clearMode==2)vars[1].modified=true;
 if(index==1&&clearMode==2)vars[2].modified=false;
 if(index==4){dxState.activeStateBits[0]=0x12345678;}
}
struct {void (*Dvar_ClearModified)(const dvar_t *);} ri={clearModified};
void RB_SetAnisotropy(){++anisotropyCalls;lastAnisotropy=r_anisotropy->current.integer;calls.push_back(6);}
void RB_SetAlphaAntiAliasingState(int state){++alphaCalls;alphaBits=state;calls.push_back(7);}
'''+sampler+rebuild+updates+r'''
void reset(){
 memset(vars,0,sizeof(vars));memset(alternate,0,sizeof(alternate));
 for(int i=0;i<5;++i)*slots[i]=vars+i;
 vars[0].current.integer=1;alternate[0].current.integer=4;
 vars[1].current.integer=8;alternate[1].current.integer=16;
 vars[2].current.value=-0.25f;alternate[2].current.value=0.75f;
 vars[3].current.value=3.5f;alternate[3].current.value=-7.0f;
 vars[4].current.integer=1;alternate[4].current.integer=2;
 memset(images,0,sizeof(images));
 for(int i=0;i<2;++i){images[i].mapType=3;images[i].track=1;images[i].memory[0]=8192;images[i].memory[1]=8192;images[i].guard=12345;}
 images[0].texture.basemap=&originalResource;images[1].texture.basemap=&replacementResource;rgp.specularityImage=images;
 alwaysfails=0;clearMode=imageMode=0;renderer.current.integer=0;
 anisotropyCalls=alphaCalls=clearCalls=unbindCalls=releaseCalls=createCalls=kernelCalls=uploadCalls=0;
 dx.hasTransparencyMsaa=false;dxState.activeStateBits[0]=0x11111111;
 for(int i=0;i<59;++i)for(int j=0;j<4;++j)backEnd.codeConsts[i][j]=(float)(1000+i*4+j);
 backEnd.defaultSamplerState=0x55;calls.clear();
}
int main(){
 assert(sizeof(void *)==4&&offsetof(dvar_t,modified)==7&&offsetof(dvar_t,current)==8&&offsetof(GfxImage,texture)==4);
 int cases=0;
 for(int rendererId:{0,1,2})for(int modifiedMask=0;modifiedMask<32;++modifiedMask)
 for(bool capability:{false,true})for(int replacements:{0,1}){
  reset();renderer.current.integer=rendererId;dx.hasTransparencyMsaa=capability;clearMode=replacements;
  for(int i=0;i<5;++i)vars[i].modified=modifiedMask&(1<<i);
  wantedShift=(replacements?alternate[2]:vars[2]).current.value;
  RB_UpdateBackendDvars();++cases;
  int expectedClear=0;for(int i=0;i<5;++i)expectedClear+=!!(modifiedMask&(1<<i));assert(clearCalls==expectedClear);
  assert(anisotropyCalls==!!(modifiedMask&2));if(modifiedMask&2)assert(lastAnisotropy==(replacements?16:8));
  assert(alphaCalls==((modifiedMask&16)&&capability));if(alphaCalls)assert(alphaBits==0x12345678);
  assert(backEnd.defaultSamplerState==((modifiedMask&1)?(replacements?11:2):0x55));
  for(int i=0;i<59;++i)for(int j=0;j<4;++j){
   float value=i==50&&(modifiedMask&8)?(replacements?-7.0f:3.5f):(float)(1000+i*4+j);
   assert(bits(backEnd.codeConsts[i][j])==bits(value));
  }
  bool rebuilt=(modifiedMask&4)&&rendererId!=2;
  assert(unbindCalls==rebuilt&&releaseCalls==rebuilt&&createCalls==rebuilt&&kernelCalls==rebuilt&&uploadCalls==rebuilt);
  std::vector<int> expected;
  for(int i=0;i<5;++i)if(modifiedMask&(1<<i)){
   expected.push_back(i);if(i==1)expected.push_back(6);
   if(i==2&&rebuilt)for(int event:{10,11,12,13,14})expected.push_back(event);
   if(i==4&&capability)expected.push_back(7);
  }
  assert(calls==expected);
 }
 for(int rendererId:{0,2})for(int mode=0;mode<6;++mode)for(float shift:{-0.5f,0.0f,0.75f}){
  reset();renderer.current.integer=rendererId;imageMode=mode;wantedShift=shift;
  Image_RebuildCosinePowerMap(shift);++cases;
  if(rendererId==2){assert(calls.empty()&&images[0].texture.basemap==&originalResource);}
  else assert(calls==std::vector<int>({10,11,12,13,14}));
  for(auto &image:images)assert(image.track==1&&image.memory[0]==8192&&image.memory[1]==8192&&image.guard==12345);
 }
 reset();clearMode=2;vars[0].modified=vars[2].modified=true;RB_UpdateBackendDvars();++cases;
 assert(calls==std::vector<int>({0,1,6})&&clearCalls==2&&!kernelCalls);
 reset();vars[3].modified=true;unsigned nanBits=0x7fc12345;memcpy(&vars[3].current.value,&nanBits,4);
 RB_UpdateBackendDvars();++cases;for(float v:backEnd.codeConsts[50])assert(bits(v)==nanBits);
 printf("PASS: %d backend dvar/rebuild routes, all32 masks, clear/live replacement order, DX7 skip, 8192-byte upload and image tracking guards\n",cases);
}
'''
with tempfile.TemporaryDirectory() as tmp:
    cpp=Path(tmp)/'test.cpp';exe=Path(tmp)/'test';cpp.write_text(program)
    subprocess.run(['g++','-m32','-std=c++11','-O2','-fno-strict-aliasing',str(cpp),'-o',str(exe)],check=True)
    subprocess.run([str(exe)],check=True)

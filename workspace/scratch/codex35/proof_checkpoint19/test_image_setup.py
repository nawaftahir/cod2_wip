"""Actual texture setup/accounting bodies against scalar size and routing oracles."""
from pathlib import Path
import subprocess
import tempfile

packet = Path(__file__).resolve().parent
common = (packet / 'src/gfx_d3d/r_image_load_common.cpp').read_text()
image = (packet / 'src/gfx_d3d/r_image.cpp').read_text()

def body(source, name):
    start = source.index(name + '(')
    # A forward declaration can precede the definition.
    while source.index(';', start) < source.index('{', start):
        start = source.index(name + '(', start + len(name))
    start = source.rfind('\n', 0, start) + 1
    brace = source.index('{', start)
    end, depth = brace + 1, 1
    while depth:
        depth += (source[end] == '{') - (source[end] == '}')
        end += 1
    return source[start:end]

program = r'''
#include <cassert>
#include <algorithm>
#include <initializer_list>
typedef int D3DFORMAT;
typedef unsigned long DWORD;
enum { D3DFMT_A8R8G8B8=21,D3DFMT_X8R8G8B8=22,D3DFMT_D32=71,
 D3DFMT_D24S8=75,D3DFMT_R32F=114,D3DFMT_R5G6B5=23,D3DFMT_A8L8=51,
 D3DFMT_D16=80,D3DFMT_A8=28,D3DFMT_L8=50,D3DFMT_DXT1=0x31545844,
 D3DFMT_DXT3=0x33545844,D3DFMT_DXT5=0x35545844,D3DPOOL_MANAGED=1 };
struct Picmip { unsigned char platform[2]; };
struct GfxImage { Picmip picmip;unsigned char semantic,noPicmip,track;
 unsigned short width,height,depth;struct { int platform[2]; } cardMemory; };
struct { int width,height; } vidConfig;
struct { int totalMemory[2]; } imageGlobals;
int I_max(int a,int b) { return std::max(a,b); }
int I_min(int a,int b) { return std::min(a,b); }
void Image_PicmipForSemantic(unsigned char semantic,Picmip *p) {
 assert(semantic==3);p->platform[0]=3;p->platform[1]=2;
}
int createKind,createCount,createWidth,createHeight,createDepth,createMips,createUsage,createFormat;
void create(GfxImage *im,int kind,int w,int h,int d,int m,int u,int f,int pool) {
 assert(pool==D3DPOOL_MANAGED);++createCount;createKind=kind;
 createWidth=w;createHeight=h;createDepth=d;createMips=m;createUsage=u;createFormat=f;
 im->width=w;im->height=h;im->depth=d;
}
void Image_Create2DTexture(GfxImage *im,int w,int h,int m,DWORD u,int f,int p) { create(im,3,w,h,1,m,u,f,p); }
void Image_Create3DTexture(GfxImage *im,int w,int h,int d,int m,DWORD u,int f,int p) { create(im,4,w,h,d,m,u,f,p); }
void Image_CreateCubeTexture(GfxImage *im,int w,int m,int f,int p) { create(im,5,w,w,1,m,0,f,p); }
'''
program += '\n'.join(body(common, n) for n in [
    'Image_GetCardMemoryAmountForMipLevel', 'Image_GetCardMemoryAmount'])
program += '\n'.join(body(image, n) for n in [
    'Image_GetPlatformScreenWidth', 'Image_GetPlatformScreenHeight',
    'Image_TrackFullscreenTexture', 'Image_TrackTexture'])
program += '\n'.join(body(common, n) for n in ['Image_ClampPicmip', 'Image_Setup'])
program += r'''
int oneMip(int format,int w,int h,int d) {
 if(format==D3DFMT_DXT1 || format==D3DFMT_DXT3 || format==D3DFMT_DXT5)
  return ((w+3)/4)*((h+3)/4)*d*(format==D3DFMT_DXT1?8:16);
 int bpp;
 switch(format) {
 case 21:case 22:case 71:case 75:case 114:bpp=4;break;
 case 23:case 51:case 80:bpp=2;break;
 case 28:case 50:bpp=1;break;
 default:bpp=0;break;
 }
 return w*h*d*bpp;
}
int memory(int flags,int format,int w,int h,int d) {
 int result=0;
 do {
  result+=oneMip(format,w,h,d);
  if((flags&2) || (w<=1 && h<=1 && d<=1))break;
  w=std::max(1,w/2);h=std::max(1,h/2);d=std::max(1,d/2);
 } while(true);
 return result*((flags&4)?6:1);
}
int main() {
 for(int format:std::initializer_list<int>{21,22,71,75,114,23,51,80,28,50,D3DFMT_DXT1,D3DFMT_DXT3,D3DFMT_DXT5,0})
 for(int w:{1,3,8,17})for(int h:{1,5,16})for(int d:{1,3,8})for(int flags=0;flags<16;++flags) {
  assert(Image_GetCardMemoryAmount(flags,format,w,h,d)==memory(flags,format,w,h,d));
  for(int track=0;track<256;++track) {
   GfxImage im={};im.track=track;im.picmip.platform[0]=3;im.picmip.platform[1]=1;
   imageGlobals.totalMemory[0]=101;imageGlobals.totalMemory[1]=203;
   Image_TrackTexture(&im,flags,format,w,h,d);
   for(int p=0;p<2;++p) {
    int shift=(flags&1)?0:im.picmip.platform[p];
    int expected=memory(flags,format,std::max(1,w>>shift),std::max(1,h>>shift),std::max(1,d>>shift));
    assert(im.cardMemory.platform[p]==expected);
    assert(imageGlobals.totalMemory[p]==(p?203:101)+((track==0 || track==1 || track==4)?0:expected));
   }
  }
  GfxImage im={};im.semantic=3;im.track=2;
  imageGlobals.totalMemory[0]=imageGlobals.totalMemory[1]=0;createCount=0;
  Image_Setup(&im,w,h,d,flags,7,format);
  int limit=0,minSize=(format==D3DFMT_DXT1 || format==D3DFMT_DXT3 || format==D3DFMT_DXT5)?4:1;
  for(int k=1;k<=3;++k)if((std::min(w,h)>>k)>=minSize)limit=k;
  int shift=(flags&3)?0:std::min(3,limit);
  assert(im.noPicmip==bool(flags&3) && im.picmip.platform[0]==shift);
  assert(im.picmip.platform[1]==((flags&3)?0:std::min(2,limit)));
  assert(createCount==1 && createKind==((flags&4)?5:(flags&8)?4:3));
  assert(createWidth==std::max(1,w>>shift));
  assert(createHeight==((flags&4)?createWidth:std::max(1,h>>shift)));
  assert(createDepth==((flags&4 || !(flags&8))?1:std::max(1,d>>shift)));
  assert(createMips==bool(flags&2) && createUsage==((flags&4)?0:7) && createFormat==format);
 }
 for(int w:{1,1920,65539})for(int h:{1,1080,65541})for(int mip:{0,1,3,17})for(int track=0;track<256;++track) {
  vidConfig.width=w;vidConfig.height=h;GfxImage im={};im.track=track;
  im.cardMemory.platform[0]=13;im.cardMemory.platform[1]=29;
  imageGlobals.totalMemory[0]=101;imageGlobals.totalMemory[1]=203;
  Image_TrackFullscreenTexture(&im,mip,D3DFMT_A8R8G8B8);
  for(int p=0;p<2;++p) {
   unsigned short pw=std::max(1,(p?640:w)>>mip),ph=std::max(1,(p?480:h)>>mip);
   int expected=oneMip(21,pw,ph,1);
   assert(im.cardMemory.platform[p]==(p?29:13)+expected);
   assert(imageGlobals.totalMemory[p]==(p?203:101)+((track==0 || track==1 || track==4)?0:expected));
  }
 }
}
'''
with tempfile.TemporaryDirectory(prefix='codex_image_setup_') as temp:
    cpp = Path(temp) / 'test.cpp'
    cpp.write_text(program)
    exe = Path(temp) / 'test'
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    str(cpp), '-o', str(exe)], check=True)
    subprocess.run([str(exe)], check=True)
print('PASS: actual setup, picmip clamp, mip/cube sizes, 256 tracks and fullscreen accumulation')

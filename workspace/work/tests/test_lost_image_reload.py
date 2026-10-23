"""Actual water-map rebuild and lost-image selection, including live table/renderer changes."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_image.cpp').read_text()
local = (work / 'src/gfx_d3d/r_local.h').read_text()
types = local[local.index('union GfxTexture'):local.index('// Stringized after expansion')]
globals_type = text[text.index('struct ImageGlobals\n'):text.index('ImageGlobals imageGlobals;')]
predicate = text[text.index('inline Bool Image_IsCodeImage('):text.index('GfxImage *Image_FindExisting(')]
source = text[text.index('// PINNED 1000d0f0:'):text.index('Bool Image_LoadFromFile(')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdint>
#include <vector>
typedef unsigned char byte;typedef byte Bool;typedef unsigned long DWORD;
typedef int D3DFORMAT;typedef int D3DPOOL;
enum {D3DUSAGE_DYNAMIC=512,D3DPOOL_DEFAULT=0,D3DFMT_X8R8G8B8=22,D3DFMT_L8=50};
struct Texture {} oldTexture,newTexture;
typedef Texture IDirect3DBaseTexture9;typedef Texture IDirect3DTexture9;
typedef Texture IDirect3DVolumeTexture9;typedef Texture IDirect3DCubeTexture9;
''' + types + globals_type + r'''
ImageGlobals imageGlobals;GfxImage g_imageProgs[13];
struct dvar_t {struct {int integer;} current;} renderer;
const dvar_t *r_rendererInUse=&renderer;
struct Create {GfxImage *image;int width,height,mips,format;};std::vector<Create> calls;
int mutation;
void Image_Create2DTexture(GfxImage *image,int w,int h,int mips,DWORD usage,D3DFORMAT format,D3DPOOL pool) {
    assert(usage==512&&pool==0);calls.push_back({image,w,h,mips,format});image->texture.basemap=&newTexture;
    if(mutation&&calls.size()==1){renderer.current.integer=0;imageGlobals.imageHashTable[102]=imageGlobals.imageHashTable[104];}
}
''' + predicate + source + r'''
int main() {
    static_assert(sizeof(GfxImage)==36,"actual PC image records");
    int direct=0,selected=0;
    for(int category=0;category<256;++category)for(int mode=0;mode<2;++mode)for(unsigned dimensions:{0u,1u,65535u}) {
        GfxImage image={};image.category=category;image.width=dimensions;image.height=65535-dimensions;
        image.texture.basemap=&oldTexture;renderer.current.integer=mode?2:0;calls.clear();mutation=0;
        Image_BuildWaterMap(&image);assert(calls.size()==unsigned(category==5));
        if(category==5){auto c=calls[0];assert(c.image==&image&&c.width==int(dimensions)&&c.height==int(65535-dimensions)&&c.mips==mode&&c.format==(mode?22:50));}
        else assert(image.texture.basemap==&oldTexture);++direct;
    }
    for(int category=0;category<256;++category)for(int mode=0;mode<2;++mode)for(int present=0;present<2;++present)for(int prog=0;prog<2;++prog) {
        memset(&imageGlobals,0,sizeof(imageGlobals));memset(g_imageProgs,0,sizeof(g_imageProgs));
        GfxImage ordinary={};GfxImage *image=prog?&g_imageProgs[12]:&ordinary;
        image->category=category;image->width=37;image->height=59;image->texture.basemap=present?&oldTexture:0;
        imageGlobals.imageHashTable[100]=image;renderer.current.integer=mode?2:0;calls.clear();mutation=0;
        for(int i=0;i<12;++i){g_imageProgs[i].category=5;imageGlobals.imageHashTable[200+i]=&g_imageProgs[i];}
        R_ReloadLostImages();bool create=category==5&&!present&&!prog;assert(calls.size()==unsigned(create));
        if(create){auto c=calls[0];assert(c.image==image&&c.width==37&&c.height==59&&c.mips==mode&&c.format==(mode?22:50));}
        assert(imageGlobals.imageHashTable[100]==image);
        for(int i=0;i<12;++i)assert(!g_imageProgs[i].texture.basemap);++selected;
    }
    {
        memset(&imageGlobals,0,sizeof(imageGlobals));GfxImage images[3]={};
        for(int i=0;i<3;++i){images[i].category=5;images[i].width=32+i;images[i].height=64+i;}
        imageGlobals.imageHashTable[100]=&images[0];imageGlobals.imageHashTable[102]=&images[1];imageGlobals.imageHashTable[104]=&images[2];
        calls.clear();mutation=1;renderer.current.integer=2;R_ReloadLostImages();
        assert(calls.size()==2&&calls[0].image==&images[0]&&calls[0].format==22&&calls[1].image==&images[2]&&calls[1].format==50&&!images[1].texture.basemap);
    }
    printf("PASS: %d actual water rebuilds,%d lost-image selector routes and live mutation; all categories, ushort dimensions, DX7/DX9 format/mips,13 program images and existing-texture skips\n",direct,selected);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_lost_image_reload_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

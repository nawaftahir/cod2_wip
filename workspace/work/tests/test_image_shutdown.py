"""Image shutdown releases ordinary images and rehashes retained program images."""
from pathlib import Path
import subprocess
import tempfile

work = Path(__file__).resolve().parents[1]
text = (work / 'src/gfx_d3d/r_image.cpp').read_text()
local = (work / 'src/gfx_d3d/r_local.h').read_text()
types = local[local.index('union GfxTexture'):local.index('// Stringized after expansion')]
globals_type = text[text.index('struct ImageGlobals\n'):text.index('ImageGlobals imageGlobals;')]
list_type = text[text.index('struct ImageList\n'):text.index('struct Image_MemUsage')]
hash_code = text[text.index('int R_HashAssetName('):text.index('GfxImage *Image_FindExisting(')]
hash_slot = text[text.index('static int Image_GetAvailableHashLocation('):text.index('GfxImage *Image_AllocProg(')]
source = text[text.index('void Image_Release('):text.index('void R_ReleaseLostImages(')]
program = r'''
#include <cassert>
#include <cstdio>
#include <cstring>
#include <cstdint>
#include <vector>
typedef unsigned char Bool;
struct Texture {int id;unsigned Release();} textures[21];
typedef Texture IDirect3DBaseTexture9;typedef Texture IDirect3DTexture9;
typedef Texture IDirect3DVolumeTexture9;typedef Texture IDirect3DCubeTexture9;
''' + types + globals_type + list_type + r'''
ImageGlobals imageGlobals;GfxImage g_imageProgs[13];
struct {Bool deviceLost;} dx;struct {int maxTextureMaps;} vidConfig;
std::vector<int> releases;int samplers,mode;
unsigned Texture::Release(){releases.push_back(id);return 19;}
void RB_SetSampler(int index,unsigned char state,GfxImage *image) {
    assert(index==samplers++&&!state&&!image);
    if(index==0&&mode==1)vidConfig.maxTextureMaps=0;
    if(index==0&&mode==2)vidConfig.maxTextureMaps=5;
}
''' + hash_code + hash_slot + source + r'''
int main() {
    static_assert(sizeof(GfxImage)==36,"primary image size");
    char names[13][4];for(int i=0;i<21;++i)textures[i].id=i;
    for(int i=0;i<13;++i){names[i][0]='a'+i;names[i][1]='Z'-2*i;names[i][2]='a'+i;names[i][3]=0;}
    for(int i=1;i<13;++i)assert(R_HashAssetName(names[i])==R_HashAssetName(names[0]));
    int cases=0;
    for(unsigned seed=0;seed<256;++seed)for(int lost=0;lost<2;++lost)for(mode=0;mode<4;++mode) {
        memset(&imageGlobals,0,sizeof(imageGlobals));memset(g_imageProgs,0,sizeof(g_imageProgs));
        imageGlobals.picmip=77;imageGlobals.picmipBump=78;imageGlobals.picmipSpec=79;
        imageGlobals.totalMemory[0]=10000;imageGlobals.totalMemory[1]=20000;
        dx.deviceLost=lost;vidConfig.maxTextureMaps=mode==3?-1:3;samplers=0;releases.clear();
        GfxImage ordinary[8]={},before[8];int total0=10000,total1=20000;
        std::vector<int> expected;std::vector<GfxImage *> keep;
        for(int i=0;i<8;++i) {
            auto &image=ordinary[i];image.mapType=3;image.track=i;image.cardMemory.platform[0]=10+i;image.cardMemory.platform[1]=20+i;
            if(seed&(1u<<i))image.texture.basemap=&textures[i];
            imageGlobals.imageHashTable[100+i*2]=&image;
            if(i!=0&&i!=1&&i!=4){total0-=10+i;total1-=20+i;}
            if(image.texture.basemap)expected.push_back(i);
        }
        memcpy(before,ordinary,sizeof(before));
        unsigned mask=seed==255?8191:seed*2654435761u;
        for(int i=0;i<13;++i) {
            auto &image=g_imageProgs[i];image.name=names[i];image.mapType=5;image.track=7;image.texture.basemap=&textures[8+i];
            image.cardMemory.platform[0]=123;image.cardMemory.platform[1]=456;
            if(mask&(1u<<i)){imageGlobals.imageHashTable[101+i*2]=&image;keep.push_back(&image);}
        }
        GfxImage progBefore[13];memcpy(progBefore,g_imageProgs,sizeof(progBefore));
        R_ShutdownImages();
        assert(releases==expected&&samplers==(lost||mode==3?0:mode==1?1:mode==2?5:3));
        assert(imageGlobals.totalMemory[0]==total0&&imageGlobals.totalMemory[1]==total1);
        assert(imageGlobals.picmip==77&&imageGlobals.picmipBump==78&&imageGlobals.picmipSpec==79);
        assert(!memcmp(g_imageProgs,progBefore,sizeof(progBefore)));
        for(int i=0;i<8;++i) {
            before[i].mapType=0;if(before[i].texture.basemap){before[i].texture.basemap=0;memset(&before[i].cardMemory,0,sizeof(before[i].cardMemory));}
            assert(!memcmp(&ordinary[i],&before[i],sizeof(GfxImage)));
        }
        GfxImage *table[2048]={};unsigned hash=R_HashAssetName(names[0])&2047;
        for(unsigned i=0;i<keep.size();++i)table[(hash+i)&2047]=keep[i];
        assert(!memcmp(table,imageGlobals.imageHashTable,sizeof(table)));++cases;
    }
    printf("PASS: %d actual image-shutdown routes; retained program range, colliding rehash order, track memory, null textures and live sampler bounds\n",cases);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_image_shutdown_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++','-m32','-std=c++11','-O2','-x','c++','-','-o',binary],input=program,text=True,check=True)
    subprocess.run([binary],check=True)

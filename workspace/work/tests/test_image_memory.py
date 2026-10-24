"""Exercise the actual PC image iterator, list callback and memory accounting."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_image.cpp').read_text()
registry = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_image_registry.h').read_text().replace('#pragma once','')
source = registry + text[text.index('struct Image_MemUsage'):text.index('// PINNED101a59fc/')]
program = r'''
#include <cassert>
#include <cstdint>
#include <cstring>
typedef unsigned char Bool;
struct GfxImage { unsigned char track;struct { int platform[2]; } cardMemory; };
GfxImage g_imageProgs[13];
struct { GfxImage *imageHashTable[2048];int totalMemory[2]; } imageGlobals;
'''+source+r'''
int main() {
    for(int track=-2;track<12;++track)
        assert(bool(Image_IsCodeTrack(track))==(track==0||track==1||track==4));
    GfxImage images[2048];
    for(int count=0;count<=2048;count+=16) {
        memset(&imageGlobals,0,sizeof(imageGlobals));
        imageGlobals.totalMemory[0]=123456;imageGlobals.totalMemory[1]=987654;
        int total=0,lightmap=0,expectedCount=0;
        for(int i=0;i<count;++i) {
            images[i].track=i%10;images[i].cardMemory.platform[0]=i+3;
            images[i].cardMemory.platform[1]=i+50;
            imageGlobals.imageHashTable[i]=i%17==0?g_imageProgs+(i%13):images+i;
            if(i%17==0)continue;
            ++expectedCount;
            if(i%10==4)lightmap+=i+3;
            else if(i%10!=0&&i%10!=1)total+=i+3;
        }
        ImageList list;list.count=-99;R_GetImageList(&list);
        assert(list.count==expectedCount);
        int index=0;
        for(int i=0;i<count;++i)if(i%17!=0)assert(list.image[index++]==images+i);
        Image_MemUsage usage={-1,-1,-1};R_GetImageMemory(&usage);
        assert(usage.total==total&&usage.lightmap==lightmap&&usage.minspec==987654);
    }
    memset(&imageGlobals,0,sizeof(imageGlobals));
    for(int i=0;i<13;++i)imageGlobals.imageHashTable[2047-i]=g_imageProgs+i;
    ImageList list;R_GetImageList(&list);assert(list.count==0);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_image_memory_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 129 image-table populations, all13 programmable images, list order and both memory counters')

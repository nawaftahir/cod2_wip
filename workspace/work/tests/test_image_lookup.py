"""Check actual image hashing/probing, wraparound, case and program-image exclusion."""
from pathlib import Path
import subprocess
import tempfile

text = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_image.cpp').read_text()
utils = (Path(__file__).resolve().parents[1] / 'src/gfx_d3d/r_utils.cpp').read_text()
source = utils[utils.index('int R_HashAssetName('):utils.index('bool R_ValidXModelName(')] + text[text.index('inline Bool Image_IsCodeImage('):text.index('static int Image_GetAvailableHashLocation(')]
program = r'''
#include <cassert>
#include <cstring>
#include <cstdint>
#include <cstdio>
#include <string>
#include <vector>
struct GfxImage { const char *name; } g_imageProgs[13];
struct { GfxImage *imageHashTable[2048]; } imageGlobals;
typedef unsigned char Bool;
// Keep the Win32 pointer selection representable on this 64-bit host.
intptr_t I_sel(int x,intptr_t y,intptr_t z) { return x>=0?y:z; }
'''+source+r'''
int main() {
    assert(!Image_FindExisting("missing"));
    std::vector<std::string> names;names.reserve(3);
    for(int a=1;a<256&&names.size()<3;++a)
    for(int b=1;b<256&&names.size()<3;++b) {
        char label[3]={char(a),char(b),0};
        if((R_HashAssetName(label)&2047)==2047)names.push_back(label);
    }
    assert(names.size()==3);
    GfxImage images[3];
    for(int i=0;i<3;++i) {
        images[i].name=names[i].c_str();imageGlobals.imageHashTable[(2047+i)&2047]=images+i;
    }
    for(int i=0;i<3;++i)assert(Image_FindExisting(names[i].c_str())==images+i);
    GfxImage image={"CaseSensitive"};
    memset(&imageGlobals,0,sizeof(imageGlobals));
    imageGlobals.imageHashTable[R_HashAssetName(image.name)&2047]=&image;
    assert(Image_FindExisting("CaseSensitive")==&image);
    assert(!Image_FindExisting("casesensitive"));
    for(int i:{0,12}) {
        memset(&imageGlobals,0,sizeof(imageGlobals));
        g_imageProgs[i].name="program_image";
        imageGlobals.imageHashTable[R_HashAssetName("program_image")&2047]=g_imageProgs+i;
        assert(!Image_FindExisting("program_image"));
    }
    const char highByteName[]={char(0xff),'x',0};
    assert(R_HashAssetName(highByteName)==-119+120*'x');
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_image_lookup_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-x', 'c++', '-', '-o', binary],
                   input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: image lookup misses/hits, collisions, bucket wrap, case, program endpoints and signed hash')

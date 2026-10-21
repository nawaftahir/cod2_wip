"""Check the actual wavelet loader's allocation, mip and cubemap routing."""
from pathlib import Path
import subprocess
import tempfile

root = Path(__file__).resolve().parents[1] / 'src/gfx_d3d'
text = (root / 'r_image_load_obj.cpp').read_text()
source = text[text.index('void Image_LoadWavelet('):text.index('\nGfxImage *R_CreateWaterMap(')]
decode_type = (root / 'r_image_wavelet_types.h').read_text().replace('#pragma once', '')
program = r'''
#include <cassert>
#include <algorithm>
#include <cstring>
#include <vector>
typedef unsigned char byte;
typedef unsigned char Bool;
typedef int D3DFORMAT;
typedef int D3DCUBEMAP_FACES;
struct GfxImage { int mapType;struct { byte platform[2]; } picmip; };
struct GfxImageFileHeader { byte tag[3],version,format,flags;short dimensions[3];int fileSizeForPicmip[4]; };
'''+decode_type+r'''
GfxImage *currentImage;GfxImageFileHeader header;int channels,faceCount,startLevel;
int allocations,frees,decodes,uploads;std::vector<byte*> buffers,previous;
byte input[16];
int I_max(int a,int b) { return std::max(a,b); }
void Image_Setup(GfxImage *image,int w,int h,int d,int flags,int usage,int format) {
    assert(image==currentImage&&w==header.dimensions[0]&&h==header.dimensions[1]
        &&d==header.dimensions[2]&&flags==header.flags&&!usage&&format==21);
}
void *allocate(int size) {
    assert(!decodes&&allocations<faceCount);
    assert(size==header.dimensions[0]*header.dimensions[1]*(channels==3?4:channels));
    byte *p=new byte[size];buffers.push_back(p);previous.push_back(nullptr);++allocations;return p;
}
void release(void *p) {
    assert(p==buffers[faceCount-1-frees]);++frees;delete[] static_cast<byte*>(p);
}
struct { void *(*Hunk_AllocateTempMemoryInternal)(int);void (*Hunk_FreeTempMemory)(void*); } ri={allocate,release};
void Wavelet_DecompressLevel(byte *old,byte *out,WaveletDecode *decode) {
    assert(allocations==faceCount&&decodes==uploads);
    int face=decodes%faceCount,level=startLevel-decodes/faceCount;
    int bpp=channels==3?4:channels;
    int total=header.dimensions[0]*header.dimensions[1]*bpp;
    int size=std::max(1,header.dimensions[0]>>level)*std::max(1,header.dimensions[1]>>level)*bpp;
    assert(decode->data==input&&!decode->value&&!decode->bit);
    assert(bool(decode->dataInitialized)==bool(decodes));
    assert(decode->width==header.dimensions[0]&&decode->height==header.dimensions[1]);
    assert(decode->channels==channels&&decode->bpp==bpp&&decode->mipLevel==level);
    assert(old==previous[face]&&out==buffers[face]+total-size);
    previous[face]=out;decode->dataInitialized=1;++decodes;
}
void Image_UploadData(GfxImage *image,int format,int face,unsigned mip,const byte *data) {
    assert(image==currentImage&&format==21&&face==uploads%faceCount&&decodes==uploads+1);
    assert(mip==unsigned(startLevel-uploads/faceCount-currentImage->picmip.platform[0]));
    assert(data==previous[face]);++uploads;
}
'''+source+r'''
int main() {
    int cases=0;
    for(int width:{1,3,8,16})for(int height:{1,3,8,16})for(int depth:{1,4})
    for(int faces:{1,6})for(int noMips=0;noMips<2;++noMips)
    for(int count=1;count<=4;++count)for(int mip=0;mip<4;++mip) {
        GfxImage image={faces==6?5:3,{{byte(mip),0}}};currentImage=&image;
        header.flags=byte((noMips?2:0)|(faces==6?4:0));
        header.dimensions[0]=short(width);header.dimensions[1]=short(height);header.dimensions[2]=short(depth);
        faceCount=faces;channels=count;startLevel=0;
        if(!noMips)for(int d=1;d<std::max(width,std::max(height,depth));d*=2)++startLevel;
        allocations=frees=decodes=uploads=0;buffers.clear();previous.clear();
        Image_LoadWavelet(&image,&header,input,21,count);
        assert(allocations==faces&&frees==faces);
        assert(decodes==faces*std::max(0,startLevel-mip+1)&&uploads==decodes);++cases;
    }
    assert(cases==2048);
}
'''
with tempfile.TemporaryDirectory(prefix='gfx_wavelet_loader_') as directory:
    binary = str(Path(directory) / 'test')
    subprocess.run(['g++', '-std=c++11', '-O2', '-Wall', '-Wextra', '-Werror',
                    '-x', 'c++', '-', '-o', binary], input=program, text=True, check=True)
    subprocess.run([binary], check=True)
print('PASS: 2048 actual wavelet-loader cases, mip routing, RGB expansion, six faces and reverse frees')

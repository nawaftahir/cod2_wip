#include <assert.h>
#include <stddef.h>
#include <string.h>
#include "scratch/wavelet_setup_family/j_wavelet.c"

const WaveletHuffmanDecode waveletDecodeBlue[4096] = {{0, 0}};
const WaveletHuffmanDecode waveletDecodeRedGreen[4096] = {{0, 0}};
const WaveletHuffmanDecode waveletDecodeAlpha[4096] = {{0, 0}};
void *(*ri_hunk_allocate)(int);
void (*ri_hunk_free)(void *);
byte can_mip_cubemaps;
int picmip_semantic_2_5;
int picmip_semantic_3;
int picmip_semantic_4;
static int kind;
static int dimensions[3];
static int selected_levels;
static unsigned int selected_usage;
static int tracked[3];

static void record(int type, int w, int h, int d, int levels, unsigned int usage, int pool)
{
    assert(pool == 1);
    kind = type;
    dimensions[0] = w;
    dimensions[1] = h;
    dimensions[2] = d;
    selected_levels = levels;
    selected_usage = usage;
}

void Image_Create2DTexture(GfxImagePrefix *image, int w, int h, int levels,
                           unsigned int usage, int format, int pool)
{
    (void)image; (void)format;
    record(3, w, h, 1, levels, usage, pool);
}

void Image_Create3DTexture(GfxImagePrefix *image, int w, int h, int d, int levels,
                           unsigned int usage, int format, int pool)
{
    (void)image; (void)format;
    record(4, w, h, d, levels, usage, pool);
}

void Image_CreateCubeTexture(GfxImagePrefix *image, int edge, int levels,
                             unsigned int usage, int format, int pool)
{
    (void)image; (void)format;
    record(5, edge, edge, 1, levels, usage, pool);
}

void Image_TrackTexture(GfxImagePrefix *image, int flags, int format, int w, int h, int d)
{
    (void)image; (void)flags; (void)format;
    tracked[0] = w; tracked[1] = h; tracked[2] = d;
}

void Image_Upload2D_CopyData_PC(const GfxImagePrefix *image, int format, int face,
                               unsigned int mip, byte *pixels)
{
    (void)image; (void)format; (void)face; (void)mip; (void)pixels;
    assert(0);
}

void Image_Upload3D_CopyData_PC(const GfxImagePrefix *image, int format,
                               unsigned int mip, byte *pixels)
{
    (void)image; (void)format; (void)mip; (void)pixels;
    assert(0);
}

void Image_LoadBitmap(GfxImagePrefix *image, const GfxImageFileHeader *header,
                      const byte *data, int format, int bytes)
{
    (void)image; (void)header; (void)data; (void)format; (void)bytes;
    assert(0);
}

void Image_LoadDxtc(GfxImagePrefix *image, const GfxImageFileHeader *header,
                    const byte *data, int format, int bytes)
{
    (void)image; (void)header; (void)data; (void)format; (void)bytes;
    assert(0);
}

int main(void)
{
    GfxImagePrefix image;
    byte picmip[2];

    assert(offsetof(GfxImagePrefix, semantic) == 10);
    assert(offsetof(GfxImagePrefix, noPicmip) == 11);
    assert(offsetof(GfxImagePrefix, width) == 24);
    assert(offsetof(GfxImagePrefix, height) == 26);
    assert(offsetof(GfxImagePrefix, depth) == 28);
    picmip_semantic_2_5 = -1;
    Image_PicmipForSemantic(2, picmip);
    assert(picmip[0] == 0 && picmip[1] == 2);
    picmip_semantic_2_5 = 99;
    Image_PicmipForSemantic(5, picmip);
    assert(picmip[0] == 3 && picmip[1] == 2);
    Image_PicmipForSemantic(99, picmip);
    assert(picmip[0] == 0 && picmip[1] == 0);
    memset(&image, 0, sizeof(image));
    image.semantic = 3;
    picmip_semantic_3 = 3;
    Image_Setup(&image, 16, 2, 1, 0, 17, 0x15);
    assert(image.picmip[0] == 1 && image.picmip[1] == 1);
    assert(image.width == 8 && image.height == 1 && image.depth == 1);
    assert(kind == 3 && selected_usage == 17 && selected_levels == 0);
    Image_Setup(&image, 16, 2, 1, 0, 17, 0x31545844);
    assert(image.picmip[0] == 0 && image.picmip[1] == 0);
    Image_Setup(&image, 16, 8, 4, 8, 17, 0x15);
    assert(kind == 4 && dimensions[0] == 2 && dimensions[1] == 1 && dimensions[2] == 1);
    assert(selected_usage == 17 && tracked[0] == 16 && tracked[1] == 8 && tracked[2] == 4);
    Image_Setup(&image, 16, 8, 4, 4, 17, 0x15);
    assert(kind == 5 && dimensions[0] == 2 && dimensions[1] == 2 && selected_usage == 0);
    Image_Setup(&image, 16, 8, 4, 2, 17, 0x15);
    assert(image.noPicmip == 1 && image.picmip[0] == 0 && image.picmip[1] == 0);
    assert(kind == 3 && selected_levels == 1 && image.width == 16 && image.height == 8);
    return 0;
}

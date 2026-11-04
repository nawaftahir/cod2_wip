#include <assert.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "scratch/wavelet_loader_family/j_wavelet.c"

const WaveletHuffmanDecode waveletDecodeBlue[4096] = {{0, 0}};
const WaveletHuffmanDecode waveletDecodeRedGreen[4096] = {{0, 0}};
const WaveletHuffmanDecode waveletDecodeAlpha[4096] = {{0, 0}};
byte can_mip_cubemaps;
static void *allocations[6];
static int allocated;
static int released;
static int uploaded;
static byte setup_picmip;
static int volume_uploads;

static void *allocate_memory(int bytes)
{
    void *memory;

    assert(bytes == 4 && allocated < 6);
    memory = malloc(bytes);
    assert(memory);
    allocations[allocated] = memory;
    allocated += 1;
    return memory;
}

static void release_memory(void *memory)
{
    assert(memory == allocations[allocated - released - 1]);
    released += 1;
    free(memory);
}

void *(*ri_hunk_allocate)(int) = allocate_memory;
void (*ri_hunk_free)(void *) = release_memory;

void Image_Setup(GfxImagePrefix *image, int width, int height, int depth,
                 int flags, unsigned int usage, int format)
{
    assert(width == 1 && height == 4 && depth == 1);
    assert(flags == 0 && usage == 0 && format == 0x1c);
    assert(image->texture == 0);
    image->picmip[0] = setup_picmip;
}

void Image_Upload2D_CopyData_PC(const GfxImagePrefix *image, int format,
                               int face, unsigned int mip, byte *pixels)
{
    assert(format == 0x1c && pixels);
    if (image->mapType == 5)
    {
        assert(mip == 0 && face == uploaded);
    }
    else
    {
        assert(face == 0 && mip == (unsigned int)(2 - uploaded));
        assert(pixels[0] == (byte)((1 << uploaded) - 1));
    }
    uploaded += 1;
}

void Image_Upload3D_CopyData_PC(const GfxImagePrefix *image, int format,
                               unsigned int mip, byte *pixels)
{
    assert(image->mapType == 4 && format == 0x1c && pixels);
    assert(mip == (unsigned int)(2 - volume_uploads));
    volume_uploads += 1;
}

void Image_LoadBitmap(GfxImagePrefix *image, const GfxImageFileHeader *header,
                      const byte *data, int format, int bytesPerPixel)
{
    (void)image; (void)header; (void)data; (void)format; (void)bytesPerPixel;
    assert(0);
}

void Image_LoadDxtc(GfxImagePrefix *image, const GfxImageFileHeader *header,
                    const byte *data, int format, int bytesPerBlock)
{
    (void)image; (void)header; (void)data; (void)format; (void)bytesPerBlock;
    assert(0);
}

int main(void)
{
    GfxImagePrefix image;
    GfxImageFileHeader header;
    byte data[64];
    int i;

    assert(offsetof(GfxImagePrefix, texture) == 4);
    assert(offsetof(GfxImagePrefix, picmip) == 8);
    assert(offsetof(GfxImageFileHeader, flags) == 5);
    assert(offsetof(GfxImageFileHeader, dimensions) == 6);
    assert(sizeof(GfxImageFileHeader) == 28);
    for (i = 0; i < 64; i += 1)
    {
        data[i] = (byte)i;
    }
    memset(&header, 0, sizeof(header));
    header.format = 10;
    header.dimensions[0] = 1;
    header.dimensions[1] = 4;
    header.dimensions[2] = 1;
    memset(&image, 0, sizeof(image));
    image.mapType = 3;
    Image_LoadFromData(&image, &header, data);
    assert(allocated == 1 && released == 1 && uploaded == 3);
    allocated = released = uploaded = 0;
    image.mapType = 5;
    Image_LoadFromData(&image, &header, data);
    assert(allocated == 6 && released == 6 && uploaded == 6);
    allocated = released = uploaded = 0;
    image.mapType = 4;
    Image_LoadFromData(&image, &header, data);
    assert(allocated == 1 && released == 1 && uploaded == 0 && volume_uploads == 3);
    allocated = released = uploaded = 0;
    setup_picmip = 3;
    image.mapType = 3;
    Image_LoadFromData(&image, &header, data);
    assert(allocated == 1 && released == 1 && uploaded == 0);
    return 0;
}

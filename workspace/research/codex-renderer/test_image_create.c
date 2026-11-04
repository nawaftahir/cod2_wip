#include <assert.h>
#include <stddef.h>
#include <stdarg.h>
#include <string.h>
#ifndef _MSC_VER
#define __stdcall __attribute__((stdcall))
#endif
#ifndef IMAGE_CREATE_SOURCE
#define IMAGE_CREATE_SOURCE "scratch/wavelet_create_format/j_wavelet.c"
#endif
#include IMAGE_CREATE_SOURCE

const WaveletHuffmanDecode waveletDecodeBlue[4096] = {{0, 0}};
const WaveletHuffmanDecode waveletDecodeRedGreen[4096] = {{0, 0}};
const WaveletHuffmanDecode waveletDecodeAlpha[4096] = {{0, 0}};
void *(*ri_hunk_allocate)(int);
void (*ri_hunk_free)(void *);
byte can_mip_cubemaps;
int picmip_semantic_2_5, picmip_semantic_3, picmip_semantic_4;
void *renderer_device;
static void *slots[26];
static unsigned int captured[7];
static int failure, errors, description_calls;
#ifdef IMAGE_RELOAD_ERROR
static int reload_errors;
#endif
static GfxImagePrefix image;

static int record(void *device, unsigned int w, unsigned int h, unsigned int d,
    unsigned int levels, unsigned int usage, int format, int pool, void **out, void *shared)
{
    assert(device == renderer_device && out == &image.texture && !shared);
    captured[0] = w; captured[1] = h; captured[2] = d;
    captured[3] = levels; captured[4] = usage;
    captured[5] = format; captured[6] = pool;
    *out = &image;
    return failure;
}

static int __stdcall texture(void *dev, unsigned int w, unsigned int h,
    unsigned int levels, unsigned int usage, int format, int pool, void **out, void *shared)
{
    return record(dev, w, h, 1, levels, usage, format, pool, out, shared);
}

static int __stdcall volume(void *dev, unsigned int w, unsigned int h, unsigned int d,
    unsigned int levels, unsigned int usage, int format, int pool, void **out, void *shared)
{
    return record(dev, w, h, d, levels, usage, format, pool, out, shared);
}

static int __stdcall cube(void *dev, unsigned int edge, unsigned int levels,
    unsigned int usage, int format, int pool, void **out, void *shared)
{
    return record(dev, edge, edge, 1, levels, usage, format, pool, out, shared);
}

const char *__stdcall Renderer_ErrorDescription(int result)
{
    assert(result == failure);
    description_calls += 1;
    return "fixture failure";
}

void Renderer_Error(int code, const char *format, ...)
{
    va_list args;
    assert(code == 1);
#ifdef IMAGE_RELOAD_ERROR
    if (strcmp(format, "failed to load image '%s'") == 0)
    {
        va_start(args, format);
        assert(va_arg(args, const char *) == image.name);
        va_end(args);
        reload_errors += 1;
        return;
    }
#endif
    va_start(args, format);
    assert(va_arg(args, const char *) == image.name);
    assert(va_arg(args, int) == image.width);
    if (image.mapType == 5)
    {
        assert(va_arg(args, int) == (int)captured[3]);
        assert(va_arg(args, int) == (int)captured[5]);
    }
    else
    {
        assert(va_arg(args, int) == image.height);
        if (image.mapType == 4)
        {
            assert(va_arg(args, int) == image.depth);
        }
        assert(va_arg(args, int) == 0);
        assert(va_arg(args, unsigned int) == captured[5]);
    }
    assert(va_arg(args, int) == failure);
    assert(strcmp(va_arg(args, const char *), "fixture failure") == 0);
    va_end(args);
    errors += 1;
}

#ifndef IMAGE_MEMORY_SOURCE
void Image_TrackTexture(GfxImagePrefix *i, int flags, int fmt, int w, int h, int d) {}
#endif
#ifndef IMAGE_ALL_UPLOAD_SOURCE
void Image_Upload2D_CopyData_PC(const GfxImagePrefix *i, int f, int face, unsigned int mip, byte *p) {}
#endif
#ifndef IMAGE_VOLUME_SOURCE
void Image_Upload3D_CopyData_PC(const GfxImagePrefix *i, int f, unsigned int mip, byte *p) {}
#endif
#ifndef IMAGE_BITMAP_SOURCE
void Image_LoadBitmap(GfxImagePrefix *i, const GfxImageFileHeader *h, const byte *p, int f, int b) {}
#endif
#ifndef IMAGE_DXT_SOURCE
void Image_LoadDxtc(GfxImagePrefix *i, const GfxImageFileHeader *h, const byte *p, int f, int b) {}
#endif

int main(void)
{
    static void **vtable = slots;
    int n;

    assert(sizeof(void *) == 4);
    assert(offsetof(GfxImagePrefix, category) == 30);
    assert(offsetof(GfxImagePrefix, name) == 32);
    renderer_device = &vtable;
    slots[23] = (void *)texture;
    slots[24] = (void *)volume;
    slots[25] = (void *)cube;
    image.name = "test image";
    for (n = 0; n < 2; n += 1)
    {
        failure = n ? -1 : 0;
        Image_Create2DTexture(&image, 0x10007, 0x20009, 3, 17, 21, 1);
        assert(image.mapType == 3 && image.texture == &image);
        assert(captured[0] == 7 && captured[1] == 9 && captured[2] == 1);
        assert(captured[3] == 3 && captured[4] == 17 && captured[5] == 21 && captured[6] == 1);
        Image_Create3DTexture(&image, 11, 13, 0x1000f, 4, 19, 22, 2);
        assert(image.mapType == 4 && image.depth == 15);
        assert(captured[0] == 11 && captured[1] == 13 && captured[2] == 15);
        can_mip_cubemaps = 0;
        Image_CreateCubeTexture(&image, 0x10010, 5, 99, 23, 1);
        assert(image.mapType == 5 && image.width == 16 && image.height == 16);
        assert(captured[3] == 1 && captured[4] == 0);
        can_mip_cubemaps = 1;
        Image_CreateCubeTexture(&image, 32, 5, 99, 23, 1);
        assert(captured[3] == 5 && captured[4] == 0);
    }
    assert(errors == 4 && description_calls == 4);
    return 0;
}

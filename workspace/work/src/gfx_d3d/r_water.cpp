// PC 1.0 water simulation; helper names are descriptive, not debug provenance.
#include "gfx.h"
#include <stddef.h>

static WaterGlob waterGlob;
extern r_backEndGlobals_t backEnd;
extern GfxBackEndData *backEndData;
extern const dvar_t *r_drawWater;
void FFT(complex_s *data, unsigned long log2_count, unsigned long stride,
    int *bitSwap, complex_s *trigTable);
void Image_UploadData(GfxImage *image, D3DFORMAT format, D3DCUBEMAP_FACES face,
    unsigned int mipLevel, const byte *src);
void R_DownsampleMipMapBilinear(const byte *src, int srcBufferSize,
    int srcWidth, int srcHeight, int texelPitch, byte *dst, int dstBufferSize);

typedef char waterImageCheck[(offsetof(water_t, image) == 0x40) ? 1 : -1];
typedef char waterPixelsCheck[(offsetof(WaterGlob, pixels) == 0x20000) ? 1 : -1];
typedef char waterSinCheck[(offsetof(r_globals_t, sinTable) == 0x1510) ? 1 : -1];
typedef char waterTrigCheck[(offsetof(r_globals_t, fftTrigTable) == 0x2510) ? 1 : -1];
typedef char waterBitsCheck[(offsetof(r_globals_t, fftBitswap) == 0x2d10) ? 1 : -1];
typedef char waterTimeCheck[(offsetof(r_backEndGlobals_t, sceneDef)
    + offsetof(GfxSceneDef, floatTime) == 0x3bc) ? 1 : -1];

// PINNED 1002c470: the cosine lookup is phase +255, not +256.
__declspec(noinline) void R_WaterHkt(water_t *water, complex_t *H, float time)
{
    int n, m, index = 0;
    int phase;
    for (n = -(water->N / 2); n < water->N / 2; ++n)
    {
        for (m = -(water->M / 2); m < water->M / 2; ++m)
        {
            if (0.0f == water->wTerm[index])
            {
                H[index].real = 0.0f;
                H[index].imag = 0.0f;
            }
            else
            {
                phase = I_fround(water->wTerm[index] * time * 162.97466f) & 1023;
                H[index].real = water->H0[index].real * rg.sinTable[(phase + 255) & 1023];
                H[index].imag = water->H0[index].imag * rg.sinTable[phase];
            }
            ++index;
        }
    }
}

// PINNED 1002c570: rows first, then strided columns.
__declspec(noinline) void R_WaterFFT(water_t *water, complex_t *H)
{
    int log2N = 0, log2M = 0;
    int row, column;
    complex_t *columnData;
    while (water->N != (1 << log2N))
        ++log2N;
    while (water->M != (1 << log2M))
        ++log2M;
    for (row = 0; row < water->N; ++row)
        FFT(H + row * water->M, log2M, 1, rg.fftBitswap, rg.fftTrigTable);
    columnData = H;
    for (column = 0; column < water->M; ++column, ++columnData)
        FFT(columnData, log2N, water->M, rg.fftBitswap, rg.fftTrigTable);
}

// PINNED 1002c620: overwrite real components with heights before differencing.
__declspec(noinline) void R_WaterNormalMap(complex_t *H, byte *pixels, water_t *water)
{
    int count = water->M * water->N;
    float dz = (float)count;
    float dzSq = dz * dz;
    int i, x, y;
    int previousX, previousRow, index;
    float dx, dy, scale;
    for (i = 0; i < count; ++i)
        H[i].real = I_sqrt(H[i].real * H[i].real + H[i].imag * H[i].imag);
    previousX = water->M - 1;
    previousRow = count - water->M;
    index = 0;
    for (y = 0; y < water->N; ++y)
    {
        for (x = 0; x < water->M; ++x)
        {
            dx = H[index].real - H[previousX].real;
            dy = H[index].real - H[previousRow].real;
            scale = 127.5f / I_sqrt(dx * dx + dy * dy + dzSq);
            pixels[2] = (byte)I_fround(dx * scale + 127.5f);
            pixels[1] = (byte)I_fround(dy * scale + 127.5f);
            pixels[0] = (byte)I_fround(dz * scale + 127.5f);
            pixels[3] = 255;
            pixels += 4;
            previousX = index++;
            ++previousRow;
        }
        previousRow = (index + count - water->M) & (count - 1);
    }
}

// PINNED 1002c7b0: clamp by value -1, preserving unordered comparison behavior.
__declspec(noinline) void R_WaterHeightMap(complex_t *H, byte *pixels, water_t *water)
{
    int count = water->M * water->N;
    float countFloat = (float)count;
    float height;
    int i;
    for (i = 0; i < water->M * water->N; ++i)
    {
        height = I_sqrt(H[i].real * H[i].real + H[i].imag * H[i].imag) / countFloat;
        if (height - 1.0f >= 0.0f)
            height = 1.0f;
        *pixels++ = (byte)I_fround(height * 255.0f);
    }
}

// PINNED 1002c850: in-place luminance mips, including rectangular tails.
__declspec(noinline) void R_WaterMipmaps(water_t *water, GfxImage *image,
    D3DFORMAT format, byte *pixels)
{
    int width = water->M;
    int height = water->N;
    unsigned int mipLevel = 1;
    while (width > 1 || height > 1)
    {
        R_DownsampleMipMapBilinear(pixels, 16384, width, height, 1, pixels, 16384);
        Image_UploadData(image, format, D3DCUBEMAP_FACE_POSITIVE_X, mipLevel, pixels);
        width = I_max(1, width >> 1);
        height = I_max(1, height >> 1);
        ++mipLevel;
    }
}

// PINNED 1002c910: stamp even disabled water; only the DX9 path builds mips.
void RB_UploadWaterTexture(GfxImage *image, water_t *water)
{
    int frame = backEndData->frameCount;
    if (water->writable.frameCount == frame)
        return;
    water->writable.frameCount = frame;
    if (!r_drawWater->current.enabled)
        return;
    R_WaterHkt(water, waterGlob.H, backEnd.sceneDef.floatTime);
    R_WaterFFT(water, waterGlob.H);
    if (r_rendererInUse->current.integer == 2)
    {
        R_WaterNormalMap(waterGlob.H, waterGlob.pixels, water);
        Image_UploadData(image, D3DFMT_A8R8G8B8, D3DCUBEMAP_FACE_POSITIVE_X, 0, waterGlob.pixels);
    }
    else
    {
        R_WaterHeightMap(waterGlob.H, waterGlob.pixels, water);
        Image_UploadData(image, D3DFMT_L8, D3DCUBEMAP_FACE_POSITIVE_X, 0, waterGlob.pixels);
        R_WaterMipmaps(water, image, D3DFMT_L8, waterGlob.pixels);
    }
}

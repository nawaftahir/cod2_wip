// r_screenshot.cpp - cubemap shots and screenshots.

#include "r_local.h"
#include "universal/com_math.h"
#include <math.h>

struct CubemapShotGlob
{
    unsigned char *pixels[6];
};

// PINNED 0x10696bb4
CubemapShotGlob cubeShotGlob;

// PINNED 0x101903a8; index 0 is CUBEMAPSHOT_NONE.
const float cubemapShotAxis[7][3][3] =
{
    { { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 0.0f } },
    { { 0.0f, 0.0f, 1.0f }, { 1.0f, 0.0f, 0.0f }, { 0.0f, 1.0f, 0.0f } },
    { { 0.0f, 0.0f, -1.0f }, { -1.0f, 0.0f, 0.0f }, { 0.0f, 1.0f, 0.0f } },
    { { 0.0f, 1.0f, 0.0f }, { -1.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 1.0f } },
    { { 0.0f, -1.0f, 0.0f }, { 1.0f, 0.0f, 0.0f }, { 0.0f, 0.0f, 1.0f } },
    { { 1.0f, 0.0f, 0.0f }, { 0.0f, 1.0f, 0.0f }, { 0.0f, 0.0f, 1.0f } },
    { { -1.0f, 0.0f, 0.0f }, { 0.0f, -1.0f, 0.0f }, { 0.0f, 0.0f, 1.0f } },
};

static void R_GetDirForCubemapPixel(int faceIndex, float x, float y, float *dir)
{
    VectorMA(cubemapShotAxis[faceIndex + 1][0], x, cubemapShotAxis[faceIndex + 1][1], dir);
    VectorMA(dir, y, cubemapShotAxis[faceIndex + 1][2], dir);
    Vec3Normalize(dir);
}

static void R_CubemapLightingForDir(float (**linearColors)[3], int width, int height, const float *dir, const float *baseColor, unsigned char *pixel)
{
    float color[3];
    float sourceDir[3];
    float facing;
    int sampleCount;
    int faceIndex;
    int x;
    int y;

    VectorClear(color);
    sampleCount = 0;
    for (faceIndex = 0; faceIndex < 6; ++faceIndex)
    {
        for (y = 0; y < height; ++y)
        {
            for (x = 0; x < width; ++x)
            {
                R_GetDirForCubemapPixel(faceIndex, ((float)x + 0.5f) * 2.0f / width - 1.0f, ((float)y + 0.5f) * 2.0f / height - 1.0f, sourceDir);
                facing = DotProduct(dir, sourceDir);
                if (facing > 0.0f)
                {
                    VectorMA(color, facing, linearColors[faceIndex][y * width + x], color);
                    ++sampleCount;
                }
            }
        }
    }
    VectorScale(color, 1.0f / sampleCount, color);
    color[0] = pow(color[0], 1.0f / 2.2f);
    color[1] = pow(color[1], 1.0f / 2.2f);
    color[2] = pow(color[2], 1.0f / 2.2f);
    Vec3Mul(color, baseColor, color);
    pixel[2] = I_fround(I_fmin(1.0f, color[0]) * 255.0f);
    pixel[1] = I_fround(I_fmin(1.0f, color[1]) * 255.0f);
    pixel[0] = I_fround(I_fmin(1.0f, color[2]) * 255.0f);
    pixel[3] = 0xff;
}

static void R_CubemapLighting(float (**linearColors)[3], int width, int height, const float *baseColor, unsigned char **pixels)
{
    float dir[3];
    int faceIndex;
    int x;
    int y;

    for (faceIndex = 0; faceIndex < 6; ++faceIndex)
    {
        for (y = 0; y < height; ++y)
        {
            for (x = 0; x < width; ++x)
            {
                R_GetDirForCubemapPixel(faceIndex, ((float)x + 0.5f) * 2.0f / width - 1.0f, ((float)y + 0.5f) * 2.0f / height - 1.0f, dir);
                R_CubemapLightingForDir(linearColors, width, height, dir, baseColor, &pixels[faceIndex][4 * (y * width + x)]);
            }
        }
    }
}

static void R_CubemapShotExtractLinearLight(unsigned char **pixels, int width, int height, float (**linearColors)[3])
{
    int faceIndex;
    int pixelIndex;
    int x;
    int y;

    for (faceIndex = 0; faceIndex < 6; ++faceIndex)
    {
        pixelIndex = 0;
        for (y = 0; y < height; ++y)
        {
            for (x = 0; x < width; ++x)
            {
                linearColors[faceIndex][pixelIndex][0] = pow(pixels[faceIndex][4 * pixelIndex + 2] * (1.0f / 255.0f), 2.2f);
                linearColors[faceIndex][pixelIndex][1] = pow(pixels[faceIndex][4 * pixelIndex + 1] * (1.0f / 255.0f), 2.2f);
                linearColors[faceIndex][pixelIndex][2] = pow(pixels[faceIndex][4 * pixelIndex] * (1.0f / 255.0f), 2.2f);
                ++pixelIndex;
            }
        }
    }
}

void R_LightingFromCubemapShots(const float *baseColor)
{
    int pixelsPerFace;
    float (*linearColors[6])[3];

    pixelsPerFace = dx.cubemapShotRes * dx.cubemapShotRes;
    linearColors[0] = (float (*)[3])ri.Z_MallocInternal(72 * pixelsPerFace);
    linearColors[1] = &linearColors[0][pixelsPerFace];
    linearColors[2] = &linearColors[1][pixelsPerFace];
    linearColors[3] = &linearColors[2][pixelsPerFace];
    linearColors[4] = &linearColors[3][pixelsPerFace];
    linearColors[5] = &linearColors[4][pixelsPerFace];
    R_CubemapShotExtractLinearLight(cubeShotGlob.pixels, dx.cubemapShotRes, dx.cubemapShotRes, linearColors);
    R_CubemapLighting(linearColors, dx.cubemapShotRes, dx.cubemapShotRes, baseColor, cubeShotGlob.pixels);
    ri.Z_FreeInternal(linearColors[0]);
}

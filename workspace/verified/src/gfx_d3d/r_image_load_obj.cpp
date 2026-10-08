// Image creation for loaded world assets.
#include "r_local.h"
#include <math.h>
#include "universal/com_math.h"

GfxImage *Image_Alloc(const char *name, int category, int semantic, int imageTrack);
void Image_Setup(GfxImage *image, int width, int height, int depth, int imageFlags, DWORD usage, D3DFORMAT imageFormat);
void Image_UploadData(GfxImage *image, D3DFORMAT format, D3DCUBEMAP_FACES cubemapFace, unsigned int mipLevel, const unsigned char *src);
void Image_Create2DTexture(GfxImage *image, int width, int height, int mipmapCount, DWORD usage, D3DFORMAT imageFormat, D3DPOOL memPool);

GfxImage *R_CreateWaterMap(char *name, int imageWidth, int imageHeight)
{
    GfxImage *image;

    image = Image_Alloc(name, 5, 5, 9);
    image->width = (unsigned short)imageWidth;
    image->height = (unsigned short)imageHeight;
    if (r_rendererInUse->current.integer == 2)
        Image_Create2DTexture(image, imageWidth, imageHeight, 1, D3DUSAGE_DYNAMIC, D3DFMT_X8R8G8B8, D3DPOOL_DEFAULT);
    else
        Image_Create2DTexture(image, imageWidth, imageHeight, 0, D3DUSAGE_DYNAMIC, D3DFMT_L8, D3DPOOL_DEFAULT);
    return image;
}

// Blend weights for the 32x32 lightmap-weights image (0x1000fd70); name unconfirmed (no reference names it).
void R_GetLightmapWeightsForDir(const float *dir, float *weights)
{
    float angle;

    angle = atan2(dir[1], dir[0]) * 0.47746482f - 0.75f;
    if (angle < 0.0f)
        angle += 3.0f;
    else if (angle > 3.0f)
        angle -= 3.0f;
    if (angle < 1.0f)
    {
        weights[1] = 1.0f - angle;
        weights[2] = angle;
        weights[3] = 0.0f;
    }
    else if (angle < 2.0f)
    {
        angle -= 1.0f;
        weights[1] = 0.0f;
        weights[2] = 1.0f - angle;
        weights[3] = angle;
    }
    else
    {
        angle -= 2.0f;
        weights[1] = angle;
        weights[2] = 0.0f;
        weights[3] = 1.0f - angle;
    }
    weights[0] = 1.0f - acos(dir[2]) * 1.0467734f;
    if (weights[0] < 0.0f)
        weights[0] = 0.0f;
    else if (weights[0] > 1.0f)
        weights[0] = 1.0f;
    else
        weights[0] = weights[0]; // retail re-stores the unclamped value
    weights[1] *= 1.0f - weights[0];
    weights[2] *= 1.0f - weights[0];
    weights[3] *= 1.0f - weights[0];
}

// Mac 1.3 name (SUPPORTED); 32x32 blend-weight image, 0x1000fe90.
void Image_LoadLightmapWeights(GfxImage *image)
{
    unsigned char pic[32][32][4];
    float dir[3];
    float weights[4];
    float lengthSq;
    float zSq;
    float length;
    float invLength;
    int y;
    int x;

    for (y = 0; y < 32; y++)
    {
        dir[1] = ((float)y + 0.5f) / 32.0f * 2.0f - 1.0f;
        for (x = 0; x < 32; x++)
        {
            dir[0] = ((float)x + 0.5f) / 32.0f * 2.0f - 1.0f;
            lengthSq = dir[0] * dir[0] + dir[1] * dir[1];
            zSq = 1.0f - lengthSq;
            if (zSq < 0.0f)
            {
                length = sqrt(lengthSq);
                if (length != 0.0f)
                {
                    invLength = 1.0f / length;
                    dir[0] *= invLength;
                    dir[1] *= invLength;
                }
                zSq = 0.0f;
            }
            dir[2] = sqrt(zSq);
            R_GetLightmapWeightsForDir(dir, weights);
            pic[y][x][0] = (unsigned char)I_fround(weights[0] * 255.0f);
            pic[y][x][1] = (unsigned char)I_fround(weights[1] * 255.0f);
            pic[y][x][2] = (unsigned char)I_fround(weights[2] * 255.0f);
            pic[y][x][3] = (unsigned char)I_fround(weights[3] * 255.0f);
        }
    }
    Image_Setup(image, 32, 32, 1, 3, 0, D3DFMT_A8R8G8B8);
    Image_UploadData(image, D3DFMT_A8R8G8B8, D3DCUBEMAP_FACE_POSITIVE_X, 0, &pic[0][0][0]);
}

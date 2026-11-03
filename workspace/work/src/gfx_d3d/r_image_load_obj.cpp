// Image creation for loaded world assets.
#include "r_local.h"
#include <math.h>
#include "universal/com_math.h"
#include "r_image_wavelet_types.h"
#include "gfx.h"

GfxImage *Image_Alloc(const char *name, int category, int semantic, int imageTrack);
void Image_Setup(GfxImage *image, int width, int height, int depth, int imageFlags, DWORD usage, D3DFORMAT imageFormat);
void Image_UploadData(GfxImage *image, D3DFORMAT format, D3DCUBEMAP_FACES cubemapFace, unsigned int mipLevel, const unsigned char *src);
void Image_Create2DTexture(GfxImage *image, int width, int height, int mipmapCount, DWORD usage, D3DFORMAT imageFormat, D3DPOOL memPool);
void Image_BuildSpecularityMap(float shift, unsigned char *pic);
void Image_GetLightGridWeightsForVector(const float *direction, int subMap, unsigned char *pixel);
void Image_GetSunHalfAngleForVector(const float *direction, int unused, unsigned char *pixel);

void Wavelet_DecompressLevel(byte *src, byte *dst, WaveletDecode *decode);

// PINNED 1000fbd0/86: every face is uploaded from its own source slice.
void Image_GenerateCube(GfxImage *image, int resolution, const byte *pixels,
    volatile int faceBytes, D3DFORMAT format)
{
    Image_Setup(image, resolution, resolution, 1, 7, 0, format);
    const byte *facePixels = pixels;
    for (int face = 0; face < 6; ++face)
    {
        Image_UploadData(image, format, (D3DCUBEMAP_FACES)face, 0, facePixels);
        facePixels += faceBytes;
    }
}

void R_LoadJpg(const char *filename, byte **file, byte **pixels,
    int *width, int *height, D3DFORMAT *format);

// PINNED 1000fc30/169: imageTrack is unused by the PC raw loader.
Bool Image_LoadRaw(GfxImage *image, const char *filename, int imageTrack)
{
    byte *pixels = 0;
    byte *file;
    int width, height;
    D3DFORMAT format;
    R_LoadJpg(filename, &file, &pixels, &width, &height, &format);
    if (!pixels)
        return 0;
    Image_Setup(image, width, height, 1, 3, 0, format);
    Image_UploadData(image, format, D3DCUBEMAP_FACE_POSITIVE_X, 0, pixels);
    ri.Hunk_FreeTempMemory(pixels);
    ri.FS_FreeFile(file);
    return 1;
}

// PINNED 1000fce0/119: original lookup is32 by256, one luminance byte per texel.
void Image_GenerateSpecularity(GfxImage *image)
{
    byte pixels[32 * 256];
    Image_BuildSpecularityMap(0.0f, pixels);
    Image_Setup(image, 32, 256, 1, 3, 0, D3DFMT_L8);
    Image_UploadData(image, D3DFMT_L8, D3DCUBEMAP_FACE_POSITIVE_X, 0, pixels);
}

// PINNED 100100f0/102: the four bytes reach the texture in BGRA order.
void Image_GenerateSolidColor(GfxImage *image, byte red, byte green, byte blue, byte alpha)
{
    byte pixel[4];
    pixel[0] = blue;
    pixel[1] = green;
    pixel[2] = red;
    pixel[3] = alpha;
    Image_Setup(image, 1, 1, 1, 3, 0, D3DFMT_A8R8G8B8);
    Image_UploadData(image, D3DFMT_A8R8G8B8, D3DCUBEMAP_FACE_POSITIVE_X, 0, pixel);
}

typedef void (*CubemapPixelCallback)(const float *direction, int userData, byte *pixel);

// PINNED 10010160/786: the axis descriptors are local to the original function.
void Image_GenerateCubemapFunction(GfxImage *image, byte *pixels, int resolution,
    int userData, CubemapPixelCallback callback)
{
    int faceAxis[6][3] = {
        { 0, 5, 3 }, { 1, 4, 3 }, { 2, 0, 4 },
        { 3, 0, 5 }, { 4, 0, 3 }, { 5, 1, 3 }
    };
    float inverseResolution = 1.0f / resolution;
    int pixelIndex = 0;
    for (int face = 0; face < 6; ++face)
    {
        float origin[3] = { 0.0f, 0.0f, 0.0f };
        int axis = faceAxis[face][0];
        origin[axis >> 1] = axis & 1 ? -1.0f : 1.0f;
        float right[3] = { 0.0f, 0.0f, 0.0f };
        axis = faceAxis[face][1];
        origin[axis >> 1] = axis & 1 ? 1.0f : -1.0f;
        right[axis >> 1] = origin[axis >> 1] * -2.0f;
        float up[3] = { 0.0f, 0.0f, 0.0f };
        axis = faceAxis[face][2];
        origin[axis >> 1] = axis & 1 ? 1.0f : -1.0f;
        up[axis >> 1] = origin[axis >> 1] * -2.0f;
        VectorScale(right, inverseResolution, right);
        VectorScale(up, inverseResolution, up);
        float rowBase[3];
        VectorMA(origin, 0.5f, right, rowBase);
        for (int row = 0; row < resolution; ++row)
        {
            float direction[3];
            float rowOffset = row + 0.5f;
            VectorMA(rowBase, rowOffset, up, direction);
            for (int column = 0; column < resolution; ++column)
            {
                callback(direction, userData, pixels + pixelIndex * 4);
                ++pixelIndex;
                direction[0] += right[0];
                direction[1] += right[1];
                direction[2] += right[2];
            }
        }
    }
    Image_GenerateCube(image, resolution, pixels, resolution * resolution * 4,
        D3DFMT_A8R8G8B8);
}

// PINNED 10010680/43: submap is passed unchanged to every pixel callback.
void Image_GenerateLightGridWeights(GfxImage *image, int subMap)
{
    byte pixels[6 * 32 * 32 * 4];
    Image_GenerateCubemapFunction(image, pixels, 32, subMap, Image_GetLightGridWeightsForVector);
}

// PINNED 100107b0/46: this larger cubemap uses temporary hunk memory, not the stack.
void Image_GenerateSunHalfAngle(GfxImage *image)
{
    byte *pixels = (byte *)ri.Hunk_AllocateTempMemoryInternal(6 * 64 * 64 * 4);
    Image_GenerateCubemapFunction(image, pixels, 64, 0, Image_GetSunHalfAngleForVector);
    ri.Hunk_FreeTempMemory(pixels);
}

static unsigned int Image_CountMipmapsForFile(const GfxImageFileHeader *fileHeader)
{
    if (fileHeader->flags & 2)
        return 1;
    unsigned int count = 1;
    int dimension = 1;
    while (dimension < fileHeader->dimensions[0] || dimension < fileHeader->dimensions[1]
        || dimension < fileHeader->dimensions[2])
    {
        dimension <<= 1;
        ++count;
    }
    return count;
}

// PINNED 1000f380/537; no Mac byte swapping or extra temporary copy on PC.
void Image_LoadWavelet(GfxImage *image, const GfxImageFileHeader *fileHeader,
    const byte *data, D3DFORMAT format, int bytesPerPixel)
{
    WaveletDecode decode;
    byte *hunkBufs[6];
    byte *hunkAddrs[6];
    byte *oldAddrs[6];
    Image_Setup(image, fileHeader->dimensions[0], fileHeader->dimensions[1],
        fileHeader->dimensions[2], fileHeader->flags, 0, format);
    decode.value = 0;
    decode.bit = 0;
    decode.width = fileHeader->dimensions[0];
    decode.height = fileHeader->dimensions[1];
    int levels = 1;
    if (!(fileHeader->flags & 2))
        for (int dimension = 1; dimension < decode.width || dimension < decode.height
            || dimension < fileHeader->dimensions[2]; dimension <<= 1)
            ++levels;
    decode.mipLevel = levels - 1;
    decode.channels = bytesPerPixel;
    decode.bpp = bytesPerPixel;
    decode.dataInitialized = 0;
    if (bytesPerPixel == 3)
        decode.bpp = 4;
    int faceCount = image->mapType == 5 ? 6 : 1;
    int totalSize = decode.width * decode.height * decode.bpp;
    for (int face = 0; face < faceCount; ++face)
    {
        hunkBufs[face] = (byte *)ri.Hunk_AllocateTempMemoryInternal(totalSize);
        hunkAddrs[face] = 0;
    }
    decode.data = data;
    for (; decode.mipLevel >= image->picmip.platform[0]; --decode.mipLevel)
    {
        int size = I_max(1, decode.width >> decode.mipLevel)
            * I_max(1, decode.height >> decode.mipLevel) * decode.bpp;
        for (int face = 0; face < faceCount; ++face)
        {
            oldAddrs[face] = hunkAddrs[face];
            hunkAddrs[face] = hunkBufs[face] + totalSize - size;
            Wavelet_DecompressLevel(oldAddrs[face], hunkAddrs[face], &decode);
            Image_UploadData(image, format, (D3DCUBEMAP_FACES)face,
                decode.mipLevel - image->picmip.platform[0], hunkAddrs[face]);
        }
    }
    for (int face = faceCount - 1; face >= 0; --face)
        ri.Hunk_FreeTempMemory(hunkBufs[face]);
}

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

// PINNED 1000f5a0/527: expand BGR in-place channel order, never reverse it.
void Image_LoadBitmap(GfxImage *image, const GfxImageFileHeader *fileHeader,
    const byte *data, D3DFORMAT format, int bytesPerPixel)
{
    Image_Setup(image, fileHeader->dimensions[0], fileHeader->dimensions[1],
        fileHeader->dimensions[2], fileHeader->flags, 0, format);
    int faceCount = image->mapType == 5 ? 6 : 1;
    byte *expandedData = 0;
    if (format == D3DFMT_X8R8G8B8)
    {
        int imageSize = image->height;
        imageSize *= image->width;
        imageSize *= 4;
        expandedData = (byte *)ri.Hunk_AllocateTempMemoryInternal(imageSize);
    }
    int mipCount = Image_CountMipmapsForFile(fileHeader);
    for (int mipLevel = mipCount - 1; mipLevel >= image->picmip.platform[0]; --mipLevel)
    {
        int width = I_max(1, fileHeader->dimensions[0] >> (short)mipLevel);
        int height = I_max(1, fileHeader->dimensions[1] >> (short)mipLevel);
        for (int face = 0; face < faceCount; ++face)
        {
            if (format == D3DFMT_X8R8G8B8)
            {
                int count = width * height;
                byte *dst = expandedData;
                const byte *src = data;
                do
                {
                    dst[0] = src[0];
                    dst[1] = src[1];
                    dst[2] = src[2];
                    dst[3] = 255;
                    dst += 4;
                    src += 3;
                } while (--count);
                Image_UploadData(image, D3DFMT_X8R8G8B8, (D3DCUBEMAP_FACES)face,
                    mipLevel - image->picmip.platform[0], expandedData);
            }
            else
                Image_UploadData(image, format, (D3DCUBEMAP_FACES)face,
                    mipLevel - image->picmip.platform[0], data);
            data += bytesPerPixel * height * width;
        }
    }
    if (expandedData)
        ri.Hunk_FreeTempMemory(expandedData);
}

// PINNED 1000f7b0/331: each mip uses rounded-up 4x4 block dimensions.
void Image_LoadDxtc(GfxImage *image, const GfxImageFileHeader *fileHeader,
    const byte *data, D3DFORMAT format, int bytesPerBlock)
{
    Image_Setup(image, fileHeader->dimensions[0], fileHeader->dimensions[1],
        fileHeader->dimensions[2], fileHeader->flags, 0, format);
    int faceCount = image->mapType == 5 ? 6 : 1;
    int mipCount = Image_CountMipmapsForFile(fileHeader);
    for (int mipLevel = mipCount - 1; mipLevel >= image->picmip.platform[0]; --mipLevel)
    {
        int width = I_max(1, fileHeader->dimensions[0] >> (short)mipLevel);
        int height = I_max(1, fileHeader->dimensions[1] >> (short)mipLevel);
        for (int face = 0; face < faceCount; ++face)
        {
            Image_UploadData(image, format, (D3DCUBEMAP_FACES)face,
                mipLevel - image->picmip.platform[0], data);
            data += bytesPerBlock * ((height + 3) >> 2) * ((width + 3) >> 2);
        }
    }
}

// PINNED 1000f900/261 plus a separate 52-byte switch table at1000fa08.
void Image_LoadFromData(GfxImage *image, const GfxImageFileHeader *fileHeader, const byte *data)
{
    image->texture.basemap = 0;
    switch (fileHeader->format)
    {
    case 1: Image_LoadBitmap(image, fileHeader, data, D3DFMT_A8R8G8B8, 4); break;
    case 2: Image_LoadBitmap(image, fileHeader, data, D3DFMT_X8R8G8B8, 3); break;
    case 3: Image_LoadBitmap(image, fileHeader, data, D3DFMT_A8L8, 2); break;
    case 4: Image_LoadBitmap(image, fileHeader, data, D3DFMT_L8, 1); break;
    case 5: Image_LoadBitmap(image, fileHeader, data, D3DFMT_A8, 1); break;
    case 6: Image_LoadWavelet(image, fileHeader, data, D3DFMT_A8R8G8B8, 4); break;
    case 7: Image_LoadWavelet(image, fileHeader, data, D3DFMT_X8R8G8B8, 3); break;
    case 8: Image_LoadWavelet(image, fileHeader, data, D3DFMT_A8L8, 2); break;
    case 9: Image_LoadWavelet(image, fileHeader, data, D3DFMT_L8, 1); break;
    case 10: Image_LoadWavelet(image, fileHeader, data, D3DFMT_A8, 1); break;
    case 11: Image_LoadDxtc(image, fileHeader, data, D3DFMT_DXT1, 8); break;
    case 12: Image_LoadDxtc(image, fileHeader, data, D3DFMT_DXT3, 16); break;
    case 13: Image_LoadDxtc(image, fileHeader, data, D3DFMT_DXT5, 16); break;
    }
}

void Com_Printf(const char *format, ...);
int Com_sprintf(char *dest, size_t size, const char *format, ...);

// PINNED 1000f2a0/67; compare individual tag bytes, then version5.
Bool Image_ValidateHeader(const GfxImageFileHeader *fileHeader, const char *filepath)
{
    if (fileHeader->tag[0] != 'I' || fileHeader->tag[1] != 'W' || fileHeader->tag[2] != 'i')
    {
        Com_Printf("^1ERROR: image '%s' is not an IW image\n", filepath);
        return 0;
    }
    if (fileHeader->version != 5)
    {
        Com_Printf("^1ERROR: image '%s' is version %i but should be version %i\n",
            filepath, fileHeader->version, 5);
        return 0;
    }
    return 1;
}

// PINNED 1000fa40/240. Preserve PC ordering, including noPicmip before validation.
Bool Image_LoadFromFile(GfxImage *image)
{
    char filepath[64];
    GfxImageFileHeader *fileHeader;
    if (Com_sprintf(filepath, sizeof(filepath), "%s%s%s", "images/", image->name, ".iwi") < 0)
    {
        Com_Printf("^1ERROR: filename '%s' too long\n", filepath);
        return 0;
    }
    int length = ri.FS_ReadFile(filepath, (void **)&fileHeader);
    if (length < 0)
    {
        Com_Printf("^1ERROR: image '%s' is missing\n", filepath);
        return 0;
    }
    if (!length)
    {
        Com_Printf("^1ERROR: image '%s' has 0 length\n", filepath);
        ri.FS_FreeFile(fileHeader);
        return 0;
    }
    const byte *data = (const byte *)fileHeader + sizeof(GfxImageFileHeader);
    if (fileHeader->flags & 3)
        image->noPicmip = 1;
    if (!Image_ValidateHeader(fileHeader, filepath))
    {
        ri.FS_FreeFile(fileHeader);
        return 0;
    }
    Image_LoadFromData(image, fileHeader, data);
    ri.FS_FreeFile(fileHeader);
    return 1;
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

float FresnelTerm(float n0, float n1, float cosIncidentAngle);

// PINNED 100107e0/98: copy the BGRA color, then replace only alpha with Fresnel reflectance.
void Image_WaterColorForDirection(const float *direction, int color, byte *pixel)
{
    float normal[3];
    Vec3NormalizeTo(direction, normal);
    memcpy(pixel, &color, 4);
    float alpha = FresnelTerm(1.0f, 1.333f, normal[2]) * 255.0f;
    pixel[3] = (byte)I_fround(alpha);
}

// PINNED 10010850/70: the callback receives packed color by value, not a stack pointer.
void Image_GenerateWaterColor(GfxImage *image, byte red, byte green, byte blue)
{
    byte pixels[6 * 16 * 16 * 4];
    byte color[4];
    color[2] = red;
    color[1] = green;
    color[0] = blue;
    color[3] = 0xff;
    Image_GenerateCubemapFunction(image, pixels, 16, *(int *)color, Image_WaterColorForDirection);
}

void R_CreateOutdoorImage(GfxImage *image);
void Com_Printf(const char *format, ...);

// PINNED 100108a0/519: unknown builtins return null before allocating an image.
GfxImage *Image_LoadBuiltin(const char *name, int semantic, int imageTrack)
{
    GfxImage *image;
    if (!strcmp(name, "$white"))
    {
        image = Image_Alloc(name, 1, semantic, imageTrack);
        Image_GenerateSolidColor(image, 255, 255, 255, 255);
        return image;
    }
    if (!strcmp(name, "$black"))
    {
        image = Image_Alloc(name, 1, semantic, imageTrack);
        Image_GenerateSolidColor(image, 0, 0, 0, 255);
        return image;
    }
    if (!strcmp(name, "$identitynormalmap"))
    {
        image = Image_Alloc(name, 1, semantic, imageTrack);
        Image_GenerateSolidColor(image, 128, 128, 255, 128);
        return image;
    }
    if (!strcmp(name, "$specularity"))
    {
        image = Image_Alloc(name, 1, semantic, imageTrack);
        Image_GenerateSpecularity(image);
        return image;
    }
    if (!strcmp(name, "$outdoor"))
    {
        image = Image_Alloc(name, 1, semantic, imageTrack);
        R_CreateOutdoorImage(image);
        return image;
    }
    if (!strcmp(name, "$lightmapweights"))
    {
        image = Image_Alloc(name, 1, semantic, imageTrack);
        Image_LoadLightmapWeights(image);
        return image;
    }
    if (!strcmp(name, "$lightgridweights0"))
    {
        image = Image_Alloc(name, 1, semantic, imageTrack);
        Image_GenerateLightGridWeights(image, 0);
        return image;
    }
    if (!strcmp(name, "$lightgridweights1"))
    {
        image = Image_Alloc(name, 1, semantic, imageTrack);
        Image_GenerateLightGridWeights(image, 1);
        return image;
    }
    if (!strcmp(name, "$watercolor"))
    {
        image = Image_Alloc(name, 1, semantic, imageTrack);
        Image_GenerateWaterColor(image, 51, 64, 77);
        return image;
    }
    if (!strcmp(name, "$sunhalfangle"))
    {
        image = Image_Alloc(name, 1, semantic, imageTrack);
        Image_GenerateSunHalfAngle(image);
        return image;
    }
    Com_Printf("ERROR: Unknown built-in image '%s'", name);
    return 0;
}

// PINNED 1000d0f0: category5 is the dynamic water texture, not a file reload.
void Image_BuildWaterMap(GfxImage *image)
{
    if (image->category == 5)
    {
        if (r_rendererInUse->current.integer == 2)
            Image_Create2DTexture(image, image->width, image->height, 1,
                D3DUSAGE_DYNAMIC, D3DFMT_X8R8G8B8, D3DPOOL_DEFAULT);
        else
            Image_Create2DTexture(image, image->width, image->height, 0,
                D3DUSAGE_DYNAMIC, D3DFMT_L8, D3DPOOL_DEFAULT);
    }
}

// Light-grid cubemap weights.
#pragma optimize("p", on)
int VecLargestAxis(const float vector[3]);
void R_QuantizeCachedColor(const float *color, byte *out);

static __forceinline void Image_TransformLightGridVector(float x, float y, float z, float *out)
{
    static const vec3_t basis[3] = {
        {0.81649655f, -0.40824828f, -0.40824828f},
        {0.0f, 0.70710677f, -0.70710677f},
        {0.57735026f, 0.57735026f, 0.57735026f}
    };
    AxisTransformVector(basis, x, y, z, out);
}

void Image_GetLightGridWeightsForVector(const float *facePos, int subMap, byte *pixel)
{
    float transformed[3];
    float weights[4];
    float smooth[3];
    float value;
    Image_TransformLightGridVector(facePos[0], facePos[1], facePos[2], transformed);
    int majorAxis = VecLargestAxis(transformed);
    float scale = 1.0f / fabsf(transformed[majorAxis]);
    VectorScale(transformed, scale, transformed);
    value = (transformed[0] + 1.0f) * 0.5f;
    smooth[0] = (3.0f - (value + value)) * value * value;
    value = (transformed[1] + 1.0f) * 0.5f;
    smooth[1] = (3.0f - (value + value)) * value * value;
    if (subMap == 0)
        value = 0.5f - transformed[2] * 0.5f;
    else
        value = (transformed[2] + 1.0f) * 0.5f;
    smooth[2] = (3.0f - (value + value)) * value * value;
    float bottom = 1.0f - smooth[1];
    float left = 1.0f - smooth[0];
    weights[0] = left * bottom * smooth[2];
    weights[1] = bottom * smooth[2] * smooth[0];
    weights[2] = left * smooth[2] * smooth[1];
    weights[3] = smooth[2] * smooth[1] * smooth[0];
    R_QuantizeCachedColor(weights, pixel);
}

#pragma optimize("p", off)

// Cubemap pixel callback: half-angle between the sun and the face direction, packed as a byte color.
void Image_GetSunHalfAngleForVector(const float *facePos, int unused, unsigned char *pixel)
{
    float dirFromEye[3];
    float halfAngle[3];
    const float *sunPos;
    float s0;
    float s1;
    float s2;

    Vec3NormalizeTo(facePos, dirFromEye);
    sunPos = rgp.world->sunLight.position;
    halfAngle[0] = sunPos[0] - dirFromEye[0];
    halfAngle[1] = sunPos[1] - dirFromEye[1];
    halfAngle[2] = sunPos[2] - dirFromEye[2];
    Vec3Normalize(halfAngle);
    s0 = (halfAngle[0] + 1.0f) * 0.5f;
    s1 = (halfAngle[1] + 1.0f) * 0.5f;
    s2 = (halfAngle[2] + 1.0f) * 0.5f;
    pixel[2] = (unsigned char)I_fround(s0 * 255.0f);
    pixel[1] = (unsigned char)I_fround(s1 * 255.0f);
    pixel[0] = (unsigned char)I_fround(s2 * 255.0f);
    pixel[3] = 0x80;
}

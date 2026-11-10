// Image setup, card-memory accounting and texel upload shared by the image loaders.
#include "r_local.h"
#include <string.h>
#include "universal/com_math.h"

void Image_Create2DTexture(GfxImage *image, unsigned short width, unsigned short height, int mipmapCount, DWORD usage, D3DFORMAT imageFormat, D3DPOOL memPool);
void Image_Create3DTexture(GfxImage *image, int width, int height, int depth, int mipmapCount, DWORD usage, D3DFORMAT imageFormat, D3DPOOL memPool);
void Image_CreateCubeTexture(GfxImage *image, int edgeLen, int mipmapCount, D3DFORMAT imageFormat, D3DPOOL memPool);
void Image_TrackTexture(GfxImage *image, int imageFlags, D3DFORMAT format, int width, int height, int depth);
void Image_PicmipForSemantic(unsigned char semantic, Picmip *picmip);

// Name from KisakCOD (CoD4); 0x1000e840.
static int Image_SourceBytesPerSlice(D3DFORMAT format, int width, int height)
{
    switch (format)
    {
    case D3DFMT_A8R8G8B8:
    case D3DFMT_D32:
    case D3DFMT_D24S8:
    case D3DFMT_R32F:
        return width * height * 4;
    case D3DFMT_X8R8G8B8:
        return width * height * 3;
    case D3DFMT_R5G6B5:
    case D3DFMT_A8L8:
    case D3DFMT_D16:
        return width * height * 2;
    case D3DFMT_A8:
    case D3DFMT_L8:
        return width * height;
    case D3DFMT_DXT1:
        return ((width + 3) >> 2) * ((height + 3) >> 2) * 8;
    case D3DFMT_DXT3:
    case D3DFMT_DXT5:
        return ((width + 3) >> 2) * ((height + 3) >> 2) * 16;
    default:
        return 0;
    }
}

// Name from KisakCOD (CoD4); 0x1000e900.
static void Image_Upload2D_CopyDataBlock(int width, int height, const unsigned char *src, D3DFORMAT format, int dstPitch, unsigned char *dst)
{
    int srcStride;
    int dy;
    int y;

    switch (format)
    {
    case D3DFMT_A8R8G8B8:
    case D3DFMT_X8R8G8B8:
        srcStride = 4 * width;
        dy = 1;
        break;
    case D3DFMT_R5G6B5:
    case D3DFMT_A8L8:
        srcStride = 2 * width;
        dy = 1;
        break;
    case D3DFMT_A8:
    case D3DFMT_L8:
        srcStride = width;
        dy = 1;
        break;
    case D3DFMT_DXT1:
        srcStride = 8 * ((width + 3) >> 2);
        dy = 4;
        break;
    case D3DFMT_DXT3:
    case D3DFMT_DXT5:
        srcStride = 16 * ((width + 3) >> 2);
        dy = 4;
        break;
    default:
        return;
    }
    if (dstPitch == srcStride)
    {
        memcpy(dst, src, srcStride * ((height - 1) / dy + 1));
        return;
    }
    for (y = 0; y < height; y += dy)
    {
        memcpy(dst, src, srcStride);
        dst += dstPitch;
        src += srcStride;
    }
}

// Name UNCONFIRMED (Mac 1.3 inlines the 2D/cube upload into Image_UploadData); 0x1000ea20.
void Image_Upload2D(GfxImage *image, D3DFORMAT format, D3DCUBEMAP_FACES cubemapFace, unsigned int mipLevel, const unsigned char *src)
{
    D3DLOCKED_RECT lockedRect;
    int width;
    int height;

    width = I_max(1, image->width >> mipLevel);
    height = I_max(1, image->height >> mipLevel);
    if (image->mapType == 3)
    {
        R_DX_CALL(image->texture.map->LockRect( mipLevel, &lockedRect, 0, 0 ));
        Image_Upload2D_CopyDataBlock(width, height, src, format, lockedRect.Pitch, (unsigned char *)lockedRect.pBits);
        R_DX_CALL(image->texture.map->UnlockRect( mipLevel ));
    }
    else
    {
        R_DX_CALL(image->texture.cubemap->LockRect( cubemapFace, mipLevel, &lockedRect, 0, 0 ));
        Image_Upload2D_CopyDataBlock(width, height, src, format, lockedRect.Pitch, (unsigned char *)lockedRect.pBits);
        R_DX_CALL(image->texture.cubemap->UnlockRect( cubemapFace, mipLevel ));
    }
}

// Name UNCONFIRMED; 0x1000ec00.
void Image_Upload3D(GfxImage *image, D3DFORMAT format, unsigned int mipLevel, const unsigned char *src)
{
    D3DLOCKED_BOX lockedBox;
    int width;
    int height;
    int depth;
    int srcSlicePitch;
    unsigned char *dst;
    int z;

    width = I_max(1, image->width >> mipLevel);
    height = I_max(1, image->height >> mipLevel);
    depth = I_max(1, image->depth >> mipLevel);
    srcSlicePitch = Image_SourceBytesPerSlice(format, width, height);
    R_DX_CALL(image->texture.volmap->LockBox( mipLevel, &lockedBox, 0, 0 ));
    dst = (unsigned char *)lockedBox.pBits;
    for (z = 0; z < depth; z++)
    {
        Image_Upload2D_CopyDataBlock(width, height, src, format, lockedBox.RowPitch, dst);
        src += srcSlicePitch;
        dst += lockedBox.SlicePitch;
    }
    R_DX_CALL(image->texture.volmap->UnlockBox( mipLevel ));
}

// Mac 1.3 r_image_load_common; inlined at every call site in retail 1.0.
void Image_UploadData(GfxImage *image, D3DFORMAT format, D3DCUBEMAP_FACES cubemapFace, unsigned int mipLevel, const unsigned char *src)
{
    if (image->mapType == 4)
        Image_Upload3D(image, format, mipLevel, src);
    else if (image->mapType != 5 || !mipLevel || dx.canMipCubemaps)
        Image_Upload2D(image, format, cubemapFace, mipLevel, src);
}

// Name UNCONFIRMED (Mac 1.3 inlines this into Image_Setup); 0x1000edc0.
static void Image_ClampPicmip(D3DFORMAT format, int width, int height, Picmip *picmip)
{
    int minSize;
    int minDim;
    unsigned char picmipLimit;
    int platform;

    if (format == D3DFMT_DXT1 || format == D3DFMT_DXT3 || format == D3DFMT_DXT5)
        minSize = 4;
    else
        minSize = 1;
    minDim = I_min(width, height);
    for (picmipLimit = 3; picmipLimit; picmipLimit--)
    {
        if ((minDim >> picmipLimit) >= minSize)
            break;
    }
    for (platform = 0; platform < 2; platform++)
    {
        if (picmip->platform[platform] > picmipLimit)
            picmip->platform[platform] = picmipLimit;
    }
}

void Image_Setup(GfxImage *image, int width, int height, int depth, int imageFlags, DWORD usage, D3DFORMAT imageFormat)
{
    int mipWidth;
    int mipHeight;
    int mipDepth;
    int mipmapCount;

    image->noPicmip = (imageFlags & 3) != 0;
    if (!image->noPicmip)
        Image_PicmipForSemantic(image->semantic, &image->picmip);
    else
        *(unsigned short *)&image->picmip = 0;
    Image_ClampPicmip(imageFormat, width, height, &image->picmip);
    mipWidth = I_max(1, width >> image->picmip.platform[0]);
    image->width = (unsigned short)mipWidth;
    mipHeight = I_max(1, height >> image->picmip.platform[0]);
    image->height = (unsigned short)mipHeight;
    mipDepth = I_max(1, depth >> image->picmip.platform[0]);
    image->depth = (unsigned short)mipDepth;
    mipmapCount = (imageFlags & 2) != 0;
    if (imageFlags & 4)
        Image_CreateCubeTexture(image, mipWidth, mipmapCount, imageFormat, D3DPOOL_MANAGED);
    else if (imageFlags & 8)
        Image_Create3DTexture(image, mipWidth, mipHeight, mipDepth, mipmapCount, usage, imageFormat, D3DPOOL_MANAGED);
    else
        Image_Create2DTexture(image, mipWidth, mipHeight, mipmapCount, usage, imageFormat, D3DPOOL_MANAGED);
    Image_TrackTexture(image, imageFlags, imageFormat, width, height, depth);
}

// Name from KisakCOD (CoD4); 0x1000ef40.
static int Image_GetCardMemoryAmountForMipLevel(D3DFORMAT format, int width, int height, int depth)
{
    switch (format)
    {
    case D3DFMT_A8R8G8B8:
    case D3DFMT_X8R8G8B8:
    case D3DFMT_D32:
    case D3DFMT_D24S8:
    case D3DFMT_R32F:
        return width * height * depth * 4;
    case D3DFMT_R5G6B5:
    case D3DFMT_A8L8:
    case D3DFMT_D16:
        return width * height * depth * 2;
    case D3DFMT_A8:
    case D3DFMT_L8:
        return width * height * depth;
    case D3DFMT_DXT1:
        return ((width + 3) >> 2) * ((height + 3) >> 2) * depth * 8;
    case D3DFMT_DXT3:
    case D3DFMT_DXT5:
        return ((width + 3) >> 2) * ((height + 3) >> 2) * depth * 16;
    default:
        return 0;
    }
}

int Image_GetCardMemoryAmount(int imageFlags, D3DFORMAT format, int width, int height, int depth)
{
    int memory;
    memory = Image_GetCardMemoryAmountForMipLevel(format, width, height, depth);
    if (!(imageFlags & 2))
    {
        while (width > 1 || height > 1 || depth > 1)
        {
            width >>= 1;
            if (1 - width >= 0)
                width = 1;
            height >>= 1;
            if (1 - height >= 0)
                height = 1;
            depth >>= 1;
            if (1 - depth >= 0)
                depth = 1;
            memory += Image_GetCardMemoryAmountForMipLevel(format, width, height, depth);
        }
    }
    if (imageFlags & 4)
        return memory * 6;
    return memory;
}

// Image registry and Direct3D texture creation.
#include "r_local.h"
#include <string.h>
#include <dxerr9.h>
#include "universal/com_math.h"

// Field names KisakCOD; PINNED on PC 1.0: imageHashTable 0x101cea68, picmip 0x101d0a68, picmipBump 0x101d0a6c,
// picmipSpec 0x101d0a70, totalMemory 0x101d0a74 (Image_PicmipForSemantic, Image_TrackTexture). Later fields not reconstructed.
struct ImageGlobals
{
    GfxImage *imageHashTable[2048];
    int picmip;
    int picmipBump;
    int picmipSpec;
    int totalMemory[2];
};

ImageGlobals imageGlobals;

int Image_GetCardMemoryAmount(int imageFlags, D3DFORMAT format, int width, int height, int depth);

void Image_TrackTexture(GfxImage *image, int imageFlags, D3DFORMAT format, int width, int height, int depth)
{
    int platform;
    int picmip;
    int memory;
    int mipWidth;
    int mipHeight;
    int mipDepth;
    int track;

    for (platform = 0; platform < 2; platform++)
    {
        if (imageFlags & 1)
        {
            mipWidth = width;
            mipHeight = height;
            mipDepth = depth;
        }
        else
        {
            picmip = image->picmip.platform[platform];
            mipWidth = I_max(1, width >> picmip);
            mipHeight = I_max(1, height >> picmip);
            mipDepth = I_max(1, depth >> picmip);
        }
        memory = Image_GetCardMemoryAmount(imageFlags, format, mipWidth, mipHeight, mipDepth);
        image->cardMemory.platform[platform] = memory;
        track = image->track;
        switch (track)
        {
        case 0:
        case 1:
        case 4:
            break;
        default:
            imageGlobals.totalMemory[platform] += memory;
            break;
        }
    }
}

// r_utils in Mac 1.3; inlined at every call site in retail 1.0.
int R_HashAssetName(const char *name)
{
    int hash;
    int i;

    int mult;

    hash = 0;
    mult = 119;
    for (i = 0; name[i]; i++)
    {
        hash += name[i] * mult;
        mult++;
    }
    return hash;
}

static int Image_GetAvailableHashLocation(const char *name)
{
    int hashIndex;

    for (hashIndex = R_HashAssetName(name) & 0x7ff; imageGlobals.imageHashTable[hashIndex]; hashIndex = (hashIndex + 1) & 0x7ff)
        ;
    return hashIndex;
}

void Image_Create2DTexture(GfxImage *image, int width, int height, int mipmapCount, DWORD usage, D3DFORMAT imageFormat, D3DPOOL memPool)
{
    HRESULT hr;

    image->height = (unsigned short)height;
    image->width = (unsigned short)width;
    image->depth = 1;
    image->mapType = 3;
    hr = dx.device->CreateTexture((unsigned short)width, (unsigned short)height, mipmapCount, usage, imageFormat, memPool, &image->texture.map, NULL);
    if (FAILED(hr))
    {
        R_Error(ERR_DROP, "Create2DTexture( %s, %i, %i, %i, %i ) failed: %08x = %s",
            image->name, image->width, image->height, 0, imageFormat, hr, DXGetErrorDescription9(hr));
    }
}

void Image_Create3DTexture(GfxImage *image, int width, int height, int depth, int mipmapCount, DWORD usage, D3DFORMAT imageFormat, D3DPOOL memPool)
{
    HRESULT hr;

    image->width = (unsigned short)width;
    image->height = (unsigned short)height;
    image->depth = (unsigned short)depth;
    image->mapType = 4;
    hr = dx.device->CreateVolumeTexture((unsigned short)width, (unsigned short)height, (unsigned short)depth, mipmapCount, usage, imageFormat, memPool, &image->texture.volmap, NULL);
    if (FAILED(hr))
    {
        R_Error(ERR_DROP, "Create3DTexture( %s, %i, %i, %i, %i, %i ) failed: %08x = %s",
            image->name, image->width, image->height, image->depth, 0, imageFormat, hr, DXGetErrorDescription9(hr));
    }
}

void Image_CreateCubeTexture(GfxImage *image, int edgeLen, int mipmapCount, D3DFORMAT imageFormat, D3DPOOL memPool)
{
    HRESULT hr;

    image->width = (unsigned short)edgeLen;
    image->height = (unsigned short)edgeLen;
    image->depth = 1;
    image->mapType = 5;
    if (!dx.canMipCubemaps)
        mipmapCount = 1;
    hr = dx.device->CreateCubeTexture((unsigned short)edgeLen, mipmapCount, 0, imageFormat, memPool, &image->texture.cubemap, NULL);
    if (FAILED(hr))
    {
        R_Error(ERR_DROP, "CreateCubeTexture ( %s, %i, %i, %i ) failed: %08x = %s",
            image->name, image->width, mipmapCount, imageFormat, hr, DXGetErrorDescription9(hr));
    }
}

GfxImage *Image_Alloc(const char *name, int category, int semantic, int imageTrack)
{
    GfxImage *image;
    int nameLen;

    nameLen = strlen(name) + 1;
    image = (GfxImage *)ri.Hunk_AllocInternal(sizeof(GfxImage) + nameLen);
    image->name = (char *)(image + 1);
    memcpy((char *)(image + 1), name, nameLen);
    image->category = (unsigned char)category;
    image->semantic = (unsigned char)semantic;
    image->track = (unsigned char)imageTrack;
    imageGlobals.imageHashTable[Image_GetAvailableHashLocation(name)] = image;
    return image;
}

void Image_PicmipForSemantic(unsigned char semantic, Picmip *picmip)
{
    int picmipUsed;

    switch (semantic)
    {
    case 2:
    case 5:
        picmipUsed = imageGlobals.picmip;
        break;
    case 3:
        picmipUsed = imageGlobals.picmipBump;
        break;
    case 4:
        picmipUsed = imageGlobals.picmipSpec;
        break;
    case 0:
    case 1:
        *(unsigned short *)picmip = 0;
        return;
    default:
        *(unsigned short *)picmip = 0;
        return;
    }
    picmip->platform[1] = 2;
    if (picmipUsed < 0)
        picmipUsed = 0;
    else if (picmipUsed > 3)
        picmipUsed = 3;
    picmip->platform[0] = (unsigned char)picmipUsed;
}

void R_ReleaseLostImages()
{
    unsigned int index;
    GfxImage *image;
    int track;
    for (index = 0; index < 2048; index++)
    {
        image = imageGlobals.imageHashTable[index];
        if (image && image->category >= 5)
        {
            track = image->track;
            switch (track)
            {
            case 0:
            case 1:
            case 4:
                break;
            default:
                imageGlobals.totalMemory[0] -= image->cardMemory.platform[0];
                imageGlobals.totalMemory[1] -= image->cardMemory.platform[1];
                break;
            }
            if (image->texture.basemap)
            {
                image->texture.basemap->Release();
                image->texture.basemap = NULL;
                memset(&image->cardMemory, 0, sizeof(image->cardMemory));
            }
            image->mapType = 0;
        }
    }
}

IDirect3DSurface9 *Image_GetSurface(GfxImage *image)
{
    IDirect3DSurface9 *surface;

    R_DX_CALL(image->texture.map->GetSurfaceLevel( 0, &surface ));
    return surface;
}

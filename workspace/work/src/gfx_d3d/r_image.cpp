// Image registry and Direct3D texture creation.
#include "r_local.h"
#include <string.h>
#include <dxerr9.h>
#include <algorithm>
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

// PINNED 1000de10: source and destination may be the same mip buffer.
__declspec(noinline) void R_DownsampleMipMapBilinear(const byte *src, int srcBufferSize,
    int srcWidth, int srcHeight, int texelPitch, byte *dst, int dstBufferSize)
{
    int dstWidth, dstHeight, srcRowPitch, dstRowPitch;
    int row, col, ch;
    if (srcWidth == 1 && srcHeight == 1)
        return;
    dstWidth = srcWidth >> 1;
    dstHeight = srcHeight >> 1;
    srcRowPitch = srcWidth * texelPitch;
    dstRowPitch = dstWidth * texelPitch;
    if (!dstWidth || !dstHeight)
    {
        for (col = 0; col < dstWidth + dstHeight; ++col)
        {
            for (ch = 0; ch < texelPitch; ++ch)
                dst[ch] = (byte)((src[ch] + src[ch + texelPitch]) >> 1);
            dst += texelPitch;
            src += 2 * texelPitch;
        }
        return;
    }
    for (row = 0; row < dstHeight; ++row)
    {
        const byte *srcPos = src;
        byte *dstPos = dst;
        for (col = 0; col < dstWidth; ++col)
        {
            for (ch = 0; ch < texelPitch; ++ch)
                dstPos[ch] = (byte)((srcPos[ch] + srcPos[ch + texelPitch]
                    + srcPos[ch + srcRowPitch] + srcPos[ch + srcRowPitch + texelPitch]) >> 2);
            srcPos += 2 * texelPitch;
            dstPos += texelPitch;
        }
        src += 2 * srcRowPitch;
        dst += dstRowPitch;
    }
}

// PINNED: PC 0x101ce890 holds 13 programmable images, each 36 bytes.
GfxImage g_imageProgs[13];
const char *g_imageProgNames[13] = {
    "$dynamic_shadows", "$shadow_cookie", "$shadow_cookie_blur", "$floatz",
    "$blurred_screen", "$glow_0", "$glow_1", "$pingpong_0", "$pingpong_1",
    "$resolved_post_sun", "$resolved_scene", "$savedscreen", "$raw"
};

struct ImageList
{
    int count;
    GfxImage *image[2048];
};

struct Image_MemUsage
{
    int total;
    int lightmap;
    int minspec;
};

// PINNED1000d480: programmable images are excluded by their whole address range.
static void Image_Iterate(void (*callback)(GfxImage *, void *), void *data)
{
    for (unsigned int index = 0; index < 2048; ++index)
    {
        GfxImage *image = imageGlobals.imageHashTable[index];
        if (image && (image < g_imageProgs || image >= g_imageProgs + 13))
            callback(image, data);
    }
}

// PINNED1000c7e0: the callback keeps its ordinary two-stack-argument ABI.
static void R_AddImageToList(GfxImage *image, void *data)
{
    ImageList *list = (ImageList *)data;
    list->image[list->count] = image;
    ++list->count;
}

// PINNED1000c800; names and list shape agree with the Mac reference.
void R_GetImageList(ImageList *list)
{
    list->count = 0;
    Image_Iterate(R_AddImageToList, list);
}

// PINNED1000c7c0: preserve the signed track test, including negative inputs.
static Bool Image_IsCodeTrack(int track)
{
    return track >= 0 && (track <= 1 || track == 4);
}

// PINNED1000c8d0; this accessor is also present as a public retail body.
int R_GetMinSpecImageMemory()
{
    return imageGlobals.totalMemory[1];
}

// PINNED1000c820: minspec is the second platform's tracked memory counter.
void R_GetImageMemory(Image_MemUsage *usage)
{
    ImageList list;
    int memoryByTrack[10];
    int total = 0;
    R_GetImageList(&list);
    memset(memoryByTrack, 0, sizeof(memoryByTrack));
    for (int index = 0; index < list.count; ++index)
    {
        GfxImage *image = list.image[index];
        int memory = image->cardMemory.platform[0];
        int track = image->track;
        memoryByTrack[track] += memory;
        if (!Image_IsCodeTrack(track))
            total += memory;
    }
    usage->total = total;
    usage->lightmap = memoryByTrack[4];
    usage->minspec = R_GetMinSpecImageMemory();
}

// PINNED101a59fc/101a5a24: track labels and platform labels, respectively.
static const char *imageTypeName[10] = {
    "misc  ", "debug ", "$tex+?", "ui    ", "lmap  ",
    "light ", "f/x   ", "hud   ", "model ", "world "
};
static const char *g_platform_name[2] = {"current", " min_pc"};

// PINNED1000d900: ascending track, then ascending current-platform memory.
static int imagecompare(GfxImage *first, GfxImage *second)
{
    if (first->track > second->track)
        return 0;
    if (first->track < second->track)
        return 1;
    return first->cardMemory.platform[0] < second->cardMemory.platform[0];
}

int I_stricmp(const char *first, const char *second);

// PINNED1000d940: PC has13 programmable images and the real SDK texture descs.
void R_ImageList_f()
{
    ImageList list;
    int imageTrack[10][2];
    int total[2];
    Bool listAllImages = 0;
    int index;
    int platform;
    if (ri.Cmd_Argc() == 2 && !I_stricmp(ri.Cmd_Argv(1), "all"))
        listAllImages = 1;
    memset(total, 0, sizeof(total));
    memset(imageTrack, 0, sizeof(imageTrack));
    R_GetImageList(&list);
    if (listAllImages)
    {
        for (index = 0; index < 13; ++index)
        {
            if ((unsigned int)list.count >= 2048)
                break;
            if (g_imageProgs[index].mapType)
                list.image[list.count++] = &g_imageProgs[index];
        }
    }
    std::sort(list.image, list.image + list.count, imagecompare);
    ri.Printf(0, "\n-if-- ");
    for (platform = 0; platform < 2; ++platform)
        ri.Printf(0, "%s", g_platform_name[platform]);
    ri.Printf(0, "  --name-------\n");
    for (index = 0; index < list.count; ++index)
    {
        GfxImage *image = list.image[index];
        D3DVOLUME_DESC volumeDesc;
        D3DSURFACE_DESC surfaceDesc;
        D3DFORMAT format;
        switch (image->mapType)
        {
        case 3:
            image->texture.map->GetLevelDesc(0, &surfaceDesc);
            format = surfaceDesc.Format;
            break;
        case 4:
            image->texture.volmap->GetLevelDesc(0, &volumeDesc);
            format = volumeDesc.Format;
            break;
        case 5:
            image->texture.cubemap->GetLevelDesc(0, &surfaceDesc);
            format = surfaceDesc.Format;
            break;
        default:
            return;
        }
        switch (format)
        {
        case D3DFMT_X8R8G8B8: ri.Printf(0, "RGB32 "); break;
        case D3DFMT_A8R8G8B8: ri.Printf(0, "RGBA32"); break;
        case D3DFMT_A8: ri.Printf(0, "A8    "); break;
        case D3DFMT_L8: ri.Printf(0, "L8    "); break;
        case D3DFMT_R5G6B5: ri.Printf(0, "RGB16 "); break;
        case D3DFMT_A8L8: ri.Printf(0, "AL16  "); break;
        case D3DFMT_DXT1: ri.Printf(0, "DXT1  "); break;
        case D3DFMT_DXT3: ri.Printf(0, "DXT3  "); break;
        case D3DFMT_DXT5: ri.Printf(0, "DXT5  "); break;
        case D3DFMT_R32F: ri.Printf(0, "R32F  "); break;
        }
        ri.Printf(0, "  %s", imageTypeName[image->track]);
        for (platform = 0; platform < 2; ++platform)
        {
            float sizeKB = image->cardMemory.platform[platform] * 0.0009765625f;
            ri.Printf(0, sizeKB < 10.0f ? "%7.1f" : "%7.0f", (double)sizeKB);
            int memory = image->cardMemory.platform[platform];
            imageTrack[image->track][platform] += memory;
            if (listAllImages || !Image_IsCodeTrack(image->track))
                total[platform] += memory;
        }
        ri.Printf(0, "  %s\n", image->name);
    }
    ri.Printf(0, " ---------\n");
    ri.Printf(0, " %i total images\n", list.count);
    for (platform = 0; platform < 2; ++platform)
        ri.Printf(0, " %5.1f MB %s total image size\n",
            (double)(total[platform] * 9.5367431640625e-7f), g_platform_name[platform]);
    ri.Printf(0, "\n");
    ri.Printf(0, "       ");
    for (platform = 0; platform < 2; ++platform)
        ri.Printf(0, "%s", g_platform_name[platform]);
    ri.Printf(0, "\n");
    for (index = 0; index < 10; ++index)
    {
        ri.Printf(0, "%s:", imageTypeName[index]);
        for (platform = 0; platform < 2; ++platform)
            ri.Printf(0, "  %5.1f", (double)(imageTrack[index][platform] * 9.5367431640625e-7f));
        ri.Printf(0, "  MB\n");
    }
    ri.Printf(0, "Related commands: meminfo, imagelist, gfx_world, gfx_model, cg_drawfps, com_statmon, tempmeminfo\n");
}

extern const dvar_t *r_picmip_manual;
extern const dvar_t *r_picmip;
extern const dvar_t *r_picmip_bump;
extern const dvar_t *r_picmip_spec;
unsigned int R_AvailableTextureMemory();

// PINNED: retail 0x1000d680 uses unsigned memory thresholds.
void R_SetPicmip();

int Image_GetCardMemoryAmount(int imageFlags, D3DFORMAT format, int width, int height, int depth);

int Image_GetPlatformScreenWidth(int platform)
{
    return platform - 1 ? vidConfig.width : 640;
}

int Image_GetPlatformScreenHeight(int platform)
{
    return platform - 1 ? vidConfig.height : 480;
}

// PINNED: PC 0x1000c9d0 accumulates, with dimensions truncated to 16 bits.
void Image_TrackFullscreenTexture(GfxImage *image, int picmip, D3DFORMAT format)
{
    int screenWidth;
    int screenHeight;
    int width;
    int height;
    int memory;
    int track;

    for (int platform = 0; platform < 2; ++platform)
    {
        screenWidth = vidConfig.width;
        switch (platform)
        {
        case 1:
            screenWidth = 640;
            break;
        }
        screenHeight = vidConfig.height;
        switch (platform)
        {
        case 1:
            screenHeight = 480;
            break;
        }
        width = I_max(1, screenWidth >> picmip);
        height = I_max(1, screenHeight >> picmip);
        memory = Image_GetCardMemoryAmount(3, format,
            (unsigned short)width, (unsigned short)height, 1);
        image->cardMemory.platform[platform] += memory;
        track = image->track;
        if (!Image_IsCodeTrack(track))
            imageGlobals.totalMemory[platform] += memory;
    }
}

void Image_TrackTexture(GfxImage *image, int imageFlags, D3DFORMAT format, int width, int height, int depth)
{
    int platform;
    int picmip;
    int mipWidth;
    int mipHeight;
    int mipDepth;
    int shiftedHeight;
    int memory;
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
            mipWidth = I_sel(1 - (width >> picmip), 1, width >> picmip);
            shiftedHeight = height >> picmip;
            mipHeight = I_sel(1 - shiftedHeight, 1, shiftedHeight);
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

inline Bool Image_IsCodeImage(const GfxImage *image)
{
    uintptr_t address = (uintptr_t)image;
    return address >= (uintptr_t)g_imageProgs && address < (uintptr_t)(g_imageProgs + 13);
}

// PINNED 1000d140: byte-sized predicate, then a normalized mask selects the pointer.
GfxImage *Image_FindExisting(const char *name)
{
    unsigned int index = R_HashAssetName(name) & 0x7ff;
    GfxImage *image = imageGlobals.imageHashTable[index];
    while (image && strcmp(name, image->name))
    {
        index = (index + 1) & 0x7ff;
        image = imageGlobals.imageHashTable[index];
    }
    return (GfxImage *)(intptr_t)I_sel((int)(bool)Image_IsCodeImage(image) - 1, 0, (intptr_t)image);
}

static int Image_GetAvailableHashLocation(const char *name)
{
    int hashIndex;

    for (hashIndex = R_HashAssetName(name) & 0x7ff; imageGlobals.imageHashTable[hashIndex]; hashIndex = (hashIndex + 1) & 0x7ff)
        ;
    return hashIndex;
}

GfxImage *Image_AllocProg(int imageProgType, int category)
{
    GfxImage *image = &g_imageProgs[imageProgType];
    const char *name = g_imageProgNames[imageProgType];
    image->name = name;
    image->category = (unsigned char)category;
    image->semantic = 0;
    image->track = 0;
    imageGlobals.imageHashTable[Image_GetAvailableHashLocation(name)] = image;
    return image;
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

// PINNED 1000d010/53 and1000d050/56: account the stored 16-bit dimensions.
void Image_SetupRenderTarget(GfxImage *image, int width, int height, D3DFORMAT format)
{
    Image_Create2DTexture(image, width, height, 1, D3DUSAGE_RENDERTARGET, format, D3DPOOL_DEFAULT);
    Image_TrackTexture(image, 3, format, (unsigned short)width, (unsigned short)height, 1);
}

void Image_SetupSystem(GfxImage *image, int width, int height, D3DFORMAT format)
{
    Image_Create2DTexture(image, width, height, 1, D3DUSAGE_DYNAMIC, format, D3DPOOL_SYSTEMMEM);
    Image_TrackTexture(image, 3, format, (unsigned short)width, (unsigned short)height, 1);
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

// PINNED: retail 0x1000c910; the same release path is inlined in lost-image cleanup.
void Image_Release(GfxImage *image)
{
    int track = image->track;
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

void R_ReleaseLostImages()
{
    unsigned int index;
    GfxImage *image;
    for (index = 0; index < 2048; index++)
    {
        image = imageGlobals.imageHashTable[index];
        if (image && image->category >= 5)
        {
            Image_Release(image);
        }
    }
}

Bool Image_LoadFromFile(GfxImage *image);

// PINNED 1000d450/42: release first, then reload or raise ERR_DROP.
void Image_Reload(GfxImage *image)
{
    Image_Release(image);
    if (!Image_LoadFromFile(image))
        R_Error(ERR_DROP, "failed to load image '%s'", image->name);
}

IDirect3DSurface9 *Image_GetSurface(GfxImage *image)
{
    IDirect3DSurface9 *surface;

    R_DX_CALL(image->texture.map->GetSurfaceLevel( 0, &surface ));
    return surface;
}

void R_SetPicmip()
{
    unsigned int texMemInMegs;
    unsigned int sysMemInMegs;
    int minPicmip;
    int picmip, picmipBump, picmipSpec;
    bool changed;

    texMemInMegs = R_AvailableTextureMemory();
    sysMemInMegs = ri.Dvar_GetInt("sys_sysMB");
    if (r_picmip_manual->current.enabled)
    {
        ri.Printf(0, "Picmip is set manually.\n");
        picmip = imageGlobals.picmip = r_picmip->current.integer;
        imageGlobals.picmipBump = r_picmip_bump->current.integer;
        imageGlobals.picmipSpec = r_picmip_spec->current.integer;
    }
    else
    {
        minPicmip = 2;
        if (r_rendererInUse->current.integer == 2)
        {
            ri.Printf(0, "Texture detail is set automatically for DirectX 7.\n");
            if (texMemInMegs >= 100)
            {
                picmip = 0;
                picmipBump = 0;
                picmipSpec = 0;
            }
            else if (texMemInMegs >= 28)
            {
                picmip = 1;
                picmipBump = 1;
                picmipSpec = 1;
            }
            else
            {
                picmip = 2;
                picmipBump = 2;
                picmipSpec = 2;
            }
            imageGlobals.picmip = picmip;
            imageGlobals.picmipBump = picmipBump;
            imageGlobals.picmipSpec = picmipSpec;
            if (sysMemInMegs >= 384)
                goto setDvars;
            minPicmip = 1;
        }
        else
        {
            ri.Printf(0, "Texture detail is set automatically.\n");
            if (texMemInMegs >= 300)
            {
                picmip = 0;
                picmipBump = 0;
                picmipSpec = 0;
            }
            else if (texMemInMegs >= 240)
            {
                picmip = 0;
                picmipBump = 0;
                picmipSpec = 1;
            }
            else if (texMemInMegs >= 190)
            {
                picmip = 0;
                picmipBump = 1;
                picmipSpec = 1;
            }
            else
            {
                picmip = 1;
                if (texMemInMegs >= 150)
                {
                    picmipBump = 1;
                    picmipSpec = 1;
                }
                else
                {
                    if (texMemInMegs >= 130)
                        picmipBump = 1;
                    else
                    {
                        picmipBump = 2;
                        if (texMemInMegs < 120)
                            picmip = 2;
                    }
                    picmipSpec = 2;
                }
            }
            imageGlobals.picmip = picmip;
            imageGlobals.picmipBump = picmipBump;
            imageGlobals.picmipSpec = picmipSpec;
            if (sysMemInMegs >= 384)
            {
                if (sysMemInMegs >= 480)
                    goto setDvars;
                minPicmip = 1;
            }
        }
        {
            changed = false;
            if (picmip < minPicmip)
            {
                picmip = minPicmip;
                imageGlobals.picmip = picmip;
                changed = true;
            }
            if (imageGlobals.picmipBump < minPicmip)
            {
                imageGlobals.picmipBump = minPicmip;
                changed = true;
            }
            if (imageGlobals.picmipSpec < minPicmip)
            {
                imageGlobals.picmipSpec = minPicmip;
                changed = true;
            }
            if (changed)
            {
                ri.Printf(0, "Reducing texture detail based on total system memory of %i MB to improve load times.\n", sysMemInMegs);
                picmip = imageGlobals.picmip;
            }
        }
    }
setDvars:
    ri.Dvar_SetInt(r_picmip, picmip);
    ri.Dvar_SetInt(r_picmip_bump, imageGlobals.picmipBump);
    ri.Dvar_SetInt(r_picmip_spec, imageGlobals.picmipSpec);
    ri.Printf(0, "Using picmip %i on most textures, %i on normal maps, and %i on specular maps\n", imageGlobals.picmip, imageGlobals.picmipBump, imageGlobals.picmipSpec);
}

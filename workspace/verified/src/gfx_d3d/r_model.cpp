// Model registration and skinned-cache helpers.
#include "gfx.h"
#include "imports.h"

extern DxGlobals dx;
extern int alwaysfails;
void RB_LogPrint(const char *text);
extern "C" __declspec(dllimport) long __stdcall InterlockedExchangeAdd(long volatile *addend, long value);
extern "C" __declspec(dllimport) long __stdcall InterlockedExchange(long volatile *target, long value);

typedef HRESULT(__stdcall *BufferUnlockFn)(void *buffer);
#define VTABLE(obj) (*(void ***)((void *)(obj)))

// Name unconfirmed: DObjAnimMat to 4x4 skeleton matrix.
void R_ConvertAnimMatToSkelMat(const float *in, float *out)
{
    float xx, xy, xz, xw, yy, yz, yw, zz, zw;
    float sx, sy;

    sx = in[7] * in[0];
    sy = in[7] * in[1];
    xx = sx * in[0];
    xy = sx * in[1];
    xz = sx * in[2];
    xw = sx * in[3];
    yy = sy * in[1];
    yz = sy * in[2];
    yw = sy * in[3];
    zz = in[7] * in[2] * in[2];
    zw = in[7] * in[2] * in[3];
    out[3] = 0.0f;
    out[7] = 0.0f;
    out[11] = 0.0f;
    out[0] = 1.0f - (zz + yy);
    out[1] = xy + zw;
    out[2] = xz - yw;
    out[4] = xy - zw;
    out[5] = 1.0f - (zz + xx);
    out[6] = yz + xw;
    out[8] = yw + xz;
    out[9] = yz - xw;
    out[10] = 1.0f - (yy + xx);
    out[12] = in[4];
    out[13] = in[5];
    out[14] = in[6];
    out[15] = 1.0f;
}

static void *Hunk_AllocXModelPrecache(int size)
{
    return ri.Hunk_AllocInternal(size);
}

static void *Hunk_AllocXModelPrecacheColl(int size)
{
    return ri.Hunk_AllocInternal(size);
}

static bool R_ValidXModelName(const char *name)
{
    if (strlen(name) >= 0x40)
        return false;
    if (_strnicmp(name, "xmodel", 6))
        return false;
    return name[6] == '/' || name[6] == '\\';
}

XModel *R_RegisterModel(const char *name)
{
    if (!R_ValidXModelName(name))
    {
        ri.Printf(2, "R_RegisterModel: Invalid model name '%s'\n", name);
        return 0;
    }
    return ri.XModelPrecache(name + 7, Hunk_AllocXModelPrecache, Hunk_AllocXModelPrecacheColl);
}

extern "C" const char *__stdcall DXGetErrorDescription9A(HRESULT hr);
typedef HRESULT(__stdcall *BufferLockFn)(void *buffer, UINT offset, UINT size, void **data, DWORD flags);

void R_LockSkinnedCache(int lockType)
{
    void *vb;
    DWORD lockFlags;
    HRESULT hr;

    vb = (void *)frontEndDataOut->skinnedCacheVb->buffer;
    if (dx.gpuSync || lockType)
        lockFlags = 0x1000;
    else
        lockFlags = 0x2000;
    hr = ((BufferLockFn)VTABLE(vb)[0x2c / 4])(vb, 0, 0, (void **)&dx.skinnedCacheLockAddr, lockFlags);
    if (hr < 0)
    {
        ri.Printf(0, "********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n");
        ri.Printf(0, "********** error information:  %s\n", DXGetErrorDescription9A(hr));
        ri.Sys_DirectXFatalError();
    }
    if ((unsigned int)dx.skinnedCacheLockAddr & 0xf)
    {
        ((BufferUnlockFn)VTABLE(vb)[0x30 / 4])(vb);
        dx.skinnedCacheLockAddr = 0;
    }
}

void R_UnlockSkinnedCache()
{
    GfxBackEndData *data;
    void *vb;

    if (!dx.skinnedCacheLockAddr)
        return;
    data = frontEndDataOut;
    dx.skinnedCacheLockAddr = 0;
    vb = (void *)data->skinnedCacheVb->buffer;
    do
    {
        RB_LogPrint("vb->Unlock()\n");
        ((BufferUnlockFn)VTABLE(vb)[0x30 / 4])(vb);
    } while (*(volatile int *)&alwaysfails != 0);
}

int R_AllocSkinnedCachedVerts(int vertCount)
{
    static int skinCacheWarnFrame;
    int offset;

    if (!dx.skinnedCacheLockAddr)
        return -1;
    offset = InterlockedExchangeAdd((long *)&frontEndDataOut->skinnedCacheVb->used, (r_rendererInUse->current.integer == 2 ? 0x24 : 0x40) * vertCount);
    if (frontEndDataOut->skinnedCacheVb->used > frontEndDataOut->skinnedCacheVb->total)
    {
        if (offset <= frontEndDataOut->skinnedCacheVb->total)
            InterlockedExchange((long *)&frontEndDataOut->skinnedCacheVb->used, offset);
        if (skinCacheWarnFrame != frontEndDataOut->frameCount)
        {
            skinCacheWarnFrame = frontEndDataOut->frameCount;
            ri.Printf(2, "R_MAX_SKINNED_CACHE_VERTICES exceeded - not drawing surface\n");
        }
        return -1;
    }
    return offset;
}

void R_DObjGetSurfMaterials(DObj *obj, char lod, MaterialHandle *matHandleArray)
{
    char lods[8];
    int partBits[4];
    DSurface_s surfaces[64];
    int numModels;
    int i;
    int surfaceCount;
    int surfaceIndex;
    int modelIndex;
    const trXSkin_t *skins;

    numModels = ri.DObjGetNumModels(obj);
    for (i = 0; i < numModels; ++i)
        lods[i] = lod;
    surfaceCount = ri.DObjGetSurfaceList(obj, surfaces, partBits, lods);
    for (surfaceIndex = 0; surfaceIndex < surfaceCount; ++surfaceIndex)
    {
        modelIndex = surfaces[surfaceIndex].modelIndex;
        skins = ri.XModelGetSkins(ri.DObjGetModel(obj, modelIndex));
        if (!skins)
            matHandleArray[surfaceIndex] = 0;
        else
            matHandleArray[surfaceIndex] = ((MaterialHandle **)skins)[lods[modelIndex]][surfaces[surfaceIndex].subMatIndex];
    }
}

void R_DObjReplaceMaterial(DObj *obj, char lod, int surfaceIndex, MaterialHandle material)
{
    char lods[8];
    int partBits[4];
    DSurface_s surfaces[64];
    int numModels;
    int i;
    int modelIndex;
    const trXSkin_t *skins;

    numModels = ri.DObjGetNumModels(obj);
    for (i = 0; i < numModels; ++i)
        lods[i] = lod;
    ri.DObjGetSurfaceList(obj, surfaces, partBits, lods);
    modelIndex = surfaces[surfaceIndex].modelIndex;
    skins = ri.XModelGetSkins(ri.DObjGetModel(obj, modelIndex));
    if (skins)
        ((MaterialHandle **)skins)[lods[modelIndex]][surfaces[surfaceIndex].subMatIndex] = material;
}

void R_ModelBounds(const vec_t *bounds, vec_t *mins, vec_t *maxs)
{
    if (bounds)
    {
        mins[0] = bounds[0];
        mins[1] = bounds[1];
        mins[2] = bounds[2];
        maxs[0] = bounds[3];
        maxs[1] = bounds[4];
        maxs[2] = bounds[5];
    }
    else
    {
        mins[0] = 0.0f;
        mins[1] = 0.0f;
        mins[2] = 0.0f;
        maxs[0] = 0.0f;
        maxs[1] = 0.0f;
        maxs[2] = 0.0f;
    }
}

GfxBrushModel *R_RegisterInlineModel(int index)
{
    return &rgp.world->models[index];
}

void R_SetIgnorePrecacheErrors(int ignore)
{
    rg.ignorePrecacheErrors = ignore != 0;
}

bool R_GetIgnorePrecacheErrors()
{
    return rg.ignorePrecacheErrors != 0;
}

void XModelUnoptimize(XModel *model);

static void R_ReleaseModel(XAssetHeader header, void *data)
{
    if (ri.XModelBad(header.model))
        return;
    XModelUnoptimize(header.model);
}

void R_ReleaseAllModels()
{
    ri.DB_EnumXAssets(1, R_ReleaseModel, 0, 1);
}

void R_AbortRenderCommands()
{
    if (!rg.registered)
        return;
    R_UnlockSkinnedCache();
    frontEndDataOut->commands.usedTotal = 0;
    frontEndDataOut->commands.usedCritical = 0;
    frontEndDataOut->commands.lastCmd = 0;
    if (!dx.tempSkinPos)
        return;
    ri.Z_VirtualDecommitInternal(dx.tempSkinBuf, dx.tempSkinPos);
    dx.tempSkinPos = 0;
}

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
void R_ConvertAnimMatToSkelMat(const DObjAnimMat *in, DObjSkelMat *out)
{
    float xx, xy, xz, xw, yy, yz, yw, zz, zw;
    float scaledQuat[3];

    VectorScale(in->quat, in->transWeight, scaledQuat);
    xx = scaledQuat[0] * in->quat[0];
    xy = scaledQuat[0] * in->quat[1];
    xz = scaledQuat[0] * in->quat[2];
    xw = scaledQuat[0] * in->quat[3];
    yy = scaledQuat[1] * in->quat[1];
    yz = scaledQuat[1] * in->quat[2];
    yw = scaledQuat[1] * in->quat[3];
    zz = scaledQuat[2] * in->quat[2];
    zw = scaledQuat[2] * in->quat[3];
    out->axis[0][3] = 0.0f;
    out->axis[1][3] = 0.0f;
    out->axis[2][3] = 0.0f;
    out->axis[0][0] = 1.0f - (zz + yy);
    out->axis[0][1] = xy + zw;
    out->axis[0][2] = xz - yw;
    out->axis[1][0] = xy - zw;
    out->axis[1][1] = 1.0f - (zz + xx);
    out->axis[1][2] = yz + xw;
    out->axis[2][0] = yw + xz;
    out->axis[2][1] = yz - xw;
    out->axis[2][2] = 1.0f - (yy + xx);
    out->origin[0] = in->trans[0];
    out->origin[1] = in->trans[1];
    out->origin[2] = in->trans[2];
    out->origin[3] = 1.0f;
}

// PINNED 1001ee70: four transformed rows; only translation adds origin.
void R_GetRigidTransform(const DObjSkelMat *bone, const float *origin,
    const vec3_t *axis, float scale, vec3_t *boneAxis)
{
    vec3_t scaledAxis[3];
    VectorScale(axis[0], scale, scaledAxis[0]);
    VectorScale(axis[1], scale, scaledAxis[1]);
    VectorScale(axis[2], scale, scaledAxis[2]);
    boneAxis[0][0] = bone->axis[0][0] * scaledAxis[0][0]
        + bone->axis[0][1] * scaledAxis[1][0] + bone->axis[0][2] * scaledAxis[2][0];
    boneAxis[0][1] = bone->axis[0][0] * scaledAxis[0][1]
        + bone->axis[0][1] * scaledAxis[1][1] + bone->axis[0][2] * scaledAxis[2][1];
    boneAxis[0][2] = bone->axis[0][0] * scaledAxis[0][2]
        + bone->axis[0][1] * scaledAxis[1][2] + bone->axis[0][2] * scaledAxis[2][2];
    boneAxis[1][0] = bone->axis[1][0] * scaledAxis[0][0]
        + bone->axis[1][1] * scaledAxis[1][0] + bone->axis[1][2] * scaledAxis[2][0];
    boneAxis[1][1] = bone->axis[1][0] * scaledAxis[0][1]
        + bone->axis[1][1] * scaledAxis[1][1] + bone->axis[1][2] * scaledAxis[2][1];
    boneAxis[1][2] = bone->axis[1][0] * scaledAxis[0][2]
        + bone->axis[1][1] * scaledAxis[1][2] + bone->axis[1][2] * scaledAxis[2][2];
    boneAxis[2][0] = bone->axis[2][0] * scaledAxis[0][0]
        + bone->axis[2][1] * scaledAxis[1][0] + bone->axis[2][2] * scaledAxis[2][0];
    boneAxis[2][1] = bone->axis[2][0] * scaledAxis[0][1]
        + bone->axis[2][1] * scaledAxis[1][1] + bone->axis[2][2] * scaledAxis[2][1];
    boneAxis[2][2] = bone->axis[2][0] * scaledAxis[0][2]
        + bone->axis[2][1] * scaledAxis[1][2] + bone->axis[2][2] * scaledAxis[2][2];
    boneAxis[3][0] = bone->origin[0] * scaledAxis[0][0]
        + bone->origin[1] * scaledAxis[1][0] + bone->origin[2] * scaledAxis[2][0] + origin[0];
    boneAxis[3][1] = bone->origin[0] * scaledAxis[0][1]
        + bone->origin[1] * scaledAxis[1][1] + bone->origin[2] * scaledAxis[2][1] + origin[1];
    boneAxis[3][2] = bone->origin[0] * scaledAxis[0][2]
        + bone->origin[1] * scaledAxis[1][2] + bone->origin[2] * scaledAxis[2][2] + origin[2];
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
void XModelOptimize(XModel *model);
extern const dvar_t *r_optimizeXModels;

static void R_OptimizeModel(XAssetHeader header, void *data)
{
    if (ri.XModelBad(header.model))
        return;
    XModelOptimize(header.model);
}

void R_FinishLoadingModels()
{
    if (!r_optimizeXModels->current.integer)
        return;
    ri.DB_EnumXAssets(1, R_OptimizeModel, 0, 1);
}

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

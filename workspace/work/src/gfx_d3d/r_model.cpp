// Model registration, bounds, skinning and skinned-cache helpers.
// The decompile's float-array __m128 is not the compiler's SIMD type.
#define __m128 CoD2DecompileVector4
#include "gfx.h"
#undef __m128
#include <xmmintrin.h>
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

// PINNED 100030d9/10003128 call this body out of line.
__declspec(noinline) XModel *R_RegisterModel(const char *name)
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

// PC 1.0 model bounds/debug cohort, 1001d9f0--100201a3.
extern "C" __declspec(dllimport) long __stdcall InterlockedCompareExchange(long volatile *, long, long);
extern const dvar_t *developer;
float R_GetModelLodDistance(const float *origin, float scale);
void ConvertQuatToMat(const DObjAnimMat *mat, vec3_t axis[3]);
void TransformVectorByAnimMat(const float *in, const DObjAnimMat *mat, float *out);
void TransformBounds(const vec3_t bounds[2], const vec3_t origin, const vec3_t axis[3], vec3_t out[2]);
void R_AddDebugLine(DebugGlobals *debug, const float *start, const float *end, const float *color);

typedef char model_bounds_layout[(offsetof(GfxEntity, origin) == 0x3c
    && offsetof(GfxSceneEntity, cullState) == 0xc
    && offsetof(GfxSceneEntity, curMins) == 0x14
    && offsetof(GfxBackEndData, debugGlobals) == 0x249d18
    && sizeof(DObjAnimMat) == 32 && sizeof(DSurface_s) == 4) ? 1 : -1];

// PINNED ri+0x22c: pose context, DObj, four part-bit words.
static void R_CalcSceneEntityPose(const GfxSceneEntity *sceneEnt, const DObj *obj, int *partBits)
{
    if (sceneEnt->cent)
        ((void (*)(const centity_s *, const DObj *, int *))ri.slot139)(sceneEnt->cent, obj, partBits);
}

static int R_GetSurfaceData(const GfxEntity *ent, const DObj *obj,
    DSurface_s *surfaces, int *partBits, char *lods)
{
    int modelCount = ri.DObjGetNumModels(obj);
    float distance = R_GetModelLodDistance(ent->origin, ent->scale);
    for (int index = 0; index < modelCount; ++index)
        lods[index] = (char)ri.DObjGetLodForDist(obj, index, distance);
    return ri.DObjGetSurfaceList(obj, surfaces, partBits, lods);
}

// PINNED 10190278: twelve consecutive endpoint pairs.
static const int boxVerts[24][3] = {
    {0,0,0},{1,0,0}, {0,0,0},{0,1,0},
    {1,1,0},{1,0,0}, {1,1,0},{0,1,0},
    {0,0,1},{1,0,1}, {0,0,1},{0,1,1},
    {1,1,1},{1,0,1}, {1,1,1},{0,1,1},
    {0,0,0},{0,0,1}, {1,0,0},{1,0,1},
    {0,1,0},{0,1,1}, {1,1,0},{1,1,1},
};

static void R_XModelDebugBoxes(const DObj *obj, const GfxEntity *ent,
    const GfxSceneEntity *sceneEnt)
{
    DSurface_s surfaces[64];
    int partBits[4];
    char lods[8];
    XBoneInfo *boneInfo[128];
    R_GetSurfaceData(ent, obj, surfaces, partBits, lods);
    R_CalcSceneEntityPose(sceneEnt, obj, partBits);
    int boneCount = ri.DObjNumBones(obj);
    ri.DObjGetBoneInfo(obj, boneInfo);
    const DObjAnimMat *boneMatrix = ri.DObjGetRotTransArray(obj);
    if (!boneMatrix)
        return;
    const float color[4] = {1.0f, 1.0f, 1.0f, 0.0f};
    for (int bone = 0; bone < boneCount; ++bone)
    {
        if (!(partBits[bone >> 5] & (1u << (bone & 31))))
            continue;
        const vec3_t *bounds = boneInfo[bone]->bounds;
        const int (*edge)[3] = boxVerts;
        for (int count = 12; count; --count)
        {
            vec3_t corner, point, start, end;
            corner[0] = bounds[edge[0][0]][0];
            corner[1] = bounds[edge[0][1]][1];
            corner[2] = bounds[edge[0][2]][2];
            TransformVectorByAnimMat(corner, &boneMatrix[bone], point);
            MatrixTransformVector(point, ent->axis, start);
            VectorAdd(start, ent->origin, start);
            ++edge;
            corner[0] = bounds[edge[0][0]][0];
            corner[1] = bounds[edge[0][1]][1];
            corner[2] = bounds[edge[0][2]][2];
            TransformVectorByAnimMat(corner, &boneMatrix[bone], point);
            MatrixTransformVector(point, ent->axis, end);
            VectorAdd(end, ent->origin, end);
            ++edge;
            R_AddDebugLine(&frontEndDataOut->debugGlobals, start, end, color);
        }
    }
}

static void R_XModelDebugAxes(const DObj *obj, const GfxEntity *ent,
    const GfxSceneEntity *sceneEnt)
{
    DSurface_s surfaces[64];
    int partBits[4];
    char lods[8];
    R_GetSurfaceData(ent, obj, surfaces, partBits, lods);
    R_CalcSceneEntityPose(sceneEnt, obj, partBits);
    vec3_t translation[3] = {{6,0,0},{0,6,0},{0,0,6}};
    int boneCount = ri.DObjNumBones(obj);
    const DObjAnimMat *boneMatrix = ri.DObjGetRotTransArray(obj);
    if (!boneMatrix)
        return;
    for (int bone = 0; bone < boneCount; ++bone)
    {
        if (!(partBits[bone >> 5] & (1u << (bone & 31))))
            continue;
        for (int axis = 0; axis < 3; ++axis)
        {
            float color[4] = {0,0,0,0};
            vec3_t point, start, end;
            color[axis] = 1.0f;
            TransformVectorByAnimMat(vec3_origin, &boneMatrix[bone], point);
            MatrixTransformVector(point, ent->axis, start);
            VectorAdd(start, ent->origin, start);
            TransformVectorByAnimMat(translation[axis], &boneMatrix[bone], point);
            MatrixTransformVector(point, ent->axis, end);
            VectorAdd(end, ent->origin, end);
            R_AddDebugLine(&frontEndDataOut->debugGlobals, start, end, color);
        }
    }
}

static void R_SetEntityOriginBounds(GfxSceneEntity *sceneEnt, const float *origin)
{
    VectorCopy(origin, sceneEnt->curMins);
    VectorCopy(origin, sceneEnt->curMaxs);
}

// Retail 1001fdd0; no historical helper name is asserted.
static void R_ExpandBoneBounds(const vec3_t *bounds, const float *origin,
    const vec3_t *axis, vec3_t *out)
{
    for (int index = 0; index < 3; ++index)
    {
        int offset = I_sel(FloatAsInt(axis[0][index]), 0, 12);
        float lower = ((const float *)((const byte *)bounds + offset))[0] * axis[0][index] + origin[index];
        float upper = ((const float *)((const byte *)bounds - offset))[3] * axis[0][index] + origin[index];
        offset = I_sel(FloatAsInt(axis[1][index]), 0, 12);
        lower += ((const float *)((const byte *)bounds + offset))[1] * axis[1][index];
        upper += ((const float *)((const byte *)bounds - offset))[4] * axis[1][index];
        offset = I_sel(FloatAsInt(axis[2][index]), 0, 12);
        lower += ((const float *)((const byte *)bounds + offset))[2] * axis[2][index];
        upper += ((const float *)((const byte *)bounds - offset))[5] * axis[2][index];
        if (out[0][index] > lower) out[0][index] = lower;
        if (upper > out[1][index]) out[1][index] = upper;
    }
}

void R_UpdateXModelBounds(GfxSceneEntity *sceneEnt, const GfxEntity *ent)
{
    DSurface_s surfaces[64];
    int partBits[4];
    char lods[8];
    XBoneInfo *boneInfo[128];
    vec3_t bounds[2], axis[3];
    if (sceneEnt->cullState >= 2)
        return;
    if (InterlockedCompareExchange((long volatile *)&sceneEnt->cullState, 1, 0))
    {
        while (sceneEnt->cullState < 2) {}
        return;
    }
    const DObj *obj;
    if (ent->reType == 0)
        obj = sceneEnt->u.obj;
    else
    {
        obj = rg.modelDObj;
        ri.DObjSetModel((DObj *)obj, sceneEnt->u.model);
    }
    if (ri.DObjBad(obj))
    {
        if (developer->current.integer)
        {
            R_XModelDebugBoxes(obj, ent, sceneEnt);
            R_XModelDebugAxes(obj, ent, sceneEnt);
        }
        R_SetEntityOriginBounds(sceneEnt, ent->origin);
        sceneEnt->cullState = 2;
        return;
    }
    if (!R_GetSurfaceData(ent, obj, surfaces, partBits, lods))
    {
        R_SetEntityOriginBounds(sceneEnt, ent->origin);
        sceneEnt->cullState = 2;
        return;
    }
    R_CalcSceneEntityPose(sceneEnt, obj, partBits);
    const DObjAnimMat *boneMatrix = ri.DObjGetRotTransArray(obj);
    if (!boneMatrix)
    {
        R_SetEntityOriginBounds(sceneEnt, ent->origin);
        sceneEnt->cullState = 2;
        return;
    }
    ClearBounds(bounds[0], bounds[1]);
    ri.DObjGetBoneInfo(obj, boneInfo);
    int boneCount = ri.DObjNumBones(obj);
    for (int bone = 0; bone < boneCount; ++bone)
    {
        if (partBits[bone >> 5] & (1u << (bone & 31)))
        {
            ConvertQuatToMat(&boneMatrix[bone], axis);
            R_ExpandBoneBounds(boneInfo[bone]->bounds, boneMatrix[bone].trans, axis, bounds);
        }
    }
    TransformBounds(bounds, ent->origin, ent->axis, (vec3_t *)&sceneEnt->curMins);
    sceneEnt->cullState = 2;
}

// PINNED PC rigid vertex transforms, 1001e260/1001e3a0/1001ed70/1001ee00.
typedef char rigid_vertex_layout[(sizeof(XVertexInfo) == 64
    && sizeof(GfxVertex) == 64 && sizeof(GfxVertexDx7) == 36
    && offsetof(XSurface, verts) == 12 && offsetof(XSurface, vertCount) == 2) ? 1 : -1];
typedef char skinning_layout[(sizeof(XBlendInfo) == 16 && offsetof(XBlendInfo, boneOffset) == 12
    && offsetof(XBlendInfo, boneWeight) == 14 && sizeof(GfxModelSkinnedSurface) == 16
    && offsetof(GfxModelSkinnedSurface, skinnedCachedOffset) == 8
    && offsetof(GfxModelSkinnedSurface, skinnedVert) == 12
    && offsetof(SkinRigidXModelCmd, mat) == 12 && sizeof(DObjSkelMat) == 64
    && offsetof(GfxEntity, axis) == 20 && offsetof(GfxEntity, scale) == 56
    && offsetof(GfxEntity, origin) == 60) ? 1 : -1];

// Helper names, formal argument order and TU grouping are provisional.
void R_TransformSkelVector(const DObjSkelMat *bone, const float *in, float *out);
void R_TransformSkelPosition(const DObjSkelMat *bone, const float *in, float *out);
static void R_TransformRigidVertex(const DObjSkelMat *bone, const float *normal,
    const float *binormal, const float *position, const float *tangent, GfxVertex *out)
{
    R_TransformSkelVector(bone, normal, out->normal);
    R_TransformSkelVector(bone, binormal, out->binormal);
    R_TransformSkelVector(bone, tangent, out->tangent);
    R_TransformSkelPosition(bone, position, out->xyzw);
    out->xyzw[3] = 1.0f;
}

static void R_TransformRigidVertexDx7(const DObjSkelMat *bone, const float *position,
    const float *normal, GfxVertexDx7 *out)
{
    R_TransformSkelVector(bone, normal, out->normal);
    R_TransformSkelPosition(bone, position, out->xyz);
}

void R_SkinXSurfaceRigid(const XSurface *surface, const DObjSkelMat *bones,
    int boneOffset, GfxVertex *out)
{
    const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + boneOffset);
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    while (remaining > 0)
    {
        __declspec(align(16)) GfxVertex vertex;
        vertex.color = *(const GfxColor *)in->color;
        vertex.texCoord[0] = in->texCoordX;
        vertex.texCoord[1] = in->texCoordY;
        R_TransformRigidVertex(bone, in->normal, in->binormal, in->offset, in->tangent, &vertex);
        ++in;
        --remaining;
        memcpy(out, &vertex, sizeof(vertex));
        ++out;
    }
}

void R_SkinXSurfaceRigidDx7(const XSurface *surface, const DObjSkelMat *bones,
    int boneOffset, GfxVertexDx7 *out)
{
    const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + boneOffset);
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    while (remaining > 0)
    {
        GfxVertexDx7 vertex;
        vertex.color = *(const GfxColor *)in->color;
        vertex.texCoord[0] = in->texCoordX;
        vertex.texCoord[1] = in->texCoordY;
        R_TransformRigidVertexDx7(bone, in->offset, in->normal, &vertex);
        ++in;
        --remaining;
        memcpy(out, &vertex, sizeof(vertex));
        ++out;
    }
}

// PINNED 1001e920/344 and 1001ec20/330: only position is blended.
static __forceinline void R_BlendSkinPosition(const float *in,
    const DObjSkelMat *bone, float weight, float *out)
{
    out[0] += (bone->axis[2][0] * in[2] + bone->axis[1][0] * in[1]
        + in[0] * bone->axis[0][0] + bone->origin[0]) * weight;
    out[1] += (bone->axis[2][1] * in[2] + bone->axis[1][1] * in[1]
        + bone->axis[0][1] * in[0] + bone->origin[1]) * weight;
    out[2] += (bone->axis[2][2] * in[2] + bone->axis[1][2] * in[1]
        + bone->axis[0][2] * in[0] + bone->origin[2]) * weight;
}

static void R_SkinXSurfaceBlended(const XSurface *surface, const DObjSkelMat *bones, GfxVertex *out)
{
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    while (remaining > 0)
    {
        __declspec(align(16)) GfxVertex vertex;
        const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + in->boneOffset);
        R_TransformRigidVertex(bone, in->normal, in->binormal, in->offset, in->tangent, &vertex);
        vertex.color = *(const GfxColor *)in->color;
        vertex.texCoord[0] = in->texCoordX;
        vertex.texCoord[1] = in->texCoordY;
        unsigned int weights = in->numWeights;
        if (weights)
        {
            float weight = (float)in->boneWeight * (1.0f / 256.0f);
            vertex.xyzw[0] *= weight;
            vertex.xyzw[1] *= weight;
            vertex.xyzw[2] *= weight;
            ++in;
            do
            {
                const XBlendInfo *blend = (const XBlendInfo *)in;
                bone = (const DObjSkelMat *)((const byte *)bones + blend->boneOffset);
                weight = (float)blend->boneWeight * (1.0f / 65536.0f);
                R_BlendSkinPosition(blend->offset, bone, weight, vertex.xyzw);
                in = (const XVertexInfo *)(blend + 1);
            } while (--weights);
        }
        else
            ++in;
        --remaining;
        memcpy(out++, &vertex, sizeof(vertex));
    }
}

static void R_SkinXSurfaceBlendedDx7(const XSurface *surface, const DObjSkelMat *bones, GfxVertexDx7 *out)
{
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    while (remaining > 0)
    {
        GfxVertexDx7 vertex;
        const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + in->boneOffset);
        R_TransformRigidVertexDx7(bone, in->offset, in->normal, &vertex);
        vertex.color = *(const GfxColor *)in->color;
        vertex.texCoord[0] = in->texCoordX;
        vertex.texCoord[1] = in->texCoordY;
        unsigned int weights = in->numWeights;
        if (weights)
        {
            float weight = (float)in->boneWeight * (1.0f / 256.0f);
            vertex.xyz[0] *= weight;
            vertex.xyz[1] *= weight;
            vertex.xyz[2] *= weight;
            ++in;
            do
            {
                const XBlendInfo *blend = (const XBlendInfo *)in;
                bone = (const DObjSkelMat *)((const byte *)bones + blend->boneOffset);
                weight = (float)blend->boneWeight * (1.0f / 65536.0f);
                R_BlendSkinPosition(blend->offset, bone, weight, vertex.xyz);
                in = (const XVertexInfo *)(blend + 1);
            } while (--weights);
        }
        else
            ++in;
        --remaining;
        memcpy(out++, &vertex, sizeof(vertex));
    }
}

static __forceinline __m128 R_SkinVectorSse(const __m128 &in, const DObjSkelMat *bone)
{
    return _mm_add_ps(_mm_add_ps(_mm_mul_ps(_mm_load_ps(bone->axis[0]), _mm_shuffle_ps(in, in, 0)),
        _mm_mul_ps(_mm_load_ps(bone->axis[1]), _mm_shuffle_ps(in, in, 0x55))),
        _mm_mul_ps(_mm_load_ps(bone->axis[2]), _mm_shuffle_ps(in, in, 0xaa)));
}

static __forceinline __m128 R_SkinPositionSse(const __m128 &in, const DObjSkelMat *bone)
{
    return _mm_add_ps(_mm_add_ps(_mm_mul_ps(_mm_load_ps(bone->axis[0]), _mm_shuffle_ps(in, in, 0)),
        _mm_mul_ps(_mm_load_ps(bone->axis[1]), _mm_shuffle_ps(in, in, 0x55))),
        _mm_add_ps(_mm_mul_ps(_mm_load_ps(bone->axis[2]), _mm_shuffle_ps(in, in, 0xaa)),
            _mm_load_ps(bone->origin)));
}

// PINNED 1001e6e0/567: aligned loads, position weights and four streaming stores.
static void R_SkinXSurfaceBlendedSse(const XSurface *surface, const DObjSkelMat *bones, GfxVertex *out)
{
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    _mm_empty();
    while (remaining > 0)
    {
        const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + in->boneOffset);
        __m128 normalIn = _mm_load_ps(in->normal);
        __m128 binormalIn = _mm_load_ps(in->binormal);
        __m128 tangentIn = _mm_load_ps(in->tangent);
        __m128 position = R_SkinPositionSse(_mm_load_ps(in->offset), bone);
        __m128 normal = R_SkinVectorSse(normalIn, bone);
        _mm_prefetch((const char *)in + 128, _MM_HINT_NTA);
        __m128 binormal = R_SkinVectorSse(binormalIn, bone);
        __m128 tangent = R_SkinVectorSse(tangentIn, bone);
        __m128 coords = _mm_unpackhi_ps(binormalIn, tangentIn);
        unsigned int weights = in->numWeights;
        if (weights)
        {
            position = _mm_mul_ps(position, _mm_set1_ps((float)in->boneWeight * (1.0f / 256.0f)));
            ++in;
            do
            {
                const XBlendInfo *blend = (const XBlendInfo *)in;
                bone = (const DObjSkelMat *)((const byte *)bones + blend->boneOffset);
                __m128 transformed = R_SkinPositionSse(_mm_load_ps(blend->offset), bone);
                __m128 weight = _mm_set1_ps((float)blend->boneWeight * (1.0f / 65536.0f));
                position = _mm_add_ps(position, _mm_mul_ps(weight, transformed));
                in = (const XVertexInfo *)(blend + 1);
            } while (--weights);
        }
        else
            ++in;
        _mm_stream_ps(out->xyzw, position);
        __m128 normalColor = _mm_shuffle_ps(normal, normalIn, 0xfa);
        normalColor = _mm_shuffle_ps(normal, normalColor, 0xd4);
        _mm_stream_ps(out->normal, normalColor);
        _mm_stream_ps(out->texCoord, _mm_shuffle_ps(coords, binormal, 0x4e));
        __m128 tail = _mm_shuffle_ps(binormal, tangent, 0x22);
        _mm_stream_ps(&out->binormal[2], _mm_shuffle_ps(tail, tangent, 0x9c));
        ++out;
        --remaining;
    }
}

// PINNED 1001ea80/408: the DX7 output is a 36-byte copy, not a streaming store.
static void R_SkinXSurfaceBlendedDx7Sse(const XSurface *surface, const DObjSkelMat *bones, GfxVertexDx7 *out)
{
    const XVertexInfo *in = &surface->verts->v;
    int remaining = surface->vertCount;
    while (remaining > 0)
    {
        const DObjSkelMat *bone = (const DObjSkelMat *)((const byte *)bones + in->boneOffset);
        __m128 position = R_SkinPositionSse(_mm_load_ps(in->offset), bone);
        __m128 normal = R_SkinVectorSse(_mm_load_ps(in->normal), bone);
        const XVertexInfo *original = in;
        unsigned int weights = in->numWeights;
        if (weights)
        {
            position = _mm_mul_ps(position, _mm_set1_ps((float)in->boneWeight * (1.0f / 256.0f)));
            ++in;
            do
            {
                const XBlendInfo *blend = (const XBlendInfo *)in;
                bone = (const DObjSkelMat *)((const byte *)bones + blend->boneOffset);
                __m128 transformed = R_SkinPositionSse(_mm_load_ps(blend->offset), bone);
                __m128 weight = _mm_set1_ps((float)blend->boneWeight * (1.0f / 65536.0f));
                position = _mm_add_ps(position, _mm_mul_ps(weight, transformed));
                in = (const XVertexInfo *)(blend + 1);
            } while (--weights);
        }
        else
            ++in;
        __declspec(align(16)) GfxVertexDx7 vertex;
        _mm_store_ps(vertex.xyz, position);
        _mm_storeu_ps(vertex.normal, normal);
        vertex.color = *(const GfxColor *)original->color;
        vertex.texCoord[0] = original->texCoordX;
        vertex.texCoord[1] = original->texCoordY;
        memcpy(out++, &vertex, sizeof(vertex));
        --remaining;
    }
}

extern const dvar_t *sys_SSE;
extern const dvar_t *r_sse_skinning;
extern DxGlobals dx;

// PINNED 1001f030/195: cached byte offsets and per-surface rigid/blended routing.
static __declspec(noinline) void R_SkinXSurfaceSkinned(GfxModelSkinnedSurface *modelSurface, const DObjSkelMat *bones)
{
    void *out;
    if (modelSurface->skinnedCachedOffset >= 0)
        out = dx.skinnedCacheLockAddr + modelSurface->skinnedCachedOffset;
    else
        out = modelSurface->skinnedVert.variant;
    const XSurface *surface = modelSurface->surf.xsurf;
    int boneOffset = surface->boneOffset;
    if (r_rendererInUse->current.integer == 2)
    {
        if (boneOffset == -1)
        {
            if (sys_SSE->current.enabled && r_sse_skinning->current.enabled)
                R_SkinXSurfaceBlendedDx7Sse(surface, bones, (GfxVertexDx7 *)out);
            else
                R_SkinXSurfaceBlendedDx7(surface, bones, (GfxVertexDx7 *)out);
        }
        else
            R_SkinXSurfaceRigidDx7(surface, bones, boneOffset, (GfxVertexDx7 *)out);
    }
    else
    {
        if (boneOffset == -1)
        {
            if (sys_SSE->current.enabled && r_sse_skinning->current.enabled)
                R_SkinXSurfaceBlendedSse(surface, bones, (GfxVertex *)out);
            else
                R_SkinXSurfaceBlended(surface, bones, (GfxVertex *)out);
        }
        else
            R_SkinXSurfaceRigid(surface, bones, boneOffset, (GfxVertex *)out);
    }
}

void R_ConvertAnimMatToSkelMat(const DObjAnimMat *in, DObjSkelMat *out);
void R_GetRigidTransform(const DObjSkelMat *bone, const float *origin, const vec3_t *axis, float scale, vec3_t *out);

// PINNED 1001f480/65; the helper name is descriptive.
byte *R_SkinXModelSurface(const DObjSkelMat *bone, const GfxEntity *entity, byte *cursor)
{
    GfxModelSurface *surface = (GfxModelSurface *)cursor;
    if (surface->surfType != 5)
    {
        if (surface->surfType == 4)
        {
            GfxModelRigidSurface *rigid = (GfxModelRigidSurface *)cursor;
            R_GetRigidTransform((const DObjSkelMat *)((const byte *)bone + surface->xsurf->boneOffset),
                entity->origin, entity->axis, entity->scale, rigid->boneAxis);
            return cursor + 56;
        }
        R_SkinXSurfaceSkinned((GfxModelSkinnedSurface *)cursor, bone);
    }
    return cursor + 16;
}

// PINNED 1001f520/135: one aligned pose, then variable-size surface records.
void R_SkinRigidXModelCmd(SkinRigidXModelCmd *cmd)
{
    byte boneStorage[sizeof(DObjSkelMat) + 16];
    DObjSkelMat *bone = (DObjSkelMat *)(((size_t)boneStorage + 15) & ~(size_t)15);
    R_ConvertAnimMatToSkelMat(&cmd->mat, bone);
    byte *cursor = (byte *)cmd->surfs;
    for (int index = 0; index < cmd->surfCount; ++index)
        cursor = R_SkinXModelSurface(bone, cmd->e, cursor);
}

typedef char skin_command_layout[(sizeof(SkinBuffers) == 40960
    && offsetof(SkinXModelCmd, mat) == 8 && offsetof(SkinXModelCmd, surfacePartBits) == 12
    && offsetof(SkinXModelCmd, surfCount) == 28 && offsetof(SkinXModelCmd, boneCount) == 29
    && offsetof(SkinXModelCmd, matOffset) == 30) ? 1 : -1];

// SUPPORTED single context from the reference; the PC command runner uses context zero.
SkinBuffers g_skinBuffers[1];

// PINNED 1001f5b0/84: convert only the bones selected by the surface bitset.
static __declspec(noinline) void R_ConvertSurfaceBones(const SkinXModelCmd *cmd, DObjSkelMat *out)
{
    int count = cmd->boneCount;
    const DObjAnimMat *in = cmd->mat;
    for (int index = 0; index < count; ++index, ++in, ++out)
    {
        if (cmd->surfacePartBits[index >> 5] & (1u << (index & 31)))
            R_ConvertAnimMatToSkelMat(in, out);
    }
}

// PINNED 1001f610/152: offsets select a skeleton base before per-surface routing.
void R_SkinXModelCmd(SkinXModelCmd *cmd, int context)
{
    DObjSkelMat *bones = g_skinBuffers[context].matArrayBuf;
    R_ConvertSurfaceBones(cmd, bones);
    byte *cursor = (byte *)cmd->surfs;
    for (int index = 0; index < cmd->surfCount; ++index)
    {
        DObjSkelMat *bone = bones + cmd->matOffset[index];
        GfxModelSurface *surface = (GfxModelSurface *)cursor;
        GfxEntity *entity = cmd->e;
        if (surface->surfType == 3)
        {
            R_SkinXSurfaceSkinned((GfxModelSkinnedSurface *)cursor, bone);
            cursor += 16;
        }
        else if (surface->surfType == 5)
            cursor += 16;
        else
        {
            GfxModelRigidSurface *rigid = (GfxModelRigidSurface *)cursor;
            R_GetRigidTransform((const DObjSkelMat *)((const byte *)bone + surface->xsurf->boneOffset),
                entity->origin, entity->axis, entity->scale, rigid->boneAxis);
            cursor += 56;
        }
    }
}

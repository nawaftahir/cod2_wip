// PC 1.0 model bounds/debug cohort, 1001d9f0--100201a3.
#define DObjAnimMat_s DObjAnimMat
#include "gfx.h"
#undef DObjAnimMat_s

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

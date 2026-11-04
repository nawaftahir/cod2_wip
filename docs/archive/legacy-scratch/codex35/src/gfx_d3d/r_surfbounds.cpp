#include "common_types.h"
#include "imports.h"
#include <universal/com_math.h>
extern GfxScene scene;
void TransformBounds(const vec3_t bounds[2], const vec3_t origin, const vec3_t axis[3], vec3_t out[2]);

extern bool R_IsBoundsOutsideViewNoStack(DpvsPlane *planes, int planeCount, const float *bounds);
extern int R_FilterEntityIntoCells_r(mnode_t *node, int entIndex, const vec_t *mins, const vec_t *maxs);
extern void R_AddBModelSurfaces(GfxSceneEntity *sceneEnt, int entIndex);

// PINNED 101a5a8c: eight surface-type callbacks, with four live entries.
const vec_t *R_BoundsForSurf_ModelInst(const GfxDrawSurf *drawSurf, int entIndex);
const vec_t *R_BoundsForSurf_StaticModelCached(const GfxDrawSurf *drawSurf, int entIndex);
const vec_t *R_BoundsForSurf_Triangles(const GfxDrawSurf *drawSurf, int entIndex);
const vec_t *(*R_BoundsForDrawSurfTable[8])(const GfxDrawSurf *, int) = {
    NULL, NULL, NULL,
    R_BoundsForSurf_ModelInst,
    R_BoundsForSurf_ModelInst,
    R_BoundsForSurf_StaticModelCached,
    R_BoundsForSurf_Triangles,
    NULL,
};
static vec3_t surfBoundsGlob[2];

extern r_global_permanent_t rgp;

/* Target 0x100088c0; descriptive name, historical symbol unconfirmed. */
static void R_TransformBoundsCorners(const GfxEntity *entity, vec3_t mins, vec3_t maxs, const vec3_t *bounds)
{
    mins[0] = 131072.0f;
    mins[1] = 131072.0f;
    mins[2] = 131072.0f;
    maxs[0] = -131072.0f;
    maxs[1] = -131072.0f;
    maxs[2] = -131072.0f;

#define TEST_BOUNDS_CORNER(x, y, z) \
    do { \
        vec3_t corner; \
        vec3_t transformed; \
        corner[0] = bounds[x][0]; \
        corner[1] = bounds[y][1]; \
        corner[2] = bounds[z][2]; \
        VectorCopy(entity->origin, transformed); \
        VectorMA(transformed, corner[0], entity->axis[0], transformed); \
        VectorMA(transformed, corner[1], entity->axis[1], transformed); \
        VectorMA(transformed, corner[2], entity->axis[2], transformed); \
        if (transformed[0] < mins[0]) mins[0] = transformed[0]; \
        if (transformed[0] > maxs[0]) maxs[0] = transformed[0]; \
        if (transformed[1] < mins[1]) mins[1] = transformed[1]; \
        if (transformed[1] > maxs[1]) maxs[1] = transformed[1]; \
        if (transformed[2] < mins[2]) mins[2] = transformed[2]; \
        if (transformed[2] > maxs[2]) maxs[2] = transformed[2]; \
    } while (0)

    TEST_BOUNDS_CORNER(0, 0, 0);
    TEST_BOUNDS_CORNER(1, 0, 0);
    TEST_BOUNDS_CORNER(0, 1, 0);
    TEST_BOUNDS_CORNER(1, 1, 0);
    TEST_BOUNDS_CORNER(0, 0, 1);
    TEST_BOUNDS_CORNER(1, 0, 1);
    TEST_BOUNDS_CORNER(0, 1, 1);
    TEST_BOUNDS_CORNER(1, 1, 1);

#undef TEST_BOUNDS_CORNER
}

// PINNED 100091d0/117; descriptive name, historical symbol unconfirmed.
void R_CullBrushEntity(int entIndex, DpvsPlane *planes, int planeCount)
{
    GfxEntity *entity = &scene.def.entities[entIndex];
    GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    vec3_t mins, maxs;
    R_TransformBoundsCorners(entity, mins, maxs, sceneEnt->u.bmodel->bounds);
    if (!R_IsBoundsOutsideViewNoStack(planes, planeCount, mins))
        if (R_FilterEntityIntoCells_r(rgp.world->nodes, entIndex, mins, maxs) == -1)
            R_AddBModelSurfaces(sceneEnt, entIndex);
}

const vec_t *R_BoundsForSurf_Triangles(const GfxDrawSurf *drawSurf, int entIndex)
{
    srfTriangles_t *tri = (srfTriangles_t *)drawSurf->surface;
    vec3_t *bounds = tri->bounds;
    if (entIndex >= 0x7fe)
        return (const vec_t *)bounds;

    GfxEntity *entity = &scene.def.entities[entIndex];
    TransformBounds(bounds, entity->origin, entity->axis, surfBoundsGlob);
    return (const vec_t *)surfBoundsGlob;
}

const vec_t *R_BoundsForSurf_ModelInst(const GfxDrawSurf *drawSurf, int entIndex)
{
    return scene.sceneEnts[entIndex].curMins;
}

const vec_t *R_BoundsForSurf_StaticModelCached(const GfxDrawSurf *drawSurf, int entIndex)
{
    GfxStaticModelCachedSurface *cached = (GfxStaticModelCachedSurface *)drawSurf->surface;
    int smodelIndex = cached->surface->smodelIndex;
    return rgp.world->smodelInsts[smodelIndex].mins;
}

const vec_t *R_BoundsForDrawSurf(const GfxDrawSurf *surf)
{
    int surfType = *surf->surface;
    const vec_t *(*boundsFunc)(const GfxDrawSurf *, int) = R_BoundsForDrawSurfTable[surfType];
    int entIndex;
    unsigned int sortVal;

    if (!boundsFunc)
        return 0;

    sortVal = surf->sort;
    if (sortVal & 0x80000000u)
        entIndex = sortVal >> 19;
    else
        entIndex = sortVal >> 4;
    entIndex &= 0xfff;
    if (entIndex >= 0x800)
        entIndex = 0x7fe;

    return boundsFunc(surf, entIndex);
}

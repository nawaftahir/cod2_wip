#include "common_types.h"
#include "imports.h"
#include <universal/com_math.h>
extern GfxScene scene;
extern r_global_permanent_t rgp;

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

const vec_t *R_BoundsForSurf_Triangles(const GfxDrawSurf *drawSurf, int entIndex)
{
    srfTriangles_t *tri = (srfTriangles_t *)drawSurf->surface;
    vec3_t *bounds = tri->bounds;
    if (entIndex >= 0x7fe)
        return (const vec_t *)bounds;

    GfxEntity *entity = &scene.def.entities[entIndex];
    GetRotatedBounds(bounds, entity->origin, entity->axis, surfBoundsGlob);
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

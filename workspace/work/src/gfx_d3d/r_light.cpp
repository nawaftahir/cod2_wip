// Light definition loading and registry.
#include "r_local.h"
#include "r_light.h"
#include "gfx.h"

GfxLightDef *R_LoadLightDef(const char *name);

// PINNED 101d7eb0: one count followed by64 definition pointers.
struct LightGlobals
{
    int count;
    GfxLightDef *defs[64];
};
static LightGlobals lightGlobals;
typedef char lightGlobalsLayoutCheck[(sizeof(LightGlobals) == 260 &&
    offsetof(LightGlobals, defs) == 4) ? 1 : -1];

// PINNED in 10013080: the definition pointers are not cleared here.
void R_ShutdownLightDefs()
{
    lightGlobals.count = 0;
}

// PINNED 10014c60/243: fallback is the registered default, not a missing-name alias.
GfxLightDef *R_RegisterLightDef(const char *name)
{
    for (;;)
    {
        for (int index = 0; index < lightGlobals.count; ++index)
            if (!_stricmp(name, lightGlobals.defs[index]->name))
                return lightGlobals.defs[index];
        if (lightGlobals.count == 64)
        {
            ri.Printf(0, "Loaded light defs:\n");
            for (int index = 0; index < lightGlobals.count; ++index)
                ri.Printf(0, "%s\n", lightGlobals.defs[index]->name);
            // PINNED original call omits the name argument required by its format.
            R_Error(ERR_DROP, "Can't load light def %s; %i unique light defs already loaded", lightGlobals.count);
        }
        GfxLightDef *definition = R_LoadLightDef(name);
        if (definition)
        {
            lightGlobals.defs[lightGlobals.count] = definition;
            ++lightGlobals.count;
            return definition;
        }
        if (!_stricmp(name, "light_dynamic"))
            R_Error(ERR_DROP, "Can't load the default light def '%s'", name);
        name = "light_dynamic";
    }
}

// Point-light scene gathering.
#pragma optimize("p", on)
extern const dvar_t *r_dlightLimit;
const vec_t *R_BoundsForDrawSurf(const GfxDrawSurf *surf);
float PointToBoxDistSq(const vec3_t point, const vec3_t mins, const vec3_t maxs);

// PINNED 10014d90/184: walk the original surfaces backwards and append hits.
void R_AddPointLightSurfaces(const vec_t *origin, float radius,
    const GfxDrawSurf *drawSurfs, int drawSurfCount)
{
    for (int i = drawSurfCount - 1; i >= 0; --i)
    {
        const GfxDrawSurf *surf = &drawSurfs[i];
        const vec_t *bounds = R_BoundsForDrawSurf(surf);
        if (bounds && PointToBoxDistSq(origin, bounds, bounds + 3) <= radius * radius)
        {
            scene.drawSurfs[scene.drawSurfCount] = *surf;
            ++scene.drawSurfCount;
            ++frontEndDataOut->drawSurfCount;
        }
    }
}

// PINNED 10014e50/212: ordered ties compare true, unordered values false.
static Bool R_PointLightRanksBefore(const GfxLight *a, const GfxLight *b)
{
    float radiusB = b->position[3] * b->position[3];
    float radiusA = a->position[3] * a->position[3];
    vec3_t deltaB, deltaA;
    VectorSubtract(rg.viewOrg, b->position, deltaB);
    float distB = deltaB[2] * deltaB[2] + deltaB[1] * deltaB[1] + deltaB[0] * deltaB[0];
    VectorSubtract(rg.viewOrg, a->position, deltaA);
    float distA = deltaA[2] * deltaA[2] + deltaA[1] * deltaA[1] + deltaA[0] * deltaA[0];
    return distB * radiusA <= distA * radiusB;
}

// PINNED 10014f30/131: partition the chosen prefix without sorting all lights.
static void R_SelectPointLights(const GfxLight **lights, int count, int wanted)
{
    for (;;)
    {
        const GfxLight *pivot = lights[0];
        int lo = 0;
        int hi = count;
        for (;;)
        {
            do { ++lo; } while (lo < hi && R_PointLightRanksBefore(pivot, lights[lo]));
            do { --hi; } while (hi >= lo && R_PointLightRanksBefore(lights[hi], pivot));
            if (hi < lo)
                break;
            const GfxLight *swap = lights[lo];
            lights[lo] = lights[hi];
            lights[hi] = swap;
        }
        if (lo == count)
        {
            const GfxLight *swap = lights[0];
            lights[0] = lights[hi];
            lights[hi] = swap;
            --lo;
        }
        if (lo == wanted)
            return;
        if (lo < wanted)
        {
            lights += lo;
            count -= lo;
            wanted -= lo;
        }
        else
            count = lo;
    }
}

// PINNED 10014fc0/193: only nonempty light partitions occupy output slots.
int R_GetPointLightPartitions(const GfxDrawSurf *drawSurfs, int drawSurfCount,
    PointLightPartition *partitions, int maxPartitions)
{
    const GfxLight *lights[32];
    int count = 0;
    for (int i = 0; i < scene.dlightCount; ++i)
        if (!scene.dlightCulled[i])
            lights[count++] = &scene.dlights[i];
    if (r_dlightLimit->current.integer < maxPartitions)
        maxPartitions = r_dlightLimit->current.integer;
    if (count > maxPartitions)
    {
        R_SelectPointLights(lights, count, maxPartitions);
        count = maxPartitions;
    }
    int partitionCount = 0;
    for (int i = 0; i < count; ++i)
    {
        PointLightPartition *partition = &partitions[partitionCount];
        partition->light = lights[i];
        partition->firstDrawSurf = scene.drawSurfCount;
        R_AddPointLightSurfaces(lights[i]->position, lights[i]->position[3], drawSurfs, drawSurfCount);
        partition->drawSurfCount = scene.drawSurfCount - partition->firstDrawSurf;
        if (partition->drawSurfCount)
            ++partitionCount;
    }
    return partitionCount;
}

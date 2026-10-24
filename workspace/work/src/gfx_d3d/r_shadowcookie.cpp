// PINNED PC candidate selection 10027d00/573; name supported by KisakCOD.
#include "gfx.h"

typedef char shadow_entity_size[(sizeof(GfxEntity) == 0x74) ? 1 : -1];
typedef char shadow_scene_entity_size[(sizeof(GfxSceneEntity) == 0x34) ? 1 : -1];
typedef char shadow_scene_entities[(offsetof(GfxScene, sceneEnts) == 0x5c4) ? 1 : -1];
typedef char shadow_origin_offset[(offsetof(GfxEntity, origin) == 0x3c) ? 1 : -1];

void R_PopulateCandidates(const float *viewOrigin, ShadowCandidate *candidates)
{
    int candidateIndex;
    for (candidateIndex = 0; candidateIndex != 24; ++candidateIndex)
    {
        candidates[candidateIndex].entIndex = -1;
        candidates[candidateIndex].weight = 100000000.0f;
    }
    ShadowCandidate *worstCandidate = candidates;
    for (int entIndex = 0; entIndex < scene.def.entityCount; ++entIndex)
    {
        const GfxEntity *ent = &scene.def.entities[entIndex];
        int shadowHint;
        vec3_t mins, maxs, size, sizeSquared, diff;
        if (ent->reType != 0 || (ent->renderFxFlags & 8))
            continue;
        shadowHint = ent->renderFxFlags & 0xe00;
        if (shadowHint == 0x200)
            continue;
        ri.DObjGetBounds(scene.sceneEnts[entIndex].u.obj, mins, maxs);
        VectorSubtract(maxs, mins, size);
        Vec3Mul(size, size, sizeSquared);
        int majorAxis = sizeSquared[1] > sizeSquared[0] ? 1 : 0;
        if (sizeSquared[2] > sizeSquared[majorAxis])
            majorAxis = 2;
        float majorAxisLength = size[majorAxis];
        if (majorAxisLength == 0.0f)
            continue;
        VectorSubtract(ent->origin, viewOrigin, diff);
        float entityDistance = VectorLength(diff);
        float entityWeight = entityDistance / majorAxisLength;
        // The original cutoff and replacement branches accept unordered values.
        if (entityWeight >= 100000000.0f)
            continue;
        if (shadowHint == 0x800)
            entityWeight = 0.0f;
        else if (shadowHint == 0x600)
            entityWeight *= 0.25f;
        else if (shadowHint == 0x400)
            entityWeight *= 4.0f;
        if (!(entityWeight > worstCandidate->weight))
        {
            worstCandidate->entIndex = entIndex;
            worstCandidate->weight = entityWeight;
            worstCandidate = candidates;
            for (candidateIndex = 1; candidateIndex != 24; ++candidateIndex)
                if (candidates[candidateIndex].weight > worstCandidate->weight)
                    worstCandidate = &candidates[candidateIndex];
        }
    }
}

ShadowCookieGlob shadowCookieGlob;

// PINNED 100016e9: inlined into R_LoadWorld.
void R_ResetShadowCookies()
{
    shadowCookieGlob.weightCap = 10.0f;
    shadowCookieGlob.lastTime = -1;
}

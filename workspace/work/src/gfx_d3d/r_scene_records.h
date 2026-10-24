// Shared PC scene and LOD records; field names agree with the common/Mac view.
#pragma once
#include <stddef.h>
#ifndef GFX_OC_TYPES
struct GfxEntity;
struct GfxSceneDef
{
    int time;
    float floatTime;
    int entityCount;
    GfxEntity *entities;
};
struct GfxLodParms
{
    float origin[3];
    float scale;
    float bias;
};
#endif

typedef char sceneRecordsLayoutCheck[(sizeof(GfxSceneDef) == 16
    && offsetof(GfxSceneDef, floatTime) == 4
    && offsetof(GfxSceneDef, entities) == 12
    && sizeof(GfxLodParms) == 20
    && offsetof(GfxLodParms, scale) == 12
    && offsetof(GfxLodParms, bias) == 16) ? 1 : -1];

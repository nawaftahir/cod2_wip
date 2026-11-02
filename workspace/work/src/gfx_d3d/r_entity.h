// Shared entity record; PC offsets pinned by the sprite command and tessellators.
#pragma once
#include <stddef.h>
#ifndef GFX_OC_TYPES
struct Material;
struct FxMemMgr_Emitter;
enum refEntityType_t {
    RT_DOBJ = 0,
    RT_XMODEL = 1,
    RT_STATICMODEL = 2,
    RT_BRUSHMODEL = 3,
    RT_SPRITE = 4,
    RT_RAIL_CORE = 5,
    RT_PARTICLE_CLOUD = 6,
    RT_ORIENTED_QUAD = 7,
    RT_LINE = 8,
    RT_CYLINDER = 9,
    RT_MAX_REF_ENTITY_TYPE = 10
};
struct GfxEntity {
    refEntityType_t reType;
    int renderFxFlags;
    union { struct { FxMemMgr_Emitter * (*colorForDir)[2]; float sunVisibility; } dx7; vec3_t baseCoords; vec3_t origin; } lighting;
    vec3_t axis[3];
    float scale;
    vec3_t origin;
    vec3_t endpos;
    Material *customMaterial;
    byte materialRGBA[4];
    float materialTime;
    int materialSubimageIndex;
    vec2_t radius;
    float rotation;
    float minScreenRadius;
};
#endif
typedef char entityLayoutCheck[(sizeof(GfxEntity) == 116
    && offsetof(GfxEntity, renderFxFlags) == 4
    && offsetof(GfxEntity, origin) == 60
    && offsetof(GfxEntity, customMaterial) == 84
    && offsetof(GfxEntity, materialRGBA) == 88
    && offsetof(GfxEntity, radius) == 100
    && offsetof(GfxEntity, minScreenRadius) == 112) ? 1 : -1];

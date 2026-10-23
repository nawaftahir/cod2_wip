// Shared PC permanent renderer state; storage remains owned by r_init.cpp.
#pragma once
#include <stddef.h>

#ifndef GFX_OC_TYPES
struct Material;
struct MaterialWaterDef;
struct GfxWorld;
struct GfxLightDef;

struct MaterialTextureDef
{
    const char *name;
    byte samplerState;
    byte semantic;
    byte unused_0;
    byte unused_1;
    union { GfxImage *image; MaterialWaterDef *water; } u;
};

struct r_global_permanent_t
{
    int materialLoaded;
    int materialCount;
    Material *sortedMaterials[1024];
    GfxImage *whiteImage;
    GfxImage *blackImage;
    GfxImage *identityNormalMapImage;
    GfxImage *specularityImage;
    GfxImage *lightmapWeightsImage;
    GfxImage *lightGridWeightsImage[2];
    GfxImage *outdoorImage;
    GfxLightDef *dlightDef;
    Material *defaultMaterial;
    Material *rawMaterial;
    Material *stencilPlaneMaterial;
    Material *whiteMaterial;
    Material *additiveMaterial;
    Material *pointMaterial;
    Material *lineMaterial;
    Material *clearAlphaStencilMaterial;
    Material *shadowClearMaterial;
    Material *shadowCookieOverlayMaterial;
    Material *shadowCookieBlurMaterial;
    Material *glareBlindMaterial;
    Material *normalFillMaterial;
    Material *alphaBlendFillMaterial;
    Material *alphaTestPassFillMaterial;
    Material *alphaTestFailFillMaterial;
    Material *additiveFillMaterial;
    Material *depthOnlyFillMaterial;
    Material *stencilOneSideKeepFillMaterial;
    Material *stencilOneSideRejectFillMaterial;
    Material *stencilTwoSideKeepFillMaterial;
    Material *stencilTwoSideRejectFillMaterial;
    Material *phongBumpFillMaterial;
    Material *phongBumpSpecFillMaterial;
    Material *colorChannelMixerMaterial;
    Material *frameColorDebugMaterial;
    Material *frameAlphaDebugMaterial;
    GfxImage *rawImage;
    GfxWorld *world;
    GfxImage *sunHalfAngleImage;
    GfxImage *waterColorImage;
    Material *feedbackReplaceMaterial;
    Material *feedbackBlendMaterial;
    Material *symmetricFilterMaterial[8];
    Material *shellShockMaterial;
    Material *glowSetupMaterial;
    Material *glowApplySkyBleedMaterial;
    Material *glowApplyBloomMaterial;
    int savedScreenTime;
    MaterialTextureDef rawTexdef;
};
#endif

extern r_global_permanent_t rgp;
typedef char permanentStateLayoutCheck[(sizeof(r_global_permanent_t) == 0x10f0
    && offsetof(r_global_permanent_t, whiteImage) == 0x1008
    && offsetof(r_global_permanent_t, defaultMaterial) == 0x102c
    && offsetof(r_global_permanent_t, world) == 0x109c
    && offsetof(r_global_permanent_t, rawTexdef) == 0x10e4) ? 1 : -1];

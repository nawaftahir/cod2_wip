// Tessellated surface setup; PINNED PC 1.0 shared state.
#include "gfx.h"
#include "rb_tess.h"

extern const dvar_t *r_logFile;
void RB_LogPrint(const char *text);

// PINNED 10037930/304; descriptive name, historical spelling unconfirmed.
static const char *RB_TechniqueName(int techType)
{
    const char *names[35];
    names[0] = "TECHNIQUE_DEPTH_PREPASS";
    names[1] = "TECHNIQUE_SKY";
    names[2] = "TECHNIQUE_BUILD_FLOAT_Z";
    names[3] = "TECHNIQUE_FOGABLE_FIRST";
    names[4] = "TECHNIQUE_UNLIT_FOG_LINEAR";
    names[5] = "TECHNIQUE_UNLIT_FOG_EXP";
    names[6] = "TECHNIQUE_LIGHTMAP";
    names[7] = "TECHNIQUE_LIGHTMAP_FOG_LINEAR";
    names[8] = "TECHNIQUE_LIGHTMAP_FOG_EXP";
    names[9] = "TECHNIQUE_LIGHTPROBE";
    names[10] = "TECHNIQUE_LIGHTPROBE_FOG_LINEAR";
    names[11] = "TECHNIQUE_LIGHTPROBE_FOG_EXP";
    names[12] = "TECHNIQUE_LIGHTPROBE_SMODEL";
    names[13] = "TECHNIQUE_LIGHTPROBE_SMODEL_FOG_LINEAR";
    names[14] = "TECHNIQUE_LIGHTPROBE_SMODEL_FOG_EXP";
    names[15] = "TECHNIQUE_LIGHTPROBE_SMODEL_CACHED";
    names[16] = "TECHNIQUE_LIGHTPROBE_SMODEL_CACHED_FOG_LINEAR";
    names[17] = "TECHNIQUE_LIGHTPROBE_SMODEL_CACHED_FOG_EXP";
    names[18] = "TECHNIQUE_POINTLIGHT";
    names[19] = "TECHNIQUE_POINTLIGHT_FOG_LINEAR";
    names[20] = "TECHNIQUE_POINTLIGHT_FOG_EXP";
    names[21] = "TECHNIQUE_EMISSIVE";
    names[22] = "TECHNIQUE_EMISSIVE_FOG_LINEAR";
    names[23] = "TECHNIQUE_EMISSIVE_FOG_EXP";
    names[24] = "TECHNIQUE_EMISSIVE_FEATHERED";
    names[25] = "TECHNIQUE_EMISSIVE_FEATHERED_FOG_LINEAR";
    names[26] = "TECHNIQUE_EMISSIVE_FEATHERED_FOG_EXP";
    names[27] = "TECHNIQUE_FAKELIGHT_NORMAL";
    names[28] = "TECHNIQUE_FAKELIGHT_VIEW";
    names[29] = "TECHNIQUE_WIREFRAME_SOLID";
    names[30] = "TECHNIQUE_WIREFRAME_SHADED";
    names[31] = "TECHNIQUE_SHADOWCOOKIE_CASTER";
    names[32] = "TECHNIQUE_SHADOWCOOKIE_RECEIVER";
    names[33] = "TECHNIQUE_DEBUG_BUMPMAP";
    names[34] = "TECHNIQUE_COUNT";
    return names[techType];
}

// PINNED 1003a5f0: optimized counts and materialTime are NOT reset here.
void RB_BeginSurface(const Material *material, int techType, int lmapIndex)
{
    if (r_logFile->current.integer)
        RB_LogPrint(va("---------- RB_BeginSurface( %s, %s )\n", material->info.name, RB_TechniqueName(techType)));
    tess.declType = 0;
    tess.optimizedVertexSource = 0;
    tess.indexCount = 0;
    tess.vertexCount = 0;
    tess.firstVertex = 0;
    tess.lastVertex = 0;
    tess.material = material;
    tess.techType = techType;
    tess.lmapIndex = lmapIndex;
}

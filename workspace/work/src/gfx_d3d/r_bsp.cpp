// World queries.
#include "gfx.h"

extern const dvar_t *r_lightTweakAmbient;
extern const dvar_t *r_lightTweakDiffuseFraction;
extern const dvar_t *r_lightTweakSunLight;
extern const dvar_t *r_lightTweakAmbientColor;
extern const dvar_t *r_lightTweakSunColor;
extern const dvar_t *r_lightTweakSunDiffuseColor;
extern const dvar_t *r_lightTweakSunDirection;

void *R_AllocStaticVertexBuffer(void **vb, int sizeInBytes);
void R_FinishStaticVertexBuffer(void *vb);
void R_FreeStaticVertexBuffer(IDirect3DVertexBuffer9 *vb);
extern "C" void Com_Memcpy(void *dest, const void *src, int count);

// Name unconfirmed; PINNED out-of-line copy at 10001030 (DX7 32 B, DX9 68 B vertices).
inline int R_WorldVertexSize()
{
    return r_rendererInUse->current.integer == 2 ? 0x20 : 0x44;
}

IDirect3DVertexBuffer9 *R_CreateWorldVertexBuffer(GfxWorldVertex *vertices, int vertexCount)
{
    IDirect3DVertexBuffer9 *worldVb;
    byte *dataPtr;
    int sizeVerts;
    int vertIndex;

    sizeVerts = R_WorldVertexSize() * vertexCount;
    dataPtr = (byte *)R_AllocStaticVertexBuffer((void **)&worldVb, sizeVerts);
    if (r_rendererInUse->current.integer == 2)
    {
        // DX7 path: GfxWorldVertex (0x44) -> GfxWorldVertexDx7 (0x20)
        for (vertIndex = 0; vertIndex < vertexCount; vertIndex++)
        {
            GfxWorldVertexDx7 *dst = (GfxWorldVertexDx7 *)(dataPtr + vertIndex * sizeof(GfxWorldVertexDx7));
            const GfxWorldVertex *src = &vertices[vertIndex];

            VectorCopy(src->xyz, dst->xyz);
            dst->color = src->color;
            dst->texCoord[0] = src->texCoord[0];
            dst->texCoord[1] = src->texCoord[1];
            Vector2Copy(src->lmapCoord, dst->lmapCoord);
        }
    }
    else
    {
        Com_Memcpy(dataPtr, vertices, sizeVerts);
    }
    R_FinishStaticVertexBuffer(worldVb);
    return worldVb;
}

void R_GetWorldBounds(vec_t *mins, vec_t *maxs)
{
    VectorCopy(rgp.world->mins, mins);
    VectorCopy(rgp.world->maxs, maxs);
}

void R_UpdateLightsFromDvars();

// PINNED 10001280: API59 slot28 tail-calls the existing dvar update.
void R_ResetSunLightParseParams()
{
    R_UpdateLightsFromDvars();
}

void R_InterpretSunLightParseParamsIntoLights(SunLightParseParams *sunParse, GfxLight *sunLight);

// name unconfirmed: reads the r_lightTweak dvars into a parse block
// SUPPORTED name: KisakCOD r_bsp.cpp; PINNED 10001290.
static void R_GetNormalizedColorFromDvar(const dvar_t *dvar, float *outVec)
{
    int channelIter = 0;
    do
    {
        outVec[channelIter] = (float)dvar->current.color[channelIter];
        channelIter++;
    } while (channelIter != 3);
    Vec3ScaleToUnitMax(outVec, outVec);
}

static void R_GetSunLightParseParamsFromDvars(SunLightParseParams *sunParse)
{
    sunParse->ambientScale = r_lightTweakAmbient->current.value;
    sunParse->diffuseFraction = r_lightTweakDiffuseFraction->current.value;
    sunParse->sunLight = r_lightTweakSunLight->current.value;
    R_GetNormalizedColorFromDvar(r_lightTweakAmbientColor, sunParse->ambientColor);
    R_GetNormalizedColorFromDvar(r_lightTweakSunColor, sunParse->sunColor);
    R_GetNormalizedColorFromDvar(r_lightTweakSunDiffuseColor, sunParse->diffuseColor);
    sunParse->diffuseColorHasBeenSet = 1;
    VectorCopy(r_lightTweakSunDirection->current.vector, sunParse->angles);
}

void R_InterpretSunLightParseParams(SunLightParseParams *sunParse)
{
    R_InterpretSunLightParseParamsIntoLights(sunParse, &rgp.world->sunLight);
    VectorCopy(rgp.world->sunLight.color, rgp.world->sunColorFromBsp);
}

__declspec(noinline) void R_UpdateLightsFromDvars()
{
    SunLightParseParams sunParse;

    R_GetSunLightParseParamsFromDvars(&sunParse);
    R_InterpretSunLightParseParamsIntoLights(&sunParse, &rgp.world->sunLight);
    VectorCopy(rgp.world->sunLight.color, rgp.world->sunColorFromBsp);
}

void R_SetSunLightOverride(const vec_t *sunColor)
{
    if (r_rendererInUse->current.integer != 2)
        VectorCopy(sunColor, rgp.world->sunLight.color);
}

void R_ResetSunLightOverride()
{
    VectorCopy(rgp.world->sunColorFromBsp, rgp.world->sunLight.color);
}

int R_GetMaxModelSurfaceCount(const XModel *model);

typedef char WorldDynamicLayoutCheck[(offsetof(GfxWorld, smodelCount) == 0xf4
    && offsetof(GfxWorld, surfaceCount) == 0x10
    && offsetof(GfxWorld, cullGroupCount) == 0xec
    && offsetof(r_globals_t, smodelDyncs) == 0x3194
    && sizeof(GfxStaticModelDynamic) == 8 && sizeof(GfxStaticSurface) == 16) ? 1 : -1];

// PINNED 10001490: copy the BSP sun settings into the tweak dvars.
static void R_CopyParseParamsToDvars(const SunLightParseParams *sunParse)
{
    ri.Dvar_SetFloat(r_lightTweakAmbient, sunParse->ambientScale);
    ri.Dvar_SetFloat(r_lightTweakDiffuseFraction, sunParse->diffuseFraction);
    ri.Dvar_SetFloat(r_lightTweakSunLight, sunParse->sunLight);
    ri.Dvar_SetColor(r_lightTweakAmbientColor, sunParse->ambientColor[0], sunParse->ambientColor[1], sunParse->ambientColor[2], 1.0f);
    ri.Dvar_SetColor(r_lightTweakSunColor, sunParse->sunColor[0], sunParse->sunColor[1], sunParse->sunColor[2], 1.0f);
    ri.Dvar_SetColor(r_lightTweakSunDiffuseColor, sunParse->diffuseColor[0], sunParse->diffuseColor[1], sunParse->diffuseColor[2], 1.0f);
    ri.Dvar_SetVec3(r_lightTweakSunDirection, sunParse->angles[0], sunParse->angles[1], sunParse->angles[2]);
    ri.Dvar_ChangeResetValue(r_lightTweakAmbient, r_lightTweakAmbient->current);
    ri.Dvar_ChangeResetValue(r_lightTweakDiffuseFraction, r_lightTweakDiffuseFraction->current);
    ri.Dvar_ChangeResetValue(r_lightTweakSunLight, r_lightTweakSunLight->current);
    ri.Dvar_ChangeResetValue(r_lightTweakAmbientColor, r_lightTweakAmbientColor->current);
    ri.Dvar_ChangeResetValue(r_lightTweakSunColor, r_lightTweakSunColor->current);
    ri.Dvar_ChangeResetValue(r_lightTweakSunDiffuseColor, r_lightTweakSunDiffuseColor->current);
    ri.Dvar_ChangeResetValue(r_lightTweakSunDirection, r_lightTweakSunDirection->current);
}

// PINNED100015b0/217; descriptive name for world dynamic-array initialization.
void R_InitWorldDynamicData()
{
    rg.smodelDyncs = (GfxStaticModelDynamic *)ri.Hunk_AllocInternal(
        rgp.world->smodelCount * sizeof(GfxStaticModelDynamic));
    rg.surfaces = (GfxSurfaceDynamic *)ri.Hunk_AllocInternal(
        rgp.world->surfaceCount * sizeof(GfxSurfaceDynamic));
    rg.cullGroups = (GfxCullGroupDynamic *)ri.Hunk_AllocInternal(
        rgp.world->cullGroupCount * sizeof(GfxCullGroupDynamic));
    for (int index = 0; index < rgp.world->smodelCount; ++index)
    {
        GfxStaticModelDynamic *dynamic = &rg.smodelDyncs[index];
        GfxStaticModelInstance *instance = &rgp.world->smodelInsts[index];
        int size = R_GetMaxModelSurfaceCount(instance->model)
            * sizeof(GfxStaticSurface);
        dynamic->staticSurfs = (GfxStaticSurface *)ri.Hunk_AllocAlignInternal(size, 4);
        memset(dynamic->staticSurfs, 0, size);
    }
}

void RB_InitLightVisHistory(const char *bspName);
GfxWorld *R_LoadWorldInternal(const char *name);
void R_FlushSun();
void R_ResetShadowCookies();
void R_InitStaticModelIndexCache();
GfxImage *Image_Register(const char *name, int semantic, int imageTrack);

typedef char loadWorldChecksumCheck[offsetof(GfxWorld, checksum) == 0x154 ? 1 : -1];

// PINNED 10001690: load the BSP and set up per-world state.
void R_LoadWorld(const char *name, int *checksum)
{
    RB_InitLightVisHistory(name);
    rgp.world = R_LoadWorldInternal(name);
    if (checksum)
        *checksum = rgp.world->checksum;
    R_CopyParseParamsToDvars(&rgp.world->sunParse);
    R_UpdateLightsFromDvars();
    R_FlushSun();
    R_ResetShadowCookies();
    R_InitStaticModelIndexCache();
    R_InitWorldDynamicData();
    if (r_rendererInUse->current.integer == 2)
        rgp.sunHalfAngleImage = Image_Register("$sunhalfangle", 1, 0);
}

void R_ShutdownWorld()
{
    if (rgp.world)
    {
        if (rgp.world->vd.worldVb)
        {
            R_FreeStaticVertexBuffer(rgp.world->vd.worldVb);
            rgp.world->vd.worldVb = NULL;
        }
        rgp.world = NULL;
    }
}

void R_ReleaseWorld()
{
    if (rgp.world->vd.worldVb)
    {
        R_FreeStaticVertexBuffer(rgp.world->vd.worldVb);
        rgp.world->vd.worldVb = NULL;
    }
}

void R_ReloadWorld()
{
    rgp.world->vd.worldVb = R_CreateWorldVertexBuffer(rgp.world->vd.vertices, rgp.world->vertexCount);
}

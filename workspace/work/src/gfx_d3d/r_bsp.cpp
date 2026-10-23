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

IDirect3DVertexBuffer9 *R_CreateWorldVertexBuffer(GfxWorldVertex *vertices, int vertexCount)
{
    IDirect3DVertexBuffer9 *worldVb;
    byte *dataPtr;
    int sizeVerts;
    int vertIndex;

    sizeVerts = (r_rendererInUse->current.integer == 2 ? 0x20 : 0x44) * vertexCount;
    dataPtr = (byte *)R_AllocStaticVertexBuffer((void **)&worldVb, sizeVerts);
    if (r_rendererInUse->current.integer == 2)
    {
        // DX7 path: GfxWorldVertex (0x44) -> GfxWorldVertexDx7 (0x20)
        for (vertIndex = 0; vertIndex < vertexCount; vertIndex++)
        {
            GfxWorldVertexDx7 *dst = (GfxWorldVertexDx7 *)(dataPtr + vertIndex * sizeof(GfxWorldVertexDx7));
            const GfxWorldVertex *src = &vertices[vertIndex];

            dst->xyz[0] = src->xyz[0];
            dst->xyz[1] = src->xyz[1];
            dst->xyz[2] = src->xyz[2];
            dst->color = src->color;
            dst->texCoord[0] = src->texCoord[0];
            dst->texCoord[1] = src->texCoord[1];
            dst->lmapCoord[0] = src->lmapCoord[0];
            dst->lmapCoord[1] = src->lmapCoord[1];
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

void R_InterpretSunLightParseParamsIntoLights(SunLightParseParams *sunParse, GfxLight *sunLight);

// name unconfirmed: reads the r_lightTweak dvars into a parse block
static void R_GetSunLightParseParamsFromDvars(SunLightParseParams *sunParse)
{
    sunParse->ambientScale = r_lightTweakAmbient->current.value;
    sunParse->diffuseFraction = r_lightTweakDiffuseFraction->current.value;
    sunParse->sunLight = r_lightTweakSunLight->current.value;
    {
        float *c = sunParse->ambientColor;
        int i = 0;
        do
        {
            c[i] = (float)r_lightTweakAmbientColor->current.color[i];
            i++;
        } while (i != 3);
        Vec3ScaleToUnitMax(c, c);
    }
    {
        float *c = sunParse->sunColor;
        int i = 0;
        do
        {
            c[i] = (float)r_lightTweakSunColor->current.color[i];
            i++;
        } while (i != 3);
        Vec3ScaleToUnitMax(c, c);
    }
    {
        float *c = sunParse->diffuseColor;
        int i = 0;
        do
        {
            c[i] = (float)r_lightTweakSunDiffuseColor->current.color[i];
            i++;
        } while (i != 3);
        Vec3ScaleToUnitMax(c, c);
    }
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

// PINNED 10001280: API59 slot28 tail-calls the existing dvar update.
void R_ResetSunLightParseParams()
{
    R_UpdateLightsFromDvars();
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

int R_GetMaxModelSurfaceCount(const XModel *model);

typedef char WorldDynamicLayoutCheck[(offsetof(GfxWorld, smodelCount) == 0xf4
    && offsetof(GfxWorld, surfaceCount) == 0x10
    && offsetof(GfxWorld, cullGroupCount) == 0xec
    && offsetof(r_globals_t, smodelDyncs) == 0x3194
    && sizeof(GfxStaticModelDynamic) == 8 && sizeof(GfxStaticSurface) == 16) ? 1 : -1];

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

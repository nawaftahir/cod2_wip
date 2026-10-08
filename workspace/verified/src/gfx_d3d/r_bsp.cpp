// World queries.
#include "gfx.h"

extern const dvar_t *r_lightTweakAmbient;
extern const dvar_t *r_lightTweakDiffuseFraction;
extern const dvar_t *r_lightTweakSunLight;
extern const dvar_t *r_lightTweakAmbientColor;
extern const dvar_t *r_lightTweakSunColor;
extern const dvar_t *r_lightTweakSunDiffuseColor;
extern const dvar_t *r_lightTweakSunDirection;

void *R_AllocStaticVertexBuffer(IDirect3DVertexBuffer9 **vb, int sizeInBytes);
void R_FinishStaticVertexBuffer(IDirect3DVertexBuffer9 *vb);
void R_FreeStaticVertexBuffer(IDirect3DVertexBuffer9 *vb);

IDirect3DVertexBuffer9 *R_CreateWorldVertexBuffer(GfxWorldVertex *vertices, int vertexCount)
{
    IDirect3DVertexBuffer9 *worldVb;
    byte *dataPtr;
    int sizeVerts;
    int vertIndex;

    sizeVerts = (r_rendererInUse->current.integer == 2 ? 0x20 : 0x44) * vertexCount;
    dataPtr = (byte *)R_AllocStaticVertexBuffer(&worldVb, sizeVerts);
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
            dst->lmapCoord[0] = src->lmapCoord[0];
            dst->lmapCoord[1] = src->lmapCoord[1];
        }
    }
    else
    {
        memcpy(dataPtr, vertices, sizeVerts);
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

void R_UpdateLightsFromDvars()
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

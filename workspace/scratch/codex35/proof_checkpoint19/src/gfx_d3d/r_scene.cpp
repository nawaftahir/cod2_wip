// Scene setup.
#include "gfx.h"

GfxScene scene;

extern const dvar_t *fx_sort;
extern const dvar_t *r_drawBModels;

// PINNED 10024380/117; unsigned arithmetic preserves packed-key wraparound.
static void R_AddDrawSurf(const Material *material, int entIndex, int lmapIndex, const surfaceType_t *surface)
{
    GfxBackEndData *data = frontEndDataOut;
    if (data->drawSurfCount >= 65536)
        return;
    GfxDrawSurf *drawSurf = &data->drawSurfs[data->drawSurfCount];
    unsigned int type = *surface;
    unsigned int sort;
    if (type == 2 && fx_sort->current.enabled)
        sort = (((((unsigned int)entIndex - 4096) << 10) + material->info.sortedIndex)
            * 32 + lmapIndex) * 16;
    else
        sort = (((material->info.sortedIndex * 32u + lmapIndex) << 12)
            + entIndex) * 16;
    drawSurf->sort = sort + type;
    drawSurf->surface = surface;
    ++scene.drawSurfCount;
    ++data->drawSurfCount;
}

// PINNED 10024610/99; disabled brush drawing still updates cullState.
void R_AddBModelSurfaces(GfxSceneEntity *sceneEnt, int entIndex)
{
    sceneEnt->cullState = 5;
    if (!r_drawBModels->current.enabled)
        return;
    const GfxBrushModel *bmodel = sceneEnt->u.bmodel;
    int surfIndex = bmodel->startSurfIndex;
    for (int index = 0; index < bmodel->surfaceCount; ++index, ++surfIndex)
    {
        GfxSurface *surf = &rgp.world->surfaces[surfIndex];
        R_AddDrawSurf(surf->material, entIndex, surf->lightmapIndex, surf->data);
    }
}

void R_ClearDpvsScene();

void R_ClearScene()
{
    GfxBackEndData *data;

    scene.viewCount++;
    scene.dlightCount = 0;
    scene.drawSurfCount = 0;
    data = frontEndDataOut;
    scene.drawSurfs = &data->drawSurfs[data->drawSurfCount];
    scene.polyCount = 0;
    scene.def.entityCount = 0;
    scene.def.entities = &data->entities[data->entityCount];
    scene.sceneEntMaterialCount = 0;
    R_ClearDpvsScene();
}

static int R_CompareDumpSceneEntities(const void *e0, const void *e1)
{
    int index0;
    int index1;
    GfxEntity *ent0;
    GfxEntity *ent1;
    GfxSceneEntity *sceneEnt0;
    GfxSceneEntity *sceneEnt1;
    const DObj *obj0;
    const DObj *obj1;
    int type;
    int diff;

    index0 = *(const int *)e0;
    index1 = *(const int *)e1;
    ent0 = &frontEndDataOut->entities[index0];
    ent1 = &frontEndDataOut->entities[index1];
    type = ent0->reType;
    diff = type - ent1->reType;
    if (diff)
        return diff;
    sceneEnt0 = &scene.sceneEnts[index0];
    sceneEnt1 = &scene.sceneEnts[index1];
    switch (type)
    {
    case 0:
        obj0 = sceneEnt0->u.obj;
        obj1 = sceneEnt1->u.obj;
        return (int)ri.DObjGetModel(obj0, 0) - (int)ri.DObjGetModel(obj1, 0);
    case 1:
    case 2:
        return (int)sceneEnt0->u.model - (int)sceneEnt1->u.model;
    case 3:
        return sceneEnt0->u.bmodel - sceneEnt1->u.bmodel;
    default:
        return ent0->customMaterial - ent1->customMaterial;
    }
}

// Name HYPOTHESIS (inlined into R_RenderScene on Mac; comparator name is from Mac STABS).
void R_DumpSceneEntities()
{
    const char *typeNames[10];
    int sortedIndices[2046];
    GfxEntity *ent;
    GfxSceneEntity *sceneEnt;
    int entIndex;
    int nextIndex;
    int count;

    typeNames[0] = "dobj";
    typeNames[1] = "xmodel";
    typeNames[2] = "smodel";
    typeNames[3] = "bmodel";
    typeNames[4] = "sprite";
    typeNames[5] = "rail core";
    typeNames[6] = "cloud";
    typeNames[7] = "oriented";
    typeNames[8] = "line";
    typeNames[9] = "cylinder";
    for (entIndex = 0; entIndex != scene.def.entityCount; ++entIndex)
        sortedIndices[entIndex] = entIndex;
    qsort(sortedIndices, scene.def.entityCount, sizeof(int), R_CompareDumpSceneEntities);
    for (entIndex = 0; entIndex != scene.def.entityCount; entIndex += count)
    {
        ent = &frontEndDataOut->entities[sortedIndices[entIndex]];
        sceneEnt = &scene.sceneEnts[sortedIndices[entIndex]];
        for (nextIndex = entIndex + 1; nextIndex != scene.def.entityCount; ++nextIndex)
        {
            if (R_CompareDumpSceneEntities(&sortedIndices[entIndex], &sortedIndices[nextIndex]))
                break;
        }
        count = nextIndex - entIndex;
        Com_Printf("%3i: %-8s: ", count, typeNames[ent->reType]);
        switch (ent->reType)
        {
        case 0:
            Com_Printf("%s\n", ri.XModelGetName(ri.DObjGetModel(sceneEnt->u.obj, 0)));
            break;
        case 1:
        case 2:
            Com_Printf("%s\n", ri.XModelGetName(sceneEnt->u.model));
            break;
        case 3:
            Com_Printf("*%i\n", sceneEnt->u.bmodel - rgp.world->models);
            break;
        default:
            Com_Printf("%s\n", ent->customMaterial ? ent->customMaterial->info.name : "(null)");
            break;
        }
    }
}

void R_UpdateFrameFog()
{
    int fadeTime;
    float lerpPos;

    if (scene.def.time >= rg.fogSettings[4].finishTime)
    {
        rg.fogSettings[2] = rg.fogSettings[4];
    }
    else if (rg.fogSettings[3].techniqueOffset != rg.fogSettings[4].techniqueOffset)
    {
        rg.fogSettings[2] = rg.fogSettings[4];
        rg.fogSettings[4].finishTime = 0;
    }
    else
    {
        fadeTime = rg.fogSettings[4].finishTime - rg.fogSettings[4].startTime;
        if (fadeTime <= 0)
            fadeTime = 1;
        lerpPos = (float)(scene.def.time - rg.fogSettings[4].startTime) / fadeTime;
        if (lerpPos > 1.0f)
            lerpPos = 1.0f;
        rg.fogSettings[2].fogStart = (rg.fogSettings[4].fogStart - rg.fogSettings[3].fogStart) * lerpPos + rg.fogSettings[3].fogStart;
        rg.fogSettings[2].fogEnd = (rg.fogSettings[4].fogEnd - rg.fogSettings[3].fogEnd) * lerpPos + rg.fogSettings[3].fogEnd;
        rg.fogSettings[2].density = (rg.fogSettings[4].density - rg.fogSettings[3].density) * lerpPos + rg.fogSettings[3].density;
        rg.fogSettings[2].color.array[0] = (byte)((rg.fogSettings[4].color.array[0] - rg.fogSettings[3].color.array[0]) * lerpPos + rg.fogSettings[3].color.array[0]);
        rg.fogSettings[2].color.array[1] = (byte)((rg.fogSettings[4].color.array[1] - rg.fogSettings[3].color.array[1]) * lerpPos + rg.fogSettings[3].color.array[1]);
        rg.fogSettings[2].color.array[2] = (byte)((rg.fogSettings[4].color.array[2] - rg.fogSettings[3].color.array[2]) * lerpPos + rg.fogSettings[3].color.array[2]);
        rg.fogSettings[2].color.array[3] = (byte)((rg.fogSettings[4].color.array[3] - rg.fogSettings[3].color.array[3]) * lerpPos + rg.fogSettings[3].color.array[3]);
        rg.fogSettings[2].techniqueOffset = rg.fogSettings[4].techniqueOffset;
        rg.fogSettings[2].registered = 1;
        rg.fogSettings[2].clearScreen = rg.fogSettings[4].clearScreen || rg.fogSettings[3].clearScreen;
    }
    if (rg.fogIndex)
        frontEndDataOut->fogSettings = rg.fogSettings[2];
    else
        frontEndDataOut->fogSettings.techniqueOffset = FOG_OFFSET_NONE;
}

static int R_AllocSceneEntity()
{
    static int warnCount;
    int entIndex;

    if (r_drawEntities->current.enabled)
    {
        entIndex = scene.def.entityCount;
        if ((unsigned int)entIndex < 2046)
        {
            if ((unsigned int)frontEndDataOut->entityCount < 8184)
            {
                ++frontEndDataOut->entityCount;
                ++scene.def.entityCount;
                return entIndex;
            }
            if (warnCount != frontEndDataOut->frameCount)
            {
                warnCount = frontEndDataOut->frameCount;
                ri.Printf(2, "too many visible models (more than %i)\n", 8184);
                return -1;
            }
        }
        else if (warnCount != frontEndDataOut->frameCount)
        {
            warnCount = frontEndDataOut->frameCount;
            ri.Printf(2, "too many scene entities (more than %i)\n", 2046);
        }
    }
    return -1;
}

int R_AddStaticModelToScene(int smodelIndex)
{
    int entIndex;
    GfxEntity *ent;
    GfxStaticModelInstance *smodelInst;
    GfxSceneEntity *sceneEnt;

    entIndex = R_AllocSceneEntity();
    if (entIndex < 0)
        return -1;
    ent = &scene.def.entities[entIndex];
    smodelInst = &rgp.world->smodelInsts[smodelIndex];
    memset(ent, 0, sizeof(*ent));
    ent->reType = (refEntityType_t)2;
    VectorCopy(smodelInst->origin, ent->origin);
    AxisCopy(smodelInst->axis, ent->axis);
    ent->scale = smodelInst->scale;
    if (r_rendererInUse->current.integer == 2)
    {
        ent->lighting.dx7.colorForDir = (FxMemMgr_Emitter *(*)[2])&rgp.world->smodelLightingColorTable[smodelIndex];
        ent->lighting.dx7.sunVisibility = rgp.world->smodelLightingSunVisTable[smodelIndex];
    }
    else
    {
        VectorCopy(smodelInst->baseLightingCoords, ent->lighting.baseCoords);
    }
    sceneEnt = &scene.sceneEnts[entIndex];
    memset(sceneEnt, 0, sizeof(*sceneEnt));
    sceneEnt->cullState = 2;
    sceneEnt->u.model = smodelInst->model;
    VectorCopy(smodelInst->mins, sceneEnt->curMins);
    VectorCopy(smodelInst->maxs, sceneEnt->curMaxs);
    return entIndex;
}

extern const dvar_t *r_dlightLimit;

// name unconfirmed (refexport slot 24); entry layout unknown, 17 floats each
void R_ResetEntries(int count, float (*entries)[17])
{
    float *e;
    int n;

    if (count <= 0)
        return;
    e = &entries[0][5];
    for (n = count; n; n--)
    {
        e[-2] = 0.0f;
        e[-1] = 0.0f;
        e[0] = 1.0f;
        e[6] = 0.0f;
        e[7] = 1.0f;
        e[8] = 0.0f;
        e[9] = 1.0f;
        e[10] = 0.0f;
        e[11] = 0.0f;
        e += 17;
    }
}

void R_AddLightToScene(const vec_t *org, float radius, float r, float g, float b)
{
    GfxLight *light;
    int dlightCount;

    if (!rg.registered)
        return;
    if (!rgp.world)
        return;
    if (radius <= 0.0f)
        return;
    dlightCount = scene.dlightCount;
    if (dlightCount >= r_dlightLimit->current.integer)
        return;
    light = &scene.dlights[dlightCount];
    scene.dlightCount = dlightCount + 1;
    light->def = rgp.dlightDef;
    light->position[0] = org[0];
    light->position[1] = org[1];
    light->position[2] = org[2];
    light->position[3] = radius;
    light->color[0] = r;
    light->color[1] = g;
    light->color[2] = b;
}

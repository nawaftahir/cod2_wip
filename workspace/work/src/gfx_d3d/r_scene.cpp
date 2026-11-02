// Scene setup.
#include "gfx.h"
#include <stddef.h>
void R_UpdateXModelBounds(GfxSceneEntity *sceneEnt, const GfxEntity *ent);

// PC 1.0 10023d40: resolve the scene record from the entity-array index.
__declspec(noinline) void R_UpdateGfxEntityBounds(GfxEntity *ent)
{
    int entIndex = ent - scene.def.entities;
    R_UpdateXModelBounds(&scene.sceneEnts[entIndex], ent);
}

// PINNED refapi callback10020cd0/12; the internal worker receives ESI.
void R_UpdateGfxEntityBoundsCmd(GfxEntity *ent)
{
    R_UpdateGfxEntityBounds(ent);
}

GfxScene scene;

extern const dvar_t *r_lockPvs;
extern const dvar_t *r_lodScale;
extern const dvar_t *r_lodBias;
extern const dvar_t *r_znear;
extern const dvar_t *r_znear_depthhack;
void MatrixForViewer(float mtx[4][4], const vec3_t origin, const vec3_t axis[3]);
void InfinitePerspectiveMatrix(float mtx[4][4], float fovX, float fovY, float zNear);
void MatrixMultiply44(const float first[4][4], const float second[4][4], float out[4][4]);
void MatrixInverse44(const float *matrix, float *out);

// PINNED 10696a68: retained camera used when r_lockPvs is enabled.
static GfxViewParms lockPvsViewParms;

// PINNED 10025570: shared by the LOD callback and scene submission.
static __declspec(noinline) void R_SetViewParmsForScene(GfxViewParms *viewParms, const refdef_t *refdef)
{
    float zNear;

    memset(viewParms, 0, sizeof(*viewParms));
    viewParms->viewport.X = refdef->x;
    viewParms->viewport.Y = refdef->y;
    viewParms->viewport.Width = refdef->width;
    viewParms->viewport.Height = refdef->height;
    viewParms->viewport.MinZ = 0.0f;
    viewParms->viewport.MaxZ = 1.0f;
    VectorCopy(refdef->vieworg, viewParms->origin);
    VectorCopy(refdef->viewaxis[0], viewParms->axis[0]);
    VectorCopy(refdef->viewaxis[1], viewParms->axis[1]);
    VectorCopy(refdef->viewaxis[2], viewParms->axis[2]);
    MatrixForViewer((float (*)[4])&viewParms->viewMatrix, viewParms->origin, viewParms->axis);
    if (refdef->zNear > 0.0f)
        zNear = refdef->zNear;
    else
        zNear = I_fmax(0.01f, r_znear->current.value);
    InfinitePerspectiveMatrix((float (*)[4])&viewParms->projectionMatrix,
        refdef->fov_x, refdef->fov_y, zNear);
    viewParms->depthHackNearClip = r_znear_depthhack->current.value;
    MatrixMultiply44((const float (*)[4])&viewParms->viewMatrix,
        (const float (*)[4])&viewParms->projectionMatrix,
        (float (*)[4])&viewParms->viewProjectionMatrix);
    MatrixInverse44((const float *)&viewParms->viewProjectionMatrix,
        (float *)&viewParms->inverseViewProjectionMatrix);
}

#pragma intrinsic(tan)
// PINNED 100256c0: API59 slot107; the reference FOV uses single-precision arithmetic.
void R_SetLodOrigin(const refdef_t *refdef)
{
    float invFovScale;

    if (r_lockPvs->modified)
    {
        ri.Dvar_ClearModified(r_lockPvs);
        R_SetViewParmsForScene(&lockPvsViewParms, refdef);
    }
    if (r_lockPvs->current.enabled)
        VectorCopy(lockPvsViewParms.origin, rg.lodParms.origin);
    else
        VectorCopy(refdef->vieworg, rg.lodParms.origin);
    rg.lodParms.scale = r_lodScale->current.value;
    rg.lodParms.bias = r_lodBias->current.value;
    if (refdef->fov_x != 80.0f)
    {
        float halfFov = refdef->fov_x * 0.5f;
        invFovScale = (float)(tan(halfFov * (M_PI / 180.0f))
            / tan(DEG2RAD(80.0f * 0.5f)));
        rg.lodParms.scale *= invFovScale;
        rg.lodParms.bias *= invFovScale;
    }
}
#pragma function(tan)

extern const dvar_t *fx_sort;
extern const dvar_t *r_drawBModels;

// PINNED 10024380/117; unsigned arithmetic preserves packed-key wraparound.
__declspec(noinline) void R_AddDrawSurf(const Material *material, int entIndex, int lmapIndex, const surfaceType_t *surface)
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

// PINNED 10023ed0/245: backend arrays and vertex stride used by the API callback.
typedef char polygonLayout[
    sizeof(srfPoly_t) == 16 && sizeof(GfxWorldVertex) == 68 &&
    offsetof(GfxBackEndData, polyCount) == 0x187c70 &&
    offsetof(GfxBackEndData, polys) == 0x187c74 &&
    offsetof(GfxBackEndData, polyVertCount) == 0x18fc74 &&
    offsetof(GfxBackEndData, polyVerts) == 0x18fc78 ? 1 : -1];

void R_AddPolyToScene(Material *material, int lmapIndex,
    unsigned short vertCount, const GfxWorldVertex *verts)
{
    if (!rg.registered)
        return;
    if (!material)
        material = rgp.defaultMaterial;
    GfxBackEndData *data = frontEndDataOut;
    int count = (unsigned short)vertCount;
    if (data->polyVertCount + count > 8192 || data->polyCount >= 2048)
        return;
    srfPoly_t *poly = &data->polys[data->polyCount];
    poly->lmapIndex = (unsigned short)lmapIndex;
    poly->material = material;
    poly->vertCount = (unsigned short)vertCount;
    poly->surfaceType = SF_POLY;
    poly->verts = &data->polyVerts[data->polyVertCount];
    memcpy(poly->verts, verts, count * sizeof(*verts));
    R_AddDrawSurf(material, scene.polyCount % 2048 + 2048, (unsigned short)lmapIndex,
        &poly->surfaceType);
    ++data->polyCount;
    data->polyVertCount += count;
    ++scene.polyCount;
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

void R_SkinSceneDObj(GfxSceneEntity *sceneEnt, GfxEntity *ent);

// PINNED 10023d70/61: bounds must precede DObj surface publication.
void R_SkinGfxEntity(GfxEntity *ent)
{
    int entIndex = ent - scene.def.entities;
    GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    R_UpdateXModelBounds(sceneEnt, ent);
    R_SkinSceneDObj(sceneEnt, ent);
}

// PINNED PC model surface submission, 10024680/286.
extern const dvar_t *r_showTriCounts;
extern const dvar_t *r_showVertCounts;
extern const dvar_t *r_showSurfCounts;
void R_AddScaledDebugString(DebugGlobals *debug, const GfxViewParms *viewParms,
    const float *origin, const float *color, const char *text);

// PINNED 101a5a2c: writable entity surface token, followed by the stride table.
surfaceType_t s_entitySurface = (surfaceType_t)2;

// PINNED 101a5a30: byte strides, including the two unused entries.
byte s_XModelSurfaceSize[8] = {0, 0, 0, 16, 56, 16, 0, 0};

void R_AddXModelSurfaces(int entIndex)
{
    GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    GfxEntity *ent = &scene.def.entities[entIndex];
    GfxModelSurface *surface = (GfxModelSurface *)sceneEnt->surfs;
    int triCount = 0;
    int vertCount = 0;
    for (int index = 0; index < sceneEnt->surfCount; ++index)
    {
        const Material *material = sceneEnt->materials[index];
        if (!material)
            continue;
        R_AddDrawSurf(material, surface->surfType == 5 ? 2047 : entIndex,
            31, &surface->surfType);
        if (r_showTriCounts->current.enabled)
            triCount += surface->xsurf->triCount;
        else if (r_showVertCounts->current.enabled)
            vertCount += surface->xsurf->vertCount;
        surface = (GfxModelSurface *)((byte *)surface + s_XModelSurfaceSize[surface->surfType]);
    }
    int count;
    if (r_showTriCounts->current.enabled)
        count = triCount;
    else if (r_showVertCounts->current.enabled)
        count = vertCount;
    else if (r_showSurfCounts->current.enabled)
        count = sceneEnt->surfCount;
    else
        return;
    R_AddScaledDebugString(&frontEndDataOut->debugGlobals, rg.debugViewParms,
        ent->origin, colorCyan, va("%i", count));
}

// PINNED PC ref-entity submission, 10023db0/209.
typedef char refEntityLayoutCheck[(sizeof(GfxEntity) == 116 && sizeof(GfxSceneEntity) == 52
    && sizeof(GfxModel) == 4 && offsetof(GfxEntity, scale) == 0x38
    && offsetof(GfxEntity, customMaterial) == 0x54
    && offsetof(GfxSceneEntity, u) == 4 && offsetof(GfxSceneEntity, cent) == 8
    && offsetof(GfxBackEndData, entityCount) == 0xa000c) ? 1 : -1];

extern const dvar_t *com_statmon;
void R_DrawModel(int entIndex);

// PINNED 10023780/128; private helper name unconfirmed.
static void R_CopyRefEntityToScene(int entIndex, const GfxEntity *refEnt, GfxModel sceneModel)
{
    GfxEntity *ent = &scene.def.entities[entIndex];
    *ent = *refEnt;
    if (refEnt->scale == 0.0f)
        ent->scale = 1.0f;
    GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    memset(sceneEnt, 0, sizeof(*sceneEnt));
    if (refEnt->reType >= 4)
        R_AddDrawSurf(refEnt->customMaterial, entIndex, 31, &s_entitySurface);
    else
        sceneEnt->u = sceneModel;
}

// PINNED 10023cc0/128; private helper name unconfirmed.
static GfxEntity *R_AddModelRefEntity(const GfxEntity *refEnt, GfxModel sceneModel,
    const centity_s *cent)
{
    int entIndex = R_AllocSceneEntity();
    if (entIndex < 0)
        return 0;
    GfxEntity *ent = &scene.def.entities[entIndex];
    *ent = *refEnt;
    if (refEnt->scale == 0.0f)
        ent->scale = 1.0f;
    GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    memset(sceneEnt, 0, sizeof(*sceneEnt));
    sceneEnt->u = sceneModel;
    sceneEnt->cent = cent;
    if (refEnt->reType == 1)
        R_DrawModel(entIndex);
    return ent;
}

// PINNED 10023db0/209: higher entity types warn before allocation is attempted.
GfxEntity *R_AddRefEntityToScene(const GfxEntity *refEnt, GfxModel sceneModel,
    const centity_s *cent)
{
    static int refEntityWarnFrame;
    if (refEnt->reType <= 1)
        return R_AddModelRefEntity(refEnt, sceneModel, cent);
    if (com_statmon->current.enabled && (unsigned int)frontEndDataOut->entityCount >= 7365)
        ri.StatMon_Warning(5, 3000, "gfx/2d/warning@models.jpg");
    if (refEnt->reType < 0 || refEnt->reType >= 10)
        R_Error(ERR_DROP, "\x15R_AddRefEntityToScene: bad reType %i", refEnt->reType);
    if ((unsigned int)frontEndDataOut->entityCount >= 8184)
    {
        if (refEntityWarnFrame != frontEndDataOut->frameCount)
        {
            refEntityWarnFrame = frontEndDataOut->frameCount;
            ri.Printf(2, "refEntity buffer exceeded - not drawing model\n");
        }
        return 0;
    }
    int entIndex = R_AllocSceneEntity();
    if (entIndex < 0)
        return 0;
    R_CopyRefEntityToScene(entIndex, refEnt, sceneModel);
    return &scene.def.entities[entIndex];
}

// PINNED 10024460/70: selection sort swaps the entire surface record.
static void R_ShortSortDrawSurfs(GfxDrawSurf *lo, GfxDrawSurf *hi)
{
    while (hi > lo)
    {
        GfxDrawSurf *max = lo;
        for (GfxDrawSurf *p = lo + 1; p <= hi; ++p)
            if (p->sort > max->sort)
                max = p;
        GfxDrawSurf temp = *max;
        *max = *hi;
        *hi = temp;
        --hi;
    }
}

// PINNED 100244b0/301: keep retail's second division by the record size.
void qsortDrawSurfs(GfxDrawSurf *drawSurfs, int drawSurfCount)
{
    GfxDrawSurf *lostk[30];
    GfxDrawSurf *histk[30];
    if (drawSurfCount < 2)
        return;
    int stkptr = 0;
    GfxDrawSurf *lo = drawSurfs;
    GfxDrawSurf *hi = drawSurfs + drawSurfCount - 1;
    for (;;)
    {
        int size = (unsigned int)(hi - lo) / sizeof(*lo) + 1;
        if (size <= 8)
        {
            R_ShortSortDrawSurfs(lo, hi);
        }
        else
        {
            GfxDrawSurf *mid = lo + size / 2;
            GfxDrawSurf temp = *mid;
            *mid = *lo;
            *lo = temp;
            GfxDrawSurf *loguy = lo;
            GfxDrawSurf *higuy = hi + 1;
            for (;;)
            {
                do { ++loguy; } while (loguy <= hi && loguy->sort <= lo->sort);
                do { --higuy; } while (higuy > lo && higuy->sort >= lo->sort);
                if (higuy < loguy)
                    break;
                temp = *loguy;
                *loguy = *higuy;
                *higuy = temp;
            }
            temp = *lo;
            *lo = *higuy;
            *higuy = temp;
            if (higuy - 1 - lo >= hi - loguy)
            {
                if (lo < higuy - 1)
                {
                    lostk[stkptr] = lo;
                    histk[stkptr++] = higuy - 1;
                }
                if (loguy < hi)
                {
                    lo = loguy;
                    continue;
                }
            }
            else
            {
                if (loguy < hi)
                {
                    lostk[stkptr] = loguy;
                    histk[stkptr++] = hi;
                }
                if (lo < higuy - 1)
                {
                    hi = higuy - 1;
                    continue;
                }
            }
        }
        if (--stkptr < 0)
            return;
        lo = lostk[stkptr];
        hi = histk[stkptr];
    }
}

// Scene rendering modes; names describe roles pinned by the retail callers.
extern DxGlobals dx;
extern vidConfig_t vidConfig;
extern const dvar_t *r_clearColor;
extern const dvar_t *r_zFeather;
void R_AddCmdBeginView(int viewCount, const GfxSceneDef *sceneDef,
    const GfxViewParms *viewParms, const GfxLodParms *lodParms);
void R_AddCmdSetRenderTarget(GfxRenderTargetId renderTargetId);
void R_AddCmdSetViewport(int x, int y, int width, int height);
void R_AddCmdClearScreen(int whichToClear, const float *color, float depth, int stencil);
void R_AddCmdLightProperties(int lightIndex, const GfxLight *light);
void R_AddCmdDrawSurfs(GfxDrawSurf *drawSurfs, int drawSurfCount,
    MaterialTechniqueType techType, GfxDrawSurfOrder order);
void R_AddCmdDrawSun(int viewIndex);
int R_BeginDrawGroupSection(int group);
void R_BeginDrawGroupLoop(int group, int view);
int R_EndDrawGroupLoop(int group, int view);
void R_EndDrawGroupSection(int group);

typedef char sceneModeLayoutCheck[
    offsetof(DxGlobals, multiSampleQuality) == 0x2c28 &&
    offsetof(DxGlobals, renderTargets) + 6 * sizeof(GfxRenderTarget)
        + offsetof(GfxRenderTarget, colorSurface) == 0x2cac &&
    offsetof(r_globals_t, fogSettings) + 2 * sizeof(GfxFog)
        + offsetof(GfxFog, color) == 0x14b8 &&
    offsetof(r_globals_t, fogSettings) + 2 * sizeof(GfxFog)
        + offsetof(GfxFog, registered) == 0x14c8 ? 1 : -1];

// PINNED 10024920/156: fog is BGRA; the clear-color dvar is RGBA.
float *R_GetClearColor(float *color)
{
    if (rg.fogSettings[2].registered)
    {
        color[0] = rg.fogSettings[2].color.array[2] * 0.0039215689f;
        color[1] = rg.fogSettings[2].color.array[1] * 0.0039215689f;
        color[2] = rg.fogSettings[2].color.array[0] * 0.0039215689f;
    }
    else
    {
        color[0] = r_clearColor->current.color[0] * 0.0039215689f;
        color[1] = r_clearColor->current.color[1] * 0.0039215689f;
        color[2] = r_clearColor->current.color[2] * 0.0039215689f;
    }
    color[3] = 1.0f;
    return color;
}

// PINNED 100249c0/97: shadow type1 permits a color-only multisampled clear.
void R_AddClearCommandsForFrameBuffer(int dynamicShadowType)
{
    int flags;
    if (dx.multiSampleQuality && (dynamicShadowType == 1
        || (r_rendererInUse->current.integer != 2
            && r_zFeather->current.enabled && dx.renderTargets[6].colorSurface)))
        flags = 1;
    else
        flags = 7;
    float color[4];
    const float *clearColor = R_GetClearColor(color);
    R_AddCmdClearScreen(flags, clearColor, 1.0f, 0);
}

// PINNED 10024c80/261: DX7 base, lighting and emissive passes share one view.
void R_RenderSceneDx7(int viewIndex, const GfxViewParms *viewParms,
    GfxDrawSurf *drawSurfs, int drawSurfCount)
{
    R_AddCmdBeginView(scene.viewCount, &scene.def, viewParms, &rg.lodParms);
    R_AddCmdSetRenderTarget((GfxRenderTargetId)0);
    R_AddClearCommandsForFrameBuffer(0);
    R_AddCmdLightProperties(0, &rgp.world->sunLight);
    R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, (MaterialTechniqueType)1, (GfxDrawSurfOrder)0);
    R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, (MaterialTechniqueType)6, (GfxDrawSurfOrder)0);
    R_AddCmdDrawSun(viewIndex);
    R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, (MaterialTechniqueType)0x15, (GfxDrawSurfOrder)0);
}

// PINNED 10024d90/451: group4 starts here and remains open for later drawing.
void R_RenderSceneFullbright(int viewIndex, const GfxViewParms *viewParms,
    GfxDrawSurf *drawSurfs, int drawSurfCount)
{
    if (!R_BeginDrawGroupSection(3))
    {
        R_AddCmdSetRenderTarget((GfxRenderTargetId)0);
        R_AddCmdSetViewport(0, 0, vidConfig.width, vidConfig.height);
        R_AddClearCommandsForFrameBuffer(0);
    }
    R_BeginDrawGroupLoop(3, viewIndex);
    R_AddCmdBeginView(scene.viewCount, &scene.def, viewParms, &rg.lodParms);
    R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, (MaterialTechniqueType)3, (GfxDrawSurfOrder)0);
    R_AddCmdDrawSun(viewIndex);
    R_EndDrawGroupLoop(3, viewIndex);
    R_EndDrawGroupSection(3);
    if (!R_BeginDrawGroupSection(4))
        R_AddCmdSetViewport(0, 0, vidConfig.width, vidConfig.height);
    R_BeginDrawGroupLoop(4, viewIndex);
    R_AddCmdBeginView(scene.viewCount, &scene.def, viewParms, &rg.lodParms);
}

// PINNED 10024f60/217: debug shader uses technique33 without sun/light passes.
void R_RenderSceneDebugShader(const GfxViewParms *viewParms,
    GfxDrawSurf *drawSurfs, int drawSurfCount)
{
    R_AddCmdBeginView(scene.viewCount, &scene.def, viewParms, &rg.lodParms);
    R_AddCmdSetRenderTarget((GfxRenderTargetId)0);
    R_AddClearCommandsForFrameBuffer(0);
    R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, (MaterialTechniqueType)0x21, (GfxDrawSurfOrder)0);
}

// Normal scene command generation.
void R_AddCmdDrawFullScreenColoredQuad(float s0, float t0, float s1, float t1,
    const vec_t *color, MaterialHandle material);
void R_AddCmdApplyEarlyPostEffects();
void R_AddCmdApplyLatePostEffects(float blurRadius);
void R_AddCmdDrawSunPostEffects(int viewIndex);
void R_DrawShadowCookies(int viewIndex, const GfxViewParms *viewParms, const ShadowCookieList *shadows);

struct GfxSceneRenderOptions
{
    float blurRadius;
    Bool fullScreen;
};

typedef char normalScenePayloadCheck[
    sizeof(PointLightPartition) == 12 && sizeof(GfxSceneRenderOptions) == 8 &&
    offsetof(GfxSceneRenderOptions, fullScreen) == 4 &&
    offsetof(r_global_permanent_t, clearAlphaStencilMaterial) == 0x1048 &&
    offsetof(r_global_permanent_t, shadowClearMaterial) == 0x104c ? 1 : -1];

// PINNED 100247f0/296: capture each partition before emitting its commands.
void R_DrawPointLightSurfs(int lightCount, const PointLightPartition *partitions)
{
    for (int i = 0; i < lightCount; ++i)
    {
        const GfxLight *light = partitions[i].light;
        GfxDrawSurf *surfs = scene.drawSurfs + partitions[i].firstDrawSurf;
        int count = partitions[i].drawSurfCount;
        R_AddCmdDrawFullScreenColoredQuad(0.0f, 0.0f, 1.0f, 1.0f,
            colorWhite, rgp.clearAlphaStencilMaterial);
        R_AddCmdLightProperties(0, light);
        R_AddCmdDrawSurfs(surfs, count, (MaterialTechniqueType)0x12, (GfxDrawSurfOrder)0);
    }
}

// PINNED 10024a40/53: the target constant10191488 is white, including alpha.
void R_ClearFloatZ()
{
    R_AddCmdClearScreen(6, colorWhite, 1.0f, 0);
    R_AddCmdDrawFullScreenColoredQuad(0.0f, 0.0f, 1.0f, 1.0f,
        colorWhite, rgp.shadowClearMaterial);
}

// PINNED 10024a90/456: floatZ precedes shadow depth when available.
void R_RenderSceneDepth(int viewIndex, const GfxViewParms *viewParms,
    GfxDrawSurf *drawSurfs, int drawSurfCount, int dynamicShadowType)
{
    if (r_rendererInUse->current.integer != 2 && r_zFeather->current.enabled
        && dx.renderTargets[6].colorSurface)
    {
        if (!R_BeginDrawGroupSection(0))
        {
            R_AddCmdSetRenderTarget((GfxRenderTargetId)6);
            R_ClearFloatZ();
        }
        R_BeginDrawGroupLoop(0, viewIndex);
        R_AddCmdBeginView(scene.viewCount, &scene.def, viewParms, &rg.lodParms);
        R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, (MaterialTechniqueType)2, (GfxDrawSurfOrder)0);
        R_EndDrawGroupLoop(0, viewIndex);
        R_EndDrawGroupSection(0);
    }
    else if (dynamicShadowType == 1)
    {
        if (!R_BeginDrawGroupSection(0))
        {
            R_AddCmdSetRenderTarget((GfxRenderTargetId)3);
            R_AddCmdClearScreen(7, colorWhite, 1.0f, 0);
        }
        R_BeginDrawGroupLoop(0, viewIndex);
        R_AddCmdBeginView(scene.viewCount, &scene.def, viewParms, &rg.lodParms);
        R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, (MaterialTechniqueType)0, (GfxDrawSurfOrder)0);
        R_EndDrawGroupLoop(0, viewIndex);
        R_EndDrawGroupSection(0);
    }
}

// PINNED 10025040/694: preserve delayed-group boundaries and live post settings.
void R_RenderSceneNormal(int viewIndex, const GfxViewParms *viewParms,
    const GfxSceneRenderOptions *options, GfxDrawSurf *drawSurfs, int drawSurfCount,
    int dynamicShadowType, const ShadowCookieList *shadows,
    const PointLightPartition *partitions, int lightCount)
{
    R_RenderSceneDepth(viewIndex, viewParms, drawSurfs, drawSurfCount, dynamicShadowType);
    if (dynamicShadowType == 1)
        R_DrawShadowCookies(viewIndex, viewParms, shadows);
    if (!R_BeginDrawGroupSection(2))
    {
        R_AddCmdSetRenderTarget((GfxRenderTargetId)0);
        R_AddCmdSetViewport(0, 0, vidConfig.width, vidConfig.height);
        R_AddClearCommandsForFrameBuffer(dynamicShadowType);
        R_AddCmdLightProperties(0, &rgp.world->sunLight);
    }
    R_BeginDrawGroupLoop(2, viewIndex);
    R_AddCmdBeginView(scene.viewCount, &scene.def, viewParms, &rg.lodParms);
    R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, (MaterialTechniqueType)1, (GfxDrawSurfOrder)0);
    R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, (MaterialTechniqueType)6, (GfxDrawSurfOrder)0);
    R_AddCmdDrawSun(viewIndex);
    if (!R_EndDrawGroupLoop(2, viewIndex) && options->fullScreen)
        R_AddCmdApplyEarlyPostEffects();
    R_EndDrawGroupSection(2);
    R_BeginDrawGroupSection(3);
    R_BeginDrawGroupLoop(3, viewIndex);
    R_AddCmdBeginView(scene.viewCount, &scene.def, viewParms, &rg.lodParms);
    R_DrawPointLightSurfs(lightCount, partitions);
    MaterialTechniqueType technique = (MaterialTechniqueType)0x15;
    if (r_zFeather->current.enabled && dx.renderTargets[6].colorSurface)
        technique = (MaterialTechniqueType)0x18;
    R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, technique, (GfxDrawSurfOrder)0);
    R_EndDrawGroupLoop(3, viewIndex);
    R_EndDrawGroupSection(3);
    R_BeginDrawGroupSection(4);
    R_BeginDrawGroupLoop(4, viewIndex);
    R_AddCmdBeginView(scene.viewCount, &scene.def, viewParms, &rg.lodParms);
    if (options->fullScreen)
        R_AddCmdApplyLatePostEffects(options->blurRadius);
    R_AddCmdDrawSunPostEffects(viewIndex);
}

extern const dvar_t *r_fullbright;
extern const dvar_t *r_debugShader;

// PINNED 10025300/126: fullbright wins over DX7, then shader debug, then normal.
void R_RenderSceneMode(int viewIndex, const GfxViewParms *viewParms,
    const GfxSceneRenderOptions *options, GfxDrawSurf *drawSurfs, int drawSurfCount,
    int dynamicShadowType, const ShadowCookieList *shadows,
    const PointLightPartition *partitions, int lightCount)
{
    if (r_fullbright->current.enabled)
        R_RenderSceneFullbright(viewIndex, viewParms, drawSurfs, drawSurfCount);
    else if (r_rendererInUse->current.integer == 2)
        R_RenderSceneDx7(viewIndex, viewParms, drawSurfs, drawSurfCount);
    else if (r_debugShader->current.integer)
        R_RenderSceneDebugShader(viewParms, drawSurfs, drawSurfCount);
    else
        R_RenderSceneNormal(viewIndex, viewParms, options, drawSurfs, drawSurfCount,
            dynamicShadowType, shadows, partitions, lightCount);
}

// Outer scene driver and API59 rendering callback.
extern const dvar_t *sc_enable;
extern const dvar_t *sc_showOverlay;
extern const dvar_t *r_dlightLimit;
extern const dvar_t *r_showTris;
extern const dvar_t *r_norefresh;
extern const dvar_t *r_debugEntCounts;
int R_CellForPoint(const vec_t *origin);
void R_AddWorldSurfacesDpvs(const GfxViewParms *viewParms, int cameraCell);
void R_PopulateCandidates(const float *viewOrigin, ShadowCandidate *candidates);
void R_SortShadowCandidates(ShadowCandidate *candidates);
void R_BuildShadowCookieList(const GfxViewParms *viewParms, const ShadowCandidate *candidates,
    ShadowCookieList *shadows);
int R_GetPointLightPartitions(const GfxDrawSurf *drawSurfs, int drawSurfCount,
    PointLightPartition *partitions, int maxPartitions);
void R_UnlockSkinnedCache();
void R_DrawShadowCookieOverlay();
void RB_LogPrint(const char *text);

// PINNED 10025380/386: snapshot the base draw list after marks/effects emit it.
static void R_GenerateSceneCommands(const GfxViewParms *cullView, int viewIndex,
    const GfxViewParms *viewParms, const GfxSceneRenderOptions *options)
{
    int cell = R_CellForPoint(cullView->origin);
    if (rgp.world && rgp.world->cells)
        R_AddWorldSurfacesDpvs(cullView, cell);
    ri.CG_AddMarks();
    ri.FX_UpdateAndDraw();
    int drawSurfCount = scene.drawSurfCount;
    GfxDrawSurf *drawSurfs = scene.drawSurfs;
    qsortDrawSurfs(drawSurfs, drawSurfCount);
    int dynamicShadowType = 0;
    ShadowCookieList shadows;
    if (r_rendererInUse->current.integer != 2 && sc_enable->current.enabled)
    {
        ShadowCandidate candidates[24];
        dynamicShadowType = 1;
        R_PopulateCandidates(cullView->origin, candidates);
        R_SortShadowCandidates(candidates);
        R_BuildShadowCookieList(viewParms, candidates, &shadows);
    }
    PointLightPartition partitions[256];
    int lightCount = 0;
    if (r_rendererInUse->current.integer != 2 && r_dlightLimit->current.integer)
        lightCount = R_GetPointLightPartitions(drawSurfs, drawSurfCount, partitions, 256);
    R_RenderSceneMode(viewIndex, viewParms, options, drawSurfs, drawSurfCount,
        dynamicShadowType, &shadows, partitions, lightCount);
    if (r_showTris->current.integer)
    {
        if (r_showTris->current.integer & 2)
            R_AddCmdClearScreen(6, colorWhite, 1.0f, 0);
        R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, (MaterialTechniqueType)0x1d, (GfxDrawSurfOrder)0);
    }
    R_UnlockSkinnedCache();
    if (dynamicShadowType == 1 && sc_showOverlay->current.enabled)
        R_DrawShadowCookieOverlay();
}

// PINNED 100257a0/371: genuine API59 slot36; refdef's view index is at+84.
void R_RenderScene(const refdef_t *refdef)
{
    if (!rg.registered)
        return;
    RB_LogPrint("====== R_RenderScene ======\n");
    if (r_norefresh->current.enabled)
        return;
    if (!rgp.world)
        R_Error(ERR_DROP, "\x15R_RenderScene: NULL worldmodel");
    scene.def.time = refdef->time;
    scene.def.floatTime = (float)refdef->time * 0.001f;
    VectorCopy(refdef->vieworg, rg.viewOrg);
    VectorCopy(refdef->viewaxis[0], rg.viewDir);
    GfxBackEndData *data = frontEndDataOut;
    GfxViewParms *viewParms = &data->viewParms[data->viewParmCount++];
    R_SetViewParmsForScene(viewParms, refdef);
    GfxSceneRenderOptions options;
    options.blurRadius = refdef->blurRadius;
    options.fullScreen = refdef->width == vidConfig.width && refdef->height == vidConfig.height;
    const GfxViewParms *cullView = r_lockPvs->current.enabled ? &lockPvsViewParms : viewParms;
    R_UpdateFrameFog();
    R_GenerateSceneCommands(cullView, refdef->viewIndex, viewParms, &options);
    const dvar_t *debugCounts = r_debugEntCounts;
    if (debugCounts->current.integer && scene.def.entityCount > debugCounts->current.integer)
    {
        ri.Dvar_SetInt(debugCounts, 0);
        R_DumpSceneEntities();
    }
}

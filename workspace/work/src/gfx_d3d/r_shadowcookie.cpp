// PINNED PC candidate selection 10027d00/573; name supported by KisakCOD.
#include <algorithm>
#include "gfx.h"
#include "r_scene_commands.h"

#pragma optimize("p", on)

typedef char shadow_entity_size[(sizeof(GfxEntity) == 0x74) ? 1 : -1];
typedef char shadow_scene_entity_size[(sizeof(GfxSceneEntity) == 0x34) ? 1 : -1];
typedef char shadow_scene_entities[(offsetof(GfxScene, sceneEnts) == 0x5c4) ? 1 : -1];
typedef char shadow_origin_offset[(offsetof(GfxEntity, origin) == 0x3c) ? 1 : -1];

ShadowCookieGlob shadowCookieGlob;

// PINNED 100016e9: inlined into R_LoadWorld.
void Com_Memset(void *dest, const int val, int count);

// Shadow-cookie command generation.
extern DxGlobals dx;
extern const dvar_t *sc_debugCasterCount;
extern const dvar_t *sc_debugReceiverCount;
extern const dvar_t *sc_blur;
extern const dvar_t *r_zFeather;
int R_BeginDrawGroupSection(int group);
void R_BeginDrawGroupLoop(int group, int view);
int R_EndDrawGroupLoop(int group, int view);
void R_EndDrawGroupSection(int group);
void R_AddCmdSetRenderTarget(GfxRenderTargetId renderTargetId);
void R_AddCmdSetViewport(int x, int y, int width, int height);
void R_AddCmdClearScreen(int whichToClear, const float *color, float depth, int stencil);
void R_AddCmdBeginView(int viewCount, const GfxSceneDef *sceneDef,
    const GfxViewParms *viewParms, const GfxLodParms *lodParms);
void R_AddCmdDrawSurfs(GfxDrawSurf *drawSurfs, int drawSurfCount,
    MaterialTechniqueType technique, GfxDrawSurfOrder order);
void R_AddCmdId9(const RcWords16 *data, int extra);
void R_AddCmdHeaderOnly1C();
void qsortDrawSurfs(GfxDrawSurf *drawSurfs, int drawSurfCount);

typedef char shadowDrawLayoutCheck[
    sizeof(ShadowCookie) == 108 && offsetof(ShadowCookie, fade) == 104 &&
    offsetof(ShadowCookie, shadowViewParms) == 100 &&
    offsetof(ShadowCookieList, cookieCount) == 0xa20 &&
    sizeof(RcWords16) == 64 ? 1 : -1];

// Shadow selection and cookie creation.
extern const dvar_t *sc_length;
extern const dvar_t *sc_fadeRange;
extern const dvar_t *sc_wantCount;
extern const dvar_t *sc_wantCountMargin;
extern const dvar_t *sc_shadowInRate;
extern const dvar_t *sc_shadowOutRate;
void R_UpdateXModelBounds(GfxSceneEntity *sceneEnt, const GfxEntity *ent);
void R_SkinSceneEnt(GfxSceneEntity *sceneEnt, GfxEntity *ent);
void R_AddXModelSurfaces(int entIndex);
void R_FrustumClipPlanes(const D3DMATRIX *viewProjection, const vec4_t *sides,
    int sideCount, DpvsPlane *planes);
void MatrixMultiply44(const float first[4][4], const float second[4][4], float out[4][4]);
void MatrixInverse44(const float *matrix, float *out);

// PINNED 10027c80/116: the overlay is square and uses one quarter of video width.
extern vidConfig_t vidConfig;
void MatrixIdentity44(float matrix[4][4]);
void R_AddCmdDrawStretchPic(float x, float y, float width, float height,
    float s0, float t0, float s1, float t1, const vec_t *color, MaterialHandle material);
void R_PopulateCandidates(const float *viewOrigin, ShadowCandidate *candidates);
void R_ResetShadowCookies();
void R_EmitShadowCookieSurfs(GfxDrawSurf *drawSurfs, int drawSurfCount, MaterialTechniqueType technique);
void R_ClearShadowReceiverTarget();
void R_DrawShadowCookies(int viewIndex, const GfxViewParms *viewParms,
    const ShadowCookieList *shadows);
static bool R_CompareShadowCandidates(const ShadowCandidate &a, const ShadowCandidate &b);
void R_SortShadowCandidates(ShadowCandidate *candidates);
static void R_GetShadowLightAxis(vec3_t *axis);
static void R_SetShadowViewParms(GfxViewParms *view, const float *mins, const float *maxs);
static bool R_IsShadowReceiverOutside(const float *bounds, const DpvsPlane *planes);
static void R_AddShadowReceivers(ShadowCookie *cookie, int sourceCount, int casterIndex);
static void R_CreateShadowCookie(const GfxViewParms *viewParms, int sourceCount,
    int entIndex, float fade, ShadowCookieList *shadows);
void R_BuildShadowCookieList(const GfxViewParms *viewParms, const ShadowCandidate *candidates,
    ShadowCookieList *shadows);
void R_DrawShadowCookieOverlay();

void R_ResetShadowCookies()
{
    // shortcut: real call where retail keeps only dead setup; fits the R_LoadWorld slot, bytes differ.
    Com_Memset(&shadowCookieGlob, 0, sizeof(shadowCookieGlob));
    shadowCookieGlob.weightCap = 10.0f;
    shadowCookieGlob.lastTime = -1;
}

// PINNED 10027170/30; the original VC7.1 STL supplies the sort implementation.
static bool R_CompareShadowCandidates(const ShadowCandidate &a, const ShadowCandidate &b)
{
    return a.weight < b.weight;
}

void R_SortShadowCandidates(ShadowCandidate *candidates)
{
    std::sort(candidates, candidates + 24, R_CompareShadowCandidates);
}

// PINNED 10027930/839: a new empty group still selects/clears its receiver target.
// Name unconfirmed; PINNED out-of-line copy 10027190/27.
void R_EmitShadowCookieSurfs(GfxDrawSurf *drawSurfs, int drawSurfCount, MaterialTechniqueType technique)
{
    qsortDrawSurfs(drawSurfs, drawSurfCount);
    R_AddCmdDrawSurfs(drawSurfs, drawSurfCount, technique, (GfxDrawSurfOrder)0);
}

// PINNED 100271b0/220: choose a stable perpendicular to the incoming sun ray.
static void R_GetShadowLightAxis(vec3_t *axis)
{
    VectorNegate(rgp.world->sunLight.position, axis[0]);
    if (axis[0][1] * axis[0][1] + axis[0][0] * axis[0][0] >= 0.1f)
    {
        axis[2][0] = 0.0f;
        axis[2][2] = 1.0f;
    }
    else
    {
        axis[2][0] = 1.0f;
        axis[2][2] = 0.0f;
    }
    axis[2][1] = 0.0f;
    Vec3Cross(axis[2], axis[0], axis[1]);
    Vec3Normalize(axis[1]);
    Vec3Cross(axis[0], axis[1], axis[2]);
}

// PINNED 10027290/673: orthographic shadow projection includes the128px border.
static void R_SetShadowViewParms(GfxViewParms *view, const float *mins, const float *maxs)
{
    vec3_t axis[3];
    R_GetShadowLightAxis(axis);
    VectorNegate(axis[1], axis[1]);
    vec3_t projectedMins, projectedMaxs;
    for (unsigned int corner = 0; corner < 8; ++corner)
    {
        vec3_t point;
        for (int i = 0; i < 3; ++i)
            point[i] = corner & (1u << i) ? maxs[i] : mins[i];
        for (int i = 0; i < 3; ++i)
        {
            float coordinate = point[1] * axis[i][1] + point[0] * axis[i][0] + point[2] * axis[i][2];
            if (!corner || projectedMaxs[i] < coordinate)
                projectedMaxs[i] = coordinate;
            if (!corner || coordinate < projectedMins[i])
                projectedMins[i] = coordinate;
        }
    }
    float (*matrix)[4] = (float (*)[4])&view->viewMatrix;
    for (int i = 0; i < 3; ++i)
    {
        int column = (i + 2) % 3;
        float scale = column == 2 ? 1.0f / sc_length->current.value
            : (2.0f / (projectedMaxs[i] - projectedMins[i])) * 0.9375f;
        for (int row = 0; row < 3; ++row)
            matrix[row][column] = axis[i][row] * scale;
        matrix[3][column] = (projectedMins[i] + projectedMaxs[i]) * -0.5f * scale;
    }
    matrix[0][3] = matrix[1][3] = matrix[2][3] = 0.0f;
    matrix[3][3] = 1.0f;
    AxisCopy(axis, view->axis);
    VectorClear(view->origin);
    memset(&view->projectionMatrix, 0, sizeof(view->projectionMatrix));
    float (*projection)[4] = (float (*)[4])&view->projectionMatrix;
    projection[0][0] = 0.9843749403953552f;
    projection[1][1] = 0.9843749403953552f;
    projection[2][2] = 0.5f;
    projection[3][2] = 0.5f;
    projection[3][3] = 1.0f;
    view->depthHackNearClip = -projection[3][2];
    MatrixMultiply44((const float (*)[4])&view->viewMatrix,
        (const float (*)[4])&view->projectionMatrix, (float (*)[4])&view->viewProjectionMatrix);
    MatrixInverse44((const float *)&view->viewProjectionMatrix, (float *)&view->inverseViewProjectionMatrix);
    view->viewport.X = view->viewport.Y = 0;
    view->viewport.Width = view->viewport.Height = 128;
    view->viewport.MinZ = 0.0f;
    view->viewport.MaxZ = 1.0f;
}

// PINNED 10027540/69: all five planes test the far corner of receiver bounds.
static bool R_IsShadowReceiverOutside(const float *bounds, const DpvsPlane *planes)
{
    for (int i = 0; i != 5; ++i)
    {
        const DpvsPlane *plane = &planes[i];
        if (*(const float *)((const byte *)bounds + plane->side[0]) * plane->coeffs[0]
            + *(const float *)((const byte *)bounds + plane->side[1]) * plane->coeffs[1]
            + *(const float *)((const byte *)bounds + plane->side[2]) * plane->coeffs[2]
            + plane->coeffs[3] <= 0.0f)
            return true;
    }
    return false;
}

// PINNED retail table 101904a8: file-scope so no stack copy is made.
static const vec4_t shadowReceiverSides[5] = {{-1.0f, 0.0f, 0.0f, 1.0f}, {1.0f, 0.0f, 0.0f, 1.0f},
    {0.0f, -1.0f, 0.0f, 1.0f}, {0.0f, 1.0f, 0.0f, 1.0f}, {0.0f, 0.0f, 1.0f, 0.0f}};

// PINNED 10027590/303:ignore the caster itself and surfaces without receiver technique32.
static void R_AddShadowReceivers(ShadowCookie *cookie, int sourceCount, int casterIndex)
{
    cookie->firstReceiverDrawSurf = cookie->firstUnusedDrawSurf = scene.drawSurfCount;
    DpvsPlane planes[5];
    R_FrustumClipPlanes(&cookie->shadowViewParms->viewProjectionMatrix, shadowReceiverSides, 5, planes);
    if (sourceCount <= 0)
        return;
    int i = 0;
    do
    {
        const GfxDrawSurf *surf = &scene.drawSurfs[i];
        unsigned int key = surf->sort;
        unsigned int isEntity = key & 0x80000000u;
        int entIndex = (isEntity ? key >> 19 : key >> 4) & 0xfff;
        if (entIndex >= 2048)
            entIndex = 2046;
        const Material *material = rgp.sortedMaterials[(isEntity ? key >> 9 : key >> 21) & 0x3ff];
        if (!material->techniqueSet->techniques[32] || entIndex == casterIndex)
            continue;
        const float *bounds;
        if (*surf->surface == 6)
            bounds = (const float *)((const srfTriangles_t *)surf->surface)->bounds;
        else if (entIndex < 2046 && (scene.def.entities[entIndex].renderFxFlags & 0x100))
            bounds = scene.sceneEnts[entIndex].curMins;
        else
            continue;
        if (R_IsShadowReceiverOutside(bounds, planes))
            continue;
        scene.drawSurfs[cookie->firstUnusedDrawSurf] = *surf;
        ++cookie->firstUnusedDrawSurf;
        ++scene.drawSurfCount;
        ++frontEndDataOut->drawSurfCount;
    } while (++i != sourceCount);
}

// PINNED 100276d0/499: degenerate caster bounds do not allocate a cookie or view.
static void R_CreateShadowCookie(const GfxViewParms *viewParms, int sourceCount,
    int entIndex, float fade, ShadowCookieList *shadows)
{
    GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    GfxEntity *ent = &scene.def.entities[entIndex];
    ri.CG_UsedDObjCalcPose(sceneEnt->cent);
    R_UpdateXModelBounds(sceneEnt, ent);
    vec3_t size;
    VectorSubtract(sceneEnt->curMaxs, sceneEnt->curMins, size);
    if (size[1] * size[1] + size[0] * size[0] + size[2] * size[2] == 0.0f)
        return;
    ShadowCookie *cookie = &shadows->cookies[shadows->cookieCount++];
    GfxBackEndData *data = frontEndDataOut;
    cookie->shadowViewParms = &data->viewParms[data->viewParmCount++];
    R_SetShadowViewParms(cookie->shadowViewParms, sceneEnt->curMins, sceneEnt->curMaxs);
    cookie->fade = fade;
    cookie->shadowLookupMatrix = cookie->shadowViewParms->viewProjectionMatrix;
    float (*lookup)[4] = (float (*)[4])&cookie->shadowLookupMatrix;
    for (int i = 0; i < 4; ++i)
        lookup[i][1] = -lookup[i][1];
    for (int i = 0; i < 2; ++i)
    {
        lookup[0][i] *= 0.5f;
        lookup[1][i] *= 0.5f;
        lookup[2][i] *= 0.5f;
        lookup[3][i] = (lookup[3][i] + 1.0f) * 0.5f;
    }
    VectorCopy(sceneEnt->curMins, cookie->boxMin);
    VectorCopy(sceneEnt->curMaxs, cookie->boxMax);
    cookie->firstCasterDrawSurf = scene.drawSurfCount;
    if (shadows->cookieCount <= sc_debugCasterCount->current.integer)
    {
        rg.debugViewParms = viewParms;
        ri.CG_CullIn(sceneEnt->cent);
        R_SkinSceneEnt(sceneEnt, ent);
        R_AddXModelSurfaces(entIndex);
    }
    R_AddShadowReceivers(cookie, sourceCount, entIndex);
}

// Name unconfirmed; PINNED out-of-line copy 100278f0/53.
void R_ClearShadowReceiverTarget()
{
    if (r_rendererInUse->current.integer != 2 && r_zFeather->current.enabled
        && dx.renderTargets[6].colorSurface)
        R_AddCmdClearScreen(1, colorWhite, 0.0f, 0);
}

void R_DrawShadowCookies(int viewIndex, const GfxViewParms *viewParms,
    const ShadowCookieList *shadows)
{
    bool first = !R_BeginDrawGroupSection(1);
    R_BeginDrawGroupLoop(1, viewIndex);
    const float clearColor[4] = {0.5f, 0.5f, 0.5f, 0.0f};
    int i = 0;
    if (shadows->cookieCount)
    {
        do
        {
            const ShadowCookie *cookie = &shadows->cookies[i];
            int casterCount = cookie->firstReceiverDrawSurf - cookie->firstCasterDrawSurf;
            int receiverCount = cookie->firstUnusedDrawSurf - cookie->firstReceiverDrawSurf;
            if (receiverCount && casterCount && i < sc_debugCasterCount->current.integer)
            {
                RcWords16 matrix;
                int fade;
                memcpy(&matrix, &cookie->shadowLookupMatrix, sizeof(matrix));
                memcpy(&fade, &cookie->fade, sizeof(fade));
                R_AddCmdId9(&matrix, fade);
                R_AddCmdSetRenderTarget((GfxRenderTargetId)4);
                R_AddCmdClearScreen(7, clearColor, 1.0f, 0);
                R_AddCmdBeginView(scene.viewCount, &scene.def, cookie->shadowViewParms, &rg.lodParms);
                R_AddCmdSetViewport(1, 1, 126, 126);
                GfxDrawSurf *drawSurfs = scene.drawSurfs + cookie->firstCasterDrawSurf;
                R_EmitShadowCookieSurfs(drawSurfs, casterCount, (MaterialTechniqueType)0x1f);
                R_AddCmdSetViewport(0, 0, 128, 128);
                if (sc_blur->current.integer)
                    R_AddCmdHeaderOnly1C();
                R_AddCmdSetRenderTarget((GfxRenderTargetId)3);
                if (first)
                {
                    first = false;
                    R_ClearShadowReceiverTarget();
                }
                R_AddCmdBeginView(scene.viewCount, &scene.def, viewParms, &rg.lodParms);
                if (i < sc_debugReceiverCount->current.integer)
                {
                    drawSurfs = scene.drawSurfs + cookie->firstReceiverDrawSurf;
                    R_EmitShadowCookieSurfs(drawSurfs, receiverCount, (MaterialTechniqueType)0x20);
                }
            }
        } while (++i != shadows->cookieCount);
    }
    if (first)
    {
        R_AddCmdSetRenderTarget((GfxRenderTargetId)3);
        R_ClearShadowReceiverTarget();
    }
    R_EndDrawGroupLoop(1, viewIndex);
    R_EndDrawGroupSection(1);
}

void R_DrawShadowCookieOverlay()
{
    float size = (float)vidConfig.width * 0.25f;
    RcWords16 identity;
    MatrixIdentity44((float (*)[4])&identity);
    R_AddCmdId9(&identity, 0x3f800000);
    R_AddCmdDrawStretchPic(4.0f, 4.0f, size, size,
        0.0f, 0.0f, 1.0f, 1.0f, colorWhite, rgp.shadowCookieOverlayMaterial);
}

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

// PINNED 10027f40/408: weight cap adapts to requested count and elapsed scene time.
void R_BuildShadowCookieList(const GfxViewParms *viewParms, const ShadowCandidate *candidates,
    ShadowCookieList *shadows)
{
    shadows->cookieCount = 0;
    int sourceCount = scene.drawSurfCount;
    float fullFade = (1.0f - sc_fadeRange->current.value) * shadowCookieGlob.weightCap;
    float fadeSpan = shadowCookieGlob.weightCap * sc_fadeRange->current.value;
    int change = 0;
    int i;
    for (i = 0; i < 24; ++i)
    {
        int entIndex = candidates[i].entIndex;
        if (entIndex == -1)
            break;
        float weight = candidates[i].weight;
        if (shadowCookieGlob.weightCap < weight)
        {
            if (sc_wantCount->current.integer + sc_wantCountMargin->current.integer < i)
                change = -1;
            else if (i < sc_wantCount->current.integer - sc_wantCountMargin->current.integer)
                change = 1;
            break;
        }
        float fade = weight <= fullFade || weight == 0.0f ? 1.0f
            : (shadowCookieGlob.weightCap - weight) * (1.0f / fadeSpan);
        R_CreateShadowCookie(viewParms, sourceCount, entIndex, fade, shadows);
    }
    if (i == 24)
        change = -1;
    float seconds = 0.0f;
    if (shadowCookieGlob.lastTime != -1)
    {
        seconds = (float)(int)((unsigned int)scene.def.time - (unsigned int)shadowCookieGlob.lastTime) * 0.001f;
        if (seconds < 0.0f)
            seconds = 0.0f;
    }
    shadowCookieGlob.lastTime = scene.def.time;
    if (change > 0)
        shadowCookieGlob.weightCap += seconds * sc_shadowOutRate->current.value;
    else if (change < 0)
        shadowCookieGlob.weightCap -= seconds * sc_shadowInRate->current.value;
    if (shadowCookieGlob.weightCap < 0.0001f)
        shadowCookieGlob.weightCap = 0.0001f;
}

// Portal visibility (DPVS) helpers.
#include "gfx.h"
#include <universal/com_math.h>

extern const dvar_t *r_zfar;

#include "r_dpvs_state.h"

static DpvsState dpvsGlob;
static DpvsConfig dpvsConfig;
#define portalQueueCount dpvsGlob.queue.count
#define portalQueue dpvsGlob.queue.nodes
#define dpvsCullDist dpvsConfig.cullDist
#define nextFreeHullPoints dpvsGlob.freeHullPoints
#define portalViewPlane dpvsGlob.viewPlane
#define portalFogPlane dpvsGlob.fogPlane
#define dpvsViewOrg dpvsGlob.viewOrg
#define portalNearPlane dpvsGlob.nearPlane
#define portalFarPlane dpvsGlob.farPlane
#define activeOccluders dpvsGlob.occluders
#define activeOccluderPlanes dpvsGlob.occluderPlanes
#define portalViewProjectionMatrix dpvsGlob.projection.viewProjectionMatrix
#define portalInverseViewProjectionMatrix dpvsGlob.projection.inverseViewProjectionMatrix
DpvsScene dpvsScene;
// PINNED retail passes this table from .rdata (10182948) instead of building it on the stack.
extern const vec4_t standardFrustumSidePlanes[4];
const vec4_t standardFrustumSidePlanes[4] = {{-1.0f, 0.0f, 0.0f, 1.0f}, {1.0f, 0.0f, 0.0f, 1.0f},
    {0.0f, -1.0f, 0.0f, 1.0f}, {0.0f, 1.0f, 0.0f, 1.0f}};
void ExpandBounds(const vec3_t mins, const vec3_t maxs, vec3_t outMins, vec3_t outMaxs);

// Name unconfirmed; PINNED out-of-line copy 10005c30.
inline void R_DpvsPlaneSetDist(DpvsPlane *plane, const float *point, float dist)
{
    plane->coeffs[3] = dist - DotProduct(point, plane->coeffs);
}

// Name unconfirmed; PINNED out-of-line copy 10005c50.
inline void R_DpvsPlaneSetDistAndSides(DpvsPlane *plane, const float *point, float dist)
{
    R_DpvsPlaneSetDist(plane, point, dist);
    plane->side[0] = FloatAsInt(plane->coeffs[0]) > 0 ? 12 : 0;
    plane->side[1] = FloatAsInt(plane->coeffs[1]) > 0 ? 16 : 4;
    plane->side[2] = FloatAsInt(plane->coeffs[2]) > 0 ? 20 : 8;
}

// Name unconfirmed; PINNED out-of-line copy 10005cb0.
inline float R_DpvsPlaneDistToPoint(const DpvsPlane *plane, const float *point)
{
    return DotProduct(plane->coeffs, point) + plane->coeffs[3];
}

// Name unconfirmed; PINNED out-of-line copy 10005cd0.
inline float R_DpvsPlaneNearCornerDist(const DpvsPlane *plane, const float *bounds)
{
    return *(const float *)((const byte *)bounds + plane->side[1]) * plane->coeffs[1]
        + *(const float *)((const byte *)bounds + plane->side[0]) * plane->coeffs[0]
        + *(const float *)((const byte *)bounds + plane->side[2]) * plane->coeffs[2]
        + plane->coeffs[3];
}

// Name unconfirmed; PINNED out-of-line copy 10005d00.
inline float R_DpvsPlaneFarCornerDist(const DpvsPlane *plane, const float *bounds)
{
    return *(const float *)((const byte *)bounds + 12 - plane->side[0]) * plane->coeffs[0]
        + *(const float *)((const byte *)bounds + 20 - plane->side[1]) * plane->coeffs[1]
        + *(const float *)((const byte *)bounds + 28 - plane->side[2]) * plane->coeffs[2]
        + plane->coeffs[3];
}

// Name unconfirmed; PINNED out-of-line copy 10005d40.
inline float R_DpvsPlaneViewDist(const DpvsPlane *plane)
{
    return dpvsViewOrg[1] * plane->coeffs[1] + dpvsViewOrg[2] * plane->coeffs[2]
        + dpvsViewOrg[3] * plane->coeffs[3] + dpvsViewOrg[0] * plane->coeffs[0];
}

// Brush entity bounds and cell routing.
extern GfxScene scene;
void R_AddBModelSurfaces(GfxSceneEntity *sceneEnt, int entIndex);
bool R_IsBoundsOutsideViewNoStack(DpvsPlane *planes, int planeCount, const float *bounds);

// PINNED: free-list pointer 101ce5e8; each entry holds 64 vec2 points.
union GfxHullPointsPool
{
    GfxHullPointsPool *nextFree;
    vec2_t points[64];
};
int Com_ConvexHull(vec2_t *points, int pointCount, vec2_t *hull);

// PINNED caller 0x10009770 uses a plane at 0x101ce588; historical name unconfirmed.
// PINNED 1.0 view origin/direction is at 0x101ce5d0, homogeneous component at +12.

double R_FurthestPointOnWinding(const vec3_t *points, int pointCount, const float *plane);

// PINNED: optional far plane pointer 101ce5b4.
// PINNED: fog plane 101ce59c and near-plane pointer 101ce5b0.
__declspec(noinline) float R_GetFarPlaneDist();
void R_SetupDpvsForPoint(const GfxViewParms *viewParms);
void R_SetupDpvsForDir(const GfxViewParms *viewParms);
static int R_ChopPortal(const GfxPortal *portal, const DpvsPlane *parentPlane,
    const DpvsPlane *planes, int planeCount, vec3_t v[2][128], const vec3_t **finalVerts);
bool R_ChopPortalAndAddHullPoints(GfxPortal *portal, const DpvsPlane *parentPlane,
    const DpvsPlane *planes, int planeCount);
static bool R_PortalBehindPlane(const GfxPortal *portal, const DpvsPlane *plane);
static bool R_PortalBehindAnyPlane(const GfxPortal *portal, const DpvsPlane *planes, int planeCount);
static bool R_PortalBehindAllPlanes(const GfxPortal *portal, const DpvsPlane *planes, int planeCount);
static __declspec(noinline) bool R_IsPortalOccluded(const GfxPortal *portal);
static bool R_IsCellInList(const GfxCell *cell, const GfxCell **list, int count);
int R_GetFurtherCellList_r(const GfxCell *cell, const DpvsPlane *parentPlane,
    const DpvsPlane *planes, int planeCount, vec3_t v[2][128], const GfxCell **list, int count);
void R_PortalQueuePush(GfxPortal *portal);
void R_ClearDpvsScene();
float R_GetFarPlaneDist();
void R_SetCullDist(float dist);
GfxPortal *R_PortalQueuePopMin();
double R_FurthestPointOnWinding(const vec3_t *points, int pointCount, const float *plane);
double R_NearestPointOnWinding(const vec3_t *points, int pointCount, const float *plane);

// Portal clip planes; PC 1.0 addresses pinned from the renderer anchor.
extern const dvar_t *r_portalBevels;
extern const dvar_t *r_portalBevelsOnly;
extern const dvar_t *r_portalMinClipArea;
extern const dvar_t *r_showPortals;
void R_GetSidePlaneNormals(const vec3_t *winding, int vertexCount, vec3_t *normals);

double R_NearestPointOnWinding(const vec3_t *points, int pointCount, const float *plane);

// PINNED Win 1.0 occluder setup: 10005d70 and 100079d0--10007d4f.
extern const dvar_t *r_showPortals;

// PINNED PC scene model drawing, 10008330/112.
void R_UpdateXModelBounds(GfxSceneEntity *sceneEnt, const GfxEntity *ent);
void R_SkinSceneEnt(GfxSceneEntity *sceneEnt, GfxEntity *ent);
void R_AddXModelSurfaces(int entIndex);

// PINNED 1000a840/129: tangency and unordered plane distances remain visible.
int R_CullPointAndRadius(const vec_t *origin, float radius,
    const DpvsPlane *planes, int planeCount);

// Visibility-tree gathering.
extern const dvar_t *r_portalFineCull;
extern const dvar_t *r_showSModelNames;
void R_AddDrawSurf(const Material *material, int entIndex, int lmapIndex, const surfaceType_t *surface);
int R_AddStaticModelToScene(int smodelIndex);
void R_SkinStaticModel(GfxSceneEntity *sceneEnt, GfxEntity *ent, int smodelIndex);
void R_AddDebugString(DebugGlobals *debug, const float *origin, const float *color,
    float scale, const char *text);
void R_AddDebugBox(DebugGlobals *debug, const float *mins, const float *maxs, const float *color);
void R_AddDebugLine(DebugGlobals *debug, const float *start, const float *end, const float *color);

// Portal visitation.
extern const dvar_t *r_portalWalkLimit;
extern const dvar_t *r_singleCell;
extern const dvar_t *r_skipPvs;
extern const dvar_t *r_drawWorld;
extern const dvar_t *r_drawBModels;
extern const dvar_t *r_drawEntities;
extern const dvar_t *r_drawSModels;
extern const dvar_t *r_drawXModels;
extern const dvar_t *r_vc_makelog;
void R_AddDebugPolygon(DebugGlobals *debug, const float *color, int pointCount, const vec3_t *points);
int PointInPolygon(const vec3_t *verts, int vertCount, const vec3_t normal, const vec3_t point);
void RB_ShowLightVisCachePoints(const GfxViewParms *viewParms, const DpvsPlane *planes, int planeCount);
void R_AddVertToPortalHullPoints(GfxPortal *portal, const float *v);
void R_GetSidePlaneNormals(const vec3_t *winding, int vertexCount, vec3_t *normals);
static const vec3_t *R_ChopPortalWinding(const vec3_t *vertsIn, int *vertexCount,
    const DpvsPlane *plane, vec3_t *vertsOut);
void R_SetupDpvsForPoint(const GfxViewParms *viewParms);
static bool R_PortalBehindPlane(const GfxPortal *portal, const DpvsPlane *plane);
static bool R_PortalBehindAnyPlane(const GfxPortal *portal, const DpvsPlane *planes, int planeCount);
static bool R_PortalBehindAllPlanes(const GfxPortal *portal, const DpvsPlane *planes, int planeCount);
static __declspec(noinline) bool R_IsPortalOccluded(const GfxPortal *portal);
static int R_ChopPortal(const GfxPortal *portal, const DpvsPlane *parentPlane,
    const DpvsPlane *planes, int planeCount, vec3_t v[2][128], const vec3_t **finalVerts);
bool R_ChopPortalAndAddHullPoints(GfxPortal *portal, const DpvsPlane *parentPlane,
    const DpvsPlane *planes, int planeCount);
static bool R_IsCellInList(const GfxCell *cell, const GfxCell **list, int count);
int R_GetFurtherCellList_r(const GfxCell *cell, const DpvsPlane *parentPlane,
    const DpvsPlane *planes, int planeCount, vec3_t v[2][128], const GfxCell **list, int count);
void R_PortalQueuePush(GfxPortal *portal);
void R_SetupDpvsForDir(const GfxViewParms *viewParms);
void R_ClearDpvsScene();
float R_GetFarPlaneDist();
void R_SetCullDist(float dist);
GfxPortal *R_PortalQueuePopMin();
double R_FurthestPointOnWinding(const vec3_t *points, int pointCount, const float *plane);
double R_NearestPointOnWinding(const vec3_t *points, int pointCount, const float *plane);
static __forceinline void R_UnprojectPoint(const float *projected, float *unprojected);
static __forceinline void R_AddPortalDebugLine(const float *start, const float *end, float cyan);
static void R_ProjectPortal(int vertexCount, const vec3_t *winding, float *mins,
    float *maxs, DpvsClipChildren *clipChildren);
static int R_AddBevelPlanes(DpvsPlane *planes, int vertexCount, const vec3_t *windingNormals,
    const float *mins, const float *maxs, DpvsForceBevels forceBevels);
int R_PortalClipPlanes(DpvsPlane *planes, int vertexCount, const vec3_t *winding,
    DpvsClipChildren *clipChildren);
bool R_IsBoundsOutsideViewNoStack(DpvsPlane *planes, int planeCount, const float *bounds);
static bool R_OccluderBehindPlane(const GfxOccluder *occluder, const DpvsPlane *plane);
static bool R_IsOccluderOutsideView(const GfxOccluder *occluder,
    const DpvsPlane *planes, int planeCount);
static void R_CreateOccluderEdgePlane(const float *v0, const float *v1, DpvsPlane *plane);
void R_SetupOccludersForCell(const GfxCell *cell, const DpvsPlane *planes, int planeCount);
void R_DrawModel(int entIndex);
int R_CellForPoint(const vec_t *origin);
void R_CullSceneLights(const DpvsPlane *planes, int planeCount);
__declspec(noinline) bool R_IsBoundsOutsideView(DpvsPlane *planes, int planeCount,
    const float *bounds, int stackLevel);
__declspec(noinline) bool R_IsAabbOutsideView(DpvsPlane *planes, int planeCount,
    const float *bounds, int stackLevel);
__declspec(noinline) bool R_AabbNeedsChildClipping(DpvsPlane *planes, int planeCount,
    const float *bounds, int stackLevel);
static void R_AddWorldSurfaceDirect(int surfIndex);
static void R_AddWorldSurfaceWithCull(int surfIndex, DpvsPlane *planes,
    int planeCount, int stackLevel);
static void R_PublishStaticModel(int smodelIndex, const GfxStaticModelInstance *instance);
static void R_AddStaticModelWithCull(int smodelIndex, DpvsPlane *planes,
    int planeCount, int stackLevel);
static void R_AddAabbTreeSurfaces_r(GfxAabbTree *tree, DpvsPlane *planes,
    int planeCount, int stackLevel);
static void R_AddCullGroup(int groupIndex, DpvsPlane *planes, int planeCount);
static void R_AddCellCullGroups(const GfxCell *cell, DpvsPlane *planes, int planeCount);
static void R_GetModelEntityBounds(int entIndex, float *mins, float *maxs);
static void R_CullModelEntity(int entIndex, DpvsPlane *planes, int planeCount);
static void R_CullSceneEntities(DpvsPlane *planes, int planeCount);
static void R_DrawCellEntities(const GfxCell *cell, DpvsPlane *planes, int planeCount);
static void R_AddVisibleSurfacesInCell(const GfxCell *cell, DpvsPlane *planes, int planeCount);
static void R_AddSkySurfaces(DpvsPlane *planes, int planeCount);
__declspec(noinline) int R_AppendNearFarPlanes(DpvsPlane *planes, int planeCount);
static void R_DrawFurtherCells(const GfxCell *cell, const DpvsPlane *parentPlane,
    DpvsPlane *planes, int planeCount);
static void R_VisitPortalsForCell(const GfxCell *cell, GfxPortal *parentPortal,
    const DpvsPlane *parentPlane, DpvsPlane *planes, int planeCount,
    DpvsClipChildren clipChildren);
static void R_VisitPortals(const GfxCell *cell, const DpvsPlane *parentPlane,
    DpvsPlane *planes, int planeCount);
static void R_AddWorldSurfacesByCell(int cameraCell, DpvsPlane *planes, int planeCount);
void R_FrustumClipPlanes(const D3DMATRIX *viewProjection, const vec4_t *sides,
    int sideCount, DpvsPlane *planes);
void R_AddWorldSurfacesDpvs(const GfxViewParms *viewParms, int cameraCell);

static void R_CreateOccluderEdgePlane(const float *v0, const float *v1, DpvsPlane *plane)
{
    vec3_t delta0, delta1;
    if (dpvsViewOrg[3] != 0.0f)
    {
        VectorSubtract(v0, dpvsViewOrg, delta0);
        VectorSubtract(v1, dpvsViewOrg, delta1);
        plane->coeffs[0] = delta0[2] * delta1[1] - delta0[1] * delta1[2];
        plane->coeffs[1] = delta1[2] * delta0[0] - delta1[0] * delta0[2];
        plane->coeffs[2] = delta1[0] * delta0[1] - delta0[0] * delta1[1];
    }
    else
    {
        VectorSubtract(v1, v0, delta0);
        Vec3Cross(dpvsViewOrg, delta0, plane->coeffs);
    }
    Vec3Normalize(plane->coeffs);
    plane->u.frontal = 255;
    plane->coeffs[3] = 0.0f - (plane->coeffs[1] * v0[1]
        + v0[0] * plane->coeffs[0] + v0[2] * plane->coeffs[2]);
    plane->side[0] = FloatAsInt(plane->coeffs[0]) > 0 ? 12 : 0;
    plane->side[1] = FloatAsInt(plane->coeffs[1]) > 0 ? 16 : 4;
    plane->side[2] = FloatAsInt(plane->coeffs[2]) > 0 ? 20 : 8;
}

void R_GetSidePlaneNormals(const vec3_t *winding, int vertexCount, vec3_t *normals)
{
    vec3_t delta[129];
    int index;
    int next;

    if (dpvsViewOrg[3] != 0.0f)
    {
        for (index = 0; index < vertexCount; ++index)
            VectorSubtract(winding[index], dpvsViewOrg, delta[index]);
        VectorCopy(delta[0], delta[vertexCount]);
        for (index = 0; index < vertexCount; ++index)
        {
            Vec3Cross(delta[index + 1], delta[index], normals[index]);
            Vec3Normalize(normals[index]);
        }
    }
    else
    {
        index = vertexCount - 1;
        for (next = 0; next < vertexCount; ++next)
        {
            VectorSubtract(winding[next], winding[index], delta[0]);
            Vec3Cross(dpvsViewOrg, delta[0], normals[index]);
            Vec3Normalize(normals[index]);
            index = next;
        }
    }
}

// Names unconfirmed; PINNED out-of-line copies 100061d0, 10006210, 10006260.
inline bool R_DpvsPlaneNearCornerBehind(const DpvsPlane *plane, const float *bounds)
{
    return R_DpvsPlaneNearCornerDist(plane, bounds) <= 0.0f;
}

inline bool R_DpvsPlaneFarCornerNotBehind(const DpvsPlane *plane, const float *bounds)
{
    return R_DpvsPlaneFarCornerDist(plane, bounds) >= 0.0f;
}

inline bool R_DpvsPlaneNearCornerInFront(const DpvsPlane *plane, const float *bounds)
{
    return R_DpvsPlaneNearCornerDist(plane, bounds) > 0.0f;
}

// PINNED 100062a0/95: near then far; input count is preserved when both absent.
__declspec(noinline) int R_AppendNearFarPlanes(DpvsPlane *planes, int planeCount)
{
    if (portalNearPlane)
        planes[planeCount++] = *portalNearPlane;
    if (portalFarPlane)
        planes[planeCount++] = *portalFarPlane;
    return planeCount;
}

// PINNED 10006300/214: stack stamps skip planes proved inside by an ancestor.
__declspec(noinline) bool R_IsBoundsOutsideView(DpvsPlane *planes, int planeCount,
    const float *bounds, int stackLevel)
{
    for (int i = 0; i < planeCount; ++i)
    {
        DpvsPlane *plane = &planes[i];
        if (stackLevel > plane->u.frontal)
            continue;
        plane->u.frontal = 255;
        float distance = *(const float *)((const byte *)bounds + plane->side[0]) * plane->coeffs[0];
        distance += *(const float *)((const byte *)bounds + plane->side[1]) * plane->coeffs[1];
        distance += *(const float *)((const byte *)bounds + plane->side[2]) * plane->coeffs[2];
        distance += plane->coeffs[3];
        if (distance <= 0.0f)
            return true;
    }
    for (int i = 0; i < activeOccluders.count; ++i)
    {
        GfxOccluder *occluder = activeOccluders.list[i];
        if (stackLevel > occluder->ignoreStackLevel)
            continue;
        DpvsPlane *plane = occluder->viewPlanes;
        for (int j = 0; ; ++j, ++plane)
        {
            if (j >= occluder->viewPlaneCount)
                return true;
            if (stackLevel > plane->u.frontal)
                continue;
            plane->u.frontal = 255;
            if (R_DpvsPlaneNearCornerInFront(plane, bounds))
                break;
        }
    }
    return false;
}
// PINNED adjacent count/pointer at 101ce5c8/101ce5cc.

// PINNED 100063e0/205: this path does not inspect ignoreStackLevel.
bool R_IsBoundsOutsideViewNoStack(DpvsPlane *planes, int planeCount, const float *bounds)
{
    for (int planeIndex = 0; planeIndex < planeCount; ++planeIndex)
    {
        DpvsPlane *plane = &planes[planeIndex];
        plane->u.frontal = 255;
        float distance = *(const float *)((const byte *)bounds + plane->side[0]) * plane->coeffs[0];
        distance += *(const float *)((const byte *)bounds + plane->side[1]) * plane->coeffs[1];
        distance += *(const float *)((const byte *)bounds + plane->side[2]) * plane->coeffs[2];
        distance += plane->coeffs[3];
        if (distance <= 0.0f)
            return true;
    }
    for (int occluderIndex = 0; occluderIndex < activeOccluders.count; ++occluderIndex)
    {
        GfxOccluder *occluder = (*(GfxOccluder ** volatile *)&activeOccluders.list)[occluderIndex];
        DpvsPlane *plane = occluder->viewPlanes;
        int planeIndex;
        for (planeIndex = 0; ; ++planeIndex, ++plane)
        {
            if (planeIndex >= occluder->viewPlaneCount)
                return true;
            plane->u.frontal = 255;
            float distance = *(const float *)((const byte *)bounds + plane->side[1]) * plane->coeffs[1];
            distance += *(const float *)((const byte *)bounds + plane->side[0]) * plane->coeffs[0];
            distance += *(const float *)((const byte *)bounds + plane->side[2]) * plane->coeffs[2];
            distance += plane->coeffs[3];
            if (distance > 0.0f)
                break;
        }
    }
    return false;
}

// PINNED 100064b0/264: rejected occluder planes keep their parent stack stamp.
__declspec(noinline) bool R_IsAabbOutsideView(DpvsPlane *planes, int planeCount,
    const float *bounds, int stackLevel)
{
    for (int i = 0; i < planeCount; ++i)
    {
        DpvsPlane *plane = &planes[i];
        if (stackLevel > plane->u.frontal)
            continue;
        plane->u.frontal = 255;
        float distance = *(const float *)((const byte *)bounds + plane->side[0]) * plane->coeffs[0];
        distance += *(const float *)((const byte *)bounds + plane->side[1]) * plane->coeffs[1];
        distance += *(const float *)((const byte *)bounds + plane->side[2]) * plane->coeffs[2];
        distance += plane->coeffs[3];
        if (distance <= 0.0f)
            return true;
    }
    for (int i = 0; i < activeOccluders.count; ++i)
    {
        GfxOccluder *occluder = activeOccluders.list[i];
        if (stackLevel > occluder->ignoreStackLevel)
            continue;
        bool occluded = true;
        DpvsPlane *plane = occluder->viewPlanes;
        for (int j = 0; j < occluder->viewPlaneCount; ++j, ++plane)
        {
            if (stackLevel > plane->u.frontal)
                continue;
            plane->u.frontal = 255;
            if (R_DpvsPlaneNearCornerBehind(plane, bounds))
                plane->u.frontal = (byte)stackLevel;
            else
                occluded = false;
        }
        if (occluded)
            return true;
    }
    return false;
}

// PINNED 100065c0/157: unordered near-corner distances require child clipping.
__declspec(noinline) bool R_AabbNeedsChildClipping(DpvsPlane *planes, int planeCount,
    const float *bounds, int stackLevel)
{
    bool partial = false;
    for (; planeCount; --planeCount, ++planes)
    {
        DpvsPlane *plane = planes;
        if (stackLevel > plane->u.frontal)
            continue;
        if (!R_DpvsPlaneFarCornerNotBehind(plane, bounds))
            partial = true;
        else
            plane->u.frontal = (byte)stackLevel;
    }
    if (partial)
        return true;
    for (int i = 0; i < activeOccluders.count; ++i)
        if (stackLevel <= activeOccluders.list[i]->ignoreStackLevel)
            return true;
    return false;
}


// Convex winding extrema.
/* PINNED 1.0 convex-winding search and plane coefficients at offsets 0..12. */
double R_FurthestPointOnWinding(const vec3_t *points, int pointCount, const float *plane)
{
    int index;
    float furthest;
    float first;
    float last;

    first = DotProduct(plane, points[0]) + plane[3];
    last = DotProduct(plane, points[pointCount - 1]) + plane[3];

    if (first > last)
    {
        furthest = first;
        for (index = 1; index < pointCount - 1; ++index)
        {
            float distance = DotProduct(plane, points[index]) + plane[3];
            if (furthest > distance)
                break;
            furthest = distance;
        }
    }
    else
    {
        furthest = last;
        for (index = pointCount - 2; index > 0; --index)
        {
            float distance = DotProduct(plane, points[index]) + plane[3];
            if (furthest > distance)
                break;
            furthest = distance;
        }
    }
    return furthest;
}

double R_NearestPointOnWinding(const vec3_t *points, int pointCount, const float *plane)
{
    int index;
    float nearest;
    float first;
    float last;

    first = DotProduct(plane, points[0]) + plane[3];
    last = DotProduct(plane, points[pointCount - 1]) + plane[3];

    if (first < last)
    {
        nearest = first;
        for (index = 1; index < pointCount - 1; ++index)
        {
            float distance = DotProduct(plane, points[index]) + plane[3];
            if (nearest < distance)
                break;
            nearest = distance;
        }
    }
    else
    {
        nearest = last;
        for (index = pointCount - 2; index > 0; --index)
        {
            float distance = DotProduct(plane, points[index]) + plane[3];
            if (nearest < distance)
                break;
            nearest = distance;
        }
    }
    return nearest;
}

/* Retail has no out-of-line copy, so this is a macro rather than a function. */
#define R_AddStaticModelDirect(smodelIndexExpr)     do {         int smodelIndex_ = (smodelIndexExpr);         if (rg.smodelDyncs[smodelIndex_].viewCount != scene.viewCount)         {             rg.smodelDyncs[smodelIndex_].viewCount = scene.viewCount;             const GfxStaticModelInstance *instance_ = &rgp.world->smodelInsts[smodelIndex_];             if (instance_->cullDist == 0.0f || instance_->cullDist >=                 Vec3Distance(instance_->origin, rg.lodParms.origin) * rg.lodParms.scale + rg.lodParms.bias)                 R_PublishStaticModel(smodelIndex_, instance_);         }     } while (0)

static void R_AddWorldSurfaceDirect(int surfIndex)
{
    rg.surfaces[surfIndex].viewCount = scene.viewCount;
    const GfxSurface *surf = &rgp.world->surfaces[surfIndex];
    R_AddDrawSurf(surf->material, surf->sortGroup + 2048, surf->lightmapIndex, surf->data);
}

// PINNED 10006be0/446: transform homogeneous clipping planes and normalize XYZ.
void R_FrustumClipPlanes(const D3DMATRIX *viewProjection, const vec4_t *sides,
    int sideCount, DpvsPlane *planes)
{
    const float *matrix = (const float *)viewProjection;
    // Reproduces retail's unread stores; PINNED 10006be0.
    DpvsPlane axisPlanes[8];
    for (int i = 0; i < sideCount; ++i)
    {
        float *coeffs = planes[i].coeffs;
        float axisSign = (i & 1) ? 1.0f : -1.0f;
        int axis = (i >> 1) & 1;
        for (int j = 0; j < 4; ++j)
        {
            axisPlanes[i].coeffs[j] = axisSign * matrix[j * 4 + axis] + matrix[j * 4 + 3];
            coeffs[j] = sides[i][1] * matrix[j * 4 + 1] + sides[i][3] * matrix[j * 4 + 3]
                + sides[i][0] * matrix[j * 4] + sides[i][2] * matrix[j * 4 + 2];
        }
        VectorScale4(coeffs, 1.0f / VectorLength(coeffs), coeffs);
        planes[i].side[0] = FloatAsInt(coeffs[0]) > 0 ? 12 : 0;
        planes[i].side[1] = FloatAsInt(coeffs[1]) > 0 ? 16 : 4;
        planes[i].side[2] = FloatAsInt(coeffs[2]) > 0 ? 20 : 8;
        planes[i].u.frontal = 255;
    }
}

// PINNED 10006da0/595: NaN W does not take the near-clipped return.
static void R_ProjectPortal(int vertexCount, const vec3_t *winding, float *mins,
    float *maxs, DpvsClipChildren *clipChildren)
{
    vec2_t screenSpaceWinding[132];
    mins[0] = 1.0f;
    mins[1] = 1.0f;
    maxs[0] = -1.0f;
    maxs[1] = -1.0f;
    int index;
    for (index = 0; index < vertexCount; ++index)
    {
        const float *xyz = winding[index];
        float w = portalViewProjectionMatrix->m[0][3] * xyz[0]
            + portalViewProjectionMatrix->m[2][3] * xyz[2]
            + portalViewProjectionMatrix->m[1][3] * xyz[1] + portalViewProjectionMatrix->m[3][3];
        if (w < 0.125f)
        {
            mins[0] = -1.0f;
            mins[1] = -1.0f;
            maxs[0] = 1.0f;
            maxs[1] = 1.0f;
            *clipChildren = DPVS_CLIP_CHILDREN;
            return;
        }
        float invW = 1.0f / w;
        screenSpaceWinding[index][0] = (portalViewProjectionMatrix->m[2][0] * xyz[2]
            + portalViewProjectionMatrix->m[1][0] * xyz[1] + xyz[0] * portalViewProjectionMatrix->m[0][0]
            + portalViewProjectionMatrix->m[3][0]) * invW;
        screenSpaceWinding[index][1] = (portalViewProjectionMatrix->m[0][1] * xyz[0]
            + portalViewProjectionMatrix->m[2][1] * xyz[2] + portalViewProjectionMatrix->m[1][1] * xyz[1]
            + portalViewProjectionMatrix->m[3][1]) * invW;
        if (mins[0] > screenSpaceWinding[index][0]) mins[0] = screenSpaceWinding[index][0];
        if (maxs[0] < screenSpaceWinding[index][0]) maxs[0] = screenSpaceWinding[index][0];
        if (mins[1] > screenSpaceWinding[index][1]) mins[1] = screenSpaceWinding[index][1];
        if (maxs[1] < screenSpaceWinding[index][1]) maxs[1] = screenSpaceWinding[index][1];
    }
    if ((maxs[1] - mins[1]) * (maxs[0] - mins[0]) * 0.25f < r_portalMinClipArea->current.value)
    {
        *clipChildren = DPVS_DONT_CLIP_CHILDREN;
        return;
    }
    Vector2Copy(screenSpaceWinding[0], screenSpaceWinding[vertexCount]);
    Vector2Copy(screenSpaceWinding[1], screenSpaceWinding[vertexCount + 1]);
    float area = 0.0f;
    for (index = 1; index <= vertexCount; ++index)
        area += (screenSpaceWinding[index + 1][1] - screenSpaceWinding[index - 1][1]) * screenSpaceWinding[index][0];
    if (area * 0.125f < r_portalMinClipArea->current.value)
        *clipChildren = DPVS_DONT_CLIP_CHILDREN;
    else
        *clipChildren = DPVS_CLIP_CHILDREN;
}

static int R_AddBevelPlanes(DpvsPlane *planes, int vertexCount, const vec3_t *windingNormals,
    const float *mins, const float *maxs, DpvsForceBevels forceBevels)
{
    vec2_t projected;
    vec4_t unprojected;
    vec3_t bevelVerts[5];
    vec3_t bevelNormals[4];
    int index;
    for (index = 0; index < 4; ++index)
    {
        projected[0] = index < 2 ? mins[0] : maxs[0];
        projected[1] = index == 1 || index == 2 ? mins[1] : maxs[1];
        R_UnprojectPoint(projected, unprojected);
        float invW = 1.0f / unprojected[3];
        VectorScale(unprojected, invW, bevelVerts[index]);
    }
    VectorCopy(bevelVerts[0], bevelVerts[4]);
    R_GetSidePlaneNormals(bevelVerts, 4, bevelNormals);
    int planeCount = 0;
    for (index = 0; index < 4; ++index)
    {
        DpvsPlane *plane = &planes[planeCount];
        memcpy(plane->coeffs, bevelNormals[index], sizeof(vec3_t));
        if (forceBevels == DPVS_DONT_FORCE_BEVELS)
        {
            int vertexIndex;
            for (vertexIndex = 0; vertexIndex < vertexCount; ++vertexIndex)
                if (windingNormals[vertexIndex][0] * plane->coeffs[0]
                    + windingNormals[vertexIndex][2] * plane->coeffs[2]
                    + windingNormals[vertexIndex][1] * plane->coeffs[1] > r_portalBevels->current.value)
                {
                    if (r_showPortals->current.integer & 2)
                        R_AddPortalDebugLine(bevelVerts[index], bevelVerts[index + 1], 0.5f);
                    goto nextBevel;
                }
        }
        if (r_showPortals->current.integer)
            R_AddPortalDebugLine(bevelVerts[index], bevelVerts[index + 1], 0.75f);
        plane->coeffs[3] = 0.001f - (bevelVerts[index][2] * plane->coeffs[2]
            + bevelVerts[index][0] * plane->coeffs[0] + bevelVerts[index][1] * plane->coeffs[1]);
        plane->side[0] = FloatAsInt(plane->coeffs[0]) > 0 ? 12 : 0;
        plane->side[1] = FloatAsInt(plane->coeffs[1]) > 0 ? 16 : 4;
        plane->side[2] = FloatAsInt(plane->coeffs[2]) > 0 ? 20 : 8;
        plane->u.frontal = 255;
        ++planeCount;
    nextBevel:;
    }
    return planeCount;
}

// PINNED 10007430/1439. PC has no unused cell parameter found in the CoD4 reference.
int R_PortalClipPlanes(DpvsPlane *planes, int vertexCount, const vec3_t *winding,
    DpvsClipChildren *clipChildren)
{
    vec3_t normals[128];
    vec2_t clipSpaceMins, clipSpaceMaxs;
    bool useNormalPlanes = vertexCount <= 10;
    DpvsForceBevels forceBevels;
    bool useBevelPlanes;
    if (useNormalPlanes && !r_portalBevelsOnly->current.enabled)
    {
        forceBevels = DPVS_DONT_FORCE_BEVELS;
        useBevelPlanes = r_portalBevels->current.value > 0.0f;
    }
    else
    {
        forceBevels = DPVS_FORCE_BEVELS;
        useBevelPlanes = true;
    }
    R_GetSidePlaneNormals(winding, vertexCount, normals);
    int planeCount = 0;
    if (useBevelPlanes || r_portalMinClipArea->current.value > 0.0f)
    {
        R_ProjectPortal(vertexCount, winding, clipSpaceMins, clipSpaceMaxs, clipChildren);
        if (useBevelPlanes)
            planeCount = R_AddBevelPlanes(planes, vertexCount, normals, clipSpaceMins, clipSpaceMaxs, forceBevels);
    }
    else
        *clipChildren = DPVS_CLIP_CHILDREN;
    if (useNormalPlanes)
        for (int index = 0; index < vertexCount; ++index)
            if (VectorLengthSquared(normals[index]) != 0.0f)
            {
                DpvsPlane *plane = &planes[planeCount];
                VectorCopy(normals[index], plane->coeffs);
                plane->coeffs[3] = 0.001f - DotProduct(winding[index], plane->coeffs);
                plane->side[0] = FloatAsInt(plane->coeffs[0]) > 0 ? 12 : 0;
                plane->side[1] = FloatAsInt(plane->coeffs[1]) > 0 ? 16 : 4;
                plane->side[2] = FloatAsInt(plane->coeffs[2]) > 0 ? 20 : 8;
                plane->u.frontal = 255;
                ++planeCount;
            }
    if (portalNearPlane)
    {
        planes[planeCount] = *portalNearPlane;
        double nearest = R_NearestPointOnWinding(winding, vertexCount, planes[planeCount].coeffs);
        if (nearest > 0.0f)
            planes[planeCount].coeffs[3] = (float)(planes[planeCount].coeffs[3] - nearest);
        ++planeCount;
    }
    if (portalFarPlane)
        planes[planeCount++] = *portalFarPlane;
    return planeCount;
}

static bool R_OccluderBehindPlane(const GfxOccluder *occluder, const DpvsPlane *plane)
{
    for (int vertexIndex = 0; vertexIndex < occluder->vertexCount; ++vertexIndex)
        if (DotProduct(plane->coeffs, occluder->vertices[vertexIndex]) + plane->coeffs[3] > 0.0f)
            return false;
    return true;
}

static bool R_IsOccluderOutsideView(const GfxOccluder *occluder,
    const DpvsPlane *planes, int planeCount)
{
    if (portalNearPlane && R_OccluderBehindPlane(occluder, portalNearPlane))
        return true;
    while (planeCount)
    {
        if (R_OccluderBehindPlane(occluder, planes))
            return true;
        ++planes;
        --planeCount;
    }
    return false;
}


void R_SetupOccludersForCell(const GfxCell *cell, const DpvsPlane *planes, int planeCount)
{
    activeOccluders.count = 0;
    activeOccluderPlanes.count = 0;
    for (int occluderIndex = 0; occluderIndex < cell->occluderCount; ++occluderIndex)
    {
        GfxOccluder *occluder = cell->occluders[occluderIndex];
        if (R_IsOccluderOutsideView(occluder, planes, planeCount))
            continue;
        if (activeOccluders.count == 1024)
            R_Error(ERR_DROP, "\x15Too many active occluder brushes");
        activeOccluders.list[activeOccluders.count++] = occluder;
        occluder->ignoreStackLevel = 0x7fffffff;
        occluder->viewPlaneCount = activeOccluderPlanes.count;
        occluder->viewPlanes = &activeOccluderPlanes.planes[activeOccluderPlanes.count];
        for (int planeIndex = 0; planeIndex < occluder->planeCount; ++planeIndex)
        {
            occluder->planes[planeIndex].u.frontal = 0;
            if (R_DpvsPlaneViewDist(&occluder->planes[planeIndex]) > 0.0f)
            {
                occluder->planes[planeIndex].u.frontal = 1;
                if (activeOccluderPlanes.count == 6144)
                    R_Error(ERR_DROP, "\x15Too many active occluder faces");
                activeOccluderPlanes.planes[activeOccluderPlanes.count] = occluder->planes[planeIndex];
                ++activeOccluderPlanes.count;
            }
        }
        for (int edgeIndex = 0; edgeIndex < occluder->edgeCount; ++edgeIndex)
        {
            GfxOccluderEdge *edge = &occluder->edges[edgeIndex];
            if (edge->plane[0]->u.frontal == edge->plane[1]->u.frontal)
                continue;
            if (r_showPortals->current.integer)
                R_AddDebugLine(&frontEndDataOut->debugGlobals, *edge->vertex[0], *edge->vertex[1], colorMagenta);
            int side = edge->plane[0]->u.frontal;
            R_CreateOccluderEdgePlane(*edge->vertex[!side], *edge->vertex[side],
                &activeOccluderPlanes.planes[activeOccluderPlanes.count]);
            ++activeOccluderPlanes.count;
        }
        occluder->viewPlaneCount = activeOccluderPlanes.count - occluder->viewPlaneCount;
    }
}

// PINNED 10007d60/93: equality and unordered plane distances take child1.
int R_CellForPoint(const vec_t *origin)
{
    if (!rgp.world)
        R_Error(ERR_DROP, "\x15R_CellForCamera: bad model");
    mnode_t *node = rgp.world->nodes;
    while (node->contents == -1)
    {
        const cplane_t *plane = node->u.node.plane;
        float distance = origin[2] * plane->normal[2]
            + origin[1] * plane->normal[1] + origin[0] * plane->normal[0]
            - plane->dist;
        if (distance > 0.0f)
            node = node->u.node.children[0];
        else
            node = node->u.node.children[1];
    }
    return node->cellIndex;
}

// PINNED 10007dc0/66; name SUPPORTED by KisakCOD.
static bool R_PortalBehindPlane(const GfxPortal *portal, const DpvsPlane *plane)
{
    const float *v = portal->vertices[0];
    int count = portal->vertexCount;
    while (count)
    {
        if (R_DpvsPlaneDistToPoint(plane, v) > 0.0f)
            return false;
        --count;
        v += 3;
    }
    return true;
}

// PINNED 10007e10/98: each plane must have a strictly front vertex.
static bool R_PortalBehindAnyPlane(const GfxPortal *portal, const DpvsPlane *planes, int planeCount)
{
    while (planeCount)
    {
        if (R_PortalBehindPlane(portal, planes))
            return true;
        --planeCount;
        ++planes;
    }
    return false;
}

// PINNED 10007e80/98: an occluder contains the portal only behind all planes.
static bool R_PortalBehindAllPlanes(const GfxPortal *portal, const DpvsPlane *planes, int planeCount)
{
    while (planeCount)
    {
        if (!R_PortalBehindPlane(portal, planes))
            return false;
        --planeCount;
        ++planes;
    }
    return true;
}

// PINNED adjacent active count/list at 101ce5c0/101ce5c4.

// PINNED 10007ef0; side and distance arrays include the closing vertex.
static const vec3_t *R_ChopPortalWinding(const vec3_t *vertsIn, int *vertexCount,
    const DpvsPlane *plane, vec3_t *vertsOut)
{
    byte sideForVert[129];
    float distForVert[129];
    float lerpFactor;
    int frontCount = 0, backCount = 0;
    int vertexIndex, newVertCount;
    const float *v;
    for (vertexIndex = 0; vertexIndex < *vertexCount; ++vertexIndex)
    {
        distForVert[vertexIndex] = vertsIn[vertexIndex][2] * plane->coeffs[2]
            + vertsIn[vertexIndex][0] * plane->coeffs[0]
            + plane->coeffs[1] * vertsIn[vertexIndex][1] + plane->coeffs[3] - 0.001f;
        sideForVert[vertexIndex] = 2;
        if (distForVert[vertexIndex] < -0.001f)
        {
            sideForVert[vertexIndex] = 1;
            ++backCount;
        }
        else if (distForVert[vertexIndex] > 0.001f)
        {
            sideForVert[vertexIndex] = 0;
            ++frontCount;
        }
    }
    if (!frontCount)
    {
        *vertexCount = 0;
        return 0;
    }
    if (!backCount)
        return vertsIn;
    sideForVert[vertexIndex] = sideForVert[0];
    distForVert[vertexIndex] = distForVert[0];
    newVertCount = 0;
    for (vertexIndex = 0; vertexIndex < *vertexCount && newVertCount < 128; ++vertexIndex)
    {
        if (sideForVert[vertexIndex] == 2)
        {
            VectorCopy(vertsIn[vertexIndex], vertsOut[newVertCount]);
            ++newVertCount;
        }
        else
        {
            if (sideForVert[vertexIndex] == 0)
            {
                VectorCopy(vertsIn[vertexIndex], vertsOut[newVertCount]);
                ++newVertCount;
            }
            if (sideForVert[vertexIndex + 1] != 2 && sideForVert[vertexIndex + 1] != sideForVert[vertexIndex])
            {
                lerpFactor = distForVert[vertexIndex] / (distForVert[vertexIndex] - distForVert[vertexIndex + 1]);
                v = vertsIn[(vertexIndex + 1) % *vertexCount];
                vertsOut[newVertCount][0] = (v[0] - vertsIn[vertexIndex][0]) * lerpFactor + vertsIn[vertexIndex][0];
                vertsOut[newVertCount][1] = (v[1] - vertsIn[vertexIndex][1]) * lerpFactor + vertsIn[vertexIndex][1];
                vertsOut[newVertCount][2] = (v[2] - vertsIn[vertexIndex][2]) * lerpFactor + vertsIn[vertexIndex][2];
                ++newVertCount;
            }
        }
    }
    *vertexCount = newVertCount;
    return vertsOut;
}

// PINNED 100080d0/130: rejection leaves the surface unmarked for other portals.
static void R_AddWorldSurfaceWithCull(int surfIndex, DpvsPlane *planes,
    int planeCount, int stackLevel)
{
    if (rg.surfaces[surfIndex].viewCount == scene.viewCount)
        return;
    const GfxSurface *surf = &rgp.world->surfaces[surfIndex];
    if (r_portalFineCull->current.enabled &&
        R_IsBoundsOutsideView(planes, planeCount, (const float *)surf->tris->bounds, stackLevel))
        return;
    R_AddWorldSurfaceDirect(surfIndex);
}

// PINNED 10008160/451: only intersecting nodes recurse; contained nodes draw flat.
static void R_AddAabbTreeSurfaces_r(GfxAabbTree *tree, DpvsPlane *planes,
    int planeCount, int stackLevel)
{
    if (R_IsAabbOutsideView(planes, planeCount, tree->mins, stackLevel))
        return;
    if (!R_AabbNeedsChildClipping(planes, planeCount, tree->mins, stackLevel))
    {
        if (dpvsGlob.debug.drawSModels)
            for (int i = 0; i < tree->staticModelCount; ++i)
                R_AddStaticModelDirect(tree->staticModels[i]);
        for (int i = 0; i < tree->surfaceCount; ++i)
            if (rg.surfaces[tree->startSurfIndex + i].viewCount != scene.viewCount)
                R_AddWorldSurfaceDirect(tree->startSurfIndex + i);
    }
    else if (tree->childCount)
    {
        for (int i = 0; i < tree->childCount; ++i)
            R_AddAabbTreeSurfaces_r(&tree->children[i], planes, planeCount, stackLevel + 1);
    }
    else
    {
        if (dpvsGlob.debug.drawSModels)
            for (int i = 0; i < tree->staticModelCount; ++i)
                R_AddStaticModelWithCull(tree->staticModels[i], planes, planeCount, stackLevel + 1);
        for (int i = 0; i < tree->surfaceCount; ++i)
            R_AddWorldSurfaceWithCull(tree->startSurfIndex + i, planes, planeCount, stackLevel + 1);
    }
}

void R_DrawModel(int entIndex)
{
    if (!dpvsGlob.debug.drawXModels)
        return;
    GfxEntity *ent = &scene.def.entities[entIndex];
    GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    R_UpdateXModelBounds(sceneEnt, ent);
    R_SkinSceneEnt(sceneEnt, ent);
    sceneEnt->cullState = 5;
    R_AddXModelSurfaces(entIndex);
}

// PINNED 100083a0/288: pose hints and visibility are client callbacks, not DObj calls.
static void R_DrawCellEntities(const GfxCell *cell, DpvsPlane *planes, int planeCount)
{
    for (const GfxSceneModelCellRef *ref = cell->modelRefs; ref;
            ref = (const GfxSceneModelCellRef *)ref->next)
    {
        GfxSceneEntity *sceneEnt = &scene.sceneEnts[ref->entIndex];
        if (sceneEnt->cullState == 5)
            continue;
        GfxEntity *ent = &scene.def.entities[ref->entIndex];
        if (ent->reType <= 1)
        {
            if (!dpvsGlob.debug.drawXModels)
                continue;
            if (sceneEnt->cullState < 2)
            {
                if (R_IsBoundsOutsideViewNoStack(planes, planeCount, ref->mins))
                    continue;
                ri.CG_UsedDObjCalcPose(sceneEnt->cent);
                R_UpdateXModelBounds(sceneEnt, ent);
            }
            if (R_IsBoundsOutsideViewNoStack(planes, planeCount, sceneEnt->curMins))
                continue;
            ri.CG_CullIn(sceneEnt->cent);
            R_SkinSceneEnt(sceneEnt, ent);
            sceneEnt->cullState = 5;
            R_AddXModelSurfaces(ref->entIndex);
        }
        else if (ent->reType == 3 && dpvsGlob.debug.drawBModels &&
            !R_IsBoundsOutsideViewNoStack(planes, planeCount, ref->mins))
            R_AddBModelSurfaces(sceneEnt, ref->entIndex);
    }
}

// PINNED 100084c0/161: broad model bounds are scaled and translated, not rotated.
static void R_GetModelEntityBounds(int entIndex, float *mins, float *maxs)
{
    const GfxEntity *ent = &scene.def.entities[entIndex];
    const GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    const DObj *obj = sceneEnt->u.obj;
    if (ent->reType != 0)
    {
        DObj *modelObj = rg.modelDObj;
        ri.DObjSetModel(modelObj, sceneEnt->u.model);
        obj = modelObj;
    }
    vec3_t localMins, localMaxs;
    ri.DObjGetBounds(obj, localMins, localMaxs);
    float scale = ent->scale;
    for (int i = 0; i < 3; ++i)
        mins[i] = localMins[i] * scale + ent->origin[i];
    scale = ent->scale;
    for (int i = 0; i < 3; ++i)
        maxs[i] = localMaxs[i] * scale + ent->origin[i];
}

// PINNED 10008570/139; the limit test is equality, not >=.

static void R_LinkEntityToCell(GfxCell *cell, int entIndex, const vec_t *mins, const vec_t *maxs)
{
    if (dpvsScene.modelRefCount == 4096)
    {
        ri.Printf(1, "^1Max xmodel refs (%i) exceeded\n", 4096);
        return;
    }
    GfxSceneModelCellRef *ref = cell->modelRefs;
    while (ref)
    {
        if (ref->entIndex == entIndex)
        {
            ExpandBounds(mins, maxs, ref->mins, ref->maxs);
            return;
        }
        ref = (GfxSceneModelCellRef *)ref->next;
    }
    ref = &dpvsScene.modelRefs[dpvsScene.modelRefCount++];
    ref->entIndex = entIndex;
    VectorCopy(mins, ref->mins);
    VectorCopy(maxs, ref->maxs);
    ref->next = (intptr_t)cell->modelRefs;
    cell->modelRefs = ref;
}

// PINNED 10008600/335; Mac name agrees with the BSP/cell behavior.
int R_FilterEntityIntoCells_r(mnode_t *node, int entIndex, const vec_t *mins, const vec_t *maxs)
{
    while (node->cellIndex == -2)
    {
        int side = BoxOnPlaneSide((float *)mins, (float *)maxs, node->u.node.plane);
        if (side == 3)
        {
            int front, back;
            if (node->u.node.plane->type < 3)
            {
                vec3_t localMins, localMaxs;
                VectorCopy(mins, localMins);
                localMins[node->u.node.plane->type] = node->u.node.plane->dist;
                VectorCopy(maxs, localMaxs);
                localMaxs[node->u.node.plane->type] = node->u.node.plane->dist;
                back = R_FilterEntityIntoCells_r(node->u.node.children[1], entIndex, mins, localMaxs);
                front = back;
                if (localMins[node->u.node.plane->type] < maxs[node->u.node.plane->type])
                    front = R_FilterEntityIntoCells_r(node->u.node.children[0], entIndex, localMins, maxs);
            }
            else
            {
                front = R_FilterEntityIntoCells_r(node->u.node.children[0], entIndex, mins, maxs);
                back = R_FilterEntityIntoCells_r(node->u.node.children[1], entIndex, mins, maxs);
            }
            return front == back ? front : -2;
        }
        node = node->u.node.children[side - 1];
    }
    if (node->cellIndex >= 0)
        R_LinkEntityToCell(&rgp.world->cells[node->cellIndex], entIndex, mins, maxs);
    return node->cellIndex;
}

// PINNED 100087a0/283: bypass cell splitting only for two oversized dimensions.
static void R_CullModelEntity(int entIndex, DpvsPlane *planes, int planeCount)
{
    vec3_t bounds[2];
    R_GetModelEntityBounds(entIndex, bounds[0], bounds[1]);
    if (R_IsBoundsOutsideViewNoStack(planes, planeCount, bounds[0]))
        return;
    int large = (bounds[1][0] - bounds[0][0] > 1536.0f)
        + (bounds[1][1] - bounds[0][1] > 1536.0f)
        + (bounds[1][2] - bounds[0][2] > 1536.0f);
    if (large < 2 && R_FilterEntityIntoCells_r(rgp.world->nodes, entIndex, bounds[0], bounds[1]) != -1)
        return;
    GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    GfxEntity *ent = &scene.def.entities[entIndex];
    R_UpdateXModelBounds(sceneEnt, ent);
    ri.CG_CullIn(sceneEnt->cent);
    R_SkinSceneEnt(sceneEnt, ent);
    sceneEnt->cullState = 5;
    R_AddXModelSurfaces(entIndex);
}

#pragma optimize("p", on)
/* Target 0x100088c0; descriptive name, historical symbol unconfirmed. */
static void R_TransformBoundsCorners(const GfxEntity *entity, vec3_t mins, vec3_t maxs, const vec3_t *bounds)
{
    mins[0] = 131072.0f;
    mins[1] = 131072.0f;
    mins[2] = 131072.0f;
    maxs[0] = -131072.0f;
    maxs[1] = -131072.0f;
    maxs[2] = -131072.0f;

#define TEST_BOUNDS_CORNER(x, y, z) \
    do { \
        vec3_t corner; \
        vec3_t transformed; \
        corner[0] = bounds[x][0]; \
        corner[1] = bounds[y][1]; \
        corner[2] = bounds[z][2]; \
        VectorCopy(entity->origin, transformed); \
        VectorMA(transformed, corner[0], entity->axis[0], transformed); \
        VectorMA(transformed, corner[1], entity->axis[1], transformed); \
        VectorMA(transformed, corner[2], entity->axis[2], transformed); \
        if (transformed[0] < mins[0]) mins[0] = transformed[0]; \
        if (transformed[0] > maxs[0]) maxs[0] = transformed[0]; \
        if (transformed[1] < mins[1]) mins[1] = transformed[1]; \
        if (transformed[1] > maxs[1]) maxs[1] = transformed[1]; \
        if (transformed[2] < mins[2]) mins[2] = transformed[2]; \
        if (transformed[2] > maxs[2]) maxs[2] = transformed[2]; \
    } while (0)

    TEST_BOUNDS_CORNER(0, 0, 0);
    TEST_BOUNDS_CORNER(1, 0, 0);
    TEST_BOUNDS_CORNER(0, 1, 0);
    TEST_BOUNDS_CORNER(1, 1, 0);
    TEST_BOUNDS_CORNER(0, 0, 1);
    TEST_BOUNDS_CORNER(1, 0, 1);
    TEST_BOUNDS_CORNER(0, 1, 1);
    TEST_BOUNDS_CORNER(1, 1, 1);

#undef TEST_BOUNDS_CORNER
}

// PINNED 100091d0/117; descriptive name, historical symbol unconfirmed.
void R_CullBrushEntity(int entIndex, DpvsPlane *planes, int planeCount)
{
    GfxEntity *entity = &scene.def.entities[entIndex];
    GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    vec3_t mins, maxs;
    R_TransformBoundsCorners(entity, mins, maxs, sceneEnt->u.bmodel->bounds);
    if (!R_IsBoundsOutsideViewNoStack(planes, planeCount, mins))
        if (R_FilterEntityIntoCells_r(rgp.world->nodes, entIndex, mins, maxs) == -1)
            R_AddBModelSurfaces(sceneEnt, entIndex);
}

#pragma optimize("p", off)

// PINNED 10009250/88: only model and brush entities participate in cell routing.
static void R_CullSceneEntities(DpvsPlane *planes, int planeCount)
{
    int count = scene.def.entityCount;
    for (int i = 0; i < count; ++i)
    {
        refEntityType_t type = scene.def.entities[i].reType;
        if (type <= 1)
            R_CullModelEntity(i, planes, planeCount);
        else if (type == 3)
            R_CullBrushEntity(i, planes, planeCount);
    }
}

// PINNED 100092b0/234: the cell's root AABB chooses recursive or flat culling.
static void R_AddVisibleSurfacesInCell(const GfxCell *cell, DpvsPlane *planes, int planeCount)
{
    if (dpvsGlob.debug.drawWorld)
    {
        GfxAabbTree *tree = cell->aabbTree;
        if (tree->childCount && r_portalFineCull->current.enabled)
        {
            for (int i = 0; i < tree->childCount; ++i)
                R_AddAabbTreeSurfaces_r(&tree->children[i], planes, planeCount, 0);
        }
        else
        {
            if (dpvsGlob.debug.drawSModels)
                for (int i = 0; i < tree->staticModelCount; ++i)
                    R_AddStaticModelWithCull(tree->staticModels[i], planes, planeCount, 0);
            for (int i = 0; i < tree->surfaceCount; ++i)
                R_AddWorldSurfaceWithCull(tree->startSurfIndex + i, planes, planeCount, 0);
        }
    }
    if (dpvsGlob.debug.drawEntities)
        R_DrawCellEntities(cell, planes, planeCount);
}

// PINNED 100093a0/217: a visible cull group publishes all of its surfaces.
static void R_AddCullGroup(int groupIndex, DpvsPlane *planes, int planeCount)
{
    const GfxCullGroup *group = &rgp.world->cullGroups[groupIndex];
    if (R_IsBoundsOutsideViewNoStack(planes, planeCount, group->mins))
        return;
    if (r_showPortals->current.integer & 1)
        R_AddDebugBox(&frontEndDataOut->debugGlobals, group->mins, group->maxs, colorLtYellow);
    rg.cullGroups[groupIndex].viewCount = scene.viewCount;
    for (int i = 0; i < group->surfaceCount; ++i)
    {
        int surfIndex = group->startSurfIndex + i;
        rg.surfaces[surfIndex].viewCount = scene.viewCount;
        const GfxSurface *surf = &rgp.world->surfaces[surfIndex];
        R_AddDrawSurf(surf->material, surf->sortGroup + 2048, surf->lightmapIndex, surf->data);
    }
}

// PINNED 10009480/234 and10009570/283 share this actual model publication path.
static void R_PublishStaticModel(int smodelIndex, const GfxStaticModelInstance *instance)
{
    if (r_showSModelNames->current.enabled)
        R_AddDebugString(&frontEndDataOut->debugGlobals, instance->origin, colorWhite,
            0.3f, ri.XModelGetName(instance->model));
    int entIndex = R_AddStaticModelToScene(smodelIndex);
    if (entIndex < 0)
        return;
    GfxSceneEntity *sceneEnt = &scene.sceneEnts[entIndex];
    R_SkinStaticModel(sceneEnt, &scene.def.entities[entIndex], smodelIndex);
    sceneEnt->cullState = 5;
    R_AddXModelSurfaces(entIndex);
}

static void R_AddStaticModelWithCull(int smodelIndex, DpvsPlane *planes,
    int planeCount, int stackLevel)
{
    if (rg.smodelDyncs[smodelIndex].viewCount == scene.viewCount)
        return;
    int viewCount = scene.viewCount;
    const GfxStaticModelInstance *instance = &rgp.world->smodelInsts[smodelIndex];
    if (instance->cullDist != 0.0f && instance->cullDist <
        Vec3Distance(instance->origin, rg.lodParms.origin) * rg.lodParms.scale + rg.lodParms.bias)
    {
        rg.smodelDyncs[smodelIndex].viewCount = viewCount;
        return;
    }
    if (R_IsBoundsOutsideView(planes, planeCount, instance->mins, stackLevel))
        return;
    rg.smodelDyncs[smodelIndex].viewCount = scene.viewCount;
    R_PublishStaticModel(smodelIndex, instance);
}

// PINNED 10009690/55.
static void R_AddCellCullGroups(const GfxCell *cell, DpvsPlane *planes, int planeCount)
{
    const int *groups = cell->cullGroups;
    for (int i = cell->cullGroupCount; i != 0; --i, ++groups)
    {
        int groupIndex = *groups;
        if (rg.cullGroups[groupIndex].viewCount != scene.viewCount)
            R_AddCullGroup(groupIndex, planes, planeCount);
    }
}

// PINNED 10009700/58; descriptive name, not recovered debug information.
static __declspec(noinline) bool R_IsPortalOccluded(const GfxPortal *portal)
{
    for (int index = 0; index < activeOccluders.count; ++index)
        if (R_PortalBehindAllPlanes(portal, activeOccluders.list[index]->viewPlanes,
                activeOccluders.list[index]->viewPlaneCount))
            return true;
    return false;
}

// PINNED: 10009910; descriptive name SUPPORTED by KisakCOD.
void R_AddVertToPortalHullPoints(GfxPortal *portal, const float *v)
{
    vec2_t hull[64];
    int hullPointCount;
    GfxHullPointsPool *pool;
    if (!portal->hullPoints)
    {
        pool = nextFreeHullPoints;
        if (!nextFreeHullPoints)
            R_Error(ERR_DROP, "more than %i queued portals", 256);
        nextFreeHullPoints = nextFreeHullPoints->nextFree;
        portal->hullPoints = pool->points;
        portal->hullPointCount = 0;
    }
    else if (portal->hullPointCount == 64)
    {
        hullPointCount = Com_ConvexHull(portal->hullPoints, 64, hull);
        if (hullPointCount == 64)
            R_Error(ERR_DROP, "More than %i points on a clipped portal's convex hull\n", 64);
        portal->hullPointCount = (byte)hullPointCount;
        memcpy(portal->hullPoints, hull, portal->hullPointCount * sizeof(vec2_t));
    }
    portal->hullPoints[portal->hullPointCount][0] =
        portal->hullAxis[0][0] * v[0] + (portal->hullAxis[0][1] * v[1] + portal->hullAxis[0][2] * v[2]);
    portal->hullPoints[portal->hullPointCount][1] =
        portal->hullAxis[1][0] * v[0] + (portal->hullAxis[1][1] * v[1] + portal->hullAxis[1][2] * v[2]);
    ++portal->hullPointCount;
}

static int R_ChopPortal(const GfxPortal *portal, const DpvsPlane *parentPlane,
    const DpvsPlane *planes, int planeCount, vec3_t v[2][128], const vec3_t **finalVerts)
{
    int vertexCount = portal->vertexCount;
    const vec3_t *w;
    int planeIndex;
    w = R_ChopPortalWinding(portal->vertices, &vertexCount, parentPlane, v[0]);
    if (!vertexCount)
        return 0;
    if (portalFarPlane)
    {
        w = R_ChopPortalWinding(w, &vertexCount, portalFarPlane, v[w == v[0]]);
        if (!vertexCount)
            return 0;
    }
    for (planeIndex = 0; planeIndex < planeCount; ++planeIndex)
    {
        w = R_ChopPortalWinding(w, &vertexCount, &planes[planeIndex], v[w == v[0]]);
        if (!vertexCount)
            return 0;
    }
    if (finalVerts)
        *finalVerts = w;
    return vertexCount;
}

// PINNED 10009b30: this variant always clips to its parent plane.
bool R_ChopPortalAndAddHullPoints(GfxPortal *portal, const DpvsPlane *parentPlane,
    const DpvsPlane *planes, int planeCount)
{
    vec3_t v[2][128];
    const vec3_t *w;
    int vertexCount = R_ChopPortal(portal, parentPlane, planes, planeCount, v, &w);
    if (!vertexCount)
        return false;
    for (int vertexIndex = 0; vertexIndex < vertexCount; ++vertexIndex)
        R_AddVertToPortalHullPoints(portal, w[vertexIndex]);
    return true;
}

// PINNED 10009bc0/301. Shared clipping buffers are reused down the traversal.
static bool R_IsCellInList(const GfxCell *cell, const GfxCell **list, int count)
{
    for (int index = 0; index < count; ++index)
        if (cell == list[index])
            return true;
    return false;
}

int R_GetFurtherCellList_r(const GfxCell *cell, const DpvsPlane *parentPlane,
    const DpvsPlane *planes, int planeCount, vec3_t v[2][128], const GfxCell **list, int count)
{
    for (int portalIndex = 0; portalIndex < cell->portalCount; ++portalIndex)
    {
        const GfxPortal *portal = &cell->portals[portalIndex];
        if (R_IsCellInList(portal->cell, list, count) || portal->writable.isAncestor)
            continue;
        if (DotProduct4(portal->plane.coeffs, dpvsViewOrg) > 0.0f)
            continue;
        if (R_PortalBehindAnyPlane(portal, planes, planeCount) || R_IsPortalOccluded(portal))
            continue;
        if (R_ChopPortal(portal, parentPlane, planes, planeCount, v, 0))
        {
            list[count++] = portal->cell;
            count = R_GetFurtherCellList_r(portal->cell, parentPlane, planes, planeCount, v, list, count);
        }
    }
    return count;
}

void R_PortalQueuePush(GfxPortal *portal)
{
    int index;
    int parent;
    float distance;

    if (portalQueueCount >= 256)
        R_Error(ERR_DROP, "More than %i queued portals", 256);
    portal->writable.isQueued = 1;
    distance = R_FurthestPointOnWinding(portal->vertices, portal->vertexCount, portalViewPlane.coeffs);
    index = portalQueueCount;
    for (;;)
    {
        parent = (index - 1) >> 1;
        if (parent < 0 || distance >= portalQueue[parent].dist)
            break;
        portalQueue[index].portal = portalQueue[parent].portal;
        portalQueue[index].dist = portalQueue[parent].dist;
        index = parent;
    }
    portalQueue[index].portal = portal;
    portalQueue[index].dist = distance;
    ++portalQueueCount;
}

// PINNED 10009cf0/167: cells beyond an unclipped opening reuse the current frustum.
static void R_DrawFurtherCells(const GfxCell *cell, const DpvsPlane *parentPlane,
    DpvsPlane *planes, int planeCount)
{
    const GfxCell *cells[1024];
    vec3_t winding[2][128];
    int count = R_GetFurtherCellList_r(cell, parentPlane, planes, planeCount, winding, cells, 0);
    for (int i = 0; i < count; ++i)
    {
        R_AddVisibleSurfacesInCell(cells[i], planes, planeCount);
        if (dpvsGlob.debug.drawWorld)
            R_AddCellCullGroups(cells[i], planes, planeCount);
    }
}

// PINNED 10009df0/547: ancestors are marked only while visiting this cell.
static void R_VisitPortalsForCell(const GfxCell *cell, GfxPortal *parentPortal,
    const DpvsPlane *parentPlane, DpvsPlane *planes, int planeCount,
    DpvsClipChildren clipChildren)
{
    R_SetupOccludersForCell(cell, planes, planeCount);
    R_AddVisibleSurfacesInCell(cell, planes, planeCount);
    if (dpvsGlob.debug.drawWorld)
        R_AddCellCullGroups(cell, planes, planeCount);
    for (GfxPortal *ancestor = parentPortal; ancestor; ancestor = ancestor->writable.queuedParent)
        ancestor->writable.isAncestor = true;
    if (clipChildren == DPVS_DONT_CLIP_CHILDREN)
    {
        R_DrawFurtherCells(cell, parentPlane, planes, planeCount);
    }
    else
    {
        for (int i = 0; i < cell->portalCount; ++i)
        {
            GfxPortal *portal = &cell->portals[i];
            if (portal->writable.isAncestor)
                continue;
            float distance = dpvsViewOrg[0] * portal->plane.coeffs[0]
                + dpvsViewOrg[3] * portal->plane.coeffs[3]
                + dpvsViewOrg[2] * portal->plane.coeffs[2]
                + dpvsViewOrg[1] * portal->plane.coeffs[1];
            if (!(distance <= 0.0f) || R_PortalBehindAnyPlane(portal, planes, planeCount)
                || R_IsPortalOccluded(portal))
                continue;
            if (dpvsViewOrg[3] == 0.0f || distance <= -0.125f)
            {
                if (!R_ChopPortalAndAddHullPoints(portal, parentPlane, planes, planeCount))
                    continue;
                if (!portal->writable.isQueued)
                {
                    portal->writable.queuedParent = parentPortal;
                    R_PortalQueuePush(portal);
                }
                else if (portal->writable.queuedParent != parentPortal)
                    portal->writable.queuedParent = 0;
            }
            else if (PointInPolygon(portal->vertices, portal->vertexCount,
                portal->plane.coeffs, dpvsViewOrg))
            {
                portal->writable.queuedParent = 0;
                R_VisitPortalsForCell(portal->cell, portal, &portal->plane, planes, planeCount, clipChildren);
            }
        }
    }
    for (GfxPortal *ancestor = parentPortal; ancestor; ancestor = ancestor->writable.queuedParent)
        ancestor->writable.isAncestor = false;
}

// PINNED 1000a020/919: arena owns hulls; stack owns the queue and clipped planes.
static void R_VisitPortals(const GfxCell *cell, const DpvsPlane *parentPlane,
    DpvsPlane *planes, int planeCount)
{
    int mark = ri.HiAlloc(0x20000);
    nextFreeHullPoints = (GfxHullPointsPool *)ri.HiOffToPtr(mark);
    GfxHullPointsPool *pool = nextFreeHullPoints;
    for (int i = 0; i < 255; ++i)
        pool[i].nextFree = &pool[i + 1];
    pool[255].nextFree = 0;
    PortalHeapNode queue[256];
    portalQueue = queue;
    portalQueueCount = 0;
    R_VisitPortalsForCell(cell, 0, parentPlane, planes, planeCount, DPVS_CLIP_CHILDREN);
    int visited = 0;
    while (portalQueueCount)
    {
        GfxPortal *portal = R_PortalQueuePopMin();
        vec2_t hull[64];
        int count = Com_ConvexHull(portal->hullPoints, portal->hullPointCount, hull);
        GfxHullPointsPool *released = (GfxHullPointsPool *)portal->hullPoints;
        released->nextFree = nextFreeHullPoints;
        nextFreeHullPoints = released;
        portal->hullPoints = 0;
        if (!count)
            continue;
        if (++visited == r_portalWalkLimit->current.integer)
            break;
        vec3_t winding[64];
        vec3_t base;
        VectorScale(portal->plane.coeffs, -portal->plane.coeffs[3], base);
        for (int i = 0; i < count; ++i)
        {
            VectorMA(base, hull[i][0], portal->hullAxis[0], winding[i]);
            VectorMA(winding[i], hull[i][1], portal->hullAxis[1], winding[i]);
        }
        if (r_showPortals->current.integer && !r_portalBevelsOnly->current.enabled)
        {
            const float color[4] = {0.0f, 1.0f, 1.0f, 0.25f};
            R_AddDebugPolygon(&frontEndDataOut->debugGlobals, color, count, winding);
        }
        DpvsPlane clipped[16];
        DpvsClipChildren clipChildren;
        int clippedCount = R_PortalClipPlanes(clipped, count, winding, &clipChildren);
        R_VisitPortalsForCell(portal->cell, portal, &portal->plane, clipped, clippedCount, clipChildren);
    }
    while (portalQueueCount)
    {
        GfxPortal *portal = R_PortalQueuePopMin();
        GfxHullPointsPool *released = (GfxHullPointsPool *)portal->hullPoints;
        released->nextFree = nextFreeHullPoints;
        nextFreeHullPoints = released;
        portal->hullPoints = 0;
    }
    ri.HiSetOffset(mark);
}

// PINNED 1000a3c0/389; name SUPPORTED by KisakCOD.
void R_SetupDpvsForPoint(const GfxViewParms *viewParms)
{
    VectorCopy(viewParms->origin, dpvsViewOrg);
    dpvsViewOrg[3] = 1.0f;
    VectorCopy(viewParms->axis[0], portalViewPlane.coeffs);
    R_DpvsPlaneSetDistAndSides(&portalViewPlane, dpvsViewOrg, 0.1f);
    portalViewPlane.u.frontal = 255;
    portalNearPlane = &portalViewPlane;
    float zfar = R_GetFarPlaneDist();
    // PINNED: unordered zfar takes the fog-plane branch too.
    if (zfar <= 0.0f)
        portalFarPlane = 0;
    else
    {
        portalFogPlane.coeffs[0] = -viewParms->axis[0][0];
        portalFogPlane.coeffs[1] = -viewParms->axis[0][1];
        portalFogPlane.coeffs[2] = -viewParms->axis[0][2];
        portalFogPlane.coeffs[3] = zfar - DotProduct(portalFogPlane.coeffs, dpvsViewOrg);
        portalFogPlane.side[0] = FloatAsInt(portalFogPlane.coeffs[0]) > 0 ? 12 : 0;
        portalFogPlane.side[1] = FloatAsInt(portalFogPlane.coeffs[1]) > 0 ? 16 : 4;
        portalFogPlane.side[2] = FloatAsInt(portalFogPlane.coeffs[2]) > 0 ? 20 : 8;
        portalFogPlane.u.frontal = 255;
        portalFarPlane = &portalFogPlane;
    }
}

// PINNED 1000a550/194: directional visibility has no near/far clipping planes.
void R_SetupDpvsForDir(const GfxViewParms *viewParms)
{
    VectorNegate(viewParms->axis[0], dpvsViewOrg);
    dpvsViewOrg[3] = 0.0f;
    VectorCopy(viewParms->axis[0], portalViewPlane.coeffs);
    portalViewPlane.coeffs[3] = 262144.0f - DotProduct(portalViewPlane.coeffs, dpvsViewOrg);
    portalViewPlane.side[0] = FloatAsInt(portalViewPlane.coeffs[0]) > 0 ? 12 : 0;
    portalViewPlane.side[1] = FloatAsInt(portalViewPlane.coeffs[1]) > 0 ? 16 : 4;
    portalViewPlane.side[2] = FloatAsInt(portalViewPlane.coeffs[2]) > 0 ? 20 : 8;
    portalNearPlane = 0;
    portalFarPlane = 0;
}

// PINNED 1000a680/248: route entities before walking all/single/connected cells.
static void R_AddWorldSurfacesByCell(int cameraCell, DpvsPlane *planes, int planeCount)
{
    R_CullSceneEntities(planes, planeCount);
    if (r_skipPvs->current.enabled)
        return;
    if (cameraCell < 0)
    {
        for (int i = 0; i < rgp.world->cellCount; ++i)
        {
            const GfxCell *cell = &rgp.world->cells[i];
            R_AddVisibleSurfacesInCell(cell, planes, planeCount);
            if (dpvsGlob.debug.drawWorld)
                R_AddCellCullGroups(cell, planes, planeCount);
        }
    }
    else
    {
        const GfxCell *cell = &rgp.world->cells[cameraCell];
        if (r_singleCell->current.enabled)
        {
            portalFarPlane = 0;
            R_AddVisibleSurfacesInCell(cell, planes, planeCount);
            if (dpvsGlob.debug.drawWorld)
                R_AddCellCullGroups(cell, planes, planeCount);
        }
        else
            R_VisitPortals(cell, &portalViewPlane, planes, planeCount);
    }
}

// PINNED 1000a780: sky surfaces omit the final fog/far clip plane.
static void R_AddSkySurfaces(DpvsPlane *planes, int planeCount)
{
    if (!portalFarPlane)
        return;
    for (int i = 0; i < rgp.world->skySurfCount; ++i)
        R_AddWorldSurfaceWithCull(rgp.world->skyStartSurfs[i], planes, planeCount - 1, 0);
}

void R_ClearDpvsScene()
{
    int cellIndex;

    dpvsScene.modelRefCount = 0;
    if (rgp.world)
    {
        for (cellIndex = 0; cellIndex < rgp.world->cellCount; cellIndex++)
            rgp.world->cells[cellIndex].modelRefs = 0;
    }
}

void R_CullSceneLights(const DpvsPlane *planes, int planeCount)
{
    for (int i = 0; i < scene.dlightCount; ++i)
    {
        const GfxLight *light = &scene.dlights[i];
        scene.dlightCulled[i] = R_CullPointAndRadius(light->position,
            light->position[3], planes, planeCount) == 2;
    }
}

// PINNED 1000a8d0/399: arena buffers outlive portal walking and all light culling.
void R_AddWorldSurfacesDpvs(const GfxViewParms *viewParms, int cameraCell)
{
    int occluderMark = ri.HiAlloc(0x1000);
    activeOccluders.list = (GfxOccluder **)ri.HiOffToPtr(occluderMark);
    int planeMark = ri.HiAlloc(0x1e000);
    activeOccluderPlanes.planes = (DpvsPlane *)ri.HiOffToPtr(planeMark);
    dpvsGlob.debug.drawWorld = r_drawWorld->current.enabled;
    dpvsGlob.debug.drawEntities = r_drawEntities->current.enabled;
    dpvsGlob.debug.drawBModels = r_drawBModels->current.enabled && dpvsGlob.debug.drawEntities;
    dpvsGlob.debug.drawSModels = r_drawSModels->current.enabled && dpvsGlob.debug.drawEntities;
    dpvsGlob.debug.drawXModels = r_drawXModels->current.enabled && dpvsGlob.debug.drawEntities;
    activeOccluders.count = 0;
    portalViewProjectionMatrix = &viewParms->viewProjectionMatrix;
    portalInverseViewProjectionMatrix = &viewParms->inverseViewProjectionMatrix;
    DpvsPlane planes[6];
    R_FrustumClipPlanes(&viewParms->viewProjectionMatrix, standardFrustumSidePlanes, 4, planes);
    if (viewParms->projectionMatrix.m[3][3] == 0.0f)
        R_SetupDpvsForPoint(viewParms);
    else
        R_SetupDpvsForDir(viewParms);
    int planeCount = R_AppendNearFarPlanes(planes, 4);
    rg.debugViewParms = viewParms;
    R_AddWorldSurfacesByCell(cameraCell, planes, planeCount);
    R_AddSkySurfaces(planes, planeCount);
    R_CullSceneLights(planes, planeCount);
    if (r_vc_makelog->current.integer)
        RB_ShowLightVisCachePoints(viewParms, planes, planeCount);
    ri.HiSetOffset(planeMark);
    ri.HiSetOffset(occluderMark);
}

float R_GetFarPlaneDist()
{
    float farDist;

    farDist = r_zfar->current.value;
    if (farDist == 0.0f && rg.fogIndex && rg.fogSettings[2].registered && rg.fogSettings[2].techniqueOffset == 1)
        farDist = rg.fogSettings[2].fogEnd;
    if (farDist < dpvsCullDist)
        farDist = dpvsCullDist;
    return farDist;
}

void R_SetCullDist(float dist)
{
    if (dist <= 0.0f)
        dpvsCullDist = 0.0f;
    else
        dpvsCullDist = dist;
}

GfxPortal *R_PortalQueuePopMin()
{
    GfxPortal *top;
    int count;
    int hole;
    int index;
    int child;

    top = portalQueue[0].portal;
    *(unsigned char *)top = 0;
    portalQueueCount--;
    count = portalQueueCount;
    hole = 0;
    index = 1;
    if (count > 0)
    {
        do
        {
            child = index;
            if (index < count && portalQueue[index + 1].dist < portalQueue[index].dist)
                child = index + 1;
            if (portalQueue[count].dist <= portalQueue[child].dist)
                break;
            portalQueue[hole] = portalQueue[child];
            index = child * 2 + 1;
            hole = child;
        } while (index <= count);
    }
    portalQueue[hole] = portalQueue[portalQueueCount];
    return top;
}



// PINNED: view projection 101ce5b8, inverse view projection 101ce5bc.

static __forceinline void R_UnprojectPoint(const float *projected, float *unprojected)
{
    const D3DMATRIX *matrix = portalInverseViewProjectionMatrix;
    unprojected[0] = matrix->m[0][0] * projected[0] + matrix->m[1][0] * projected[1] + matrix->m[3][0];
    unprojected[1] = matrix->m[0][1] * projected[0] + matrix->m[1][1] * projected[1] + matrix->m[3][1];
    unprojected[2] = matrix->m[0][2] * projected[0] + matrix->m[1][2] * projected[1] + matrix->m[3][2];
    unprojected[3] = matrix->m[0][3] * projected[0] + matrix->m[1][3] * projected[1] + matrix->m[3][3];
}

static __forceinline void R_AddPortalDebugLine(const float *start, const float *end, float cyan)
{
    DebugGlobals *debug = &frontEndDataOut->debugGlobals;
    if (debug->lineCount + 1 > debug->lineLimit)
        return;
    if (!debug->lines)
        debug->lines = (trDebugLine_t *)ri.Z_MallocInternal(debug->lineLimit * sizeof(trDebugLine_t));
    trDebugLine_t *line = &debug->lines[debug->lineCount];
    VectorCopy(start, line->start);
    VectorCopy(end, line->end);
    Vector4Set(line->color, 0.0f, cyan, cyan, 1.0f);
    line->depthTest = 0;
    ++debug->lineCount;
}

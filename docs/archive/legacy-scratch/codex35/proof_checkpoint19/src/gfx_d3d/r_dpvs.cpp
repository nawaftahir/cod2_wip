// Portal visibility (DPVS) helpers.
#include "gfx.h"
#include <universal/com_math.h>

extern const dvar_t *r_zfar;

// PINNED 1.0: queue count 0x101ce5e0, queue base 0x101ce5e4, cullDist 0x101ce5f4.
struct PortalQueueState
{
    int count;
    PortalHeapNode *nodes;
};
// PINNED adjacent count and pointer fields in the retail DPVS global state.
PortalQueueState portalQueueState;
#define portalQueueCount portalQueueState.count
#define portalQueue portalQueueState.nodes
float dpvsCullDist;
DpvsScene dpvsScene;
void ExpandBounds(const vec3_t mins, const vec3_t maxs, vec3_t outMins, vec3_t outMaxs);

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
                memcpy(localMins, mins, sizeof(localMins));
                localMins[node->u.node.plane->type] = node->u.node.plane->dist;
                memcpy(localMaxs, maxs, sizeof(localMaxs));
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

// PINNED: free-list pointer 101ce5e8; each entry holds 64 vec2 points.
union GfxHullPointsPool
{
    GfxHullPointsPool *nextFree;
    vec2_t points[64];
};
GfxHullPointsPool *nextFreeHullPoints;
int Com_ConvexHull(vec2_t *points, int pointCount, vec2_t *hull);

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

// PINNED caller 0x10009770 uses a plane at 0x101ce588; historical name unconfirmed.
DpvsPlane portalViewPlane;
// PINNED 1.0 view origin/direction is at 0x101ce5d0, homogeneous component at +12.
vec4_t dpvsViewOrg;

// Private C-vs-C++ kernel experiment. The original TU language is not established.
extern "C" double R_FurthestPointOnWinding(const vec3_t *points, int pointCount, const float *plane);

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

// PINNED: optional far plane pointer 101ce5b4.
const DpvsPlane *portalFarPlane;
// PINNED: fog plane 101ce59c and near-plane pointer 101ce5b0.
DpvsPlane portalFogPlane;
const DpvsPlane *portalNearPlane;
__declspec(noinline) float R_GetFarPlaneDist();

// PINNED 1000a3c0/389; name SUPPORTED by KisakCOD.
void R_SetupDpvsForPoint(const GfxViewParms *viewParms)
{
    VectorCopy(viewParms->origin, dpvsViewOrg);
    dpvsViewOrg[3] = 1.0f;
    VectorCopy(viewParms->axis[0], portalViewPlane.coeffs);
    portalViewPlane.coeffs[3] = 0.1f - DotProduct(portalViewPlane.coeffs, dpvsViewOrg);
    portalViewPlane.side[0] = FloatAsInt(portalViewPlane.coeffs[0]) > 0 ? 12 : 0;
    portalViewPlane.side[1] = FloatAsInt(portalViewPlane.coeffs[1]) > 0 ? 16 : 4;
    portalViewPlane.side[2] = FloatAsInt(portalViewPlane.coeffs[2]) > 0 ? 20 : 8;
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

// PINNED 10007dc0/66; name SUPPORTED by KisakCOD.
static bool R_PortalBehindPlane(const GfxPortal *portal, const DpvsPlane *plane)
{
    const float *v = portal->vertices[0];
    int count = portal->vertexCount;
    while (count)
    {
        if (DotProduct(plane->coeffs, v) + plane->coeffs[3] > 0.0f)
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
struct ActiveOccluders
{
    int count;
    GfxOccluder **list;
};
ActiveOccluders activeOccluders;

// PINNED 10009700/58; descriptive name, not recovered debug information.
static __declspec(noinline) bool R_IsPortalOccluded(const GfxPortal *portal)
{
    for (int index = 0; index < activeOccluders.count; ++index)
        if (R_PortalBehindAllPlanes(portal, activeOccluders.list[index]->viewPlanes,
                activeOccluders.list[index]->viewPlaneCount))
            return true;
    return false;
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

// PINNED Win 1.0 occluder setup: 10005d70 and 100079d0--10007d4f.
#include "gfx.h"
#include <universal/com_math.h>

extern const dvar_t *r_showPortals;
extern vec4_t dpvsViewOrg;
extern const DpvsPlane *portalNearPlane;
struct ActiveOccluders { int count; GfxOccluder **list; };
extern ActiveOccluders activeOccluders;
// PINNED adjacent count/pointer at 101ce5c8/101ce5cc.
struct ActiveOccluderPlanes { int count; DpvsPlane *planes; };
ActiveOccluderPlanes activeOccluderPlanes;

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
        if (distance > 0.0f)
            return true;
    }
    for (int occluderIndex = 0; occluderIndex < activeOccluders.count; ++occluderIndex)
    {
        GfxOccluder *occluder = activeOccluders.list[occluderIndex];
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

static void R_AddOccluderDebugLine(DebugGlobals *debug, const float *start, const float *end)
{
    if (debug->lineCount + 1 > debug->lineLimit)
        return;
    if (!debug->lines)
        debug->lines = (trDebugLine_t *)ri.Z_MallocInternal(debug->lineLimit * sizeof(trDebugLine_t));
    trDebugLine_t *line = &debug->lines[debug->lineCount];
    VectorCopy(start, line->start);
    VectorCopy(end, line->end);
    VectorCopy4(colorMagenta, line->color);
    line->depthTest = false;
    ++debug->lineCount;
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
            if (DotProduct4(dpvsViewOrg, occluder->planes[planeIndex].coeffs) > 0.0f)
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
                R_AddOccluderDebugLine(&frontEndDataOut->debugGlobals, *edge->vertex[0], *edge->vertex[1]);
            int side = edge->plane[0]->u.frontal;
            R_CreateOccluderEdgePlane(*edge->vertex[!side], *edge->vertex[side],
                &activeOccluderPlanes.planes[activeOccluderPlanes.count]);
            ++activeOccluderPlanes.count;
        }
        occluder->viewPlaneCount = activeOccluderPlanes.count - occluder->viewPlaneCount;
    }
}

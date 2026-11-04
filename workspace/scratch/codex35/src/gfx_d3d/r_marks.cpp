// World surface queries for decal marks.
#include "gfx.h"

struct ClipPoint
{
    vec3_t xyz;
    vec2_t lmapCoord;
    vec3_t normal;
};
typedef char ClipPointSizeCheck[sizeof(ClipPoint) == 32 ? 1 : -1];

// Name unconfirmed; PINNED 0x100151e0 interpolates all eight clip-point floats.
static __declspec(noinline) void R_LerpMarkPoints(const ClipPoint *from, const ClipPoint *to, float fraction, ClipPoint *out)
{
    out->xyz[0] = (to->xyz[0] - from->xyz[0]) * fraction + from->xyz[0];
    out->xyz[1] = (to->xyz[1] - from->xyz[1]) * fraction + from->xyz[1];
    out->xyz[2] = (to->xyz[2] - from->xyz[2]) * fraction + from->xyz[2];
    out->lmapCoord[0] = (to->lmapCoord[0] - from->lmapCoord[0]) * fraction + from->lmapCoord[0];
    out->lmapCoord[1] = (to->lmapCoord[1] - from->lmapCoord[1]) * fraction + from->lmapCoord[1];
    out->normal[0] = (to->normal[0] - from->normal[0]) * fraction + from->normal[0];
    out->normal[1] = (to->normal[1] - from->normal[1]) * fraction + from->normal[1];
    out->normal[2] = (to->normal[2] - from->normal[2]) * fraction + from->normal[2];
}

static int R_ChopPolyBehindPlane(int inPointCount, ClipPoint *inPoints, ClipPoint *outPoints, const float *normal, float dist)
{
    int counts[3] = {0, 0, 0};
    int sides[10];
    float dists[10];
    float d;
    int pointIndex;
    int outPointCount;
    ClipPoint *inPoint;
    ClipPoint *outPoint;

    for (pointIndex = 0; pointIndex < inPointCount; ++pointIndex)
    {
        d = inPoints[pointIndex].xyz[0] * normal[0] + inPoints[pointIndex].xyz[1] * normal[1]
            + inPoints[pointIndex].xyz[2] * normal[2] - dist;
        dists[pointIndex] = d;
        if (d > 0.5f)
            sides[pointIndex] = 0;
        else if (d < -0.5f)
            sides[pointIndex] = 1;
        else
            sides[pointIndex] = 2;
        ++counts[sides[pointIndex]];
    }
    sides[pointIndex] = sides[0];
    dists[pointIndex] = dists[0];
    if (!counts[0])
        return 0;
    if (!counts[1])
    {
        memcpy(outPoints, inPoints, inPointCount * sizeof(ClipPoint));
        return inPointCount;
    }
    outPointCount = 0;
    pointIndex = 0;
    if (inPointCount > 0)
    {
        outPoint = outPoints;
        do
        {
            inPoint = &inPoints[pointIndex];
            if (sides[pointIndex] == 2)
            {
                memcpy(outPoint, inPoint, sizeof(ClipPoint));
                ++outPointCount;
                ++outPoint;
            }
            else
            {
                if (sides[pointIndex] == 0)
                {
                    memcpy(outPoint, inPoint, sizeof(ClipPoint));
                    ++outPointCount;
                    ++outPoint;
                }
                if (sides[pointIndex + 1] != 2 && sides[pointIndex + 1] != sides[pointIndex])
                {
                    R_LerpMarkPoints(inPoint, &inPoints[(pointIndex + 1) % inPointCount],
                        dists[pointIndex] / (dists[pointIndex] - dists[pointIndex + 1]), outPoint);
                    ++outPointCount;
                    ++outPoint;
                }
            }
            ++pointIndex;
        } while (pointIndex < inPointCount);
    }
    return outPointCount;
}

static int R_AddMarkFragment(ClipPoint (*clipPoints)[9], const vec3_t *normals, const float *dists,
    int maxPoints, GfxWorldVertex *verts, GfxMarkFragment *fragment)
{
    int pingPong = 0;
    int pointCount = 3;
    int planeIndex;
    int pointIndex;

    for (planeIndex = 0; planeIndex < 6; ++planeIndex)
    {
        pointCount = R_ChopPolyBehindPlane(pointCount, clipPoints[pingPong], clipPoints[!pingPong],
            normals[planeIndex], dists[planeIndex]);
        pingPong ^= 1;
        if (!pointCount)
            return -1;
    }
    if (pointCount > maxPoints)
        return -1;
    fragment->pointCount = (byte)pointCount;
    for (pointIndex = 0; pointIndex < pointCount; ++pointIndex)
    {
        VectorCopy(clipPoints[pingPong][pointIndex].xyz, verts[pointIndex].xyz);
        Vector2Copy(clipPoints[pingPong][pointIndex].lmapCoord, verts[pointIndex].lmapCoord);
        VectorCopy(clipPoints[pingPong][pointIndex].normal, verts[pointIndex].normal);
    }
    return pingPong;
}

// Name unconfirmed; PINNED 0x10015a20 expands the four corners in both projection directions.
static void R_GetMarkFragmentBounds(const vec3_t *points, const float *axis, float radius, float *mins, float *maxs)
{
    vec3_t scaledAxis;
    vec3_t xyz;
    int pointIndex;

    mins[0] = 131072.0f;
    mins[1] = 131072.0f;
    mins[2] = 131072.0f;
    maxs[0] = -131072.0f;
    maxs[1] = -131072.0f;
    maxs[2] = -131072.0f;
    VectorScale(axis, radius, scaledAxis);
    for (pointIndex = 0; pointIndex < 4; ++pointIndex)
    {
        Vec3Add(points[pointIndex], scaledAxis, xyz);
        AddPointToBounds(xyz, mins, maxs);
        VectorSubtract(points[pointIndex], scaledAxis, xyz);
        AddPointToBounds(xyz, mins, maxs);
    }
}

void R_AABBTreeSurfaces_r(GfxAabbTree *tree, const float *mins, const float *maxs, GfxSurface **surfList, int surfListSize, int *surfCount)
{
    GfxSurface *surfNodes;
    GfxSurface *surf;
    srfTriangles_t *tris;
    int surfNodeIndex;
    int childIndex;

    if (tree->maxs[0] < mins[0] || tree->mins[0] > maxs[0]
        || tree->maxs[1] < mins[1] || tree->mins[1] > maxs[1]
        || tree->maxs[2] < mins[2] || tree->mins[2] > maxs[2])
    {
        return;
    }
    if (tree->childCount)
    {
        for (childIndex = 0; childIndex < tree->childCount; ++childIndex)
            R_AABBTreeSurfaces_r(&tree->children[childIndex], mins, maxs, surfList, surfListSize, surfCount);
        return;
    }
    surfNodes = &rgp.world->surfaces[tree->startSurfIndex];
    for (surfNodeIndex = 0; surfNodeIndex < tree->surfaceCount; ++surfNodeIndex)
    {
        if (*surfCount >= surfListSize)
            return;
        surf = &surfNodes[surfNodeIndex];
        if (surf->material->info.gameFlags & 4)
            continue;
        tris = surf->tris;
        if (tris->bounds[1][0] < mins[0] || tris->bounds[0][0] > maxs[0]
            || tris->bounds[1][1] < mins[1] || tris->bounds[0][1] > maxs[1]
            || tris->bounds[1][2] < mins[2] || tris->bounds[0][2] > maxs[2])
        {
            continue;
        }
        surfList[(*surfCount)++] = surf;
    }
}

static void R_AddSurfaceToList(GfxSurface *surf, GfxSurface **surfList, int *surfCount)
{
    int listIndex;

    for (listIndex = 0; listIndex < *surfCount; ++listIndex)
    {
        if (surfList[listIndex] == surf)
            return;
    }
    surfList[(*surfCount)++] = surf;
}

static __declspec(noinline) void R_CellSurfaces(GfxCell *cell, const float *mins, const float *maxs, GfxSurface **surfList, int surfListSize, int *surfCount)
{
    GfxWorld *world;
    GfxCullGroup *group;
    GfxSurface *surfNodes;
    GfxSurface *surf;
    srfTriangles_t *tris;
    int cullGroupIndex;
    int surfNodeIndex;

    if (cell->writable.markCount == rg.markCount)
        return;
    cell->writable.markCount = rg.markCount;
    for (cullGroupIndex = 0; cullGroupIndex < cell->cullGroupCount; ++cullGroupIndex)
    {
        world = rgp.world;
        group = &world->cullGroups[cell->cullGroups[cullGroupIndex]];
        if (group->maxs[0] < mins[0] || group->mins[0] > maxs[0]
            || group->maxs[1] < mins[1] || group->mins[1] > maxs[1]
            || group->maxs[2] < mins[2] || group->mins[2] > maxs[2])
        {
            continue;
        }
        surfNodes = &world->surfaces[group->startSurfIndex];
        for (surfNodeIndex = 0; surfNodeIndex < group->surfaceCount; ++surfNodeIndex)
        {
            if (*surfCount >= surfListSize)
                break;
            surf = &surfNodes[surfNodeIndex];
            if (surf->material->info.gameFlags & 4)
                continue;
            tris = surf->tris;
            if (tris->bounds[1][0] < mins[0] || tris->bounds[0][0] > maxs[0]
                || tris->bounds[1][1] < mins[1] || tris->bounds[0][1] > maxs[1]
                || tris->bounds[1][2] < mins[2] || tris->bounds[0][2] > maxs[2])
            {
                continue;
            }
            R_AddSurfaceToList(surf, surfList, surfCount);
        }
    }
    R_AABBTreeSurfaces_r(cell->aabbTree, mins, maxs, surfList, surfListSize, surfCount);
}

void R_BoxSurfaces_r(mnode_t *node, const float *mins, const float *maxs,
    GfxSurface **surfList, int surfListSize, int *surfCount)
{
    int side;

    while (node->cellIndex == -2)
    {
        side = BoxOnPlaneSide((float *)mins, (float *)maxs, node->u.node.plane);
        if (side == 1)
            node = node->u.node.children[0];
        else
        {
            if (side != 2)
                R_BoxSurfaces_r(node->u.node.children[0], mins, maxs, surfList, surfListSize, surfCount);
            node = node->u.node.children[1];
        }
    }
    if (node->cellIndex != -1)
        R_CellSurfaces(&rgp.world->cells[node->cellIndex], mins, maxs, surfList, surfListSize, surfCount);
}

int R_MarkFragments(vec3_t *points, const float *origin, vec3_t *axis, float radius,
    int maxPoints, GfxWorldVertex *verts, int maxFragments, GfxMarkFragment *fragments, MaterialHandle markMaterial)
{
    GfxSurface *surfaces[4096];
    vec3_t mins;
    vec3_t maxs;
    vec3_t normals[6];
    float dists[6];
    ClipPoint clipPoints[2][9];
    vec3_t edge;
    vec3_t edge01;
    vec3_t edge21;
    vec3_t normal;
    vec3_t delta;
    float dot;
    float texCoordScale;
    int surfCount;
    int pointIndex;
    int surfIndex;
    int triIndex;
    int returnedPoints;
    int returnedFragments;
    GfxSurface *surf;
    srfTriangles_t *tris;
    GfxWorldVertex *triVerts;
    GfxWorldVertex *vert;
    GfxWorldVertex *outVerts;
    GfxMarkFragment *fragment;
    unsigned short *indices;

    R_GetMarkFragmentBounds(points, axis[0], radius, mins, maxs);
    ++rg.markCount;
    surfCount = 0;
    R_BoxSurfaces_r(rgp.world->nodes, mins, maxs, surfaces, 4096, &surfCount);
    for (pointIndex = 0; pointIndex < 4; ++pointIndex)
    {
        VectorSubtract(points[(pointIndex + 1) % 4], points[pointIndex], edge);
        Vec3Cross(edge, axis[0], normals[pointIndex]);
        Vec3Normalize(normals[pointIndex]);
        dists[pointIndex] = DotProduct(normals[pointIndex], points[pointIndex]);
    }
    VectorCopy(axis[0], normals[4]);
    dists[4] = DotProduct(normals[4], points[0]) - radius;
    normals[5][0] = -axis[0][0];
    normals[5][1] = -axis[0][1];
    normals[5][2] = -axis[0][2];
    dists[5] = DotProduct(normals[5], points[0]) - radius;
    texCoordScale = 0.5f / radius;
    returnedPoints = 0;
    returnedFragments = 0;
    for (surfIndex = 0; surfIndex < surfCount; ++surfIndex)
    {
        surf = surfaces[surfIndex];
        if (surf->material->stateBits[0] & 0x30)
            continue;
        tris = surf->tris;
        triVerts = &rgp.world->vd.vertices[tris->firstVertex];
        for (triIndex = 0; triIndex < tris->indexCount; triIndex += 3)
        {
            indices = (unsigned short *)tris->indices + triIndex;
            VectorSubtract(triVerts[indices[0]].xyz, triVerts[indices[1]].xyz, edge01);
            VectorSubtract(triVerts[indices[2]].xyz, triVerts[indices[1]].xyz, edge21);
            Vec3Cross(edge01, edge21, normal);
            dot = DotProduct(normal, axis[0]);
            if (!(dot >= 0.0f && dot * dot >= 0.25f * DotProduct(normal, normal)))
                continue;
            for (pointIndex = 0; pointIndex < 3; ++pointIndex)
            {
                vert = &triVerts[indices[pointIndex]];
                VectorCopy(vert->xyz, clipPoints[0][pointIndex].xyz);
                clipPoints[0][pointIndex].lmapCoord[0] = vert->lmapCoord[0];
                clipPoints[0][pointIndex].lmapCoord[1] = vert->lmapCoord[1];
                VectorCopy(vert->normal, clipPoints[0][pointIndex].normal);
            }
            fragment = &fragments[returnedFragments];
            outVerts = &verts[returnedPoints];
            if (R_AddMarkFragment(clipPoints, normals, dists, maxPoints - returnedPoints, outVerts, fragment) < 0)
                continue;
            for (pointIndex = 0; pointIndex < fragment->pointCount; ++pointIndex)
            {
                vert = &outVerts[pointIndex];
                VectorSubtract(vert->xyz, origin, delta);
                vert->texCoord[0] = DotProduct(delta, axis[1]) * texCoordScale + 0.5f;
                vert->texCoord[1] = DotProduct(delta, axis[2]) * texCoordScale + 0.5f;
                Vec3Cross(vert->normal, axis[1], vert->binormal);
                Vec3Cross(vert->binormal, vert->normal, vert->tangent);
            }
            fragment->markMaterial = markMaterial;
            fragment->lmapIndex = surf->lightmapIndex;
            fragment->firstPoint = returnedPoints;
            returnedPoints += fragment->pointCount;
            ++returnedFragments;
            if (returnedFragments == maxFragments || returnedPoints > maxPoints - 3)
                return returnedFragments;
        }
    }
    return returnedFragments;
}

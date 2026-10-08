// World surface queries for decal marks.
#include "gfx.h"

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

void R_CellSurfaces(GfxCell *cell, const float *mins, const float *maxs, GfxSurface **surfList, int surfListSize, int *surfCount)
{
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
        group = &rgp.world->cullGroups[cell->cullGroups[cullGroupIndex]];
        if (group->maxs[0] < mins[0] || group->mins[0] > maxs[0]
            || group->maxs[1] < mins[1] || group->mins[1] > maxs[1]
            || group->maxs[2] < mins[2] || group->mins[2] > maxs[2])
        {
            continue;
        }
        surfNodes = &rgp.world->surfaces[group->startSurfIndex];
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

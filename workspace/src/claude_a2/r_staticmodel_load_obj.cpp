// Static model AABB tree construction.
#include "a2.h"

static int R_CompareStaticModelIndex(const void *a, const void *b)
{
    return *(const int *)a - *(const int *)b;
}

static int R_SortGfxAabbTreeChildren(GfxWorld *world, const float *mins, const float *maxs, int *staticModels, int staticModelCount)
{
    GfxStaticModelInstance *smodelInst;
    int childCount;
    int smodelChildIndex;
    int smodelIndex;
    int smodelSwapIndex;

    childCount = 0;
    for (smodelChildIndex = 0; smodelChildIndex < staticModelCount; ++smodelChildIndex)
    {
        smodelIndex = staticModels[smodelChildIndex];
        smodelInst = &world->smodelInsts[smodelIndex];
        if (!(smodelInst->mins[0] < mins[0])
            && !(smodelInst->mins[1] < mins[1])
            && !(smodelInst->mins[2] < mins[2])
            && !(smodelInst->maxs[0] > maxs[0])
            && !(smodelInst->maxs[1] > maxs[1])
            && !(smodelInst->maxs[2] > maxs[2]))
        {
            smodelSwapIndex = staticModels[childCount];
            staticModels[childCount] = smodelIndex;
            staticModels[smodelChildIndex] = smodelSwapIndex;
            ++childCount;
        }
    }
    return childCount < 2 ? 0 : childCount;
}

void R_SortGfxAabbTree(GfxWorld *world, GfxAabbTree *tree)
{
    GfxStaticModelInstance *smodelInst;
    GfxAabbTree *childTree;
    vec3_t mins;
    vec3_t maxs;
    vec3_t childMins;
    vec3_t childMaxs;
    vec3_t middle;
    int childCount[4];
    int *staticModels;
    int staticModelCount;
    int childIndex;
    int count;
    int i;

    qsort(tree->staticModels, tree->staticModelCount, 4, R_CompareStaticModelIndex);
    if (tree->childCount)
    {
        for (childIndex = 0; childIndex < tree->childCount; ++childIndex)
            R_SortGfxAabbTree(world, &tree->children[childIndex]);
        return;
    }
    mins[0] = FLT_MAX;
    mins[1] = FLT_MAX;
    mins[2] = FLT_MAX;
    maxs[0] = -FLT_MAX;
    maxs[1] = -FLT_MAX;
    maxs[2] = -FLT_MAX;
    for (i = 0; i < tree->staticModelCount; ++i)
    {
        smodelInst = &world->smodelInsts[tree->staticModels[i]];
        if (mins[0] > smodelInst->mins[0])
            mins[0] = smodelInst->mins[0];
        if (maxs[0] < smodelInst->maxs[0])
            maxs[0] = smodelInst->maxs[0];
        if (mins[1] > smodelInst->mins[1])
            mins[1] = smodelInst->mins[1];
        if (maxs[1] < smodelInst->maxs[1])
            maxs[1] = smodelInst->maxs[1];
        if (mins[2] > smodelInst->mins[2])
            mins[2] = smodelInst->mins[2];
        if (maxs[2] < smodelInst->maxs[2])
            maxs[2] = smodelInst->maxs[2];
    }
    if (!tree->surfaceCount)
    {
        VectorCopy(mins, tree->mins);
        VectorCopy(maxs, tree->maxs);
    }
    if (tree->staticModelCount < 8)
        return;
    Vec3Add(mins, maxs, middle);
    Vec3Scale(middle, 0.5f, middle);
    staticModels = tree->staticModels;
    staticModelCount = tree->staticModelCount;

    childMins[0] = mins[0];
    childMins[1] = mins[1];
    childMins[2] = mins[2];
    childMaxs[1] = maxs[1];
    childMaxs[2] = maxs[2];
    childMaxs[0] = middle[0];
    childCount[0] = R_SortGfxAabbTreeChildren(world, childMins, childMaxs, staticModels, staticModelCount);
    staticModels += childCount[0];
    staticModelCount -= childCount[0];

    childMins[1] = mins[1];
    childMins[2] = mins[2];
    childMaxs[0] = maxs[0];
    childMaxs[1] = maxs[1];
    childMaxs[2] = maxs[2];
    childMins[0] = middle[0];
    childCount[1] = R_SortGfxAabbTreeChildren(world, childMins, childMaxs, staticModels, staticModelCount);
    staticModels += childCount[1];
    staticModelCount -= childCount[1];

    childMins[0] = mins[0];
    childMins[1] = mins[1];
    childMins[2] = mins[2];
    childMaxs[0] = maxs[0];
    childMaxs[2] = maxs[2];
    childMaxs[1] = middle[1];
    childCount[2] = R_SortGfxAabbTreeChildren(world, childMins, childMaxs, staticModels, staticModelCount);
    staticModels += childCount[2];
    staticModelCount -= childCount[2];

    childMins[0] = mins[0];
    childMins[2] = mins[2];
    childMaxs[0] = maxs[0];
    childMaxs[1] = maxs[1];
    childMaxs[2] = maxs[2];
    childMins[1] = middle[1];
    childCount[3] = R_SortGfxAabbTreeChildren(world, childMins, childMaxs, staticModels, staticModelCount);
    staticModels += childCount[3];
    staticModelCount -= childCount[3];

    count = 0;
    for (i = 0; i < 4; ++i)
        count += childCount[i] != 0;
    if (!count)
        return;
    if (tree->surfaceCount)
        ++count;
    if (staticModelCount)
        ++count;
    tree->children = (GfxAabbTree *)ri.Hunk_AllocAlignInternal(count * sizeof(GfxAabbTree), 4);
    if (tree->surfaceCount)
    {
        childTree = &tree->children[tree->childCount++];
        childTree->mins[0] = tree->mins[0];
        childTree->mins[1] = tree->mins[1];
        childTree->mins[2] = tree->mins[2];
        childTree->maxs[0] = tree->maxs[0];
        childTree->maxs[1] = tree->maxs[1];
        childTree->maxs[2] = tree->maxs[2];
        childTree->startSurfIndex = tree->startSurfIndex;
        childTree->surfaceCount = tree->surfaceCount;
    }
    staticModels = tree->staticModels;
    staticModelCount = tree->staticModelCount;
    for (i = 0; i < 4; ++i)
    {
        count = childCount[i];
        if (count)
        {
            childTree = &tree->children[tree->childCount++];
            childTree->staticModelCount = count;
            childTree->staticModels = staticModels;
            R_SortGfxAabbTree(world, childTree);
            staticModels += count;
            staticModelCount -= count;
        }
    }
    if (staticModelCount)
    {
        childTree = &tree->children[tree->childCount++];
        childTree->staticModelCount = staticModelCount;
        childTree->staticModels = staticModels;
        R_SortGfxAabbTree(world, childTree);
    }
}

void R_AddStaticModelToAabbTree_r(GfxWorld *world, GfxAabbTree *tree, int smodelIndex)
{
    GfxStaticModelInstance *smodelInst;
    GfxAabbTree *childTree;
    GfxAabbTree *children;
    int *staticModels;
    int allocCount;
    int childIndex;

    if (((tree->staticModelCount - 1) & tree->staticModelCount) == 0)
    {
        if (tree->staticModelCount)
            allocCount = 2 * tree->staticModelCount;
        else
            allocCount = 1;
        staticModels = (int *)ri.Hunk_AllocateTempMemoryInternal(allocCount * 4);
        memcpy(staticModels, tree->staticModels, tree->staticModelCount * 4);
        tree->staticModels = staticModels;
    }
    tree->staticModels[tree->staticModelCount] = smodelIndex;
    ++tree->staticModelCount;
    if (!tree->childCount)
        return;
    smodelInst = &world->smodelInsts[smodelIndex];
    for (childIndex = 0; childIndex < tree->childCount; ++childIndex)
    {
        childTree = &tree->children[childIndex];
        if (childTree->mins[0] > smodelInst->mins[0])
            continue;
        if (childTree->mins[1] > smodelInst->mins[1])
            continue;
        if (childTree->mins[2] > smodelInst->mins[2])
            continue;
        if (childTree->maxs[0] < smodelInst->maxs[0])
            continue;
        if (childTree->maxs[1] < smodelInst->maxs[1])
            continue;
        if (childTree->maxs[2] < smodelInst->maxs[2])
            continue;
        R_AddStaticModelToAabbTree_r(world, childTree, smodelIndex);
        return;
    }
    for (childIndex = 0; childIndex < tree->childCount; ++childIndex)
    {
        childTree = &tree->children[childIndex];
        if (!childTree->surfaceCount)
        {
            if (childTree->mins[0] > smodelInst->mins[0])
                childTree->mins[0] = smodelInst->mins[0];
            if (childTree->maxs[0] < smodelInst->maxs[0])
                childTree->maxs[0] = smodelInst->maxs[0];
            if (childTree->mins[1] > smodelInst->mins[1])
                childTree->mins[1] = smodelInst->mins[1];
            if (childTree->maxs[1] < smodelInst->maxs[1])
                childTree->maxs[1] = smodelInst->maxs[1];
            if (childTree->mins[2] > smodelInst->mins[2])
                childTree->mins[2] = smodelInst->mins[2];
            if (childTree->maxs[2] < smodelInst->maxs[2])
                childTree->maxs[2] = smodelInst->maxs[2];
            R_AddStaticModelToAabbTree_r(world, childTree, smodelIndex);
            return;
        }
    }
    children = (GfxAabbTree *)ri.Hunk_AllocAlignInternal((tree->childCount + 1) * sizeof(GfxAabbTree), 4);
    memcpy(children, tree->children, tree->childCount * sizeof(GfxAabbTree));
    tree->children = children;
    childTree = &tree->children[tree->childCount++];
    childTree->mins[0] = smodelInst->mins[0];
    childTree->mins[1] = smodelInst->mins[1];
    childTree->mins[2] = smodelInst->mins[2];
    childTree->maxs[0] = smodelInst->maxs[0];
    childTree->maxs[1] = smodelInst->maxs[1];
    childTree->maxs[2] = smodelInst->maxs[2];
    R_AddStaticModelToAabbTree_r(world, childTree, smodelIndex);
}

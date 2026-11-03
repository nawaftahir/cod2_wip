// Static model AABB tree construction.
#include "gfx.h"

GfxImage *Image_Alloc(const char *name, int category, int semantic, int imageTrack);
void Image_Setup(GfxImage *image, int width, int height, int depth, int imageFlags, DWORD usage, D3DFORMAT imageFormat);
void Image_UploadData(GfxImage *image, D3DFORMAT format, D3DCUBEMAP_FACES cubemapFace, unsigned int mipLevel, const unsigned char *src);
void XSurfaceGetVerts(const XSurface *surf, DObjSkelMat *boneMatrix, float *pVert, float *pTexCoord, float *pNormal);

void R_ConvertAnimMatToSkelMat(const DObjAnimMat *in, DObjSkelMat *out);

// PINNED100296a0/73; descriptive name for the PC outlined helper.
int R_GetMaxModelSurfaceCount(const XModel *model)
{
    XSurface **surfaces;
    int *partBits;
    int maxSurfaces = 0;
    int lodCount = ri.XModelGetNumLods(model);
    for (int lod = 0; lod < lodCount; ++lod)
    {
        int surfaceCount = ri.XModelGetSurfaces(model, &surfaces, lod, &partBits);
        if (maxSurfaces < surfaceCount)
            maxSurfaces = surfaceCount;
    }
    return maxSurfaces;
}

// PINNED 10029780: the second retail copy of the rounded BGRA helper.
static __declspec(noinline) void R_QuantizeStaticModelColor(byte *out, const float *color)
{
    out[2] = (byte)I_max(0, I_min(255, I_fround(color[0] * 255.0f)));
    out[1] = (byte)I_max(0, I_min(255, I_fround(color[1] * 255.0f)));
    out[0] = (byte)I_max(0, I_min(255, I_fround(color[2] * 255.0f)));
    out[3] = (byte)I_max(0, I_min(255, I_fround(color[3] * 255.0f)));
}

// Lighting cache image being built while the entity lump loads.
static struct
{
    int width;
    int height;
    float texelScaleX;
    float texelScaleY;
    unsigned char *pixels;
} smodelLoadGlob;

void R_AllocStaticModels(GfxAabbTree *tree)
{
    int *staticModels;
    int childIndex;

    if (tree->staticModelCount)
    {
        staticModels = (int *)ri.Hunk_AllocAlignInternal(tree->staticModelCount * 4, 4);
        memcpy(staticModels, tree->staticModels, tree->staticModelCount * 4);
        tree->staticModels = staticModels;
    }
    for (childIndex = 0; childIndex < tree->childCount; ++childIndex)
        R_AllocStaticModels(&tree->children[childIndex]);
}

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
    VectorAdd(mins, maxs, middle);
    VectorScale(middle, 0.5f, middle);
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
    allocCount = (tree->childCount + 1) * sizeof(GfxAabbTree);
    children = (GfxAabbTree *)ri.Hunk_AllocAlignInternal(allocCount, 4);
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

static __declspec(noinline) void R_AddStaticModelToCell(int cellIndex, GfxStaticModelInstance *smodelInst, GfxWorld *world)
{
    GfxAabbTree *tree;
    int smodelIndex;

    tree = world->cells[cellIndex].aabbTree;
    smodelIndex = smodelInst - world->smodelInsts;
    if (!tree->staticModelCount || tree->staticModels[tree->staticModelCount - 1] != smodelIndex)
        R_AddStaticModelToAabbTree_r(world, tree, smodelIndex);
}

static void R_FilterStaticModelIntoCells_r(GfxWorld *world, mnode_t *node, GfxStaticModelInstance *smodelInst, const vec_t *mins, const vec_t *maxs)
{
    int side;
    vec3_t localMins;
    vec3_t localMaxs;

    for (;;)
    {
        if (node->cellIndex != -2)
        {
            if (node->cellIndex < 0)
                return;
            R_AddStaticModelToCell(node->cellIndex, smodelInst, world);
            return;
        }
        side = BoxOnPlaneSide((float *)mins, (float *)maxs, node->u.node.plane);
        if (side == 3)
        {
            if (node->u.node.plane->type < 3)
            {
                VectorCopy(mins, localMins);
                localMins[node->u.node.plane->type] = node->u.node.plane->dist;
                VectorCopy(maxs, localMaxs);
                localMaxs[node->u.node.plane->type] = node->u.node.plane->dist;
                if (localMins[node->u.node.plane->type] < maxs[node->u.node.plane->type])
                    R_FilterStaticModelIntoCells_r(world, node->u.node.children[0], smodelInst, localMins, maxs);
                R_FilterStaticModelIntoCells_r(world, node->u.node.children[1], smodelInst, mins, localMaxs);
                return;
            }
            R_FilterStaticModelIntoCells_r(world, node->u.node.children[0], smodelInst, mins, maxs);
            node = node->u.node.children[1];
            continue;
        }
        node = node->u.node.children[side - 1];
    }
}

// Name unconfirmed: bounds of the model's lod 0 surfaces under the instance axis.
void R_StaticModelBounds(XModel *model, const float *axis, float *mins, float *maxs);

// PINNED 1002a360/441; descriptive name for the static-model bounds helper.
void R_StaticModelBounds(XModel *model, const float *axis, float *mins, float *maxs)
{
    XSurface **surfaces;
    int *partBits;
    DObjSkelMat *matArray;
    float *verts;
    DObjSkelMat *mat;
    const DObjAnimMat *basePose;
    const float *vert;
    float dot;
    int surfaceCount;
    int numBones;
    int surfIndex;
    int vertCount;
    int i;

    mins[0] = FLT_MAX;
    mins[1] = FLT_MAX;
    mins[2] = FLT_MAX;
    maxs[0] = -FLT_MAX;
    maxs[1] = -FLT_MAX;
    maxs[2] = -FLT_MAX;
    surfaceCount = ri.XModelGetSurfaces(model, &surfaces, 0, &partBits);
    matArray = (DObjSkelMat *)ri.Hunk_AllocateTempMemoryInternal(0x2000);
    verts = (float *)ri.Hunk_AllocateTempMemoryInternal(0xff78);
    numBones = ri.XModelNumBones(model);
    basePose = (const DObjAnimMat *)ri.XModelGetBasePose(model);
    if (numBones > 0)
    {
        mat = matArray;
        do
        {
            R_ConvertAnimMatToSkelMat(basePose, mat);
            ++mat;
            ++basePose;
            --numBones;
        } while (numBones);
    }
    surfIndex = 0;
    if (surfaceCount > 0)
    do
    {
        vertCount = surfaces[surfIndex]->vertCount;
        XSurfaceGetVerts(surfaces[surfIndex], matArray, verts, 0, 0);
        if (vertCount > 0)
        {
            vert = verts;
            do
            {
                dot = vert[2] * axis[6] + vert[0] * axis[0] + axis[3] * vert[1];
                if (dot < mins[0])
                    mins[0] = dot;
                if (dot > maxs[0])
                    maxs[0] = dot;
                dot = vert[0] * axis[1] + axis[7] * vert[2] + vert[1] * axis[4];
                if (dot < mins[1])
                    mins[1] = dot;
                if (dot > maxs[1])
                    maxs[1] = dot;
                dot = vert[0] * axis[2] + vert[2] * axis[8] + axis[5] * vert[1];
                if (dot < mins[2])
                    mins[2] = dot;
                if (dot > maxs[2])
                    maxs[2] = dot;
                vert += 3;
                --vertCount;
            } while (vertCount);
        }
        ++surfIndex;
    } while (surfIndex < surfaceCount);
    ri.Hunk_FreeTempMemory(verts);
    ri.Hunk_FreeTempMemory(matArray);
}

// PINNED 1002a520: scale directional lighting and sun visibility.
void R_ScaleStaticModelLighting(float directLightScale, float indirectLightScale, float *sunVisibility, vec4_t *colorForDir)
{
    vec4_t *color = colorForDir;
    int i = 6;

    *sunVisibility *= directLightScale;
    do
    {
        (*color)[0] *= indirectLightScale;
        (*color)[1] *= indirectLightScale;
        (*color)[2] *= indirectLightScale;
        (*color)[3] *= indirectLightScale;
        color++;
        --i;
    } while (i);
}

float RB_GetLightingAtPoint(const GfxLightGrid *grid, const float *origin, vec4_t *colors);

// PINNED 1002a570/341: each model owns a 2x2 block in both lighting-image layers.
void R_CacheStaticModelLighting(const GfxWorld *world, GfxStaticModelInstance *instance,
    float sunVisibility, vec4_t *colorForDir)
{
    int modelIndex = world->smodelCount - 1;
    if (r_rendererInUse->current.integer == 2)
    {
        memcpy(world->smodelLightingColorTable[modelIndex], colorForDir, sizeof(vec4_t) * 6);
        world->smodelLightingSunVisTable[modelIndex] = sunVisibility;
        return;
    }
    int x = (modelIndex % smodelLoadGlob.width) * 2;
    int y = (modelIndex / smodelLoadGlob.width) * 2;
    int component = 0;
    for (int layer = 0; layer < 2; ++layer)
        for (int row = y; row < y + 2; ++row)
            for (int column = x; column < x + 2; ++column, ++component)
            {
                vec4_t color;
                color[0] = ((float *)colorForDir)[component];
                color[1] = ((float *)colorForDir)[component + 8];
                color[2] = ((float *)colorForDir)[component + 16];
                color[3] = sunVisibility;
                R_QuantizeStaticModelColor(&smodelLoadGlob.pixels[
                    ((row + smodelLoadGlob.height * 2 * layer) * smodelLoadGlob.width * 2 + column) * 4], color);
            }
    instance->baseLightingCoords[0] = (x + 1.0f) * smodelLoadGlob.texelScaleX;
    instance->baseLightingCoords[1] = (y + 1.0f) * smodelLoadGlob.texelScaleY;
    instance->baseLightingCoords[2] = 0.5f;
}

// PINNED 1002a6d0: sample the midpoint of the instance's world bounds.
void R_GetStaticModelLightingFromGrid(const GfxWorld *world,
    GfxStaticModelInstance *instance, float *sunVisibility, vec4_t *colorForDir)
{
    vec3_t origin;
    origin[0] = (instance->mins[0] + instance->maxs[0]) * 0.5f;
    // Keep the Y/Z input load order used by the PC renderer.
    origin[1] = (*(const volatile float *)&instance->mins[1] + instance->maxs[1]) * 0.5f;
    origin[2] = (*(const volatile float *)&instance->mins[2] + instance->maxs[2]) * 0.5f;
    *sunVisibility = RB_GetLightingAtPoint(&world->lightGrid, origin, colorForDir);
}

// PINNED 1002a730: eight copies per ground-light channel.
void R_GetStaticModelLightingFromGround(const vec_t *groundLight, float *sunVisibility, vec4_t *colorForDir)
{
    vec4_t *color = colorForDir;
    int index = 0;
    do
    {
        Vector4Set(color[0], groundLight[index], groundLight[index], groundLight[index], groundLight[index]);
        Vector4Set(color[1], groundLight[index], groundLight[index], groundLight[index], groundLight[index]);
        ++index;
        color += 2;
    } while (index != 3);
    *sunVisibility = groundLight[3];
}

// PINNED 1002a780: allocate the DX7 tables or a two-layer DX9 image.
void R_PrepareStaticModelLightingCache(GfxWorld *world, int smodelCount)
{
    int height;
    int width;
    int size;

    if (r_rendererInUse->current.integer == 2)
    {
        world->smodelLightingColorTable = (vec4_t (*)[6])ri.Hunk_AllocInternal(smodelCount * 0x60);
        world->smodelLightingSunVisTable = (float *)ri.Hunk_AllocInternal(smodelCount * 4);
        return;
    }
    width = 1;
    smodelLoadGlob.width = width;
    if (smodelCount > 1)
    {
        do
            width += width;
        while (width * width < smodelCount);
        smodelLoadGlob.width = width;
    }
    height = width;
    smodelLoadGlob.height = height;
    if (width * width >= smodelCount + smodelCount)
    {
        height = (width + 1) >> 1;
        smodelLoadGlob.height = height;
    }
    smodelLoadGlob.texelScaleX = 1.0f / (float)(width + width);
    smodelLoadGlob.texelScaleY = 1.0f / (float)(height + height);
    size = height * width << 5;
    smodelLoadGlob.pixels = (unsigned char *)ri.Hunk_AllocateTempMemoryInternal(size);
    memset(smodelLoadGlob.pixels, 0x80, size);
}

// PINNED 1002a860: publish image coordinates before clearing the load state.
void R_FinishStaticModelLightingCache(GfxWorld *world)
{
    GfxImage *image;
    float scaleY;

    if (r_rendererInUse->current.integer == 2)
        return;
    image = Image_Alloc("*smodel_lighting", 2, 1, 4);
    world->smodelLightingImage = image;
    Image_Setup(image, smodelLoadGlob.width * 2, smodelLoadGlob.height * 2, 2, 0xb, 0, (D3DFORMAT)0x15);
    Image_UploadData(image, (D3DFORMAT)0x15, D3DCUBEMAP_FACE_POSITIVE_X, 0, smodelLoadGlob.pixels);
    scaleY = smodelLoadGlob.texelScaleY * 0.5f;
    world->smodelLightingLookupScale[0] = 0.5f * smodelLoadGlob.texelScaleX;
    world->smodelLightingLookupScale[1] = scaleY;
    world->smodelLightingLookupScale[2] = 0.25f;
    smodelLoadGlob.width = 0;
    smodelLoadGlob.height = 0;
    smodelLoadGlob.texelScaleX = 0.0f;
    smodelLoadGlob.texelScaleY = 0.0f;
    smodelLoadGlob.pixels = 0;
}

bool R_ValidateStaticModel(XModel *model)
{
    XSurface **surfaces;
    int *partBits;
    int lodCount;
    int lodIndex;
    int surfCount;
    int surfIndex;

    lodCount = ri.XModelGetNumLods(model);
    for (lodIndex = 0; lodIndex < lodCount; ++lodIndex)
    {
        surfCount = ri.XModelGetSurfaces(model, &surfaces, lodIndex, &partBits);
        for (surfIndex = 0; surfIndex < surfCount; ++surfIndex)
        {
            if (surfaces[surfIndex]->boneOffset == -1)
            {
                Com_Printf("^1ERROR: model '%s' is not a valid static model, since lod %i surf %i has more than one bone.  Static models should be set to 'rigid' in asset manager.\n",
                    ri.XModelGetName(model), lodIndex, surfIndex);
                return false;
            }
        }
    }
    return true;
}

void R_CreateStaticModel(GfxWorld *world, XModel *model, const vec_t *origin, const vec_t *angles, vec_t scale, GfxStaticModelInstance *smodelInst)
{
    float *mins;
    float *maxs;

    smodelInst->model = model;
    VectorCopy(origin, smodelInst->origin);
    AnglesToAxis(angles, smodelInst->axis);
    mins = smodelInst->mins;
    maxs = smodelInst->maxs;
    smodelInst->scale = scale;
    R_StaticModelBounds(model, &smodelInst->axis[0][0], mins, maxs);
    mins[0] = scale * mins[0] + origin[0];
    mins[1] = scale * mins[1] + origin[1];
    mins[2] = scale * mins[2] + origin[2];
    maxs[0] = scale * maxs[0] + origin[0];
    maxs[1] = scale * maxs[1] + origin[1];
    maxs[2] = scale * maxs[2] + origin[2];
    smodelInst->cullDist = ri.XModelGetLodOutDist(model) * scale;
    R_FilterStaticModelIntoCells_r(world, world->nodes, smodelInst, mins, maxs);
}

// Static model vertex cache.
#include "gfx.h"

static static_model_cache_t s_cache;

typedef char cached_vertex_layout[
    (sizeof(XVertexInfo) == 64 && sizeof(GfxSModelCachedVertex) == 64
    && sizeof(GfxSModelCachedVertexDx7) == 24
    && sizeof(GfxStaticModelInstance) == 96
    && offsetof(GfxStaticModelInstance, baseLightingCoords) == 0x54
    && offsetof(SkinBuffers, verts) == 0x2000) ? 1 : -1];

extern DxGlobals dx;
extern int alwaysfails;
void R_ConvertAnimMatToSkelMat(const DObjAnimMat *in, DObjSkelMat *out);
void R_GetRigidTransform(const DObjSkelMat *bone, const float *origin,
    const vec3_t *axis, float scale, vec3_t *out);
int RB_DeriveEntityLights(vec4_t *colors, float sunVisibility,
    const Material *material, D3DLIGHT9 *lights, int maxLights);
void RB_LogPrint(const char *text);
extern "C" void Com_Memcpy(void *out, const void *in, int count);
extern "C" const char *__stdcall DXGetErrorDescription9A(HRESULT hr);


// PINNED 1000f180: round and clamp each RGBA channel, store BGRA.
void R_QuantizeCachedColor(const float *color, byte *out)
{
    out[2] = (byte)I_max(0, I_min(255, I_fround(color[0] * 255.0f)));
    out[1] = (byte)I_max(0, I_min(255, I_fround(color[1] * 255.0f)));
    out[0] = (byte)I_max(0, I_min(255, I_fround(color[2] * 255.0f)));
    out[3] = (byte)I_max(0, I_min(255, I_fround(color[3] * 255.0f)));
}

// PINNED 1002b0c0--1002b3bb: ambient plus positive directional light.
static void R_LightCachedVertex(const float *normal, const byte *color,
    const D3DLIGHT9 *lights, int lightCount, byte *out)
{
    vec3_t lighting = {0.0f, 0.0f, 0.0f};
    vec4_t result;
    for (int lightIndex = 0; lightIndex < lightCount; ++lightIndex)
    {
        const D3DLIGHT9 *light = &lights[lightIndex];
        lighting[0] += light->Ambient.r;
        lighting[1] += light->Ambient.g;
        lighting[2] += light->Ambient.b;
        float xz = light->Direction.x * normal[0] + light->Direction.z * normal[2];
        float diffuse = -(xz + light->Direction.y * normal[1]);
        if (diffuse > 0.0f)
        {
            lighting[0] += diffuse * light->Diffuse.r;
            lighting[1] += diffuse * light->Diffuse.g;
            lighting[2] += diffuse * light->Diffuse.b;
        }
    }
    result[0] = (float)color[2] * lighting[0] * (1.0f / 255.0f);
    result[1] = (float)color[1] * lighting[1] * (1.0f / 255.0f);
    result[2] = (float)color[0] * lighting[2] * (1.0f / 255.0f);
    result[3] = (float)color[3] * (1.0f / 255.0f);
    R_QuantizeCachedColor(result, out);
}

typedef HRESULT (__stdcall *CachedBufferLockFn)(void *, UINT, UINT, void **, DWORD);
typedef HRESULT (__stdcall *CachedBufferUnlockFn)(void *);

static __forceinline void R_UploadCachedVertices(int baseVert, int size,
    const void *vertices, int stride)
{
    void *data;
    void *vb = (void *)dx.smodelCacheVb;
    HRESULT hr = ((CachedBufferLockFn)(*(void ***)vb)[11])(
        vb, baseVert * stride, size, &data, 0x1000);
    if (hr < 0)
    {
        ri.Printf(0, "********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n");
        ri.Printf(0, "********** error information:  %s\n", DXGetErrorDescription9A(hr));
        ri.Sys_DirectXFatalError();
    }
    Com_Memcpy(data, vertices, size);
    do
    {
        RB_LogPrint("dx.smodelCacheVb->Unlock()\n");
        vb = (void *)dx.smodelCacheVb;
        ((CachedBufferUnlockFn)(*(void ***)vb)[12])(vb);
    } while (*(volatile int *)&alwaysfails != 0);
}

// PINNED 1002adb0: DX9 cached vertices have a 64-byte stride.
static void R_SkinCachedVertices(const vec3_t *axis, const vec3_t *normalAxis,
    int smodelIndex, int baseVert, int vertCount, const XVertexInfo *src,
    GfxSModelCachedVertex *out)
{
    const float *coords = rgp.world->smodelInsts[smodelIndex].baseLightingCoords;
    unsigned short baseLighting[2];
    baseLighting[0] = (unsigned short)I_fround(coords[0] * 32768.0f);
    baseLighting[1] = (unsigned short)I_fround(coords[1] * 32768.0f);
    for (int vertexIndex = 0; vertexIndex < vertCount; ++vertexIndex)
    {
        const XVertexInfo *in = &src[vertexIndex];
        GfxSModelCachedVertex *vertex = &out[vertexIndex];
        AxisTransformVector(axis, in->offset[0], in->offset[1], in->offset[2], vertex->xyz);
        VectorAdd(vertex->xyz, axis[3], vertex->xyz);
        AxisTransformVector(normalAxis, in->normal[0], in->normal[1], in->normal[2], vertex->normal);
        vertex->color = *(const GfxColor *)in->color;
        vertex->texCoord[0] = in->texCoordX;
        vertex->texCoord[1] = in->texCoordY;
        vertex->baseLightingCoords[0] = baseLighting[0];
        vertex->baseLightingCoords[1] = baseLighting[1];
        AxisTransformVector(normalAxis, in->binormal[0], in->binormal[1], in->binormal[2], vertex->binormal);
        AxisTransformVector(normalAxis, in->tangent[0], in->tangent[1], in->tangent[2], vertex->tangent);
    }
    R_UploadCachedVertices(baseVert, vertCount * sizeof(*out), out, sizeof(*out));
}

// PINNED 1002b3c0: DX7 cached vertices have a 24-byte stride.
static void R_SkinCachedVerticesDx7(const vec3_t *axis, const vec3_t *normalAxis,
    int smodelIndex, int baseVert, int vertCount, const XVertexInfo *src,
    const Material *material, GfxSModelCachedVertexDx7 *out)
{
    D3DLIGHT9 lights[8];
    int lightCount = RB_DeriveEntityLights(
        rgp.world->smodelLightingColorTable[smodelIndex],
        rgp.world->smodelLightingSunVisTable[smodelIndex], material, lights, 8);
    for (int vertexIndex = 0; vertexIndex < vertCount; ++vertexIndex)
    {
        vec3_t normal;
        const XVertexInfo *in = &src[vertexIndex];
        GfxSModelCachedVertexDx7 *vertex = &out[vertexIndex];
        AxisTransformVector(axis, in->offset[0], in->offset[1], in->offset[2], vertex->xyz);
        VectorAdd(vertex->xyz, axis[3], vertex->xyz);
        vertex->texCoord[0] = in->texCoordX;
        vertex->texCoord[1] = in->texCoordY;
        AxisTransformVector(normalAxis, in->normal[0], in->normal[1], in->normal[2], normal);
        R_LightCachedVertex(normal, in->color, lights, lightCount, vertex->color.array);
    }
    R_UploadCachedVertices(baseVert, vertCount * sizeof(*out), out, sizeof(*out));
}

void R_SkinStaticModelCachedCmd(SkinStaticModelCachedCmd *skinCmd, SkinBuffers *skinBuffers)
{
    GfxStaticModelSurfaceCached *cached = skinCmd->cached;
    const XSurface *surface = cached->xsurf;
    const GfxStaticModelInstance *model = &rgp.world->smodelInsts[skinCmd->smodelIndex];
    DObjSkelMat bone;
    vec3_t axis[4];
    vec3_t normalAxis[3];
    const DObjAnimMat *pose = ri.XModelGetBasePoseBone(model->model, surface->boneOffset);
    R_ConvertAnimMatToSkelMat(pose, &bone);
    R_GetRigidTransform(&bone, model->origin, model->axis, model->scale, axis);
    Vec3NormalizeTo(axis[0], normalAxis[0]);
    Vec3NormalizeTo(axis[1], normalAxis[1]);
    Vec3NormalizeTo(axis[2], normalAxis[2]);
    if (r_rendererInUse->current.integer == 2)
        R_SkinCachedVerticesDx7(axis, normalAxis, skinCmd->smodelIndex,
            cached->baseVertIndex, surface->vertCount, (const XVertexInfo *)surface->verts,
            skinCmd->material, skinBuffers->verts.dx7);
    else
        R_SkinCachedVertices(axis, normalAxis, skinCmd->smodelIndex,
            cached->baseVertIndex, surface->vertCount, (const XVertexInfo *)surface->verts,
            skinBuffers->verts.dx9);
}

static void SMC_FreeCachedSurface_r(static_model_cache_t *cache, static_model_tree_t *tree, int nodeIndex, int levelsToLeaf)
{
    static_model_leaf_t *leaf;
    GfxStaticSurface *surface;
    unsigned int lodLevel;

    if (!tree->nodes[nodeIndex].usedVerts)
    {
        leaf = &tree->leafs[((nodeIndex + 1) << levelsToLeaf) - 16];
        ((static_model_node_list_t *)leaf->freenode.next)->prev = leaf->freenode.prev;
        ((static_model_node_list_t *)leaf->freenode.prev)->next = leaf->freenode.next;
        return;
    }
    tree->nodes[nodeIndex].usedVerts = 0;
    if (!tree->nodes[nodeIndex].inuse)
    {
        SMC_FreeCachedSurface_r(cache, tree, 2 * nodeIndex + 1, levelsToLeaf - 1);
        SMC_FreeCachedSurface_r(cache, tree, 2 * nodeIndex + 2, levelsToLeaf - 1);
        return;
    }
    leaf = &tree->leafs[((nodeIndex + 1) << levelsToLeaf) - 16];
    surface = leaf->surf.surface;
    for (lodLevel = 0; lodLevel < 4; ++lodLevel)
    {
        if (surface->cachedLods[lodLevel] == &leaf->surf)
        {
            surface->cachedLods[lodLevel] = 0;
            break;
        }
    }
    cache->stats.allocatedVerts -= 1 << (levelsToLeaf + 5);
    cache->stats.usedVerts -= leaf->surf.xsurf->vertCount;
    tree->nodes[nodeIndex].inuse = 0;
}

static Bool SMC_ForceFreeBlock(static_model_cache_t *cache)
{
    static_model_tree_t *tree;
    static_model_node_list_t *freenode;
    static_model_node_list_t *freelist;

    tree = (static_model_tree_t *)cache->usedlist.prev;
    if (frontEndDataOut->frameCount - tree->frameCount < 3)
        return 0;
    SMC_FreeCachedSurface_r(cache, tree, 0, 4);
    ((static_model_tree_list_t *)tree->usedlist.next)->prev = tree->usedlist.prev;
    ((static_model_tree_list_t *)tree->usedlist.prev)->next = tree->usedlist.next;
    freenode = &tree->leafs[0].freenode;
    freelist = &cache->freelist[0];
    freenode->prev = (intptr_t)freelist;
    freenode->next = freelist->next;
    freelist->next = (intptr_t)freenode;
    ((static_model_node_list_t *)freenode->next)->prev = (intptr_t)freenode;
    return 1;
}

Bool SMC_GetFreeBlockOfSize(static_model_cache_t *cache, int listIndex)
{
    static_model_node_list_t *block;
    static_model_node_list_t *buddy;
    static_model_node_list_t *freelist;
    static_model_tree_t *tree;

    if (!listIndex)
        return SMC_ForceFreeBlock(cache);
    if (cache->freelist[listIndex - 1].next == (intptr_t)&cache->freelist[listIndex - 1]
        && !SMC_GetFreeBlockOfSize(cache, listIndex - 1))
    {
        return 0;
    }
    block = (static_model_node_list_t *)cache->freelist[listIndex - 1].next;
    ((static_model_node_list_t *)block->next)->prev = block->prev;
    ((static_model_node_list_t *)block->prev)->next = block->next;
    tree = &cache->trees[((char *)block - (char *)cache) / (int)sizeof(static_model_tree_t)];
    if (listIndex == 1)
    {
        static_model_tree_list_t *usedlist = &cache->usedlist;
        tree->usedlist.prev = (intptr_t)usedlist;
        tree->usedlist.next = usedlist->next;
        usedlist->next = (intptr_t)&tree->usedlist;
        ((static_model_tree_list_t *)tree->usedlist.next)->prev = (intptr_t)&tree->usedlist;
    }
    freelist = &cache->freelist[listIndex];
    block->prev = (intptr_t)freelist;
    block->next = freelist->next;
    freelist->next = (intptr_t)block;
    ((static_model_node_list_t *)block->next)->prev = (intptr_t)block;
    buddy = &tree->leafs[(1 << (4 - listIndex)) + ((static_model_leaf_t *)block - tree->leafs)].freenode;
    buddy->prev = (intptr_t)freelist;
    buddy->next = freelist->next;
    freelist->next = (intptr_t)buddy;
    ((static_model_node_list_t *)buddy->next)->prev = (intptr_t)buddy;
    return 1;
}

typedef char cachePublicationLayoutCheck[(sizeof(static_model_tree_t) == 392 &&
    sizeof(static_model_cache_t) == 0xc438 && sizeof(GfxStaticModelSurfaceCached) == 16 &&
    offsetof(static_model_tree_t, nodes) == 12 && offsetof(static_model_tree_t, leafs) == 136 &&
    offsetof(static_model_cache_t, freelist) == 0xc400 &&
    offsetof(static_model_cache_t, usedlist) == 0xc428 &&
    offsetof(static_model_cache_t, stats) == 0xc430 &&
    offsetof(XSurface, vertCount) == 2 && offsetof(XSurface, triCount) == 4 &&
    offsetof(XSurface, triIndices) == 8 && sizeof(SkinStaticModelCachedCmd) == 12) ? 1 : -1];

// PINNED 1002acd0/215; allocation helper name unconfirmed.
static GfxStaticModelSurfaceCached *SMC_AllocCachedSurface(static_model_cache_t *cache, int sizeBits)
{
    int listIndex = 9 - sizeBits;
    static_model_node_list_t *head = &cache->freelist[listIndex];
    if (head->next == (intptr_t)head && !SMC_GetFreeBlockOfSize(cache, listIndex))
        return 0;
    static_model_node_list_t *block = (static_model_node_list_t *)head->next;
    ((static_model_node_list_t *)block->next)->prev = block->prev;
    ((static_model_node_list_t *)block->prev)->next = block->next;
    int treeIndex = ((byte *)block - (byte *)cache) / (int)sizeof(static_model_tree_t);
    static_model_tree_t *tree = &cache->trees[treeIndex];
    if (!listIndex)
    {
        static_model_tree_list_t *used = &cache->usedlist;
        tree->usedlist.prev = (intptr_t)used;
        tree->usedlist.next = used->next;
        used->next = (intptr_t)&tree->usedlist;
        ((static_model_tree_list_t *)tree->usedlist.next)->prev = (intptr_t)&tree->usedlist;
    }
    int leafIndex = (static_model_leaf_t *)block - tree->leafs;
    int nodeIndex = ((leafIndex + 16) >> (4 - listIndex)) - 1;
    tree->nodes[nodeIndex].inuse = 1;
    for (; nodeIndex >= 0; nodeIndex = (nodeIndex - 1) >> 1)
        tree->nodes[nodeIndex].usedVerts += 1 << sizeBits;
    GfxStaticModelSurfaceCached *surface = &tree->leafs[leafIndex].surf;
    surface->baseVertIndex = (treeIndex * 16 + leafIndex) * 32;
    return surface;
}

// PINNED 1002b790/82: each iteration copies two packed triangles.
static void R_CopyCachedSurfaceIndices(const GfxStaticModelSurfaceCached *cached)
{
    const unsigned int *src = (const unsigned int *)cached->xsurf->triIndices;
    unsigned int base = cached->baseVertIndex;
    unsigned int add = (base << 16) | base;
    unsigned int *dst = (unsigned int *)((byte *)dx.smodelCacheIndices + base * 12);
    int pairs = cached->xsurf->triCount / 2;
    do
    {
        *dst++ = *src++ + add;
        *dst++ = *src++ + add;
        *dst++ = *src++ + add;
    } while (--pairs);
}

extern SkinBuffers g_skinBuffers[1];

// PINNED 1002b7f0/193: allocate vertices, upload them, then publish the indices.
GfxStaticModelSurfaceCached *R_CacheStaticModelSurface(GfxStaticSurface *surface,
    const XSurface *xsurf, int smodelIndex, const Material *material)
{
    if (dx.deviceLost || xsurf->vertCount > 512)
        return 0;
    int sizeBits = 5;
    while ((1 << sizeBits) < xsurf->vertCount)
        ++sizeBits;
    GfxStaticModelSurfaceCached *cached = SMC_AllocCachedSurface(&s_cache, sizeBits);
    if (!cached)
        return 0;
    s_cache.stats.allocatedVerts += 1 << sizeBits;
    s_cache.stats.usedVerts += xsurf->vertCount;
    cached->surface = surface;
    cached->xsurf = xsurf;
    cached->smodelIndex = smodelIndex;
    SkinStaticModelCachedCmd command;
    command.cached = cached;
    command.smodelIndex = smodelIndex;
    command.material = material;
    R_SkinStaticModelCachedCmd(&command, &g_skinBuffers[0]);
    R_CopyCachedSurfaceIndices(cached);
    return cached;
}

// PINNED 1002b8c0/87: move the containing tree to the front of the used list.
void R_UsedCachedStaticModelSurface(GfxStaticModelSurfaceCached *surface)
{
    int treeIndex = ((byte *)surface - (byte *)&s_cache) / (int)sizeof(static_model_tree_t);
    static_model_tree_t *tree = &s_cache.trees[treeIndex];
    tree->frameCount = frontEndDataOut->frameCount;
    ((static_model_tree_list_t *)tree->usedlist.next)->prev = tree->usedlist.prev;
    ((static_model_tree_list_t *)tree->usedlist.prev)->next = tree->usedlist.next;
    tree->usedlist.prev = (intptr_t)&s_cache.usedlist;
    tree->usedlist.next = s_cache.usedlist.next;
    s_cache.usedlist.next = (intptr_t)&tree->usedlist;
    ((static_model_tree_list_t *)tree->usedlist.next)->prev = (intptr_t)&tree->usedlist;
}

typedef HRESULT (__stdcall *CacheCreateVertexBufferFn)(void *, UINT, DWORD,
    DWORD, int, IDirect3DVertexBuffer9 **, void *);

// PINNED 1002b920/128: size is captured before the original logging/retry loop.
void R_CreateSmodelCacheVertexBuffer()
{
    int size;

    size = (r_rendererInUse->current.integer == 2 ? 0x24 : 0x40) * 0x10000;
    do
    {
        RB_LogPrint("dx.device->CreateVertexBuffer( size, (0x00000200L) | (0x00000008L), 0, D3DPOOL_DEFAULT, &dx.smodelCacheVb, 0 )\n");
        ((CacheCreateVertexBufferFn)(*(void ***)dx.device)[0x68 / 4])(
            (void *)dx.device, size, 0x208, 0, 0, &dx.smodelCacheVb, 0);
    } while (alwaysfails);
}

void SMC_ClearCache()
{
    static_model_node_list_t *freenode;
    unsigned int listIter;
    unsigned int treeIter;

    memset(&s_cache, 0, sizeof(s_cache));
    s_cache.usedlist.prev = (intptr_t)&s_cache.usedlist;
    s_cache.usedlist.next = (intptr_t)&s_cache.usedlist;
    for (listIter = 0; listIter < 5; ++listIter)
    {
        s_cache.freelist[listIter].prev = (intptr_t)&s_cache.freelist[listIter];
        s_cache.freelist[listIter].next = (intptr_t)&s_cache.freelist[listIter];
    }
    for (treeIter = 0; treeIter < 128; ++treeIter)
    {
        freenode = &s_cache.trees[treeIter].leafs[0].freenode;
        freenode->prev = (intptr_t)&s_cache.freelist[0];
        freenode->next = s_cache.freelist[0].next;
        s_cache.freelist[0].next = (intptr_t)freenode;
        ((static_model_node_list_t *)freenode->next)->prev = (intptr_t)freenode;
    }
}

void R_FlushStaticModelCache()
{
    static_model_tree_t *tree;
    static_model_tree_list_t *next;
    static_model_node_list_t *freenode;

    if (!s_cache.usedlist.next)
        return;
    while (s_cache.usedlist.next != (intptr_t)&s_cache.usedlist)
    {
        tree = (static_model_tree_t *)s_cache.usedlist.next;
        SMC_FreeCachedSurface_r(&s_cache, tree, 0, 4);
        next = (static_model_tree_list_t *)s_cache.usedlist.next;
        ((static_model_tree_list_t *)next->next)->prev = next->prev;
        ((static_model_tree_list_t *)next->prev)->next = next->next;
        freenode = &tree->leafs[0].freenode;
        freenode->prev = (intptr_t)&s_cache.freelist[0];
        freenode->next = s_cache.freelist[0].next;
        s_cache.freelist[0].next = (intptr_t)freenode;
        ((static_model_node_list_t *)freenode->next)->prev = (intptr_t)freenode;
    }
    SMC_ClearCache();
}

typedef char smodelCacheIndicesCheck[offsetof(DxGlobals, smodelCacheIndices) == 0x2dc8 ? 1 : -1];

// PINNED 100016fd: inlined into R_LoadWorld.
void R_InitStaticModelIndexCache()
{
    dx.smodelCacheIndices = (r_index_t *)ri.Hunk_AllocInternal(0xc0000);
}

// PINNED 1002bb90/84: the denominator is the fixed65536-vertex cache capacity.
void R_StaticModelCacheStats_f()
{
    ri.Printf(0, "%.2f%% of cache is currently allocated.\n",
        s_cache.stats.allocatedVerts * (100.0f / 65536.0f));
    if (s_cache.stats.allocatedVerts)
        ri.Printf(0, "%.2f%% allocated cache vertices are used.\n",
            s_cache.stats.usedVerts * 100.0f / s_cache.stats.allocatedVerts);
}

// PINNED 1002bbf0/5: the console callback jumps to the existing real flush.
void R_StaticModelCacheFlush_f()
{
    R_FlushStaticModelCache();
}


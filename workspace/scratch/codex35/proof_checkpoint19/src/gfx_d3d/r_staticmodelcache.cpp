// Static model vertex cache.
#include "gfx.h"

static static_model_cache_t s_cache;

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

static void SMC_ClearCache()
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

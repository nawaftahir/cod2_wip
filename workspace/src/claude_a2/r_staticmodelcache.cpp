// Static model vertex cache.
#include "a2.h"

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

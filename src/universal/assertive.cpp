#include <stdlib.h>

extern "C" {

void __fastcall FUN_0047c6c0(void *self)
{
    void *child = *(void **)((char *)self + 8);
    if (child)
    {
        FUN_0047c6c0(child);
        free(child);
    }
    free(*(void **)self);
}

struct MapNode
{
    void *value;
    int unused;
    MapNode *child;

    MapNode *destroy(int destroy);
};

MapNode *MapNode::destroy(int destroy)
{
    MapNode *child = this->child;
    if (child)
        child->destroy(1);
    free(this->value);
    if (destroy & 1)
        free(this);
    return this;
}

}

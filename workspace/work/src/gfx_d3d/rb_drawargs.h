// PINNED PC draw arguments shared by upload, pass and device callers.
#pragma once
#include <stddef.h>

struct GfxDrawPrimArgs
{
    int firstVertexFromBase, vertexCount, primCount;
    union
    {
        struct { int baseVertex, baseIndex; } buf;
        struct { int vertexStride; } tess;
    } u;
};
typedef char drawArgsLayoutCheck[(sizeof(GfxDrawPrimArgs) == 20
    && offsetof(GfxDrawPrimArgs, u) == 12) ? 1 : -1];

// PINNED PC 1.0 tess: base106d3200, material1072d9bc, counts1072d9d0/d4.
#pragma once
#include <stddef.h>
struct Material;
struct GfxTess
{
    char vertexData[0x5a7b0];
    unsigned short *indices;
    unsigned short *secondaryIndices;
    int optimizedVertexSource;
    const Material *material;
    int techType;
    int lmapIndex;
    float materialTime;
    int declType;
    int indexCount;
    int vertexCount;
    int firstVertex;
    int lastVertex;
    int optimizedIndexCount;
    int optimizedVertexCount;
    int firstOptimizedVertex;
};
extern GfxTess tess;
#ifdef _MSC_VER
typedef char tessLayoutCheck[(offsetof(GfxTess, material) == 0x5a7bc &&
    offsetof(GfxTess, secondaryIndices) == 0x5a7b4 &&
    offsetof(GfxTess, indexCount) == 0x5a7d0 &&
    offsetof(GfxTess, vertexCount) == 0x5a7d4 &&
    offsetof(GfxTess, optimizedIndexCount) == 0x5a7e0 &&
    offsetof(GfxTess, firstOptimizedVertex) == 0x5a7e8 &&
    sizeof(GfxTess) == 0x5a7ec) ? 1 : -1];
#endif

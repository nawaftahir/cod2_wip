// PINNED PC 1.0 tessellated surface submission.
#include "r_local.h"
#include "rb_backend.h"
#include "rb_drawargs.h"
#include "rb_tess.h"

int RB_SetIndexData(const unsigned short *indices, int count);
void RB_SetVertexData(unsigned int stream, const void *data, int count, int stride);
void RB_ChangeStreamSource(int stream, IDirect3DVertexBuffer9 *buffer, int offset, int stride);
void RB_DrawTechnique(int declaration, const GfxDrawPrimArgs *args);
void RB_UpdateViewport();

/* Read-only views of existing allocations. These fields are pinned by
   1003a690 and 1003a8d0; unrecovered prefixes do not allocate extra state. */
struct SurfaceTechniqueView
{
    const char *name;
    unsigned short flags;
};
struct SurfaceTechniqueSetView
{
    const char *name;
    const SurfaceTechniqueView *techniques[34];
};
struct SurfaceMaterialView
{
    byte beforeTechniqueSet[0x38];
    const SurfaceTechniqueSetView *techniqueSet;
};
struct SurfaceWorldView
{
    byte beforeVertexBuffer[0x30];
    IDirect3DVertexBuffer9 *vertexBuffer;
};
struct SurfacePermanentView
{
    byte beforeWorld[0x109c];
    const SurfaceWorldView *world;
};
struct r_global_permanent_t;
extern r_global_permanent_t rgp;
typedef char surfaceViewLayoutCheck[(offsetof(SurfaceMaterialView, techniqueSet) == 0x38
    && offsetof(SurfaceTechniqueView, flags) == 4
    && offsetof(SurfacePermanentView, world) == 0x109c
    && offsetof(SurfaceWorldView, vertexBuffer) == 0x30) ? 1 : -1];

// PINNED 1003a690: optimized and ordinary counts have distinct lifetimes.
void RB_DrawOptimizedTessSurface()
{
    GfxDrawPrimArgs args;
    args.u.buf.baseVertex = tess.firstOptimizedVertex;
    args.vertexCount = tess.optimizedVertexCount;
    args.primCount = tess.optimizedIndexCount / 3;
    args.firstVertexFromBase = 0;
    args.u.buf.baseIndex = RB_SetIndexData(tess.secondaryIndices, tess.optimizedIndexCount);
    int declaration;
    IDirect3DVertexBuffer9 *buffer;
    int stride;
    if (tess.optimizedVertexSource == 1)
    {
        buffer = ((const SurfacePermanentView *)&rgp)->world->vertexBuffer;
        stride = r_rendererInUse->current.integer == 2 ? 32 : 68;
        declaration = 1;
    }
    else
    {
        buffer = dx.smodelCacheVb;
        stride = r_rendererInUse->current.integer == 2 ? 24 : 64;
        declaration = 3;
    }
    if (dxState.streams[0].vb != buffer || dxState.streams[0].offset != 0
        || dxState.streams[0].stride != stride)
        RB_ChangeStreamSource(0, buffer, 0, stride);
    RB_DrawTechnique(declaration, &args);
    tess.optimizedIndexCount = 0;
    tess.optimizedVertexSource = 0;
}

// PINNED 1003a7b0: capacity is checked after index upload, before vertex upload.
void RB_DrawTessSurface()
{
    GfxDrawPrimArgs args;
    args.vertexCount = tess.vertexCount;
    args.primCount = tess.indexCount / 3;
    args.firstVertexFromBase = 0;
    int stride;
    if (tess.declType == 1)
        stride = r_rendererInUse->current.integer == 2 ? 32 : 68;
    else
        stride = r_rendererInUse->current.integer == 2 ? 36 : 64;
    args.u.buf.baseIndex = RB_SetIndexData(tess.indices, tess.indexCount);
    if (dx.dynamicVertexBuffer->used + tess.vertexCount * stride > dx.dynamicVertexBuffer->total)
        dx.dynamicVertexBuffer->used = 0;
    RB_SetVertexData(0, tess.vertexData, tess.vertexCount, stride);
    args.u.buf.baseVertex = 0;
    RB_DrawTechnique(tess.declType, &args);
    tess.indexCount = 0;
    tess.vertexCount = 0;
}

// PINNED 1003a8d0: missing/blocked techniques clear only the three draw counts.
void RB_EndSurface()
{
    const SurfaceTechniqueView *technique = ((const SurfaceMaterialView *)tess.material)
        ->techniqueSet->techniques[tess.techType];
    if (technique)
    {
        if (backEnd.viewportIsDirty)
            RB_UpdateViewport();
        if (!dxState.viewportIsNull
            && (!(technique->flags & 1) || backEnd.resolvedPostSunTarget != 14)
            && (!(technique->flags & 2) || backEnd.resolvedSceneTarget != 14))
        {
            if (tess.optimizedIndexCount)
                RB_DrawOptimizedTessSurface();
            if (tess.indexCount)
                RB_DrawTessSurface();
            RB_LogPrint("---------- RB_EndSurface\n");
            return;
        }
    }
    tess.optimizedIndexCount = 0;
    tess.indexCount = 0;
    tess.vertexCount = 0;
}

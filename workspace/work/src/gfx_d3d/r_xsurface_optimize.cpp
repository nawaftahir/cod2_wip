// Static surface buffer creation; PC 1.0 bodies at 1002da90/1002db80/1002dc80.
#include "r_local.h"

struct XVertexBuffer;
struct GfxVertex;
struct GfxVertexDx7;
struct XRigidSurface { IDirect3DVertexBuffer9 *vb; };
// Same 24-byte surface view as common_types.h; pair it with SDK COM interfaces.
struct XSurface_s
{
    byte tileMode;
    short vertCount;
    short triCount;
    short boneOffset;
    int (*triIndices)[4];
    XVertexBuffer *verts;
    XRigidSurface surfRigid;
    IDirect3DIndexBuffer9 *indexBuffer;
};
typedef char SurfaceLayoutCheck[(sizeof(XSurface) == 24) ? 1 : -1];

extern DxGlobals dx;
void R_FinishStaticVertexBuffer(void *vb);
void R_FinishStaticIndexBuffer(IDirect3DIndexBuffer9 *ib);
void XSurfaceTransfer(const XVertexBuffer *src, GfxVertex *dst, int count);
void XSurfaceTransferDx7(const XVertexBuffer *src, GfxVertexDx7 *dst, int count);
extern "C" void Com_Memcpy(void *dst, const void *src, int count);

void XSurfaceOptimizeRigid(XModel *model, XSurface *surface, XVertexBuffer *surfVerts)
{
    void *vertexData;
    HRESULT hr;
    IDirect3DVertexBuffer9 **vb = &surface->surfRigid.vb;

    if (surface->surfRigid.vb)
        return;
    hr = dx.device->CreateVertexBuffer(surface->vertCount *
        (r_rendererInUse->current.integer == 2 ? 36 : 64), 8, 0,
        D3DPOOL_DEFAULT, vb, 0);
    if (hr < 0)
        goto failed;
    hr = surface->surfRigid.vb->Lock(0, 0, &vertexData, 0);
    if (hr < 0)
    {
        surface->surfRigid.vb->Release();
        goto failed;
    }
    if (r_rendererInUse->current.integer == 2)
        XSurfaceTransferDx7(surfVerts, (GfxVertexDx7 *)vertexData, surface->vertCount);
    else
        XSurfaceTransfer(surfVerts, (GfxVertex *)vertexData, surface->vertCount);
    R_FinishStaticVertexBuffer(surface->surfRigid.vb);
    return;
failed:
    surface->surfRigid.vb = 0;
}
// Name unconfirmed: retail 1002db80 inlines index allocation and checks its result.
void XSurfaceOptimize(XModel *model, XSurface *surface)
{
    void *indexData;
    int dataSize;
    int bufferSize;
    HRESULT hr;

    if (!surface->indexBuffer)
    {
        dataSize = surface->triCount * 6;
        bufferSize = (dataSize + 31) & ~31;
        hr = dx.device->CreateIndexBuffer(bufferSize, 8, D3DFMT_INDEX16,
            D3DPOOL_DEFAULT, &surface->indexBuffer, 0);
        if (hr < 0)
            return;
        hr = surface->indexBuffer->Lock(0, 0, &indexData, 0);
        if (hr < 0)
        {
            surface->indexBuffer->Release();
            return;
        }
        if (!indexData)
            return;
        Com_Memcpy(indexData, surface->triIndices, dataSize);
        memset((byte *)indexData + dataSize, 0, bufferSize - dataSize);
        R_FinishStaticIndexBuffer(surface->indexBuffer);
    }
    if (surface->boneOffset != -1)
        XSurfaceOptimizeRigid(model, surface, surface->verts);
}

void XModelOptimize(XModel *model)
{
    XSurface **surfaces;
    int *partBits;
    int lodCount;
    int surfCount;
    int lod;
    int surf;

    lodCount = ri.XModelGetNumLods(model);
    for (lod = 0; lod < lodCount; ++lod)
    {
        surfCount = ri.XModelGetSurfaces(model, &surfaces, lod, &partBits);
        for (surf = 0; surf < surfCount; ++surf)
            XSurfaceOptimize(model, surfaces[surf]);
    }
}


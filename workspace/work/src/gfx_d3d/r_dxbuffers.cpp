// Direct3D buffer creation.
#include "r_local.h"

void R_FinishStaticIndexBuffer(IDirect3DIndexBuffer9 *ib)
{
    R_DX_CALL(ib->Unlock());
}

void R_CreateSmodelCacheVertexBuffer()
{
    int size;

    size = (r_rendererInUse->current.integer == 2 ? 0x24 : 0x40) * 0x10000;
    R_DX_CALL(dx.device->CreateVertexBuffer( size, D3DUSAGE_DYNAMIC | D3DUSAGE_WRITEONLY, 0, D3DPOOL_DEFAULT, &dx.smodelCacheVb, 0 ));
}

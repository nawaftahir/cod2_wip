// PINNED PC 1.0 dynamic index and vertex uploads.
#include "r_local.h"
#include <dxerr9.h>
#include <stddef.h>

extern "C" void Com_Memcpy(void *dest, const void *src, int count);
void RB_ChangeIndices(IDirect3DIndexBuffer9 *buffer);
void RB_ChangeStreamSource(int streamIndex, IDirect3DVertexBuffer9 *buffer, int offset, int stride);

typedef char dynamicBufferLayoutCheck[(sizeof(r_ib_state_t) == 12
    && sizeof(r_vb_state_t) == 12
    && offsetof(DxGlobals, dynamicIndexBufferPool) == 0x2d80
    && offsetof(DxGlobals, dynamicIndexBuffer) == 0x2d8c
    && offsetof(DxGlobals, dynamicVertexBuffer) == 0x2db4
    && offsetof(refimport_t, Sys_DirectXFatalError) == 0x54) ? 1 : -1];

// Both retail upload paths inline this failure sequence.
static inline void R_FatalBufferLockError(HRESULT result)
{
    ri.Printf(0, "********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n");
    ri.Printf(0, "********** error information:  %s\n", DXGetErrorDescription9(result));
    ri.Sys_DirectXFatalError();
}

// PINNED 100386b0/282: rollover selects the pool only after clearing used.
int RB_SetIndexData(const unsigned short *indices, int indexCount)
{
    int bytes = indexCount * 2;
    bool overflow = dx.dynamicIndexBuffer->used + bytes > dx.dynamicIndexBuffer->total;
    if (overflow)
        dx.dynamicIndexBuffer->used = 0;
    if (!dx.dynamicIndexBuffer->used)
        dx.dynamicIndexBuffer = dx.dynamicIndexBufferPool;
    int offset = dx.dynamicIndexBuffer->used;
    int baseIndex = (unsigned int)offset >> 1;
    IDirect3DIndexBuffer9 *dxIb = dx.dynamicIndexBuffer->buffer;
    DWORD flags = !overflow && (dx.gpuSync || offset) ? D3DLOCK_NOOVERWRITE : D3DLOCK_DISCARD;
    void *bufferData;
    HRESULT result = dxIb->Lock(offset, bytes, &bufferData, flags);
    if (result < 0)
        R_FatalBufferLockError(result);
    Com_Memcpy(bufferData, indices, bytes);
    R_DX_CALL(dxIb->Unlock());
    if (dxState.indexBuffer != dxIb)
        RB_ChangeIndices(dxIb);
    dx.dynamicIndexBuffer->used += bytes;
    return baseIndex;
}

// PINNED 100387d0/282: callers handle capacity; offset alone selects lock flags.
void RB_SetVertexData(unsigned int streamIndex, const void *data, int vertexCount, int stride)
{
    int bytes = stride * vertexCount;
    IDirect3DVertexBuffer9 *dxVb = dx.dynamicVertexBuffer->buffer;
    int offset = dx.dynamicVertexBuffer->used;
    DWORD flags = offset ? D3DLOCK_NOOVERWRITE : D3DLOCK_DISCARD;
    void *bufferData;
    HRESULT result = dxVb->Lock(offset, bytes, &bufferData, flags);
    if (result < 0)
        R_FatalBufferLockError(result);
    Com_Memcpy(bufferData, data, bytes);
    R_DX_CALL(dxVb->Unlock());
    offset = dx.dynamicVertexBuffer->used;
    if (dxState.streams[streamIndex].vb != dxVb
        || dxState.streams[streamIndex].offset != offset
        || dxState.streams[streamIndex].stride != stride)
        RB_ChangeStreamSource(streamIndex, dxVb, offset, stride);
    dx.dynamicVertexBuffer->used += bytes;
}

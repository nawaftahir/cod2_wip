// Direct3D buffer creation.
#include "r_local.h"
#include <dxerr9.h>
#include <stdlib.h>

void R_FatalInitError(const char *message);

// PINNED 10011a40/129: total is the requested byte count, not a vertex count.
void R_CreateDynamicVertexBuffer(r_vb_state_t *state, int bytes)
{
    state->used = 0;
    state->total = bytes;
    HRESULT result = dx.device->CreateVertexBuffer(bytes,
        D3DUSAGE_DYNAMIC | D3DUSAGE_WRITEONLY, 0, D3DPOOL_DEFAULT, &state->buffer, 0);
    if (result < 0)
        R_FatalInitError(va("Couldn't create a %i-byte dynamic vertex buffer: %s",
            bytes, DXGetErrorDescription9(result)));
}

// PINNED 10011ad0/129: dynamic index entries use the SDK's 16-bit format.
void R_CreateDynamicIndexBuffer(r_ib_state_t *state, int bytes)
{
    state->used = 0;
    state->total = bytes;
    HRESULT result = dx.device->CreateIndexBuffer(bytes,
        D3DUSAGE_DYNAMIC | D3DUSAGE_WRITEONLY, D3DFMT_INDEX16, D3DPOOL_DEFAULT, &state->buffer, 0);
    if (result < 0)
        R_FatalInitError(va("Couldn't create a %i-byte dynamic index buffer: %s",
            bytes, DXGetErrorDescription9(result)));
}

// PINNED 10011b60/143: reserve the skin arena; committing it belongs elsewhere.
void R_CreateDynamicBuffers()
{
    R_CreateDynamicVertexBuffer(&dx.dynamicVertexBufferPool[0],
        (r_rendererInUse->current.integer == 2 ? 36 : 64) * 32768);
    dx.dynamicVertexBuffer = &dx.dynamicVertexBufferPool[0];
    for (int index = 0; index < 2; ++index)
        R_CreateDynamicVertexBuffer(&dx.skinnedCacheVbPool[index],
            (r_rendererInUse->current.integer == 2 ? 36 : 64) * 131072);
    R_CreateDynamicIndexBuffer(&dx.dynamicIndexBufferPool[0], 2097152);
    dx.dynamicIndexBuffer = &dx.dynamicIndexBufferPool[0];
    dx.tempSkinBuf = (byte *)ri.Z_VirtualReserveInternal(10485760);
}

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

void *R_AllocStaticVertexBuffer(void **buffer, int bytes);
void R_FinishStaticVertexBuffer(void *buffer);

struct ParticleCloudVertex
{
    float xyz[3];
    float uv[2];
};

// PINNED 10011bf0/544: allocation/lock failure still reaches the original writes.
void R_CreateParticleCloudBuffer()
{
    const unsigned short quadIndices[6] = {0, 1, 2, 2, 1, 3};
    const float quadTexCoords[4][2] = {{0, 0}, {0, 1}, {1, 0}, {1, 1}};
    ParticleCloudVertex *vertices = (ParticleCloudVertex *)R_AllocStaticVertexBuffer(
        (void **)&dx.particleCloudVertexBuffer, 81920);
    unsigned short *indices;
    HRESULT result = dx.device->CreateIndexBuffer(12288, D3DUSAGE_WRITEONLY,
        D3DFMT_INDEX16, D3DPOOL_DEFAULT, &dx.particleCloudIndexBuffer, 0);
    if (result < 0)
        indices = 0;
    else if (dx.particleCloudIndexBuffer->Lock(0, 0, (void **)&indices, 0) < 0)
    {
        dx.particleCloudIndexBuffer->Release();
        indices = 0;
    }
    for (int x = 0; x < 8; ++x)
        for (int y = 0; y < 8; ++y)
            for (int z = 0; z < 16; ++z)
            {
                int particle = (x * 8 + y) * 16 + z;
                float px = (rand() * (1.0f / 32767.0f) + x) * 0.25f - 1.0f;
                float py = (rand() * (1.0f / 32767.0f) + y) * 0.25f - 1.0f;
                float pz = (rand() * (1.0f / 32767.0f) + z) * 0.125f - 1.0f;
                for (int corner = 0; corner < 4; ++corner, ++vertices)
                {
                    vertices->xyz[0] = px;
                    vertices->xyz[1] = py;
                    vertices->xyz[2] = pz;
                    vertices->uv[0] = quadTexCoords[corner][0];
                    vertices->uv[1] = quadTexCoords[corner][1];
                }
                for (int index = 0; index < 6; ++index)
                    *indices++ = (unsigned short)(4 * particle + quadIndices[index]);
            }
    R_FinishStaticIndexBuffer(dx.particleCloudIndexBuffer);
    R_FinishStaticVertexBuffer(dx.particleCloudVertexBuffer);
}

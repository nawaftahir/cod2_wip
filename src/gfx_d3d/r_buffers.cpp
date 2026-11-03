// Static vertex and index buffers.
#include "r_local.h"
#include "gfx.h"

extern DxGlobals dx;
extern int alwaysfails;
void RB_LogPrint(const char *text);
void R_FatalInitError(const char *msg);
extern "C" const char *__stdcall DXGetErrorDescription9A(HRESULT hr);

typedef HRESULT(__stdcall *CreateVertexBufferFn)(void *device, UINT length, DWORD usage, DWORD fvf, int pool, IDirect3DVertexBuffer9 **ppVB, void *sharedHandle);
typedef HRESULT(__stdcall *BufferLockFn)(void *buffer, UINT offsetToLock, UINT sizeToLock, void **ppbData, DWORD flags);
typedef HRESULT(__stdcall *BufferUnlockFn)(void *buffer);
#define VTABLE(obj) (*(void ***)((void *)(obj)))

void *R_AllocStaticVertexBuffer(void **vb, int sizeInBytes)
{
    void *vertexBufferData;
    HRESULT hr;

    hr = ((CreateVertexBufferFn)VTABLE(dx.device)[0x68 / 4])((void *)dx.device, sizeInBytes, 8, 0, 0, (IDirect3DVertexBuffer9 **)vb, NULL);
    if (hr < 0)
        R_FatalInitError(va("DirectX didn't create a %i-byte vertex buffer: %s\n", sizeInBytes, DXGetErrorDescription9A(hr)));
    hr = ((BufferLockFn)VTABLE(*vb)[0x2c / 4])((void *)*vb, 0, 0, &vertexBufferData, 0);
    if (hr < 0)
        R_FatalInitError(va("DirectX didn't lock a vertex buffer: %s\n", DXGetErrorDescription9A(hr)));
    return vertexBufferData;
}

// Opaque COM handle shared by the Mac-union and Windows SDK pointer views.
void R_FinishStaticVertexBuffer(void *vb)
{
    do
    {
        RB_LogPrint("vb->Unlock()\n");
        ((BufferUnlockFn)VTABLE(vb)[0x30 / 4])((void *)vb);
    } while (*(volatile int *)&alwaysfails != 0);
}

typedef ULONG(__stdcall *ReleaseFn)(void *obj);

void R_FreeStaticVertexBuffer(IDirect3DVertexBuffer9 *vb)
{
    do
    {
        ((ReleaseFn)VTABLE(vb)[0x08 / 4])((void *)vb);
        vb = NULL;
    } while (*(volatile int *)&alwaysfails != 0);
}

// PINNED 10005090/72: either COM failure returns null; a failed lock releases.
void *R_AllocStaticIndexBuffer(IDirect3DIndexBuffer9 **ib, int sizeInBytes)
{
    void *data;
    if (dx.device->CreateIndexBuffer(sizeInBytes, D3DUSAGE_WRITEONLY,
        D3DFMT_INDEX16, D3DPOOL_DEFAULT, ib, 0) < 0)
        return 0;
    if ((*ib)->Lock(0, 0, &data, 0) < 0)
    {
        (*ib)->Release();
        return 0;
    }
    return data;
}

// PINNED 100050e0: the original index-buffer unlock log and retry loop.
void R_FinishStaticIndexBuffer(IDirect3DIndexBuffer9 *ib)
{
    do
    {
        RB_LogPrint("ib->Unlock()\n");
        ((BufferUnlockFn)VTABLE(ib)[0x30 / 4])((void *)ib);
    } while (alwaysfails);
}

void R_FreeStaticIndexBuffer(IDirect3DIndexBuffer9 *ib)
{
    do
    {
        ((ReleaseFn)VTABLE(ib)[0x08 / 4])((void *)ib);
        ib = NULL;
    } while (alwaysfails != 0);
}

// Direct3D presentation setup and device creation.
#include "r_local.h"
#include "r_window.h"
#include "r_sun_state.h"
#include <dxerr9.h>

extern const dvar_t *r_swapInterval;

void R_InitRenderTargets();
void R_CreateSmodelCacheVertexBuffer();
void SMC_ClearCache();
void R_CreateDynamicBuffers();
void R_CreateParticleCloudBuffer();
void RB_SetInitialState();

// PINNED 10012100/261: occlusion-query failures log and continue, event failure stops.
Bool R_CreateDeviceResources()
{
    ri.Printf(0, "Initializing render targets...\n");
    R_InitRenderTargets();
    ri.Printf(0, "Initializing static model cache...\n");
    R_CreateSmodelCacheVertexBuffer();
    SMC_ClearCache();
    ri.Printf(0, "Initializing dynamic buffers...\n");
    R_CreateDynamicBuffers();
    ri.Printf(0, "Initializing particle cloud buffer...\n");
    R_CreateParticleCloudBuffer();
    ri.Printf(0, "Creating Direct3D queries...\n");
    dx.flushGpuQueryIssued = 0;
    HRESULT result = dx.device->CreateQuery(D3DQUERYTYPE_EVENT, &dx.flushGpuQuery);
    if (result < 0)
    {
        ri.Printf(0, "Event query creation failed: %s (0x%08x)\n", DXGetErrorDescription9(result), result);
        return 0;
    }
    for (int view = 0; view < 4; ++view)
        for (int query = 0; query < 2; ++query)
        {
            result = dx.device->CreateQuery(D3DQUERYTYPE_OCCLUSION, &sunFlareState[view].sunQuery[query]);
            if (result < 0)
                ri.Printf(0, "Occlusion query creation failed: %s (0x%08x)\n", DXGetErrorDescription9(result), result);
            sunFlareState[view].sunQueryIssued[query] = 0;
        }
    ri.Printf(0, "Setting initial state...\n");
    RB_SetInitialState();
    return 1;
}

// PINNED 10011460/100: this probe always uses adapter zero.
void R_SetupAntiAliasing(const GfxWindowParms *parms)
{
    DWORD qualityLevels;
    int samples = parms->aaSamples;
    while (samples > 1)
    {
        dx.multiSampleType = (D3DMULTISAMPLE_TYPE)samples;
        if (dx.d3d9->CheckDeviceMultiSampleType(0, D3DDEVTYPE_HAL,
            D3DFMT_A8R8G8B8, !parms->fullscreen, dx.multiSampleType, &qualityLevels) >= 0)
        {
            dx.multiSampleQuality = qualityLevels - 1;
            return;
        }
        --samples;
    }
    dx.multiSampleType = D3DMULTISAMPLE_NONE;
    dx.multiSampleQuality = 0;
}

// PINNED 100114d0/137: depth format is set although automatic depth is disabled.
void R_SetD3DPresentParameters(D3DPRESENT_PARAMETERS *present, const GfxWindowParms *parms)
{
    R_SetupAntiAliasing(parms);
    memset(present, 0, sizeof(*present));
    present->BackBufferWidth = parms->width;
    present->BackBufferHeight = parms->height;
    present->BackBufferFormat = D3DFMT_A8R8G8B8;
    present->BackBufferCount = 1;
    present->MultiSampleType = dx.multiSampleType;
    present->MultiSampleQuality = dx.multiSampleQuality;
    present->SwapEffect = D3DSWAPEFFECT_DISCARD;
    present->EnableAutoDepthStencil = 0;
    present->AutoDepthStencilFormat = D3DFMT_D24S8;
    present->PresentationInterval = r_swapInterval->current.enabled ?
        D3DPRESENT_INTERVAL_ONE : D3DPRESENT_INTERVAL_IMMEDIATE;
    present->hDeviceWindow = parms->hwnd;
    present->Flags = 0;
    if (parms->fullscreen)
    {
        present->Windowed = 0;
        present->FullScreen_RefreshRateInHz = parms->hz;
    }
    else
    {
        present->Windowed = 1;
        present->FullScreen_RefreshRateInHz = 0;
    }
}

// PINNED 100126d0/113: twenty tries per adapter, then at most one adapter-zero batch.
HRESULT R_CreateDeviceInternal(HWND hwnd, DWORD behavior, D3DPRESENT_PARAMETERS *present)
{
    HRESULT result;
    for (;;)
    {
        ri.Printf(0, "Creating Direct3D device...\n");
        int attempt = 0;
        do
        {
            result = dx.d3d9->CreateDevice(dx.adapterIndex, D3DDEVTYPE_HAL,
                hwnd, behavior, present, &dx.device);
            if (result >= 0)
                return result;
            Sleep(100);
            ++attempt;
        } while (attempt != 20);
        if (!dx.adapterIndex)
            return result;
        dx.adapterIndex = 0;
    }
}

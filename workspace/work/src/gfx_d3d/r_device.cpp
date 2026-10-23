// Direct3D presentation setup and device creation.
#include "r_local.h"
#include "r_window.h"

extern const dvar_t *r_swapInterval;

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

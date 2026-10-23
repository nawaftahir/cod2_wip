// Direct3D presentation setup and device creation.
#include "r_local.h"
#include "r_window.h"
#include "r_sun_state.h"
#include "rb_backend.h"
#include <dxerr9.h>
#include <float.h>

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

extern const dvar_t *r_gamma;
extern const dvar_t *r_multiGpu;
extern const dvar_t *r_gpuSync;
void R_StoreWindowSettings(const GfxWindowParms *parms);
void R_InitSystems();

typedef char deviceStartupLayoutCheck[(offsetof(DxGlobals, gpuSync) == 0x2c20 &&
    offsetof(DxGlobals, deviceLost) == 0x2d3c &&
    offsetof(DxGlobals, windowCount) == 0x2d48 && offsetof(DxGlobals, windows) == 0x2d4c &&
    sizeof(GfxWindowTarget) == 16 && offsetof(GfxWindowTarget, width) == 8 &&
    offsetof(r_backEndGlobals_t, sceneViewport) + offsetof(GfxViewport, width) == 0x3e8 &&
    offsetof(r_backEndGlobals_t, sceneViewport) + offsetof(GfxViewport, height) == 0x3ec &&
    offsetof(vidConfig_t, width) == 0 && offsetof(vidConfig_t, height) == 4) ? 1 : -1];

// PINNED 100128b0/271: restore FP control even when device creation fails.
Bool R_CreateDevice(const GfxWindowParms *parms)
{
    HWND hwnd = parms->hwnd;
    D3DPRESENT_PARAMETERS present;
    R_SetD3DPresentParameters(&present, parms);
    HRESULT result = R_CreateDeviceInternal(hwnd, D3DCREATE_HARDWARE_VERTEXPROCESSING, &present);
    _controlfp(_PC_24, _MCW_PC);
    _controlfp(_MCW_EM, _MCW_EM);
    if (result < 0)
    {
        ri.Printf(0, "Couldn't create a Direct3D device: %s\n", DXGetErrorDescription9(result));
        return 0;
    }
    dx.deviceLost = 0;
    dx.gpuSync = r_multiGpu->current.enabled ? 0 : r_gpuSync->current.integer;
    R_StoreWindowSettings(parms);
    backEnd.sceneViewport.width = vidConfig.width;
    backEnd.sceneViewport.height = vidConfig.height;
    if (!R_CreateDeviceResources())
        return 0;
    ri.Dvar_ClearModified(r_gamma);
    R_InitSystems();
    dx.windows[dx.windowCount].hwnd = parms->hwnd;
    dx.windows[dx.windowCount].width = parms->width;
    dx.windows[dx.windowCount].height = parms->height;
    ++dx.windowCount;
    return 1;
}

void R_SetupWindowParms(GfxWindowParms *parms);
bool R_CreateDirect3D();

// PINNED 10012c20/91: lower AA first, then refresh, then resolution.
Bool R_ReduceWindowSettings()
{
    const dvar_t *setting;
    if (r_aaSamples->current.integer > 1)
        setting = r_aaSamples;
    else if (r_displayRefresh->current.integer > 0 && vidConfig.displayFrequency > 60)
        setting = r_displayRefresh;
    else if (r_mode->current.integer > 0 && (vidConfig.width > 640 || vidConfig.height > 480))
        setting = r_mode;
    else
        return 0;
    ri.Dvar_SetInt(setting, setting->current.integer - 1);
    return 1;
}

// PINNED 10012c80/289: an existing device only reinitializes systems.
void R_InitHardware()
{
    if (dx.device)
    {
        R_InitSystems();
        return;
    }
    GfxWindowParms parms;
    R_CreateDirect3D();
    for (;;)
    {
        R_SetupWindowParms(&parms);
        if (R_CreateGameWindow(&parms) && R_CreateDevice(&parms))
            break;
        if (!R_ReduceWindowSettings())
        {
            ri.Printf(0, "********** DirectX returned an unrecoverable error code during initialization  **********\n");
            ri.Printf(0, "********** Initialization also happens while playing if DirectX loses a device **********\n");
            ri.Printf(0, "********** Consult the readme for how to continue from this problem            **********\n");
            ri.Printf(0, "\n%s\n", "Couldn't initialize renderer");
            ri.Sys_DirectXFatalError();
        }
    }
    ri.Sys_HideSplashWindow();
    dx.targetWindowIndex = 0;
    ShowWindow(parms.hwnd, SW_SHOW);
}

void R_ShutdownRenderTargets();
void R_FlushStaticModelCache();
void R_ReleaseDynamicBuffers();

// PINNED 10012210: release each window, then targets, buffers and queries.
void R_ReleaseForShutdownOrReset()
{
    for (int index = 0; index < dx.windowCount; ++index)
        do
        {
            dx.windows[index].swapChain->Release();
            dx.windows[index].swapChain = 0;
        } while (alwaysfails);
    R_ShutdownRenderTargets();
    R_FlushStaticModelCache();
    if (dx.smodelCacheVb)
        do
        {
            dx.smodelCacheVb->Release();
            dx.smodelCacheVb = 0;
        } while (alwaysfails);
    R_ReleaseDynamicBuffers();
    if (dx.particleCloudVertexBuffer)
    {
        IDirect3DVertexBuffer9 *buffer = dx.particleCloudVertexBuffer;
        do
        {
            buffer->Release();
            buffer = 0;
        } while (alwaysfails);
        dx.particleCloudVertexBuffer = 0;
    }
    if (dx.particleCloudIndexBuffer)
    {
        IDirect3DIndexBuffer9 *buffer = dx.particleCloudIndexBuffer;
        do
        {
            buffer->Release();
            buffer = 0;
        } while (alwaysfails);
        dx.particleCloudIndexBuffer = 0;
    }
    if (dx.flushGpuQuery)
        do
        {
            dx.flushGpuQuery->Release();
            dx.flushGpuQuery = 0;
        } while (alwaysfails);
    for (int index = 0; index < 4; ++index)
        for (int query = 0; query < 2; ++query)
            if (sunFlareState[index].sunQuery[query])
                do
                {
                    sunFlareState[index].sunQuery[query]->Release();
                    sunFlareState[index].sunQuery[query] = 0;
                } while (alwaysfails);
}

// PINNED 10012db0: reload the current window index after Win32 calls.
void R_ShutdownHardware()
{
    R_ReleaseForShutdownOrReset();
    while (dx.windowCount)
    {
        --dx.windowCount;
        if (IsWindow(dx.windows[dx.windowCount].hwnd))
            DestroyWindow(dx.windows[dx.windowCount].hwnd);
        dx.windows[dx.windowCount].hwnd = 0;
    }
    if (dx.device)
        do
        {
            dx.device->Release();
            dx.device = 0;
        } while (alwaysfails);
    if (dx.d3d9)
        do
        {
            dx.d3d9->Release();
            dx.d3d9 = 0;
        } while (alwaysfails);
}

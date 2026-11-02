// Renderer initialization: device, capabilities, monitor, window and display modes.
#include "r_local.h"
#include <dxerr9.h>
#include <float.h>
#include <stdlib.h>
#include <stddef.h>
#include <algorithm>
#include "gfx.h"
#include "r_material_globals.h"

// Fatal initialization errors.
void R_FatalInitError(const char *msg)
{
	ri.Printf(0, "********** DirectX returned an unrecoverable error code during initialization  **********\n");
	ri.Printf(0, "********** Initialization also happens while playing if DirectX loses a device **********\n");
	ri.Printf(0, "********** Consult the readme for how to continue from this problem            **********\n");
	ri.Printf(0, "\n%s\n", msg);
	ri.Sys_DirectXFatalError();
}

// Direct3D buffer creation.
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
    for (int index = 0; index != 2; ++index)
        R_CreateDynamicVertexBuffer(&dx.skinnedCacheVbPool[index],
            (r_rendererInUse->current.integer == 2 ? 36 : 64) * 131072);
    R_CreateDynamicIndexBuffer(&dx.dynamicIndexBufferPool[0], 2097152);
    dx.dynamicIndexBuffer = &dx.dynamicIndexBufferPool[0];
    dx.tempSkinBuf = (byte *)ri.Z_VirtualReserveInternal(10485760);
}

void R_FinishStaticIndexBuffer(IDirect3DIndexBuffer9 *ib);
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

// PINNED 10011e60: release pools before freeing the reserved skin arena.
void R_ReleaseDynamicBuffers()
{
    if (dx.dynamicIndexBufferPool[0].buffer)
        do
        {
            dx.dynamicIndexBufferPool[0].buffer->Release();
            dx.dynamicIndexBufferPool[0].buffer = 0;
        } while (alwaysfails);
    if (dx.dynamicVertexBufferPool[0].buffer)
        do
        {
            dx.dynamicVertexBufferPool[0].buffer->Release();
            dx.dynamicVertexBufferPool[0].buffer = 0;
        } while (alwaysfails);
    for (int index = 0; index != 2; ++index)
        if (dx.skinnedCacheVbPool[index].buffer)
            do
            {
                dx.skinnedCacheVbPool[index].buffer->Release();
                dx.skinnedCacheVbPool[index].buffer = 0;
            } while (alwaysfails);
    if (dx.tempSkinBuf)
    {
        ri.Z_VirtualFreeInternal(dx.tempSkinBuf);
        dx.tempSkinBuf = 0;
        dx.tempSkinPos = 0;
    }
}

// Direct3D presentation setup and device creation.
extern const dvar_t *r_swapInterval;

void R_InitImages();
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

// PINNED 100113e0; both retail upload paths also inline it.
void R_FatalBufferLockError(HRESULT result)
{
    ri.Printf(0, "********** DirectX failed a call to lock a vertex buffer or an index buffer **********\n");
    ri.Printf(0, "********** error information:  %s\n", DXGetErrorDescription9(result));
    ri.Sys_DirectXFatalError();
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
    ri.Dvar_SetModified(r_gamma);
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

// Role name; PINNED 10013690: construct reset parameters before releasing resources.
void R_FatalInitError(const char *message);

void R_ResetDevice()
{
    GfxWindowParms parms;
    parms.hwnd = dx.windows[0].hwnd;
    parms.hz = vidConfig.displayFrequency;
    parms.fullscreen = vidConfig.isFullscreen != 0;
    parms.x = 0;
    parms.y = 0;
    parms.width = dx.windows[0].width;
    parms.height = dx.windows[0].height;
    parms.aaSamples = r_aaSamples->current.integer;
    D3DPRESENT_PARAMETERS present;
    R_SetD3DPresentParameters(&present, &parms);
    R_ReleaseForShutdownOrReset();
    HRESULT result = dx.device->Reset(&present);
    _controlfp(0x20000, 0x30000);
    _controlfp(0x8001f, 0x8001f);
    if (result < 0)
        R_FatalInitError(va("Couldn't reset a lost Direct3D device - IDirect3DDevice9::Reset returned 0x%08x (%s)",
            result, DXGetErrorDescription9(result)));
    dx.deviceLost = 0;
    if (!R_CreateDeviceResources())
        R_FatalInitError("Couldn't reinitialize after a lost Direct3D device");
}

void R_ReleaseAllModels();
void R_ReleaseLostImages();
void Material_ReleaseVertexDecls();
void Material_ReleaseShaders();
void R_ReleaseWorld();
void R_ReloadWorld();
void Material_ReloadAll();
void Material_ReloadShaders();
void R_ReloadLostImages();
void R_FinishLoadingModels();
int RB_CalcSunSpriteSamples();

// PINNED 100137f0: only DEVICELOST postpones recovery; other results continue.
Bool R_RecoverLostDevice()
{
    if (dx.device->TestCooperativeLevel() == D3DERR_DEVICELOST)
        return 0;
    ri.Printf(0, "Recovering lost device...\n");
    R_ReleaseAllModels();
    R_ReleaseLostImages();
    Material_ReleaseVertexDecls();
    Material_ReleaseShaders();
    if (rgp.world)
        R_ReleaseWorld();
    R_ResetDevice();
    if (rgp.world)
        R_ReloadWorld();
    Material_ReloadAll();
    Material_ReloadShaders();
    R_ReloadLostImages();
    R_FinishLoadingModels();
    dx.sunSpriteSamples = RB_CalcSunSpriteSamples();
    ri.Printf(0, "Finished recovering lost device.\n");
    return 1;
}

// PINNED PC 1.0 capability query, renderer selection, and capability storage.
// Names follow the renderer vocabulary; original TU grouping is unconfirmed.
void R_FatalInitError(const char *msg);

void R_GetDeviceCaps(UINT adapter, D3DCAPS9 *caps)
{
    HRESULT hr;
    int attempt;
    attempt = 0;
    do
    {
        hr = dx.d3d9->GetDeviceCaps(adapter, D3DDEVTYPE_HAL, caps);
        if (hr >= 0)
            return;
        Sleep(100);
        ++attempt;
    } while (attempt != 20);
    R_FatalInitError(va("GetDeviceCaps failed: %s", DXGetErrorDescription9(hr)));
}

static const char *R_RendererName(int renderer)
{
    return renderer == 1 ? "Direct3D 9" : "Direct3D 7";
}

void R_ChooseRenderer(const D3DCAPS9 *caps)
{
    int allowedPaths;
    int selected;
    int renderer;

    ri.Printf(0, "Pixel shader version is %i.%i\n",
        ((const byte *)&caps->PixelShaderVersion)[1], ((const byte *)&caps->PixelShaderVersion)[0]);
    ri.Printf(0, "Vertex shader version is %i.%i\n",
        ((const byte *)&caps->VertexShaderVersion)[1], ((const byte *)&caps->VertexShaderVersion)[0]);
    allowedPaths = R_CheckDxCaps(caps);
    selected = 0;
    for (renderer = 2; renderer; --renderer)
    {
        if (allowedPaths & (1 << renderer))
        {
            selected = renderer;
            ri.Printf(0, "%s code path is available.\n", R_RendererName(renderer));
        }
    }
    if (!selected)
        ri.Error(ERR_FATAL, "No valid rendering code path detected.\n");
    if (r_rendererPreference->current.integer)
    {
        if (allowedPaths & (1 << r_rendererPreference->current.integer))
        {
            selected = r_rendererPreference->current.integer;
            ri.Printf(0, "Using %s code path because r_rendererPreference is set to %s.\n",
                R_RendererName(selected), ri.Dvar_EnumToString((dvar_t *)r_rendererPreference));
        }
        else
            ri.Printf(0, "Using %s code path because the requested %s code path is unavailable.\n",
                R_RendererName(selected), R_RendererName(r_rendererPreference->current.integer));
    }
    else
        ri.Printf(0, "Using %s code path because it is the best available path on this hardware.\n",
            R_RendererName(selected));
    ri.Dvar_SetInt(r_rendererInUse, selected);
}

// Name unconfirmed; retail 100118d0 is also inlined in capability storage.
static bool R_CheckTransparencyMsaa(UINT adapter)
{
    if (r_aaSamples->current.integer == 1)
        return false;
    return dx.d3d9->CheckDeviceFormat(adapter, D3DDEVTYPE_HAL, D3DFMT_A8R8G8B8,
        0, D3DRTYPE_SURFACE, (D3DFORMAT)MAKEFOURCC('S', 'S', 'A', 'A')) == 0;
}

void R_StoreDirect3DCaps(UINT adapter)
{
    D3DCAPS9 caps;

    R_GetDeviceCaps(adapter, &caps);
    R_ChooseRenderer(&caps);
    if ((int)(caps.MaxTextureHeight - caps.MaxTextureWidth) >= 0)
        vidConfig.maxTextureSize = caps.MaxTextureWidth;
    else
        vidConfig.maxTextureSize = caps.MaxTextureHeight;
    vidConfig.maxTextureMaps = caps.MaxSimultaneousTextures;
    vidConfig.maxTextureCoords = caps.MaxTextureBlendStages;
    vidConfig.maxActiveLights = caps.MaxActiveLights;
    vidConfig.deviceSupportsGamma = (caps.Caps2 >> 17) & 1;
    dx.maxClipPlanes = 6;
    if ((int)(caps.MaxUserClipPlanes - 6) < 0)
        dx.maxClipPlanes = caps.MaxUserClipPlanes;
    dx.maxAnisotropy = caps.MaxAnisotropy;
    dx.stencilTwoSided = (caps.StencilCaps >> 8) & 1;
    dx.stencilWrap = (caps.StencilCaps & 0xc0) == 0xc0;
    dx.slopeScaleDepthBias = (caps.RasterCaps >> 25) & 1;
    dx.canMipCubemaps = (caps.TextureCaps >> 16) & 1;
    dx.hasBlendOp = (caps.PrimitiveMiscCaps >> 11) & 1;
    dx.hasSeparateAlphaBlend = (caps.PrimitiveMiscCaps >> 17) & 1;
    dx.hasTransparencyMsaa = R_CheckTransparencyMsaa(adapter);
}

// Monitor selection.
struct GfxEnumMonitors
{
    int monitorIndex;
    HMONITOR foundMonitor;
};

static BOOL CALLBACK R_MonitorEnumCallback(HMONITOR monitorHandle, HDC hdc, LPRECT rect, LPARAM userData)
{
    GfxEnumMonitors *enumData = (GfxEnumMonitors *)userData;

    if (--enumData->monitorIndex == 0)
    {
        enumData->foundMonitor = monitorHandle;
        return 0;
    }
    return 1;
}

HMONITOR R_ChooseMonitor()
{
    POINT pt;
    GfxEnumMonitors enumData;

    if (r_fullscreen->current.enabled)
    {
        enumData.monitorIndex = r_monitor->current.integer;
        enumData.foundMonitor = 0;
        EnumDisplayMonitors(0, 0, R_MonitorEnumCallback, (LPARAM)&enumData);
        if (enumData.foundMonitor)
            return enumData.foundMonitor;
    }
    pt.x = vid_xpos->current.integer;
    pt.y = vid_ypos->current.integer;
    return MonitorFromPoint(pt, 1);
}

// name unconfirmed: adapter index driving the chosen monitor
unsigned int R_ChooseAdapter()
{
    HMONITOR monitor;
    unsigned int adapterCount;
    unsigned int adapterIndex;
    unsigned int found;

    monitor = R_ChooseMonitor();
    found = 0;
    adapterCount = dx.d3d9->GetAdapterCount();
    for (adapterIndex = 0; adapterIndex < adapterCount; adapterIndex++)
    {
        if (monitor && dx.d3d9->GetAdapterMonitor(adapterIndex) == monitor)
            found = adapterIndex;
    }
    return found;
}

// PINNED 10011560/132: monitor failures fall back to positive desktop dimensions, then the mode.
void R_GetMonitorDimensions(int *width, int *height)
{
    if (vidConfig.isFullscreen)
    {
        MONITORINFO info;
        HMONITOR monitor = dx.d3d9->GetAdapterMonitor(dx.adapterIndex);
        info.cbSize = sizeof(info);
        if (GetMonitorInfoA(monitor, &info))
        {
            *width = info.rcMonitor.right - info.rcMonitor.left;
            *height = info.rcMonitor.bottom - info.rcMonitor.top;
            return;
        }
        *width = GetSystemMetrics(0);
        *height = GetSystemMetrics(1);
        if (*width > 0 && *height > 0)
            return;
    }
    *width = vidConfig.width;
    *height = vidConfig.height;
}

// Game window creation.
// PINNED 100129c0/248: rectangle-adjust failure does not skip window creation.
Bool R_CreateGameWindow(GfxWindowParms *parms)
{
    DWORD extendedStyle;
    DWORD style;
    if (parms->fullscreen)
    {
        ri.Printf(0, "Attempting %i x %i fullscreen with 32 bpp at %i hz\n",
            parms->width, parms->height, parms->hz);
        extendedStyle = WS_EX_TOPMOST;
        style = WS_POPUP;
    }
    else
    {
        ri.Printf(0, "Attempting %i x %i window at (%i, %i)\n",
            parms->width, parms->height, parms->x, parms->y);
        extendedStyle = 0;
        style = WS_CAPTION | WS_SYSMENU;
    }
    RECT rect;
    rect.left = 0;
    rect.right = parms->width;
    rect.top = 0;
    rect.bottom = parms->height;
    AdjustWindowRectEx(&rect, style, FALSE, extendedStyle);
    HINSTANCE instance = GetModuleHandleA(0);
    parms->hwnd = CreateWindowExA(extendedStyle, "CoD2", "Call of Duty 2 Multiplayer",
        style, parms->x, parms->y, rect.right - rect.left, rect.bottom - rect.top,
        0, 0, instance, 0);
    if (!parms->hwnd)
    {
        ri.Printf(0, "Couldn't create a window.\n");
        return 0;
    }
    ri.Printf(0, "Game window successfully created.\n");
    return 1;
}

// PINNED 10012b00/131: prefer the preceding rate only for the same resolution.
int R_ChooseRefreshRate(int width, int height, int hz)
{
    int low = 0;
    int high = dx.displayModeCount - 1;
    while (low <= high)
    {
        int middle = (high + low) / 2;
        int difference = (int)dx.displayModes[middle].Width - width;
        if (!difference)
            difference = (int)dx.displayModes[middle].Height - height;
        if (!difference)
            difference = (int)dx.displayModes[middle].RefreshRate - hz;
        if (!difference)
            return hz;
        if (difference < 0)
            low = middle + 1;
        else
            high = middle - 1;
    }
    if (dx.displayModes[high].Width == (UINT)width &&
        dx.displayModes[high].Height == (UINT)height)
        return dx.displayModes[high].RefreshRate;
    return dx.displayModes[low].RefreshRate;
}

// PINNED 10012b90/133: the PC startup path forces fullscreen and preserves tileCount.
void R_SetupWindowParms(GfxWindowParms *parms)
{
    int hz;
    sscanf(ri.Dvar_EnumToString((dvar_t *)r_mode), "%ix%i", &parms->width, &parms->height);
    sscanf(ri.Dvar_EnumToString((dvar_t *)r_displayRefresh), "%i Hz", &hz);
    parms->hz = R_ChooseRefreshRate(parms->width, parms->height, hz);
    parms->x = vid_xpos->current.integer;
    parms->y = vid_ypos->current.integer;
    parms->hwnd = 0;
    parms->fullscreen = 1;
    parms->aaSamples = r_aaSamples->current.integer;
}

// Renderer initialization.
refimport_t ri;
r_globals_t rg;
r_global_permanent_t rgp;
DxGlobals dx;
vidConfig_t vidConfig;

extern const dvar_t *r_aspectRatio;
void R_GetMonitorDimensions(int *width, int *height);

// PINNED 100115f0: reuse the existing rounding helper; its assembly is not C++ credit.
void R_StoreWindowSettings(const GfxWindowParms *parms)
{
    vidConfig.width = parms->width;
    vidConfig.height = parms->height;
    vidConfig.displayFrequency = parms->hz;
    vidConfig.isFullscreen = parms->fullscreen;
    switch (r_aspectRatio->current.integer)
    {
    case 0:
    {
        int width, height;
        R_GetMonitorDimensions(&width, &height);
        float ratio = (float)height * 16.0f / width;
        int rounded = I_fround(ratio);
        if (rounded < 10)
            vidConfig.aspectRatioWindow = 16.0f / 9.0f;
        else if (rounded == 10)
            vidConfig.aspectRatioWindow = 16.0f / 10.0f;
        else
            vidConfig.aspectRatioWindow = 4.0f / 3.0f;
        break;
    }
    case 1:
        vidConfig.aspectRatioWindow = 4.0f / 3.0f;
        break;
    case 2:
        vidConfig.aspectRatioWindow = 16.0f / 10.0f;
        break;
    case 3:
        vidConfig.aspectRatioWindow = 16.0f / 9.0f;
        break;
    }
    vidConfig.aspectRatioPixel = (float)vidConfig.height * vidConfig.aspectRatioWindow / vidConfig.width;
}

// r_material.cpp keeps its own Material view and cannot see r_globals_t; inlined there.
Material **R_GetMaterialHashTable()
{
    return rg.materialHashTable;
}

void R_AddCmdTouchAllImages();

void R_EndRegistration()
{
    R_AddCmdTouchAllImages();
}

int R_EndDrawGroupLoop(int group, int view);
void R_EndDrawGroupSection(int group);

void R_EndView(int viewIndex)
{
    R_EndDrawGroupLoop(4, viewIndex);
    R_EndDrawGroupSection(4);
}

void R_IssueDrawGroups();

void R_DoneRenderingViews()
{
    R_IssueDrawGroups();
}

void R_TrackStatistics(trStatistics_t *stats)
{
    rg.stats = stats;
}

extern "C" __declspec(dllimport) int __stdcall GetSystemMetrics(int nIndex);

// PINNED PC 1.0 sizes: rg 0x31a0, rgp 0x10f0
typedef char rgSizeCheck[(sizeof(r_globals_t) == 0x31a0 && sizeof(r_global_permanent_t) == 0x10f0) ? 1 : -1];

void RB_InitBackendGlobalStructs();
void RB_DecideDefaultSamplerState();

// KisakCOD name; Mac 1.3 inlines these steps into R_Init
void R_InitGlobalStructs()
{
    memset(&rg, 0, sizeof(rg));
    memset(&rgp, 0, sizeof(rgp));
    RB_InitBackendGlobalStructs();
    RB_DecideDefaultSamplerState();
}

// name unconfirmed: Mac 1.3 inlines this into R_Init
void R_InitSinTable()
{
    int i;
    float angle;

    for (i = 0; i < 1024; i++)
    {
        angle = i * 0.3515625f;
        rg.sinTable[i] = (float)sin(angle * 0.017453292f);
    }
}

// name unconfirmed: builds the one-model DObj used for model scene entities (Mac inlines it into R_BeginRegistration)
void R_InitModelDObj()
{
    DObjModel_s model;

    model.model = 0;
    model.boneName = 0;
    model.ignoreCollision = 0;
    ri.DObjCreate(&model, 1, 0, rg.modelDObjBuf, 0);
    rg.modelDObj = (DObj_s *)rg.modelDObjBuf;
}

extern const dvar_t *r_gamma;

#pragma intrinsic(pow)
// PINNED 10011f10: the existing I_fround expansion is accounted as assembly.
static __declspec(noinline) void R_BuildGammaTable(GfxGammaRamp *gammaTable)
{
    float inverseGamma = 1.0f / r_gamma->current.value;
    int index = 0;
    int remaining = 256;
    unsigned short *entry = gammaTable->entries;
    do
    {
        int value;
        if (inverseGamma == 1.0f)
            value = index + (index << 8);
        else
            value = I_fround((float)(pow(index * (1.0f / 255.0f), inverseGamma) * 65535.0f));
        ++index;
        *entry++ = (unsigned short)value;
    } while (--remaining);
}
#pragma function(pow)

void RB_SetGammaRamp(const GfxGammaRamp *gammaTable);

// PINNED 10011fb0: the other real caller of the shared one-channel builder.
void R_SetColorMappings()
{
    GfxGammaRamp gammaTable;
    if (vidConfig.deviceSupportsGamma)
    {
        R_BuildGammaTable(&gammaTable);
        RB_SetGammaRamp(&gammaTable);
    }
}

// PINNED 10011fe0: signed integer division after widening the ushort entry.
void R_GammaCorrect(int bufferSize, byte *buffer)
{
    GfxGammaRamp gammaTable;
    R_BuildGammaTable(&gammaTable);
    for (int index = 0; index < bufferSize; ++index)
        buffer[index] = (byte)(gammaTable.entries[buffer[index]] * 255 / 65535);
}

GfxImage *Image_Register(const char *name, int imageTrack, int semantic);
GfxImage *Image_AllocProg(int imageProgType, int category);
void R_SetPicmip();
void RB_SetSampler(int samplerIndex, unsigned char samplerState, GfxImage *image);
extern DxState dxState;

typedef char imageStartupLayoutCheck[
    offsetof(r_global_permanent_t, whiteImage) == 0x1008 &&
    offsetof(r_global_permanent_t, rawImage) == 0x1098 &&
    offsetof(r_global_permanent_t, waterColorImage) == 0x10a4 &&
    offsetof(r_global_permanent_t, rawTexdef) == 0x10e4 &&
    offsetof(MaterialTextureDef, samplerState) == 4 &&
    offsetof(MaterialTextureDef, semantic) == 5 &&
    offsetof(MaterialTextureDef, u) == 8 &&
    offsetof(DxState, samplerState) == 0x20e4 ? 1 : -1];

void Material_Init();
GfxLightDef *R_RegisterLightDef(const char *name);
extern DebugGlobals debugGlobals;

typedef char rendererSystemsLayoutCheck[(sizeof(GfxFog) == 32 &&
    offsetof(r_globals_t, sceneWaterMapSetupsCount) == 0x1028 &&
    offsetof(r_globals_t, fogSettings) == 0x146c &&
    offsetof(r_globals_t, fogIndex) == 0x150c && sizeof(DebugGlobals) == 84 &&
    offsetof(DebugGlobals, vertLimit) == 8 && offsetof(DebugGlobals, polyLimit) == 20 &&
    offsetof(DebugGlobals, stringLimit) == 32 && offsetof(DebugGlobals, lineLimit) == 56 &&
    offsetof(DebugGlobals, plumeLimit) == 80) ? 1 : -1];

// PINNED 10012040/116: reset the normal debug globals, not the frame's debug block.
void R_InitSystems()
{
    R_InitImages();
    Material_Init();
    rg.sceneWaterMapSetupsCount = 0;
    rgp.dlightDef = R_RegisterLightDef("light_dynamic");
    memset(rg.fogSettings, 0, sizeof(rg.fogSettings));
    memset(&debugGlobals, 0, sizeof(debugGlobals));
    rg.fogIndex = 0;
    debugGlobals.vertLimit = 4096;
    debugGlobals.polyLimit = 512;
    debugGlobals.stringLimit = 4096;
    debugGlobals.lineLimit = 16384;
    debugGlobals.plumeLimit = 4096;
    rg.registered = 1;
}

void R_RegisterCmds();

void Swap_Init();
void R_RegisterDvars();
void R_InitRenderCmds();
void R_InitDrawGroups();
void R_InitHardware();
Font_s *R_RegisterFont(const char *name, int imageTrack);
void FFT_Init(int *bitswap, complex_s *trigTable);
int RB_CalcSunSpriteSamples();
extern r_backEndGlobals_t backEnd;
extern DxGlobals dx;
typedef char rendererInitLayoutCheck[(offsetof(r_globals_t, fftTrigTable) == 0x2510
    && offsetof(r_globals_t, fftBitswap) == 0x2d10
    && offsetof(r_backEndGlobals_t, debugFont) == 0x36b58
    && offsetof(DxGlobals, sunSpriteSamples) == 0x2c2c) ? 1 : -1];

// PINNED 10012f80: preserve the retail startup and publication order.
void R_Init()
{
    ri.Printf(0, "----- R_Init -----\n");
    Swap_Init();
    R_RegisterDvars();
    R_RegisterCmds();
    R_InitGlobalStructs();
    R_InitRenderCmds();
    R_InitDrawGroups();
    R_InitHardware();
    backEnd.debugFont = R_RegisterFont("fonts/smalldevfont", 1);
    R_InitSinTable();
    FFT_Init(rg.fftBitswap, rg.fftTrigTable);
    R_InitModelDObj();
    dx.sunSpriteSamples = RB_CalcSunSpriteSamples();
}

typedef char rendererRegistrationLayoutCheck[(sizeof(vidConfig_t) == 44) ? 1 : -1];

// PINNED 10013190: initialize on every call before publishing all eleven words.
void R_BeginRegistration(vidConfig_t *config)
{
    R_Init();
    *config = vidConfig;
}

void R_UnregisterCmds();

void RB_ClearAllStreamSources();
void R_ShutdownBackendData();
void R_ShutdownLightDefs();
void R_ShutdownFonts();
void R_ShutdownImages();
void R_ShutdownHardware();
void R_FlushStaticModelCache();
void R_ShutdownDebug();
void RB_SaveLightVisHistory();
void R_ShutdownWorld();
void R_ReleaseAllModels();
void Material_Shutdown();
void R_UnlockSkinnedCache();
typedef char rendererShutdownLayoutCheck[(sizeof(MaterialGlobals) == 0x299c
    && offsetof(refimport_t, Dvar_UnregisterSystem) == 0x88
    && offsetof(refimport_t, Cmd_RemoveCommand) == 0x108) ? 1 : -1];

// PINNED 10013080: logical shutdown always runs; hardware teardown is optional.
void R_Shutdown(int destroyWindow)
{
    rg.registered = 0;
    if (dx.device && !dx.deviceLost)
        RB_ClearAllStreamSources();
    R_ShutdownBackendData();
    R_ShutdownDebug();
    RB_SaveLightVisHistory();
    R_ShutdownLightDefs();
    R_ShutdownWorld();
    R_ShutdownFonts();
    R_ReleaseAllModels();
    Material_Shutdown();
    memset(&materialGlobals, 0, sizeof(materialGlobals));
    memset(rg.materialHashTable, 0, sizeof(rg.materialHashTable));
    rgp.materialCount = 0;
    R_ShutdownImages();
    rgp.world = 0;
    R_UnlockSkinnedCache();
    R_FlushStaticModelCache();
    if (destroyWindow)
    {
        R_ShutdownHardware();
        ri.Dvar_UnregisterSystem(0x2000);
    }
    R_UnregisterCmds();
}

// PINNED PC 1.0 10012320/10012360/100123a0/100123d0/10012820.
// Names describe the operations; historical TU boundaries are unconfirmed.
const dvar_t *r_mode;
const dvar_t *r_displayRefresh;

void R_FatalInitError(const char *message);
void R_StoreDirect3DCaps(UINT adapter);
unsigned int R_ChooseAdapter();

struct GfxResolution { int width; int height; };

static bool R_DisplayModeLess(const D3DDISPLAYMODE &a, const D3DDISPLAYMODE &b)
{
    if (a.Width > b.Width)
        return false;
    if (a.Width < b.Width)
        return true;
    if (a.Height > b.Height)
        return false;
    if (a.Height < b.Height)
        return true;
    return a.RefreshRate < b.RefreshRate;
}

static int R_AddRefreshRate(int count, int *rates, int rate)
{
    int index;
    for (index = 0; index < count; ++index)
        if (rates[index] == rate)
            return count;
    for (index = count; index > 0 && rates[index - 1] > rate; --index)
        rates[index] = rates[index - 1];
    rates[index] = rate;
    return count + 1;
}

static int R_AddResolution(int count, GfxResolution *resolutions, int width, int height)
{
    if (count > 0 && resolutions[count - 1].width == width && resolutions[count - 1].height == height)
        return count;
    if (width >= 640 && height >= 480)
    {
        resolutions[count].width = width;
        resolutions[count].height = height;
        ++count;
    }
    return count;
}

void R_EnumerateDisplayModes(UINT adapter)
{
    int refreshRates[256];
    GfxResolution resolutions[256];
    unsigned int modeCount;
    unsigned int index;
    int resolutionCount;
    int refreshCount = 0;
    int defaultIndex;
    int i;
    char *text;

    modeCount = dx.d3d9->GetAdapterModeCount(adapter, D3DFMT_X8R8G8B8);
    dx.displayModeCount = 0;
    for (index = 0; index < modeCount; ++index)
    {
        if ((unsigned int)dx.displayModeCount >= 256)
            break;
        if (dx.d3d9->EnumAdapterModes(adapter, D3DFMT_X8R8G8B8, index,
            &dx.displayModes[dx.displayModeCount]) >= 0)
        {
            if (!dx.displayModes[dx.displayModeCount].RefreshRate)
                dx.displayModes[dx.displayModeCount].RefreshRate = 60;
            ++dx.displayModeCount;
        }
    }
    std::sort(dx.displayModes, dx.displayModes + dx.displayModeCount, R_DisplayModeLess);
    resolutionCount = 0;
    for (index = 0; index < (unsigned int)dx.displayModeCount; ++index)
    {
        resolutionCount = R_AddResolution(resolutionCount, resolutions,
            dx.displayModes[index].Width, dx.displayModes[index].Height);
        refreshCount = R_AddRefreshRate(refreshCount, refreshRates, dx.displayModes[index].RefreshRate);
    }
    text = dx.modeText;
    if (!resolutionCount)
        R_FatalInitError(va("No valid resolutions of %i x %i or above found", 640, 480));
    defaultIndex = 0;
    for (i = 0; i < resolutionCount; ++i)
    {
        dx.resolutionNameTable[i] = text;
        text += sprintf(text, "%ix%i", resolutions[i].width, resolutions[i].height) + 1;
        if (resolutions[defaultIndex].width < 640 || resolutions[defaultIndex].height < 480)
            defaultIndex = i;
    }
    dx.resolutionNameTable[i] = 0;
    r_mode = ri.Dvar_RegisterEnum("r_mode", dx.resolutionNameTable, defaultIndex, 0x2021);
    defaultIndex = 0;
    for (i = 0; i < refreshCount; ++i)
    {
        dx.refreshRateNameTable[i] = text;
        text += sprintf(text, "%i Hz", refreshRates[i]) + 1;
        if (refreshRates[defaultIndex] < 60)
            defaultIndex = i;
    }
    dx.refreshRateNameTable[i] = 0;
    r_displayRefresh = ri.Dvar_RegisterEnum("r_displayRefresh", dx.refreshRateNameTable, defaultIndex, 0x2021);
}

bool R_CreateDirect3D()
{
    UINT adapter;
    if (!dx.d3d9)
    {
        ri.Printf(0, "Getting Direct3D 9 interface...\n");
        dx.d3d9 = Direct3DCreate9(D3D_SDK_VERSION);
        if (!dx.d3d9)
        {
            ri.Printf(0, "Direct3D 9 failed to initialize\n");
            return false;
        }
    }
    adapter = R_ChooseAdapter();
    dx.adapterIndex = adapter;
    R_StoreDirect3DCaps(adapter);
    R_EnumerateDisplayModes(dx.adapterIndex);
    return true;
}

void R_SyncRenderThread();

void R_Error(errorParm_t code, const char *fmt, ...)
{
    char text[1024];
    va_list ap;

    if (ri.Sys_IsMainThread())
        R_SyncRenderThread();
    if (dx.inScene)
    {
        dx.device->EndScene();
        dx.inScene = 0;
    }
    va_start(ap, fmt);
    _vsnprintf(text, sizeof(text) - 1, fmt, ap);
    va_end(ap);
    text[sizeof(text) - 1] = 0;
    ri.Error(code, "%s", text);
}

// PINNED 10013270: copy imports and clear all108 exports before version validation.
#include "r_refapi.h"

static RendererExports59 re;

extern "C" RendererExports59 *GetRefAPI(int apiVersion, const refimport_t *imports)
{
    memcpy(&ri, imports, sizeof(ri));
    memset(&re, 0, sizeof(re));
    if (apiVersion != 59)
    {
        ri.Printf(0, "Mismatched REF_API_VERSION: expected %i, got %i\n", 59, apiVersion);
        return 0;
    }
    re.R_Shutdown = R_Shutdown;
    re.R_BeginRegistration = R_BeginRegistration;
    re.R_RegisterModel = R_RegisterModel;
    re.R_RegisterInlineModel = R_RegisterInlineModel;
    re.R_GetMinSpecImageMemory = R_GetMinSpecImageMemory;
    re.R_RegisterMaterial = R_RegisterMaterial;
    re.R_RegisterRawImage = R_RegisterRawImage;
    re.Material_IsDefault = Material_IsDefault;
    re.R_LoadWorld = R_LoadWorld;
    re.R_GetWorldBounds = R_GetWorldBounds;
    re.R_FinishLoadingModels = R_FinishLoadingModels;
    re.R_SetIgnorePrecacheErrors = R_SetIgnorePrecacheErrors;
    re.R_GetIgnorePrecacheErrors = R_GetIgnorePrecacheErrors;
    re.R_EndRegistration = R_EndRegistration;
    re.R_GetMaterialName = R_GetMaterialName;
    re.R_GetMaterialSubimageCount = R_GetMaterialSubimageCount;
    re.R_IsMaterialRefractive = R_IsMaterialRefractive;
    re.R_GetFarPlaneDist = R_GetFarPlaneDist;
    re.R_BeginFrame = R_BeginFrame;
    re.R_EndFrame = R_EndFrame;
    re.R_BeginDebugFrame = R_BeginDebugFrame;
    re.R_EndDebugFrame = R_EndDebugFrame;
    re.R_EndView = R_EndView;
    re.R_DoneRenderingViews = R_DoneRenderingViews;
    re.R_AddCmdSaveScreen = R_AddCmdSaveScreen;
    re.R_AddCmdBlendSavedScreen = R_AddCmdBlendSavedScreen;
    re.R_AddCmdClearScreen = R_AddCmdClearScreen;
    re.R_AddCmdSetViewport = R_AddCmdSetViewport;
    re.R_MarkFragments = R_MarkFragments;
    re.R_ModelBounds = R_ModelBounds;
    re.R_ClearScene = R_ClearScene;
    re.R_SkinGfxEntityCmd = R_SkinGfxEntityCmd;
    re.R_AddRefEntityToScene = R_AddRefEntityToScene;
    re.R_UpdateGfxEntityBoundsCmd = R_UpdateGfxEntityBoundsCmd;
    re.R_UpdateEffectsBolt = R_UpdateEffectsBolt;
    re.R_UpdateEffectsNonBolt = R_UpdateEffectsNonBolt;
    re.R_ResetEntries = R_ResetEntries;
    re.R_AddPolyToScene = R_AddPolyToScene;
    re.R_AddLightToScene = R_AddLightToScene;
    re.R_InterpretSunLightParseParams = R_InterpretSunLightParseParams;
    re.R_ResetSunLightParseParams = R_ResetSunLightParseParams;
    re.R_SetCullDist = R_SetCullDist;
    re.R_SetFog = R_SetFog;
    re.R_SwitchFog = R_SwitchFog;
    re.R_ArchiveFogState = R_ArchiveFogState;
    re.R_ClearFogs = R_ClearFogs;
    re.R_SetSunLightOverride = R_SetSunLightOverride;
    re.R_ResetSunLightOverride = R_ResetSunLightOverride;
    re.R_RenderScene = R_RenderScene;
    re.R_BeginDelayedDrawing = R_BeginDelayedDrawing;
    re.R_EndDelayedDrawing = R_EndDelayedDrawing;
    re.R_IssueDelayedDrawing = R_IssueDelayedDrawing;
    re.R_ClearFlares = R_ClearFlares;
    re.R_AddCmdDrawStretchPic = R_AddCmdDrawStretchPic;
    re.R_AddCmdDrawStretchPicRotate = R_AddCmdDrawStretchPicRotate;
    re.R_AddCmdDrawStretchRaw = R_AddCmdDrawStretchRaw;
    re.R_AddCmdDrawQuadPic = R_AddCmdDrawQuadPic;
    re.R_AddCmdDrawSprite = R_AddCmdDrawSprite;
    re.R_AddCmdSetMaterialColor = R_AddCmdSetMaterialColor;
    re.R_RegisterFont = R_RegisterFont;
    re.R_ResetImageAllocations = R_ResetImageAllocations;
    re.R_FreeImageAllocations = R_FreeImageAllocations;
    re.R_BeginCubemapShot = R_BeginCubemapShot;
    re.R_EndCubemapShot = R_EndCubemapShot;
    re.R_SaveCubemapShot = R_SaveCubemapShot;
    re.R_LightingFromCubemapShots = R_LightingFromCubemapShots;
    re.R_LocateDebugStrings = R_LocateDebugStrings;
    re.R_LocateDebugLines = R_LocateDebugLines;
    re.R_AddPlume = R_AddPlume;
    re.R_ShutdownDebug = R_ShutdownDebug;
    re.R_TrackStatistics = R_TrackStatistics;
    re.R_PickMaterial = R_PickMaterial;
    re.RB_UpdateColor = RB_UpdateColor;
    re.R_NormalizedTextScale = R_NormalizedTextScale;
    re.R_TextWidth = R_TextWidth;
    re.R_TextHeight = R_TextHeight;
    re.R_AddCmdDrawText = R_AddCmdDrawText;
    re.R_AddCmdDrawTextInSpace = R_AddCmdDrawTextInSpace;
    re.R_ConsoleTextWidth = R_ConsoleTextWidth;
    re.R_DrawConsoleText = R_DrawConsoleText;
    re.R_AddCmdDrawTextWithCursor = R_AddCmdDrawTextWithCursor;
    re.R_DObjGetSurfMaterials = R_DObjGetSurfMaterials;
    re.R_DObjReplaceMaterial = R_DObjReplaceMaterial;
    re.R_ParseSunLight = R_ParseSunLight;
    re.Material_Duplicate = Material_Duplicate;
    re.R_DuplicateFont = R_DuplicateFont;
    re.XModelReadSurface = XModelReadSurface;
    re.R_LoadXModelSkins = R_LoadXModelSkins;
    re.XSurfaceGetVerts = XSurfaceGetVerts;
    re.XSurfaceGetTris = XSurfaceGetTris;
    re.XSurfaceGetNumTris = XSurfaceGetNumTris;
    re.XSurfaceGetNumVerts = XSurfaceGetNumVerts;
    re.R_SyncRenderThread = R_SyncRenderThread;
    re.R_AbortRenderCommands = R_AbortRenderCommands;
    re.RB_IsGpuFenceFinished = RB_IsGpuFenceFinished;
    re.RB_AdaptiveGpuSyncWait = RB_AdaptiveGpuSyncWait;
    re.RB_GpuWaited = RB_GpuWaited;
    re.R_SetLodOrigin = R_SetLodOrigin;
    return &re;
}

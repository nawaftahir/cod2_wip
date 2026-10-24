// PC shadow-cookie render targets. Helper names describe binary-pinned behavior.
#include "r_local.h"
#include <dxerr9.h>
#include "universal/com_math.h"

GfxImage *Image_AllocProg(int imageProgType, int category);
void Image_Create2DTexture(GfxImage *, int, int, int, DWORD, D3DFORMAT, D3DPOOL);
void Image_TrackTexture(GfxImage *, int, D3DFORMAT, int, int, int);
void Image_SetupRenderTarget(GfxImage *, int, int, D3DFORMAT);
void Image_SetupSystem(GfxImage *, int, int, D3DFORMAT);
IDirect3DSurface9 *Image_GetSurface(GfxImage *);
void Com_Error(errorParm_t code, const char *fmt, ...);
void R_GetFrameBufferExtent(int *width, int *height);
void Image_TrackFullscreenTexture(GfxImage *, int, D3DFORMAT);
char *va(const char *format, ...);
extern const dvar_t *r_zFeather;

void Image_Release(GfxImage *image);

// PINNED 10023560: the cached depth surface is an alias, not another release.
void R_ShutdownRenderTargets()
{
    for (int index = 0; index < 13; ++index)
    {
        GfxRenderTarget *target = &dx.renderTargets[index];
        if (target->colorSurface)
            target->colorSurface->Release();
        if (target->depthStencilSurface)
            target->depthStencilSurface->Release();
        if (target->image)
            Image_Release(target->image);
    }
    memset(dx.renderTargets, 0, sizeof(dx.renderTargets));
    dx.singleSampleDepthStencilSurface = 0;
}

// PINNED 0x10022710: the PC switch includes R5G6B5 and D16_LOCKABLE, not D32.
static const char *R_DescribeFormat(D3DFORMAT format)
{
    switch (format)
    {
    case D3DFMT_A8R8G8B8:
    case D3DFMT_A8B8G8R8:
        return "24-bit color with 8-bit alpha";
    case D3DFMT_R5G6B5:
        return "16-bit color";
    case D3DFMT_A1R5G5B5:
        return "15-bit color with 1-bit alpha";
    case D3DFMT_D24S8:
        return "24-bit depth with 8-bit stencil";
    case D3DFMT_D15S1:
        return "15-bit depth with 1-bit stencil";
    case D3DFMT_D16_LOCKABLE:
    case D3DFMT_D16:
        return "16-bit depth without stencil";
    case D3DFMT_D24X8:
        return "24-bit depth without stencil";
    default:
        return va("unknown format 0x%08x", format);
    }
}

// PINNED 0x10022940/261: PC logs GetBackBuffer and has no texture-ID toggle.
void R_InitFrameBuffer(GfxRenderTarget *renderTarget)
{
    renderTarget->width = vidConfig.width;
    renderTarget->height = vidConfig.height;
    HRESULT hr = dx.device->GetSwapChain(0, &dx.windows[0].swapChain);
    if (FAILED(hr))
        Com_Error(ERR_FATAL, "Couldn't get an interface to the swap chain: %s\n",
            DXGetErrorDescription9(hr));
    R_DX_CALL(dx.device->GetBackBuffer( 0, 0, D3DBACKBUFFER_TYPE_MONO, &renderTarget->colorSurface ));
    int width, height;
    R_GetFrameBufferExtent(&width, &height);
    hr = dx.device->CreateDepthStencilSurface(width, height, D3DFMT_D24S8,
        dx.multiSampleType, dx.multiSampleQuality, FALSE, &renderTarget->depthStencilSurface, NULL);
    if (FAILED(hr))
        Com_Error(ERR_FATAL, "Couldn't create a %i x %i depth-stencil surface: %s\n",
            width, height, DXGetErrorDescription9(hr));
}

// PINNED 0x10022830: cache/reuse a single-sample depth surface.
IDirect3DSurface9 *R_GetOrCreateDepthStencil()
{
    if (!dx.singleSampleDepthStencilSurface && !dx.multiSampleType)
        dx.singleSampleDepthStencilSurface = dx.renderTargets[R_RENDERTARGET_FRAME_BUFFER].depthStencilSurface;
    if (dx.singleSampleDepthStencilSurface)
    {
        dx.singleSampleDepthStencilSurface->AddRef();
        return dx.singleSampleDepthStencilSurface;
    }
    int width, height;
    R_GetFrameBufferExtent(&width, &height);
    HRESULT hr = dx.device->CreateDepthStencilSurface(width, height, D3DFMT_D24S8,
        D3DMULTISAMPLE_NONE, 0, FALSE, &dx.singleSampleDepthStencilSurface, NULL);
    if (FAILED(hr))
        Com_Error(ERR_FATAL, "Couldn't create a %i x %i depth-stencil surface: %s\n",
            width, height, DXGetErrorDescription9(hr));
    return dx.singleSampleDepthStencilSurface;
}

// PINNED 0x100228d0: reuse the cookie depth surface, otherwise create without caching it.
static IDirect3DSurface9 *R_CreateSmallDepthStencil()
{
    if (dx.renderTargets[R_RENDERTARGET_SHADOWCOOKIE].depthStencilSurface)
    {
        dx.renderTargets[R_RENDERTARGET_SHADOWCOOKIE].depthStencilSurface->AddRef();
        return dx.renderTargets[R_RENDERTARGET_SHADOWCOOKIE].depthStencilSurface;
    }
    IDirect3DSurface9 *surface;
    HRESULT hr = dx.device->CreateDepthStencilSurface(128, 128, D3DFMT_D24S8,
        D3DMULTISAMPLE_NONE, 0, FALSE, &surface, NULL);
    if (FAILED(hr))
        Com_Error(ERR_FATAL, "Couldn't create a %i x %i depth-stencil surface: %s\n",
            128, 128, DXGetErrorDescription9(hr));
    return surface;
}

enum RenderTargetUsage {
    RENDERTARGET_USAGE_RENDER = 0,
    RENDERTARGET_USAGE_TEXTURE = 1,
    RENDERTARGET_USAGE_READBACK = 2
};

// PINNED 10022a60/150: usage2 selects a dynamic system-memory texture.
static __forceinline void R_InitRenderTargetImage(int imageProgId, int width, int height,
    D3DFORMAT format, RenderTargetUsage usage, GfxRenderTarget *renderTarget)
{
    renderTarget->image = Image_AllocProg(imageProgId, 6);
    if (usage == RENDERTARGET_USAGE_READBACK)
        Image_SetupSystem(renderTarget->image, width, height, format);
    else
        Image_SetupRenderTarget(renderTarget->image, width, height, format);
    renderTarget->colorSurface = Image_GetSurface(renderTarget->image);
    renderTarget->width = (unsigned short)width;
    renderTarget->height = (unsigned short)height;
}

static __forceinline void R_InitCookieRenderTarget(int imageProgId, GfxRenderTarget *renderTarget)
{
    R_InitRenderTargetImage(imageProgId, 128, 128, D3DFMT_A8R8G8B8,
        RENDERTARGET_USAGE_RENDER, renderTarget);
    Image_TrackTexture(renderTarget->image, 3, D3DFMT_A8R8G8B8, 128, 128, 1);
    renderTarget->depthStencilSurface = R_CreateSmallDepthStencil();
}

// PINNED 0x10022b90 and 0x10022c30; names are descriptive, not historical proof.
void R_InitShadowCookieRenderTarget(GfxRenderTarget *renderTarget)
{
    R_InitCookieRenderTarget(1, renderTarget);
}

void R_InitShadowCookieBlurRenderTarget(GfxRenderTarget *renderTarget)
{
    R_InitCookieRenderTarget(2, renderTarget);
}

// PINNED in 0x10022d20: all PC fullscreen images use DEFAULT-pool render textures.
// Retail expands all ten call sites; this keyword is not historical provenance.
static __forceinline void R_InitFullscreenRenderTargetImage(int imageProgId, int picmip,
    D3DFORMAT format, RenderTargetUsage usage, GfxRenderTarget *renderTarget)
{
    int width = 1 > (vidConfig.width >> picmip) ? 1 : (vidConfig.width >> picmip);
    int height = 1 > (vidConfig.height >> picmip) ? 1 : (vidConfig.height >> picmip);
    R_InitRenderTargetImage(imageProgId, width, height, format, usage, renderTarget);
    if (usage == RENDERTARGET_USAGE_RENDER)
        renderTarget->depthStencilSurface = R_GetOrCreateDepthStencil();
    Image_TrackFullscreenTexture(renderTarget->image, picmip, format);
}

// PINNED 0x10022d20/2102: no Mac sharing or CoD4 minimal-resource branches.
void R_InitRenderTargets()
{
    R_InitFrameBuffer(&dx.renderTargets[R_RENDERTARGET_FRAME_BUFFER]);
    ri.Printf(0, "Requested frame buffer to be %s\n", R_DescribeFormat(D3DFMT_A8R8G8B8));
    D3DSURFACE_DESC desc;
    dx.renderTargets[R_RENDERTARGET_FRAME_BUFFER].colorSurface->GetDesc(&desc);
    dx.backBufferFormat = desc.Format;
    ri.Printf(0, "DirectX returned a frame buffer that is %s\n", R_DescribeFormat(desc.Format));
    if (r_rendererInUse->current.integer != 2 && r_zFeather->current.enabled)
        R_InitFullscreenRenderTargetImage(3, 0, D3DFMT_R32F, RENDERTARGET_USAGE_RENDER,
            &dx.renderTargets[R_RENDERTARGET_FLOAT_Z]);
    R_InitFullscreenRenderTargetImage(0, 0, dx.backBufferFormat, RENDERTARGET_USAGE_RENDER,
        &dx.renderTargets[R_RENDERTARGET_DYNAMICSHADOWS]);
    R_InitFullscreenRenderTargetImage(9, 0, dx.backBufferFormat, RENDERTARGET_USAGE_TEXTURE,
        &dx.renderTargets[R_RENDERTARGET_RESOLVED_POST_SUN]);
    R_InitFullscreenRenderTargetImage(10, 0, dx.backBufferFormat, RENDERTARGET_USAGE_TEXTURE,
        &dx.renderTargets[R_RENDERTARGET_RESOLVED_SCENE]);
    R_InitFullscreenRenderTargetImage(11, 0, dx.backBufferFormat, RENDERTARGET_USAGE_TEXTURE,
        &dx.renderTargets[R_RENDERTARGET_SAVED_SCREEN]);
    R_InitShadowCookieRenderTarget(&dx.renderTargets[R_RENDERTARGET_SHADOWCOOKIE]);
    R_InitShadowCookieBlurRenderTarget(&dx.renderTargets[R_RENDERTARGET_SHADOWCOOKIE_BLUR]);
    R_InitFullscreenRenderTargetImage(4, 2, dx.backBufferFormat, RENDERTARGET_USAGE_RENDER,
        &dx.renderTargets[R_RENDERTARGET_BLURRED_SCREEN]);
    R_InitFullscreenRenderTargetImage(5, 2, dx.backBufferFormat, RENDERTARGET_USAGE_RENDER,
        &dx.renderTargets[R_RENDERTARGET_GLOW_0]);
    R_InitFullscreenRenderTargetImage(6, 2, dx.backBufferFormat, RENDERTARGET_USAGE_RENDER,
        &dx.renderTargets[R_RENDERTARGET_GLOW_1]);
    R_InitFullscreenRenderTargetImage(7, 2, dx.backBufferFormat, RENDERTARGET_USAGE_RENDER,
        &dx.renderTargets[R_RENDERTARGET_PINGPONG_0]);
    R_InitFullscreenRenderTargetImage(8, 2, dx.backBufferFormat, RENDERTARGET_USAGE_RENDER,
        &dx.renderTargets[R_RENDERTARGET_PINGPONG_1]);
}

extern "C" __declspec(dllimport) int __stdcall GetSystemMetrics(int nIndex);

// name unconfirmed: virtual-desktop extent, never smaller than the primary screen
static void R_GetDesktopExtent(int *width, int *height)
{
    int virtualWidth;
    int virtualHeight;
    int screenWidth;
    int screenHeight;

    virtualWidth = GetSystemMetrics(78);
    virtualHeight = GetSystemMetrics(79);
    screenWidth = GetSystemMetrics(0);
    screenHeight = GetSystemMetrics(1);
    *width = I_max(virtualWidth, screenWidth);
    *height = I_max(virtualHeight, screenHeight);
}

// name unconfirmed: fullscreen uses the mode size, windowed the desktop extent
void R_GetFrameBufferExtent(int *width, int *height)
{
    if (vidConfig.isFullscreen)
    {
        int modeWidth = vidConfig.width;
        int modeHeight = vidConfig.height;
        *width = modeWidth;
        *height = modeHeight;
        return;
    }
    R_GetDesktopExtent(width, height);
}

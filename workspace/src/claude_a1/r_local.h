// Renderer-private declarations for TUs that use the real Direct3D 9 interfaces.
#pragma once

#include <d3d9.h>
#include "ri.h"

typedef unsigned char Bool;

struct GfxImage;

// opencod2 cod2_defs.h; 20 bytes is consistent with dx.device 0x101d1bf8 / dx.inScene 0x101d492d.
struct GfxRenderTarget
{
    GfxImage *image;
    IDirect3DSurface9 *colorSurface;
    IDirect3DSurface9 *depthStencilSurface;
    int width;
    int height;
};

// opencod2 cod2_defs.h
struct GfxWindowTarget
{
    HWND hwnd;
    IDirect3DSwapChain9 *swapChain;
    int width;
    int height;
};

// Mac 1.3 layout; PINNED on PC 1.0 through hasTransparencyMsaa (maxAnisotropy 0x2d70 .. 0x2d7e, R_StoreDirect3DCaps).
struct DxGlobals
{
    HINSTANCE hinst;
    IDirect3D9 *d3d9;
    IDirect3DDevice9 *device;
    UINT adapterIndex;
    D3DFORMAT backBufferFormat;
    int displayModeCount;
    D3DDISPLAYMODE displayModes[256];
    const char *resolutionNameTable[257];
    const char *refreshRateNameTable[257];
    char modeText[5120];
    int gpuSync;
    D3DMULTISAMPLE_TYPE multiSampleType;
    DWORD multiSampleQuality;
    int sunSpriteSamples;
    GfxRenderTarget renderTargets[13];
    IDirect3DSurface9 *singleSampleDepthStencilSurface;
    unsigned short cubemapShotRes;
    unsigned short cubemapShotPixelBorder;
    Bool deviceLost;
    Bool inScene;
    unsigned short feedbackWidth;
    unsigned short feedbackHeight;
    int targetWindowIndex;
    int windowCount;
    GfxWindowTarget windows[1];
    IDirect3DQuery9 *flushGpuQuery;
    int gpuSyncDelay;
    int gpuSyncAlreadyWaited;
    Bool flushGpuQueryIssued;
    int anisotropy;
    int maxAnisotropy;
    int maxClipPlanes;
    Bool stencilTwoSided;
    Bool stencilWrap;
    Bool slopeScaleDepthBias;
    Bool canMipCubemaps;
    Bool hasBlendOp;
    Bool hasSeparateAlphaBlend;
    Bool hasTransparencyMsaa;
};

extern DxGlobals dx;

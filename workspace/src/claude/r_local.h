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

// Fields after inScene are not reconstructed yet (opencod2 PC gfx_types.h has the Mac list).
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
};

extern DxGlobals dx;

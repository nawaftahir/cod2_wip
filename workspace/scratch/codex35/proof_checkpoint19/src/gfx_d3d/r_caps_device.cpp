// PINNED PC 1.0 capability query, renderer selection, and capability storage.
// Names follow the renderer vocabulary; original TU grouping is unconfirmed.
#include "r_local.h"
#include <dxerr9.h>
#include "universal/com_math.h"

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

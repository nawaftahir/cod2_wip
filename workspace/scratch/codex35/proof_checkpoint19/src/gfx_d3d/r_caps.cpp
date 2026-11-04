// Direct3D capability checks.
#include "r_local.h"
#include <stddef.h>

enum DxCapsResponse
{
    DX_CAPS_RESPONSE_QUIT,
    DX_CAPS_RESPONSE_WARN,
    DX_CAPS_RESPONSE_INFO,
    DX_CAPS_RESPONSE_FORBID_DX7,
    DX_CAPS_RESPONSE_FORBID_DX9,
};

struct DxCapsCheckBits
{
    int offset;
    unsigned int setBits;
    unsigned int clearBits;
    DxCapsResponse response;
    const char *msg;
};

struct DxCapsCheckInteger
{
    int offset;
    unsigned int min;
    unsigned int max;
    DxCapsResponse response;
    const char *msg;
};

static const DxCapsCheckBits s_capsCheckBits[] =
{
{ offsetof(D3DCAPS9, Caps2), 0, D3DCAPS2_DYNAMICTEXTURES, DX_CAPS_RESPONSE_QUIT, "doesn't support dynamic textures" },
    { offsetof(D3DCAPS9, Caps2), 0, D3DCAPS2_FULLSCREENGAMMA, DX_CAPS_RESPONSE_WARN, "doesn't support fullscreen gamma" },
    { offsetof(D3DCAPS9, Caps3), 0, D3DCAPS3_ALPHA_FULLSCREEN_FLIP_OR_DISCARD, DX_CAPS_RESPONSE_QUIT, "doesn't support alpha blending" },
    { offsetof(D3DCAPS9, Caps3), 0, D3DCAPS3_COPY_TO_VIDMEM, DX_CAPS_RESPONSE_WARN, "doesn't accelerate dynamic textures" },
    { offsetof(D3DCAPS9, PresentationIntervals), 0, D3DPRESENT_INTERVAL_IMMEDIATE, DX_CAPS_RESPONSE_WARN, "doesn't support immediate frame buffer swapping" },
    { offsetof(D3DCAPS9, PresentationIntervals), 0, D3DPRESENT_INTERVAL_ONE, DX_CAPS_RESPONSE_WARN, "doesn't support vertical sync" },
    { offsetof(D3DCAPS9, DevCaps), 0, D3DDEVCAPS_DRAWPRIMITIVES2EX, DX_CAPS_RESPONSE_QUIT, "is not at least DirectX 7 compliant" },
    { offsetof(D3DCAPS9, DevCaps), 0, D3DDEVCAPS_DRAWPRIMTLVERTEX | D3DDEVCAPS_HWTRANSFORMANDLIGHT, DX_CAPS_RESPONSE_WARN, "doesn't accelerate transform and lighting" },
    { offsetof(D3DCAPS9, DevCaps), 0, D3DDEVCAPS_HWRASTERIZATION, DX_CAPS_RESPONSE_WARN, "doesn't accelerate rasterization" },
    { offsetof(D3DCAPS9, PrimitiveMiscCaps), 0, D3DPMISCCAPS_MASKZ, DX_CAPS_RESPONSE_QUIT, "can't disable depth buffer writes" },
    { offsetof(D3DCAPS9, PrimitiveMiscCaps), 0, D3DPMISCCAPS_COLORWRITEENABLE, DX_CAPS_RESPONSE_QUIT, "can't disable individual color channel writes" },
    { offsetof(D3DCAPS9, PrimitiveMiscCaps), 0, D3DPMISCCAPS_BLENDOP, DX_CAPS_RESPONSE_INFO, "doesn't support frame buffer blending ops beside add" },
    { offsetof(D3DCAPS9, PrimitiveMiscCaps), 0, D3DPMISCCAPS_SEPARATEALPHABLEND, DX_CAPS_RESPONSE_INFO, "doesn't support separate alpha blend, glow will be disabled" },
    { offsetof(D3DCAPS9, PrimitiveMiscCaps), 0, D3DPMISCCAPS_CULLNONE | D3DPMISCCAPS_CULLCW | D3DPMISCCAPS_CULLCCW, DX_CAPS_RESPONSE_QUIT, "doesn't support all face culling modes" },
    { offsetof(D3DCAPS9, RasterCaps), 0, D3DPRASTERCAPS_SLOPESCALEDEPTHBIAS, DX_CAPS_RESPONSE_INFO, "doesn't support high-quality polygon offset" },
    { offsetof(D3DCAPS9, RasterCaps), 0, D3DPRASTERCAPS_FOGVERTEX, DX_CAPS_RESPONSE_FORBID_DX7, "doesn't support fog" },
    { offsetof(D3DCAPS9, ZCmpCaps), 0, D3DPCMPCAPS_NEVER | D3DPCMPCAPS_EQUAL | D3DPCMPCAPS_LESSEQUAL | D3DPCMPCAPS_ALWAYS, DX_CAPS_RESPONSE_QUIT, "doesn't support the required depth comparison modes" },
    { offsetof(D3DCAPS9, SrcBlendCaps), 0, D3DPBLENDCAPS_ZERO | D3DPBLENDCAPS_ONE | D3DPBLENDCAPS_SRCCOLOR | D3DPBLENDCAPS_INVSRCCOLOR | D3DPBLENDCAPS_SRCALPHA | D3DPBLENDCAPS_INVSRCALPHA | D3DPBLENDCAPS_DESTALPHA | D3DPBLENDCAPS_INVDESTALPHA | D3DPBLENDCAPS_DESTCOLOR | D3DPBLENDCAPS_INVDESTCOLOR, DX_CAPS_RESPONSE_QUIT, "doesn't support the required frame buffer source blend modes" },
    { offsetof(D3DCAPS9, DestBlendCaps), 0, D3DPBLENDCAPS_ZERO | D3DPBLENDCAPS_ONE | D3DPBLENDCAPS_SRCCOLOR | D3DPBLENDCAPS_INVSRCCOLOR | D3DPBLENDCAPS_SRCALPHA | D3DPBLENDCAPS_INVSRCALPHA | D3DPBLENDCAPS_DESTALPHA | D3DPBLENDCAPS_INVDESTALPHA | D3DPBLENDCAPS_DESTCOLOR | D3DPBLENDCAPS_INVDESTCOLOR, DX_CAPS_RESPONSE_QUIT, "doesn't support the required frame buffer destination blend modes" },
    { offsetof(D3DCAPS9, AlphaCmpCaps), 0, D3DPCMPCAPS_LESS | D3DPCMPCAPS_GREATER | D3DPCMPCAPS_GREATEREQUAL | D3DPCMPCAPS_ALWAYS, DX_CAPS_RESPONSE_QUIT, "doesn't support the required alpha comparison modes" },
    { offsetof(D3DCAPS9, TextureCaps), 0, D3DPTEXTURECAPS_ALPHA, DX_CAPS_RESPONSE_QUIT, "doesn't support alpha in textures" },
    { offsetof(D3DCAPS9, TextureCaps), 0, D3DPTEXTURECAPS_CUBEMAP, DX_CAPS_RESPONSE_QUIT, "doesn't support cubemap textures" },
    { offsetof(D3DCAPS9, TextureCaps), 0, D3DPTEXTURECAPS_MIPMAP, DX_CAPS_RESPONSE_QUIT, "doesn't support mipmapped textures" },
    { offsetof(D3DCAPS9, TextureCaps), D3DPTEXTURECAPS_POW2, D3DPTEXTURECAPS_NONPOW2CONDITIONAL, DX_CAPS_RESPONSE_QUIT, "doesn't support restricted use of non-power-of-2 textures" },
    { offsetof(D3DCAPS9, TextureCaps), 0, D3DPTEXTURECAPS_PERSPECTIVE, DX_CAPS_RESPONSE_WARN, "doesn't support perspective correct texturing" },
    { offsetof(D3DCAPS9, TextureCaps), D3DPTEXTURECAPS_SQUAREONLY, 0, DX_CAPS_RESPONSE_QUIT, "doesn't support non-square textures" },
    { offsetof(D3DCAPS9, TextureFilterCaps), 0, D3DPTFILTERCAPS_MINFPOINT | D3DPTFILTERCAPS_MINFLINEAR | D3DPTFILTERCAPS_MIPFPOINT | D3DPTFILTERCAPS_MIPFLINEAR | D3DPTFILTERCAPS_MAGFPOINT | D3DPTFILTERCAPS_MAGFLINEAR, DX_CAPS_RESPONSE_QUIT, "doesn't support the required texture filtering modes" },
    { offsetof(D3DCAPS9, CubeTextureFilterCaps), 0, D3DPTFILTERCAPS_MINFPOINT | D3DPTFILTERCAPS_MINFLINEAR | D3DPTFILTERCAPS_MAGFPOINT | D3DPTFILTERCAPS_MAGFLINEAR, DX_CAPS_RESPONSE_QUIT, "doesn't support the required cubemap texture filtering modes" },
    { offsetof(D3DCAPS9, TextureAddressCaps), 0, D3DPTADDRESSCAPS_CLAMP, DX_CAPS_RESPONSE_QUIT, "doesn't support texture clamping" },
    { offsetof(D3DCAPS9, TextureAddressCaps), 0, D3DPTADDRESSCAPS_WRAP, DX_CAPS_RESPONSE_QUIT, "doesn't support texture wrapping" },
    { offsetof(D3DCAPS9, StencilCaps), 0, D3DSTENCILCAPS_KEEP | D3DSTENCILCAPS_ZERO | D3DSTENCILCAPS_REPLACE | D3DSTENCILCAPS_INCRSAT | D3DSTENCILCAPS_DECRSAT | D3DSTENCILCAPS_INVERT | D3DSTENCILCAPS_INCR | D3DSTENCILCAPS_DECR, DX_CAPS_RESPONSE_FORBID_DX9, "doesn't support the required stencil operations" },
    { offsetof(D3DCAPS9, TextureOpCaps), 0, D3DTEXOPCAPS_DISABLE | D3DTEXOPCAPS_SELECTARG1 | D3DTEXOPCAPS_SELECTARG2 | D3DTEXOPCAPS_MODULATE | D3DTEXOPCAPS_MODULATE2X | D3DTEXOPCAPS_MODULATE4X | D3DTEXOPCAPS_ADD | D3DTEXOPCAPS_ADDSIGNED | D3DTEXOPCAPS_ADDSIGNED2X | D3DTEXOPCAPS_SUBTRACT | D3DTEXOPCAPS_ADDSMOOTH | D3DTEXOPCAPS_BLENDDIFFUSEALPHA | D3DTEXOPCAPS_BLENDTEXTUREALPHA | D3DTEXOPCAPS_BLENDFACTORALPHA | D3DTEXOPCAPS_BLENDTEXTUREALPHAPM | D3DTEXOPCAPS_BLENDCURRENTALPHA | D3DTEXOPCAPS_MODULATEALPHA_ADDCOLOR | D3DTEXOPCAPS_MODULATECOLOR_ADDALPHA | D3DTEXOPCAPS_MODULATEINVALPHA_ADDCOLOR | D3DTEXOPCAPS_MODULATEINVCOLOR_ADDALPHA | D3DTEXOPCAPS_DOTPRODUCT3 | D3DTEXOPCAPS_MULTIPLYADD | D3DTEXOPCAPS_LERP, DX_CAPS_RESPONSE_FORBID_DX7, "doesn't support the required fixed-function texture blend operations" },
    { offsetof(D3DCAPS9, VertexProcessingCaps), 0, D3DVTXPCAPS_DIRECTIONALLIGHTS, DX_CAPS_RESPONSE_FORBID_DX7, "doesn't support direction lights in the fixed-function pipeline" },
    { offsetof(D3DCAPS9, VertexProcessingCaps), 0, D3DVTXPCAPS_TEXGEN, DX_CAPS_RESPONSE_FORBID_DX7, "doesn't support texture coordinate generation in the fixed-function pipeline" },
    { offsetof(D3DCAPS9, DevCaps2), 0, D3DDEVCAPS2_STREAMOFFSET, DX_CAPS_RESPONSE_QUIT, "doesn't support vertex stream offsets" },
    { offsetof(D3DCAPS9, StretchRectFilterCaps), 0, D3DPTFILTERCAPS_MINFLINEAR, DX_CAPS_RESPONSE_WARN, "doesn't support linear filtering when copying and shrinking the frame buffer" },
};

static const DxCapsCheckInteger s_capsCheckInt[] =
{
    { offsetof(D3DCAPS9, MaxTextureBlendStages), 4, 0xFFFFFFFF, DX_CAPS_RESPONSE_QUIT, "doesn't support enough texture stages / coordinates" },
    { offsetof(D3DCAPS9, MaxTextureBlendStages), 8, 0xFFFFFFFF, DX_CAPS_RESPONSE_FORBID_DX9, "doesn't support enough texture coordinates for the DirectX 9 code path" },
    { offsetof(D3DCAPS9, MaxSimultaneousTextures), 2, 0xFFFFFFFF, DX_CAPS_RESPONSE_QUIT, "doesn't support multitexture" },
    { offsetof(D3DCAPS9, MaxSimultaneousTextures), 8, 0xFFFFFFFF, DX_CAPS_RESPONSE_FORBID_DX9, "doesn't support enough textures for the DirectX 9 code path" },
    { offsetof(D3DCAPS9, MaxActiveLights), 3, 0xFFFFFFFF, DX_CAPS_RESPONSE_FORBID_DX7, "doesn't support enough hardware lights for the DirectX 7 code path" },
    { offsetof(D3DCAPS9, MaxStreams), 1, 0xFFFFFFFF, DX_CAPS_RESPONSE_QUIT, "is not a DirectX 9 driver" },
    { offsetof(D3DCAPS9, VertexShaderVersion), 0x200, 0xFFFFFFFF, DX_CAPS_RESPONSE_FORBID_DX9, "doesn't support vertex shader 2.0 or better" },
    { offsetof(D3DCAPS9, PixelShaderVersion), 0x200, 0xFFFFFFFF, DX_CAPS_RESPONSE_FORBID_DX9, "doesn't support pixel shader 2.0 or better" },
};

static void R_RespondToMissingCaps(DxCapsResponse response, const char *msg, int *allowedPaths)
{
    int printLevel;

    if (response == DX_CAPS_RESPONSE_WARN || response == DX_CAPS_RESPONSE_FORBID_DX7)
        printLevel = 2;
    else
        printLevel = 0;
    ri.Printf(printLevel, "Video card or driver %s.\n", msg);
    switch (response)
    {
    case DX_CAPS_RESPONSE_QUIT:
        R_Error(ERR_FATAL, "Video card or driver %s.\n", msg);
        break;
    case DX_CAPS_RESPONSE_FORBID_DX7:
        *allowedPaths &= ~(1 << 2);
        ri.Printf(printLevel, "  DirectX 7 rendering path will not be available.\n");
        break;
    case DX_CAPS_RESPONSE_FORBID_DX9:
        *allowedPaths &= ~(1 << 1);
        ri.Printf(printLevel, "  DirectX 9 rendering path will not be available.\n");
        break;
    }
}

int R_CheckDxCaps(const D3DCAPS9 *caps)
{
    int allowedPaths;
    unsigned int checkIndex;
    unsigned int bits;
    unsigned int value;

    allowedPaths = (1 << 1) | (1 << 2);
    for (checkIndex = 0; checkIndex < sizeof(s_capsCheckBits) / sizeof(s_capsCheckBits[0]); checkIndex++)
    {
        bits = *(const unsigned int *)((const char *)caps + s_capsCheckBits[checkIndex].offset);
        if ((!s_capsCheckBits[checkIndex].clearBits || (s_capsCheckBits[checkIndex].clearBits & ~bits))
            && (!s_capsCheckBits[checkIndex].setBits || (s_capsCheckBits[checkIndex].setBits & bits)))
        {
            R_RespondToMissingCaps(s_capsCheckBits[checkIndex].response, s_capsCheckBits[checkIndex].msg, &allowedPaths);
        }
    }
    for (checkIndex = 0; checkIndex < sizeof(s_capsCheckInt) / sizeof(s_capsCheckInt[0]); checkIndex++)
    {
        value = *(const unsigned int *)((const char *)caps + s_capsCheckInt[checkIndex].offset);
        if (value < s_capsCheckInt[checkIndex].min || value > s_capsCheckInt[checkIndex].max)
            R_RespondToMissingCaps(s_capsCheckInt[checkIndex].response, s_capsCheckInt[checkIndex].msg, &allowedPaths);
    }
    return allowedPaths;
}

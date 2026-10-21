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
struct r_ib_state_t
{
    int used;
    int total;
    IDirect3DIndexBuffer9 *buffer;
};

struct r_vb_state_t
{
    int used;
    int total;
    IDirect3DVertexBuffer9 *buffer;
};

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
    r_ib_state_t dynamicIndexBufferPool[1];
    r_ib_state_t *dynamicIndexBuffer;
    r_vb_state_t skinnedCacheVbPool[2];
    r_vb_state_t dynamicVertexBufferPool[1];
    r_vb_state_t *dynamicVertexBuffer;
    IDirect3DVertexBuffer9 *particleCloudVertexBuffer;
    IDirect3DIndexBuffer9 *particleCloudIndexBuffer;
    byte *skinnedCacheLockAddr;
    IDirect3DVertexBuffer9 *smodelCacheVb;
    void *smodelCacheIndices;
    int dynamicBufferFrame;
    byte *tempSkinBuf;
    int tempSkinPos;
};

extern DxGlobals dx;

#include <stdio.h>
#include <string.h>

// opencod2 layout; only current (+8) is relied on.
union DvarValue
{
    Bool enabled;
    int integer;
    float value;
    float *vector;
    const char *string;
    unsigned char color[4];
};

union DvarLimits
{
    struct { int stringCount; const char **strings; } enumeration;
    struct { int min; int max; } integer;
    struct { float min; float max; } value;
    struct { float min; float max; } vector;
};

struct dvar_s
{
    const char *name;
    unsigned short flags;
    unsigned char type;
    Bool modified;
    DvarValue current;
    DvarValue latched;
    DvarValue reset;
    DvarLimits domain;
    dvar_s *next;
    dvar_s *hashNext;
};

// opencod2 layout; PINNED maxTextureSize..deviceSupportsGamma (vidConfig 0x101d4c6c, R_StoreDirect3DCaps).
struct vidConfig_t
{
    int width;
    int height;
    int displayFrequency;
    int isFullscreen;
    float aspectRatioWindow;
    float aspectRatioPixel;
    int maxTextureSize;
    int maxTextureMaps;
    int maxTextureCoords;
    int maxActiveLights;
    Bool deviceSupportsGamma;
};

extern vidConfig_t vidConfig;

extern const dvar_t *r_aaSamples;
extern const dvar_t *vid_xpos;
extern const dvar_t *vid_ypos;
extern const dvar_t *r_fullscreen;
extern const dvar_t *r_monitor;
extern const dvar_t *r_rendererPreference;
extern const dvar_t *r_rendererInUse;
extern const dvar_t *r_mode;
extern const dvar_t *r_displayRefresh;
extern const dvar_t *r_anisotropy;
extern const dvar_t *r_aaAlpha;

void R_Error(errorParm_t code, const char *fmt, ...);
char *va(const char *format, ...);

int R_CheckDxCaps(const D3DCAPS9 *caps);

struct r_logfile_globals_t
{
    FILE *fp;
};

extern const dvar_t *r_logFile;
extern r_logfile_globals_t r_logFileGlob;
extern int alwaysfails;

bool RB_IsLogging();
void RB_UpdateLogging();
void RB_LogPrint(const char *text);
void RB_LogPrintState_0(int stateBits0, int changedBits0);
void RB_LogPrintState_1(int stateBits1, int changedBits1);

// Mac 1.3 layout; PINNED on PC 1.0: sizeof 0x24, semantic +0xa, track +0xc, width +0x18,
// height +0x1a, depth +0x1c, category +0x1e, name +0x20 (Image_Alloc 0x1000cc10, Image_Create2DTexture 0x1000ce80).
union GfxTexture
{
    IDirect3DBaseTexture9 *basemap;
    IDirect3DTexture9 *map;
    IDirect3DVolumeTexture9 *volmap;
    IDirect3DCubeTexture9 *cubemap;
};

struct Picmip
{
    unsigned char platform[2];
};

struct CardMemory
{
    int platform[2];
};

struct GfxImage
{
    int mapType;
    GfxTexture texture;
    Picmip picmip;
    unsigned char semantic;
    Bool noPicmip;
    unsigned char track;
    CardMemory cardMemory;
    unsigned short width;
    unsigned short height;
    unsigned short depth;
    unsigned char category;
    const char *name;
};

// Stringized after expansion, so the log shows D3D macros expanded.
#define R_DX_STRING(call) #call
#define R_DX_CALL(call)                                         \
	do                                                          \
	{                                                           \
		RB_LogPrint(R_DX_STRING(call) "\n");                    \
		call;                                                   \
	} while (alwaysfails)

// opencod2 common_types.h
enum GfxRenderTargetId
{
	R_RENDERTARGET_FRAME_BUFFER = 0,
	R_RENDERTARGET_RESOLVED_POST_SUN = 1,
	R_RENDERTARGET_RESOLVED_SCENE = 2,
	R_RENDERTARGET_DYNAMICSHADOWS = 3,
	R_RENDERTARGET_SHADOWCOOKIE = 4,
	R_RENDERTARGET_SHADOWCOOKIE_BLUR = 5,
	R_RENDERTARGET_FLOAT_Z = 6,
	R_RENDERTARGET_SAVED_SCREEN = 7,
	R_RENDERTARGET_BLURRED_SCREEN = 8,
	R_RENDERTARGET_GLOW_0 = 9,
	R_RENDERTARGET_GLOW_1 = 10,
	R_RENDERTARGET_PINGPONG_0 = 11,
	R_RENDERTARGET_PINGPONG_1 = 12,
	R_RENDERTARGET_COUNT = 13,
	R_RENDERTARGET_NONE = 14
};

enum GfxViewportBehavior
{
	GFX_USE_VIEWPORT_FOR_VIEW = 0,
	GFX_USE_VIEWPORT_FULL = 1
};

// Mac 1.3 layout; PINNED on PC 1.0 at 0x10764680 (pixelShaderConsts +0x1000, refStateBits +0x2000,
// genTexCoords +0x2095, renderTargetId +0x2098, viewport +0x20b0, pixelShader +0x2138).
// Enumerators, not macros: retail D3D logs print these names unexpanded.
enum
{
	DXS0_BLENDOP_RGB_SHIFT = 8,
	DXS0_ATEST_DISABLE = 0x800,
	DXS0_CULL_SHIFT = 14,
	DXS0_CULL_MASK = 0xc000,
	DXS0_BLENDOP_ALPHA_SHIFT = 24,
	DXS0_FOG = 0x20000000,
	DXS0_RENORMALIZE = 0x40000000,
	DXS0_POLYMODE_LINE = 0x80000000,
	DXS_BLENDOP_MASK = 7
};

struct DxState
{
	float vertexShaderConsts[256][4];
	float pixelShaderConsts[256][4];
	int refStateBits[2];
	int activeStateBits[2];
	int stencilRefValue;
	int refColorStageBits[8];
	int refAlphaStageBits[8];
	int activeColorStageBits[8];
	int activeAlphaStageBits[8];
	Bool gridLighting;
	unsigned char genTexCoords[2];
	GfxRenderTargetId renderTargetId;
	int renderTargetWidth;
	int renderTargetHeight;
	GfxViewportBehavior viewportBehavior;
	IDirect3DSurface9 *renderTargetSurface;
	IDirect3DSurface9 *depthStencilSurface;
	D3DVIEWPORT9 viewport;
	Bool viewportIsNull;
	IDirect3DIndexBuffer9 *indexBuffer;
	struct
	{
		IDirect3DVertexBuffer9 *vb;
		int offset;
		int stride;
	} streams[1];
	IDirect3DIndexBuffer9 *volatile indexBufferDeselecting;
	IDirect3DVertexBuffer9 *volatile vertexBufferDeselecting;
	unsigned char samplerState[16];
	const GfxImage *samplerImage[16];
	DWORD textureColorArg;
	IDirect3DPixelShader9 *pixelShader;
	IDirect3DVertexShader9 *vertexShader;
	IDirect3DVertexDeclaration9 *vertexDecl;
	DWORD fvf;
	unsigned char alphaRef;
	D3DCOLOR textureFactor;
	D3DCOLOR ambientColor;
	int clipPlaneCount;
	struct
	{
		D3DCOLOR color;
		D3DFOGMODE mode;
		float start;
		float end;
		float density;
	} fog;
	// PINNED1003c2a4 clears0x2170 bytes; the last4 bytes have no identified use.
	unsigned char reservedTail[4];
};

// Stringized after expansion, so the log shows D3D macros expanded.
#define R_DX_STRING(call) #call
#define R_DX_CALL(call)                                         \
	do                                                          \
	{                                                           \
		RB_LogPrint(R_DX_STRING(call) "\n");                    \
		call;                                                   \
	} while (alwaysfails)

extern DxState dxState;

// Backend D3D state cache: only calls into the device when a value changes.
#include <string.h>
#include <stddef.h>
#include "r_local.h"
#include "rb_backend.h"
#include "rb_drawargs.h"
#include "r_permanent.h"
#include "universal/com_math.h"

DxState dxState;
typedef char sampler_device_lost_offset[(offsetof(DxGlobals, deviceLost) == 0x2d3c) ? 1 : -1];

void RB_SetDepthRange(float nearValue, float farValue)
{
	if (dxState.viewport.MinZ == nearValue && dxState.viewport.MaxZ == farValue)
		return;
	dxState.viewport.MinZ = nearValue;
	dxState.viewport.MaxZ = farValue;
	R_DX_CALL(dx.device->SetViewport( &dxState.viewport ));
}

void RB_SetAnisotropy()
{
	int anisotropy;
	int samplerIndex;

	dx.anisotropy = r_anisotropy->current.integer;
	if (dx.anisotropy > dx.maxAnisotropy)
		dx.anisotropy = dx.maxAnisotropy;
	if (dx.anisotropy <= 1)
		dx.anisotropy = 0;
	anisotropy = I_max(1, dx.anisotropy);
	for (samplerIndex = 0; samplerIndex < vidConfig.maxTextureMaps; samplerIndex++)
		R_DX_CALL(dx.device->SetSamplerState( samplerIndex, D3DSAMP_MAXANISOTROPY, anisotropy ));
}

// PC 1.0 table at 0x10190714: D3DTEXF_NONE, POINT, LINEAR, ANISOTROPIC
static const DWORD s_filterTable[4] = { 0, 1, 2, 3 };

static void RB_GetSamplerFilterModes(unsigned char samplerState, DWORD *minFilter, DWORD *magFilter)
{
	*minFilter = s_filterTable[samplerState & 3];
	*magFilter = *minFilter;
	if (*minFilter == D3DTEXF_ANISOTROPIC)
	{
		*magFilter = D3DTEXF_LINEAR;
		if (dx.anisotropy == 0)
			*minFilter = D3DTEXF_LINEAR;
	}
}

__declspec(noinline) void RB_SetSampler(int samplerIndex, unsigned char samplerState, GfxImage *image)
{
	unsigned char currentSamplerState;
	unsigned char diffSamplerState;
	DWORD minFilter;
	DWORD magFilter;
	DWORD prevMinFilter;
	DWORD prevMagFilter;
	DWORD address;
	DWORD mipFilter;

	if (image != dxState.samplerImage[samplerIndex])
	{
		if (image)
		{
			if (r_logFile->current.integer)
				RB_LogPrint(va("---------- texture %i: %s\n", samplerIndex, image->name));
			R_DX_CALL(dx.device->SetTexture( samplerIndex, image->texture.basemap ));
		}
		else
		{
			R_DX_CALL(dx.device->SetTexture( samplerIndex, 0 ));
		}
		dxState.samplerImage[samplerIndex] = image;
	}
	if (!image)
		return;
	if (!(samplerState & 0xf))
		samplerState |= backEnd.defaultSamplerState;
	currentSamplerState = dxState.samplerState[samplerIndex];
	diffSamplerState = samplerState ^ currentSamplerState;
	if (!diffSamplerState)
		return;
	if (diffSamplerState & 3)
	{
		RB_GetSamplerFilterModes(samplerState, &minFilter, &magFilter);
		RB_GetSamplerFilterModes(currentSamplerState, &prevMinFilter, &prevMagFilter);
		if (minFilter != prevMinFilter)
			R_DX_CALL(dx.device->SetSamplerState( samplerIndex, D3DSAMP_MINFILTER, minFilter ));
		if (magFilter != prevMagFilter)
			R_DX_CALL(dx.device->SetSamplerState( samplerIndex, D3DSAMP_MAGFILTER, magFilter ));
	}
	if (diffSamplerState & 0xc)
	{
		mipFilter = s_filterTable[(samplerState >> 2) & 3];
		R_DX_CALL(dx.device->SetSamplerState( samplerIndex, D3DSAMP_MIPFILTER, mipFilter ));
	}
	if (diffSamplerState & 0x70)
	{
		if (diffSamplerState & 0x10)
		{
			address = (samplerState & 0x10) ? D3DTADDRESS_CLAMP : D3DTADDRESS_WRAP;
			R_DX_CALL(dx.device->SetSamplerState( samplerIndex, D3DSAMP_ADDRESSU, address ));
		}
		if (diffSamplerState & 0x20)
		{
			address = (samplerState & 0x20) ? D3DTADDRESS_CLAMP : D3DTADDRESS_WRAP;
			R_DX_CALL(dx.device->SetSamplerState( samplerIndex, D3DSAMP_ADDRESSV, address ));
		}
		if (diffSamplerState & 0x40)
		{
			address = (samplerState & 0x40) ? D3DTADDRESS_CLAMP : D3DTADDRESS_WRAP;
			R_DX_CALL(dx.device->SetSamplerState( samplerIndex, D3DSAMP_ADDRESSW, address ));
		}
	}
	dxState.samplerState[samplerIndex] = samplerState;
}

void RB_UnbindImage(const GfxImage *image)
{
	int samplerIndex;

	for (samplerIndex = 0; samplerIndex < vidConfig.maxTextureMaps; samplerIndex++)
	{
		if (dxState.samplerImage[samplerIndex] == image)
			RB_SetSampler(samplerIndex, 0, NULL);
	}
}

// PINNED 1003ec50/33: preserve each live sampler state while binding white.
void RB_BindWhiteImages()
{
	for (int index = 0; index < 16; ++index)
		RB_SetSampler(index, dxState.samplerState[index], rgp.whiteImage);
}

void RB_InitImages()
{
	int samplerIndex;

	if (!dx.deviceLost)
	{
		for (samplerIndex = 0; samplerIndex < vidConfig.maxTextureMaps; samplerIndex++)
			RB_SetSampler(samplerIndex, 0, NULL);
	}
}

static const DWORD s_blendTable[] =
{
	0,
	D3DBLEND_ZERO,
	D3DBLEND_ONE,
	D3DBLEND_SRCCOLOR,
	D3DBLEND_INVSRCCOLOR,
	D3DBLEND_SRCALPHA,
	D3DBLEND_INVSRCALPHA,
	D3DBLEND_DESTALPHA,
	D3DBLEND_INVDESTALPHA,
	D3DBLEND_DESTCOLOR,
	D3DBLEND_INVDESTCOLOR,
	D3DBLEND_BLENDFACTOR,
	D3DBLEND_INVBLENDFACTOR
};

static const DWORD s_blendOpTable[] =
{
	0,
	D3DBLENDOP_ADD,
	D3DBLENDOP_SUBTRACT,
	D3DBLENDOP_REVSUBTRACT,
	D3DBLENDOP_MIN,
	D3DBLENDOP_MAX
};

static const DWORD s_cullTable[] =
{
	0,
	D3DCULL_NONE,
	D3DCULL_CCW,
	D3DCULL_CW
};

void RB_SetAlphaAntiAliasingState(int stateBits0)
{
	DWORD aaAlphaFormat;

	if (stateBits0 & 0xf00)
		aaAlphaFormat = 0;
	else if (r_aaAlpha->current.integer == 2)
		aaAlphaFormat = MAKEFOURCC('S', 'S', 'A', 'A');
	else
		aaAlphaFormat = MAKEFOURCC('A', 'T', 'O', 'C');
	R_DX_CALL(dx.device->SetRenderState( D3DRS_ADAPTIVETESS_Y, aaAlphaFormat ));
}

void RB_ChangeState_0(int stateBits0)
{
	int changedBits;
	DWORD function;
	unsigned char ref;
	DWORD mask;
	int blend;
	unsigned char disableBlendOpRgb;
	unsigned char disableSeparateAlphaBlend;
	unsigned char refDisableBlendOpRgb;
	unsigned char refDisableSeparateAlphaBlend;

	changedBits = stateBits0 ^ dxState.activeStateBits[0];
	if (!changedBits && !((stateBits0 ^ dxState.refStateBits[0]) & 0x7000700))
		return;

	if (r_logFile->current.integer)
		RB_LogPrintState_0(stateBits0, changedBits);

	if (changedBits & 0x800)
		R_DX_CALL(dx.device->SetRenderState( D3DRS_ALPHATESTENABLE, (stateBits0 & DXS0_ATEST_DISABLE) ? 0 : 1 ));
	if (stateBits0 & 0x800)
	{
		stateBits0 |= dxState.activeStateBits[0] & 0x3000;
		changedBits &= ~0x3000;
	}
	if (changedBits & 0x3000)
	{
		if ((stateBits0 & 0x3000) == 0x1000)
		{
			function = D3DCMP_GREATER;
			ref = 0;
		}
		else if ((stateBits0 & 0x3000) == 0x2000)
		{
			function = D3DCMP_LESS;
			ref = 0x80;
		}
		else
		{
			function = D3DCMP_GREATEREQUAL;
			ref = 0x80;
		}
		R_DX_CALL(dx.device->SetRenderState( D3DRS_ALPHAFUNC, function ));
		if (dxState.alphaRef != ref)
		{
			R_DX_CALL(dx.device->SetRenderState( D3DRS_ALPHAREF, ref ));
			dxState.alphaRef = ref;
		}
	}
	if (changedBits & 0x18000000)
	{
		mask = (stateBits0 & 0x8000000) ? 7 : 0;
		mask |= ((unsigned int)stateBits0 & 0x10000000u) >> 25;
		R_DX_CALL(dx.device->SetRenderState( D3DRS_COLORWRITEENABLE, mask ));
	}
	if (changedBits & 0x20000000)
		R_DX_CALL(dx.device->SetRenderState( D3DRS_FOGENABLE, (stateBits0 & DXS0_FOG) ? 1 : 0 ));
	if (changedBits & 0xc000)
		R_DX_CALL(dx.device->SetRenderState( D3DRS_CULLMODE, s_cullTable[(stateBits0 & DXS0_CULL_MASK) >> DXS0_CULL_SHIFT] ));
	if (changedBits & 0x80000000)
		R_DX_CALL(dx.device->SetRenderState( D3DRS_FILLMODE, (stateBits0 & DXS0_POLYMODE_LINE) ? D3DFILL_WIREFRAME : D3DFILL_SOLID ));

	disableBlendOpRgb = (stateBits0 & 0x700) == 0;
	refDisableBlendOpRgb = (dxState.refStateBits[0] & 0x700) == 0;
	if (refDisableBlendOpRgb != disableBlendOpRgb)
		R_DX_CALL(dx.device->SetRenderState( D3DRS_ALPHABLENDENABLE, disableBlendOpRgb ? 0 : 1 ));
	if (disableBlendOpRgb)
	{
		stateBits0 = (stateBits0 & ~0x7ff) | (dxState.activeStateBits[0] & 0x7ff);
		changedBits &= ~0x7ff;
	}
	else
	{
		if (changedBits & 0x700)
			R_DX_CALL(dx.device->SetRenderState( D3DRS_BLENDOP, s_blendOpTable[(stateBits0 >> DXS0_BLENDOP_RGB_SHIFT) & DXS_BLENDOP_MASK] ));
	}
	if (changedBits & 0xff)
	{
		if (changedBits & 0xf)
		{
			blend = stateBits0 & 0xf;
			R_DX_CALL(dx.device->SetRenderState( D3DRS_SRCBLEND, s_blendTable[blend] ));
		}
		if (changedBits & 0xf0)
		{
			blend = (stateBits0 >> 4) & 0xf;
			R_DX_CALL(dx.device->SetRenderState( D3DRS_DESTBLEND, s_blendTable[blend] ));
		}
	}

	disableSeparateAlphaBlend = (stateBits0 & 0x7000000) == 0;
	refDisableSeparateAlphaBlend = (dxState.refStateBits[0] & 0x7000000) == 0;
	if (refDisableSeparateAlphaBlend != disableSeparateAlphaBlend)
		R_DX_CALL(dx.device->SetRenderState( D3DRS_SEPARATEALPHABLENDENABLE, disableSeparateAlphaBlend ? 0 : 1 ));
	if (disableSeparateAlphaBlend)
	{
		stateBits0 = (stateBits0 & ~0x7ff0000) | (dxState.activeStateBits[0] & 0x7ff0000);
		changedBits &= ~0x7ff0000;
	}
	else
	{
		if (changedBits & 0x7000000)
			R_DX_CALL(dx.device->SetRenderState( D3DRS_BLENDOPALPHA, s_blendOpTable[(stateBits0 >> DXS0_BLENDOP_ALPHA_SHIFT) & DXS_BLENDOP_MASK] ));
	}
	if (changedBits & 0xff0000)
	{
		if (changedBits & 0xf0000)
		{
			blend = (stateBits0 >> 16) & 0xf;
			R_DX_CALL(dx.device->SetRenderState( D3DRS_SRCBLENDALPHA, s_blendTable[blend] ));
		}
		if (changedBits & 0xf00000)
		{
			blend = (stateBits0 >> 20) & 0xf;
			R_DX_CALL(dx.device->SetRenderState( D3DRS_DESTBLENDALPHA, s_blendTable[blend] ));
		}
	}
	if (changedBits & 0x40000000)
		R_DX_CALL(dx.device->SetRenderState( D3DRS_NORMALIZENORMALS, (stateBits0 & DXS0_RENORMALIZE) ? 1 : 0 ));
	if (dx.hasTransparencyMsaa && r_aaAlpha->current.integer && (changedBits & 0xf00))
		RB_SetAlphaAntiAliasingState(stateBits0);

	dxState.activeStateBits[0] = stateBits0;
}

extern const dvar_t *r_polygonOffsetBias;
extern const dvar_t *r_polygonOffsetScale;

struct DxStencilDecode
{
	int shift;
	D3DRENDERSTATETYPE renderState;
};

enum
{
	DXS1_DEPTHWRITE = 1,
	DXS1_DEPTHTEST_DISABLE = 2
};

static const DWORD s_stencilOpTable[8] = { 1, 2, 3, 4, 5, 6, 7, 8 };
static const DWORD s_stencilFuncTable[8] = { 1, 2, 3, 4, 5, 6, 7, 8 };
static const DxStencilDecode s_stencilOpDecode[6] =
{
	{ 8, (D3DRENDERSTATETYPE)55 }, { 11, (D3DRENDERSTATETYPE)53 }, { 14, (D3DRENDERSTATETYPE)54 },
	{ 20, (D3DRENDERSTATETYPE)188 }, { 23, (D3DRENDERSTATETYPE)186 }, { 26, (D3DRENDERSTATETYPE)187 }
};
static const DxStencilDecode s_stencilFuncDecode[2] =
{
	{ 17, (D3DRENDERSTATETYPE)56 }, { 29, (D3DRENDERSTATETYPE)189 }
};

static inline DWORD FloatAsInt(const float *value)
{
	return *(const DWORD *)value;
}

void RB_ChangeState_1(int stateBits1)
{
	int changedBits;
	unsigned int decodeIndex;

	changedBits = stateBits1 ^ dxState.activeStateBits[1];
	if (!changedBits)
		return;
	if (r_logFile->current.integer)
		RB_LogPrintState_1(stateBits1, changedBits);

	if (changedBits & 1)
		R_DX_CALL(dx.device->SetRenderState( D3DRS_ZWRITEENABLE, (stateBits1 & DXS1_DEPTHWRITE) ? 1 : 0 ));
	if (changedBits & 2)
		R_DX_CALL(dx.device->SetRenderState( D3DRS_ZENABLE, (stateBits1 & DXS1_DEPTHTEST_DISABLE) ? D3DZB_FALSE : D3DZB_TRUE ));
	if (stateBits1 & 2)
	{
		stateBits1 |= dxState.activeStateBits[1] & 0xc;
		changedBits &= ~0xc;
	}
	if (changedBits & 0xc)
	{
		DWORD function;
		DWORD depthCode = stateBits1 & 0xc;
		if (depthCode == 4)
			function = depthCode;
		else
			function = depthCode == 8 ? 3 : 8;
		R_DX_CALL(dx.device->SetRenderState( D3DRS_ZFUNC, function ));
	}
	if (changedBits & 0x30)
	{
		float offsetUnits = (float)((stateBits1 & 0x30) >> 4);
		float bias = offsetUnits * r_polygonOffsetBias->current.value * 1.52587890625e-05f;
		if (dx.slopeScaleDepthBias)
		{
			float scale = offsetUnits * r_polygonOffsetScale->current.value;
			R_DX_CALL(dx.device->SetRenderState( D3DRS_SLOPESCALEDEPTHBIAS, FloatAsInt( &scale ) ));
		}
		else
			bias *= 2.0f;
		R_DX_CALL(dx.device->SetRenderState( D3DRS_DEPTHBIAS, FloatAsInt( &bias ) ));
	}
	if (stateBits1 & 0x40)
	{
		if (changedBits & 0x40)
			R_DX_CALL(dx.device->SetRenderState( D3DRS_STENCILENABLE, 1 ));
	}
	else
	{
		if (changedBits & 0x40)
			R_DX_CALL(dx.device->SetRenderState( D3DRS_STENCILENABLE, 0 ));
		stateBits1 |= dxState.activeStateBits[1] & ~0x7f;
		changedBits &= 0x7f;
	}
	if (stateBits1 & 0x80)
	{
		if (changedBits & 0x80)
			R_DX_CALL(dx.device->SetRenderState( D3DRS_TWOSIDEDSTENCILMODE, 1 ));
	}
	else
	{
		if (changedBits & 0x80)
			R_DX_CALL(dx.device->SetRenderState( D3DRS_TWOSIDEDSTENCILMODE, 0 ));
		stateBits1 |= dxState.activeStateBits[1] & ~0xfffff;
		changedBits &= 0xfffff;
	}
	if (changedBits & 0x1ff1ff00)
	{
		for (decodeIndex = 0; decodeIndex < 6; ++decodeIndex)
		{
			if (((changedBits >> s_stencilOpDecode[decodeIndex].shift) & 7) != 0)
			{
				unsigned int stateNibble = (stateBits1 >> s_stencilOpDecode[decodeIndex].shift) & 7;
				R_DX_CALL(dx.device->SetRenderState( s_stencilOpDecode[decodeIndex].renderState, s_stencilOpTable[stateNibble] ));
			}
		}
	}
	if (changedBits & 0xe00e0000)
	{
		for (decodeIndex = 0; decodeIndex < 2; ++decodeIndex)
		{
			if (((changedBits >> s_stencilFuncDecode[decodeIndex].shift) & 7) != 0)
			{
				unsigned int stateNibble = (stateBits1 >> s_stencilFuncDecode[decodeIndex].shift) & 7;
				R_DX_CALL(dx.device->SetRenderState( s_stencilFuncDecode[decodeIndex].renderState, s_stencilFuncTable[stateNibble] ));
			}
		}
	}
	dxState.activeStateBits[1] = stateBits1;
}

void RB_SetViewport(const GfxViewport *viewport)
{
	if (r_logFile->current.integer)
		RB_LogPrint(va("Viewport at (%i, %i) with size %i x %i\n",
		               viewport->x, viewport->y, viewport->width, viewport->height));
	if ((DWORD)viewport->x == dxState.viewport.X &&
	    (DWORD)viewport->y == dxState.viewport.Y &&
	    (DWORD)viewport->width == dxState.viewport.Width &&
	    (DWORD)viewport->height == dxState.viewport.Height)
		return;
	dxState.viewport.X = viewport->x;
	dxState.viewport.Y = viewport->y;
	dxState.viewport.Width = viewport->width;
	dxState.viewport.Height = viewport->height;
	R_DX_CALL(dx.device->SetViewport( &dxState.viewport ));
}

void RB_ChangeIndices(IDirect3DIndexBuffer9 *ib)
{
	dxState.indexBufferDeselecting = dxState.indexBuffer;
	dxState.indexBuffer = ib;
	R_DX_CALL(dx.device->SetIndices( ib ));
	dxState.indexBufferDeselecting = NULL;
}

void RB_ChangeStreamSource(int streamIndex, IDirect3DVertexBuffer9 *vb, int vertexOffset, int vertexStride)
{
	dxState.vertexBufferDeselecting = dxState.streams[streamIndex].vb;
	dxState.streams[streamIndex].vb = vb;
	dxState.streams[streamIndex].offset = vertexOffset;
	dxState.streams[streamIndex].stride = vertexStride;
	R_DX_CALL(dx.device->SetStreamSource( streamIndex, vb, vertexOffset, vertexStride ));
	dxState.vertexBufferDeselecting = NULL;
}

// PINNED in 10013080: only the one PC stream participates in shutdown.
void RB_ClearAllStreamSources()
{
    if (dxState.streams[0].vb || dxState.streams[0].offset || dxState.streams[0].stride)
        RB_ChangeStreamSource(0, 0, 0, 0);
}

// PINNED 10038430/104, 100384a0/104 and 10038510/114.
void RB_ChangePixelShader(IDirect3DPixelShader9 *shader)
{
	if (dxState.pixelShader != shader)
	{
		R_DX_CALL(dx.device->SetPixelShader( shader ));
		dxState.pixelShader = shader;
	}
}

void RB_ChangeVertexShader(IDirect3DVertexShader9 *shader)
{
	if (dxState.vertexShader != shader)
	{
		R_DX_CALL(dx.device->SetVertexShader( shader ));
		dxState.vertexShader = shader;
	}
}

void RB_ChangeVertexDeclaration(IDirect3DVertexDeclaration9 *decl)
{
	if (dxState.vertexDecl != decl)
	{
		R_DX_CALL(dx.device->SetVertexDeclaration( decl ));
		dxState.vertexDecl = decl;
		dxState.fvf = 0;
	}
}

extern const dvar_t *r_drawPrimFloor, *r_drawPrimCap;

// PINNED 10038610/150: the triangle limits do not apply to 2D draws.
void RB_DrawIndexedPrimitive(const GfxDrawPrimArgs *args)
{
	if (!backEnd.projection2D)
	{
		if (args->primCount < r_drawPrimFloor->current.integer)
			return;
		if (r_drawPrimCap->current.integer
			&& args->primCount > r_drawPrimCap->current.integer)
			return;
	}
	R_DX_CALL(dx.device->DrawIndexedPrimitive( D3DPT_TRIANGLELIST, args->u.buf.baseVertex, args->firstVertexFromBase, args->vertexCount, args->u.buf.baseIndex, args->primCount ));
}

void RB_SetFVF(DWORD fvf)
{
	if (!dxState.vertexDecl && dxState.fvf == fvf)
		return;
	R_DX_CALL(dx.device->SetFVF( fvf ));
	dxState.fvf = fvf;
	dxState.vertexDecl = NULL;
}

r_backEndGlobals_t backEnd;

extern const dvar_t *r_textureMode;

// PINNED retail 0x101906b0, indexed by r_textureMode
static const unsigned char defaultSamplerStateTable[] = { 1, 2, 6, 10, 11 };

void RB_DecideDefaultSamplerState()
{
	backEnd.defaultSamplerState = defaultSamplerStateTable[r_textureMode->current.integer];
}

void RB_InitSceneViewport()
{
	backEnd.sceneViewport.width = vidConfig.width;
	backEnd.sceneViewport.height = vidConfig.height;
}

static GfxCodeMatrices *RB_GetActiveCodeMatrices()
{
	return &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel];
}

static void RB_InvalidateCodeMatrix(GfxCodeMatrix *matrix)
{
	matrix->valid[0] = 0;
	matrix->valid[1] = 0;
	matrix->valid[2] = 0;
	matrix->valid[3] = 0;
}

static void RB_ValidatePrimaryCodeMatrix(GfxCodeMatrix *matrix)
{
	matrix->valid[1] = 0;
	matrix->valid[0] = 1;
	matrix->valid[2] = 0;
	matrix->valid[3] = 0;
}

static bool RB_UsingDx7Renderer()
{
	return r_rendererInUse->current.integer == 2;
}

void MatrixInverse44(const float *mat, float *dst);
void MatrixIdentity44(float out[4][4]);

struct DxTextureOpDecode
{
	DWORD enumerant;
	DWORD usedArgs;
};

struct DxTextureStageEnums
{
	D3DTEXTURESTAGESTATETYPE op;
	D3DTEXTURESTAGESTATETYPE arg[3];
};

// PC 1.0 table at 0x101907a8: D3DTOP value and the arguments it reads
static const DxTextureOpDecode s_textureOpTable[23] =
{
	{ 1, 0 }, { 2, 1 }, { 3, 2 }, { 4, 3 }, { 5, 3 }, { 6, 3 }, { 7, 3 }, { 8, 3 },
	{ 9, 3 }, { 10, 3 }, { 11, 3 }, { 12, 3 }, { 13, 3 }, { 14, 3 }, { 15, 3 }, { 16, 3 },
	{ 18, 3 }, { 19, 3 }, { 20, 3 }, { 21, 3 }, { 24, 3 }, { 25, 7 }, { 26, 7 }
};

// PC 1.0 table at 0x10190860: CONSTANT, CURRENT, DIFFUSE, SPECULAR, TEMP, TEXTURE, TFACTOR, DIFFUSE
static const DWORD s_textureArgTable[8] = { 6, 1, 0, 4, 5, 2, 3, 0 };

static void RB_ChangeTextureStageState(int stageIndex, const DxTextureStageEnums *texStageEnums, int texStageBits, int *activeTexStageBits)
{
	int changedBits;
	const DxTextureOpDecode *texOp;
	int argIndex;
	int argShift;
	int argMask;
	int argBits;
	DWORD texArg;

	changedBits = texStageBits ^ activeTexStageBits[stageIndex];
	texOp = &s_textureOpTable[texStageBits & 0x1f];
	if (changedBits & 0x1f)
		R_DX_CALL(dx.device->SetTextureStageState( stageIndex, texStageEnums->op, texOp->enumerant ));
	argShift = 10;
	argMask = 0x7c00;
	for (argIndex = 0; argIndex < 3; argIndex++, argShift += 5, argMask <<= 5)
	{
		if (changedBits & argMask)
		{
			if (texOp->usedArgs & (1 << argIndex))
			{
				argBits = (texStageBits >> argShift) & 0x1f;
				texArg = s_textureArgTable[argBits & 7];
				if (argBits & 8)
					texArg |= 0x10;
				if (argBits & 0x10)
					texArg |= 0x20;
				R_DX_CALL(dx.device->SetTextureStageState( stageIndex, texStageEnums->arg[argIndex], texArg ));
			}
			else
			{
				texStageBits = (texStageBits & ~argMask) | (activeTexStageBits[stageIndex] & argMask);
			}
		}
	}
	activeTexStageBits[stageIndex] = texStageBits;
}

void RB_ChangeColorStageState(int stageIndex, int texStageBits)
{
	DxTextureStageEnums texStageEnums = { D3DTSS_COLOROP, { D3DTSS_COLORARG1, D3DTSS_COLORARG2, D3DTSS_COLORARG0 } };

	RB_ChangeTextureStageState(stageIndex, &texStageEnums, texStageBits, dxState.activeColorStageBits);
}

void RB_ChangeAlphaStageState(int stageIndex, int texStageBits)
{
	DxTextureStageEnums texStageEnums = { D3DTSS_ALPHAOP, { D3DTSS_ALPHAARG1, D3DTSS_ALPHAARG2, D3DTSS_ALPHAARG0 } };

	RB_ChangeTextureStageState(stageIndex, &texStageEnums, texStageBits, dxState.activeAlphaStageBits);
}

void RB_SetSamplerConstantDx7(unsigned int color)
{
	if (dxState.textureFactor != color)
	{
		dxState.textureFactor = color;
		R_DX_CALL(dx.device->SetRenderState( D3DRS_TEXTUREFACTOR, color ));
	}
}

void RB_ChangeGenTexCoords(int samplerIndex, int genTexCoords)
{
	D3DMATRIX transform;

	switch ((unsigned char)genTexCoords)
	{
	case 0:
		R_DX_CALL(dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXCOORDINDEX, 0x00000000 | samplerIndex ));
		R_DX_CALL(dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXTURETRANSFORMFLAGS, D3DTTFF_DISABLE ));
		break;
	case 1:
		MatrixInverse44((const float *)&backEnd.viewParms->viewMatrix, (float *)&transform);
		transform._41 = 0.0f;
		transform._42 = 0.0f;
		transform._43 = 0.0f;
		R_DX_CALL(dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXCOORDINDEX, 0x00020000 ));
		R_DX_CALL(dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXTURETRANSFORMFLAGS, D3DTTFF_COUNT3 ));
		R_DX_CALL(dx.device->SetTransform( static_cast< D3DTRANSFORMSTATETYPE >( D3DTS_TEXTURE0 + samplerIndex ), &transform ));
		break;
	case 2:
		MatrixIdentity44((float (*)[4])&transform);
		transform._32 = -backEnd.texScrollAmountDx7;
		R_DX_CALL(dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXCOORDINDEX, 0x00000000 | samplerIndex));
		R_DX_CALL(dx.device->SetTextureStageState( samplerIndex, D3DTSS_TEXTURETRANSFORMFLAGS, D3DTTFF_COUNT3 ));
		R_DX_CALL(dx.device->SetTransform( static_cast< D3DTRANSFORMSTATETYPE >( D3DTS_TEXTURE0 + samplerIndex ), &transform ));
		break;
	default:
		break;
	}
	dxState.genTexCoords[samplerIndex] = (unsigned char)genTexCoords;
}

void RB_ChangedWorldMatrix(float worldScale)
{
	GfxCodeMatrices *activeMatrices;
	const dvar_t *rendererInUse;

	rendererInUse = r_rendererInUse;
	activeMatrices = RB_GetActiveCodeMatrices();
	activeMatrices->worldScale = worldScale;
	activeMatrices->world.valid[0] = 1;
	activeMatrices->world.valid[1] = 0;
	activeMatrices->world.valid[2] = 0;
	activeMatrices->world.valid[3] = 0;
	RB_InvalidateCodeMatrix(&activeMatrices->worldView);
	RB_InvalidateCodeMatrix(&activeMatrices->worldViewProjection);
	RB_InvalidateCodeMatrix(&activeMatrices->normalizedWorld);
	RB_InvalidateCodeMatrix(&activeMatrices->normalizedWorldView);
	RB_InvalidateCodeMatrix(&activeMatrices->normalizedWorldViewProjection);
	RB_InvalidateCodeMatrix(&activeMatrices->shadowLookupMatrix);
	RB_InvalidateCodeMatrix(&activeMatrices->lightGridLookupMatrix);
	RB_InvalidateCodeMatrix(&activeMatrices->worldOutdoorLookup);
	if (rendererInUse->current.integer == 2)
		R_DX_CALL(dx.device->SetTransform( (D3DTRANSFORMSTATETYPE)(0 + 256), &activeMatrices->world.matrix[0] ));
}

void RB_SetViewMatrix(const D3DMATRIX *matrix)
{
	GfxCodeMatrices *activeMatrices;

	activeMatrices = RB_GetActiveCodeMatrices();
	activeMatrices->view.matrix[0] = *matrix;
	activeMatrices->view.valid[0] = 1;
	activeMatrices->view.valid[1] = 0;
	activeMatrices->view.valid[2] = 0;
	activeMatrices->view.valid[3] = 0;
	RB_InvalidateCodeMatrix(&activeMatrices->worldView);
	RB_InvalidateCodeMatrix(&activeMatrices->viewProjection);
	RB_InvalidateCodeMatrix(&activeMatrices->worldViewProjection);
	RB_InvalidateCodeMatrix(&activeMatrices->normalizedWorldView);
	RB_InvalidateCodeMatrix(&activeMatrices->normalizedWorldViewProjection);
	if (RB_UsingDx7Renderer())
		R_DX_CALL(dx.device->SetTransform( D3DTS_VIEW, matrix ));
}

void RB_SetViewMatrixForWDx7(float w)
{
	D3DMATRIX transform;

	transform = backEnd.viewParms->viewMatrix;
	transform._44 = w;
	R_DX_CALL(dx.device->SetTransform( D3DTS_VIEW, &transform ));
}

// name unconfirmed: projection[0] already written by the caller
void RB_ProjectionMatrixChanged()
{
	GfxCodeMatrices *activeMatrices;
	const dvar_t *rendererInUse;

	activeMatrices = RB_GetActiveCodeMatrices();
	rendererInUse = r_rendererInUse;
	activeMatrices->projection.valid[1] = 0;
	activeMatrices->projection.valid[0] = 1;
	activeMatrices->projection.valid[2] = 0;
	activeMatrices->projection.valid[3] = 0;
	RB_InvalidateCodeMatrix(&activeMatrices->viewProjection);
	RB_InvalidateCodeMatrix(&activeMatrices->worldViewProjection);
	RB_InvalidateCodeMatrix(&activeMatrices->normalizedWorldViewProjection);
	if (rendererInUse->current.integer == 2)
		R_DX_CALL(dx.device->SetTransform( D3DTS_PROJECTION, &activeMatrices->projection.matrix[0] ));
}

void RB_SetDepthHackNearClip(float nearClip)
{
	RB_GetActiveCodeMatrices()->projection.matrix[0]._43 = -nearClip;
	RB_ProjectionMatrixChanged();
}

// name unconfirmed: copies the view parms matrices into the active code matrices
static __declspec(noinline) void RB_CopyViewParmsMatrices(const GfxViewParms *viewParms)
{
	GfxCodeMatrices *activeMatrices;

	activeMatrices = RB_GetActiveCodeMatrices();
	activeMatrices->view.matrix[0] = viewParms->viewMatrix;
	activeMatrices->projection.matrix[0] = viewParms->projectionMatrix;
	activeMatrices->viewProjection.matrix[0] = viewParms->viewProjectionMatrix;
	activeMatrices->viewProjection.matrix[1] = viewParms->inverseViewProjectionMatrix;
}

void RB_SetMatricesForView(const GfxViewParms *viewParms)
{
	GfxCodeMatrices *activeMatrices;

	RB_CopyViewParmsMatrices(viewParms);
	activeMatrices = RB_GetActiveCodeMatrices();
	RB_ValidatePrimaryCodeMatrix(&activeMatrices->view);
	RB_ValidatePrimaryCodeMatrix(&activeMatrices->projection);
	RB_InvalidateCodeMatrix(&activeMatrices->worldView);
	activeMatrices->viewProjection.valid[0] = 1;
	activeMatrices->viewProjection.valid[1] = 1;
	activeMatrices->viewProjection.valid[2] = 0;
	activeMatrices->viewProjection.valid[3] = 0;
	RB_InvalidateCodeMatrix(&activeMatrices->worldViewProjection);
	RB_InvalidateCodeMatrix(&activeMatrices->normalizedWorldViewProjection);
	if (RB_UsingDx7Renderer())
	{
		R_DX_CALL(dx.device->SetTransform( D3DTS_VIEW, &viewParms->viewMatrix ));
		R_DX_CALL(dx.device->SetTransform( D3DTS_PROJECTION, &viewParms->projectionMatrix ));
	}
}

void RB_PopMatrixStack()
{
	backEnd.codeMatrixStackLevel -= 1;
	if (!RB_UsingDx7Renderer())
		return;
	R_DX_CALL(dx.device->SetTransform( (D3DTRANSFORMSTATETYPE)(0 + 256), &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].world.matrix[0] ));
	R_DX_CALL(dx.device->SetTransform( D3DTS_VIEW, &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].view.matrix[0] ));
	R_DX_CALL(dx.device->SetTransform( D3DTS_PROJECTION, &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0] ));
}

void RB_UpdateViewport()
{
	GfxViewport viewport;

	backEnd.viewportIsDirty = 0;
	if (dxState.viewportBehavior == GFX_USE_VIEWPORT_FULL)
	{
		viewport.x = 0;
		viewport.y = 0;
		viewport.width = dxState.renderTargetWidth;
		viewport.height = dxState.renderTargetHeight;
	}
	else
	{
		viewport = backEnd.sceneViewport;
	}
	dxState.viewportIsNull = 0;
	RB_SetViewport(&viewport);
}

// PINNED1019087c: one viewport policy for each of the13 render targets.
static const GfxViewportBehavior s_viewportBehaviorForRenderTarget[13] = {
	GFX_USE_VIEWPORT_FOR_VIEW, GFX_USE_VIEWPORT_FULL, GFX_USE_VIEWPORT_FULL,
	GFX_USE_VIEWPORT_FOR_VIEW, GFX_USE_VIEWPORT_FOR_VIEW, GFX_USE_VIEWPORT_FULL,
	GFX_USE_VIEWPORT_FOR_VIEW, GFX_USE_VIEWPORT_FULL, GFX_USE_VIEWPORT_FULL,
	GFX_USE_VIEWPORT_FULL, GFX_USE_VIEWPORT_FULL, GFX_USE_VIEWPORT_FULL,
	GFX_USE_VIEWPORT_FULL
};

// PINNED1003ea30--1003ec15; the inventory omits the final6 bytes.
void RB_SetRenderTarget(GfxRenderTargetId newTargetId)
{
	if (newTargetId == dxState.renderTargetId)
		return;
	if (r_logFile->current.integer)
		RB_LogPrint(va("\n========== RB_SetRenderTarget( %i ) ==========\n\n", newTargetId));
	dxState.renderTargetId = newTargetId;
	if (dx.renderTargets[newTargetId].image)
		RB_UnbindImage(dx.renderTargets[newTargetId].image);
	if (dxState.renderTargetSurface != dx.renderTargets[newTargetId].colorSurface)
	{
		R_DX_CALL(dx.device->SetRenderTarget( 0, dx.renderTargets[newTargetId].colorSurface ));
		dxState.renderTargetSurface = dx.renderTargets[newTargetId].colorSurface;
		dxState.viewportBehavior = s_viewportBehaviorForRenderTarget[dxState.renderTargetId];
		dxState.renderTargetWidth = dx.renderTargets[newTargetId].width;
		dxState.renderTargetHeight = dx.renderTargets[newTargetId].height;
		dxState.viewport.X = 0;
		dxState.viewport.Y = 0;
		dxState.viewport.Width = dx.renderTargets[newTargetId].width;
		dxState.viewport.Height = dx.renderTargets[newTargetId].height;
		dxState.viewport.MinZ = 0.0f;
		dxState.viewport.MaxZ = 1.0f;
	}
	if (dxState.depthStencilSurface != dx.renderTargets[newTargetId].depthStencilSurface)
	{
		R_DX_CALL(dx.device->SetDepthStencilSurface( dx.renderTargets[newTargetId].depthStencilSurface ));
		dxState.depthStencilSurface = dx.renderTargets[newTargetId].depthStencilSurface;
	}
	RB_UpdateViewportConstants();
}

// name unconfirmed: tail of the Dx7 fixed-function state init
void RB_SetInitialDx7State()
{
	D3DMATERIAL9 material;
	int stageIndex;

	dxState.fog.end = 1.0f;
	dxState.fog.density = 1.0f;
	for (stageIndex = 0; stageIndex < 8; stageIndex++)
	{
		dxState.refColorStageBits[stageIndex] = 0;
		dxState.refAlphaStageBits[stageIndex] = 0;
		dxState.activeColorStageBits[stageIndex] = 0;
		dxState.activeAlphaStageBits[stageIndex] = 0;
	}
	dx.device->SetRenderState(D3DRS_LIGHTING, 0);
	dx.device->SetRenderState(D3DRS_AMBIENTMATERIALSOURCE, D3DMCS_COLOR1);
	material.Ambient.r = 1.0f;
	material.Ambient.g = 1.0f;
	material.Ambient.b = 1.0f;
	material.Ambient.a = 1.0f;
	material.Diffuse.r = 1.0f;
	material.Diffuse.g = 1.0f;
	material.Diffuse.b = 1.0f;
	material.Diffuse.a = 1.0f;
	material.Specular.r = 1.0f;
	material.Specular.g = 1.0f;
	material.Specular.b = 1.0f;
	material.Specular.a = 1.0f;
	material.Emissive.r = 0.0f;
	material.Emissive.g = 0.0f;
	material.Emissive.b = 0.0f;
	material.Emissive.a = 0.0f;
	material.Power = 32.0f;
	dx.device->SetMaterial(&material);
	dxState.gridLighting = 0;
	for (stageIndex = 0; stageIndex < 2; stageIndex++)
		dxState.genTexCoords[stageIndex] = 0;
}

// PINNED1003c2a0/252; the cache starts with invalid float bit patterns.
void RB_SetInitialState()
{
	int samplerIndex;
	memset(&dxState, 0, sizeof(dxState));
	RB_DecideDefaultSamplerState();
	RB_SetAnisotropy();
	dxState.activeStateBits[0] = 0x19128912;
	dxState.activeStateBits[1] = 0xe00e0007;
	dxState.refStateBits[0] = 0x18128812;
	dxState.refStateBits[1] = 0xe00e0007;
	dxState.stencilRefValue = 0;
	backEnd.sceneViewport.x = 0;
	backEnd.sceneViewport.y = 0;
	backEnd.sceneViewport.width = vidConfig.width;
	backEnd.sceneViewport.height = vidConfig.height;
	dxState.viewport.X = 0;
	dxState.viewport.Y = 0;
	dxState.viewport.Width = vidConfig.width;
	dxState.viewport.Height = vidConfig.height;
	dxState.viewport.MinZ = 0.0f;
	dxState.viewport.MaxZ = 1.0f;
	dxState.renderTargetId = R_RENDERTARGET_NONE;
	RB_SetRenderTarget(R_RENDERTARGET_FRAME_BUFFER);
	dxState.viewportIsNull = 0;
	RB_SetInitialDx7State();
	for (samplerIndex = 0; samplerIndex < 16; ++samplerIndex)
	{
		dxState.samplerImage[samplerIndex] = NULL;
		dxState.samplerState[samplerIndex] = 1;
	}
	dxState.textureColorArg = 1;
	dxState.textureFactor = 0xffffffff;
	memset(dxState.vertexShaderConsts, 0xff, sizeof(dxState.vertexShaderConsts));
	memset(dxState.pixelShaderConsts, 0xff, sizeof(dxState.pixelShaderConsts));
}

// name unconfirmed
void RB_ChangeVertexShaderConstants(int destIndex, const float *data, unsigned int rowCount)
{
	int rowIndex;

	if (r_logFile->current.integer)
	{
		for (rowIndex = 0; rowIndex < (int)rowCount; rowIndex++)
			RB_LogPrint(va("---------- const %i value %g %g %g %g\n", destIndex + rowIndex, data[rowIndex * 4], data[rowIndex * 4 + 1], data[rowIndex * 4 + 2], data[rowIndex * 4 + 3]));
	}
	if (memcmp(dxState.vertexShaderConsts[destIndex], data, rowCount * 16))
	{
		memcpy(dxState.vertexShaderConsts[destIndex], data, rowCount * 16);
		R_DX_CALL(dx.device->SetVertexShaderConstantF( destIndex, data, rowCount ));
	}
}

// name unconfirmed
void RB_ChangePixelShaderConstants(int destIndex, const float *data, unsigned int rowCount)
{
	int rowIndex;

	if (r_logFile->current.integer)
	{
		for (rowIndex = 0; rowIndex < (int)rowCount; rowIndex++)
			RB_LogPrint(va("---------- const %i value %g %g %g %g\n", destIndex + rowIndex, data[rowIndex * 4], data[rowIndex * 4 + 1], data[rowIndex * 4 + 2], data[rowIndex * 4 + 3]));
	}
	if (memcmp(dxState.pixelShaderConsts[destIndex], data, rowCount * 16))
	{
		memcpy(dxState.pixelShaderConsts[destIndex], data, rowCount * 16);
		R_DX_CALL(dx.device->SetPixelShaderConstantF( destIndex, data, rowCount ));
	}
}

// Viewport calculation.
void RB_UpdateViewportConstants()
{
	GfxViewport viewport;
	float renderTargetWidth, renderTargetHeight;
	float invRenderTargetWidth, invRenderTargetHeight;
	float halfViewportWidth, halfViewportHeight;
	float viewportCenterX, viewportCenterY;
	float normalizedViewport[2];

	backEnd.projection2D = 0;
	backEnd.viewportIsDirty = 1;
	renderTargetWidth = (float)dxState.renderTargetWidth;
	invRenderTargetWidth = 1.0f / renderTargetWidth;
	renderTargetHeight = (float)dxState.renderTargetHeight;
	invRenderTargetHeight = 1.0f / renderTargetHeight;
	if (dxState.viewportBehavior == GFX_USE_VIEWPORT_FULL)
	{
		viewport.x = 0;
		viewport.y = 0;
		viewport.width = dxState.renderTargetWidth;
		viewport.height = dxState.renderTargetHeight;
	}
	else
		viewport = backEnd.sceneViewport;
	normalizedViewport[0] = viewport.width * invRenderTargetWidth;
	normalizedViewport[1] = viewport.height * invRenderTargetHeight;
	halfViewportWidth = normalizedViewport[0] * 0.5f;
	halfViewportHeight = normalizedViewport[1] * 0.5f;
	viewportCenterX = viewport.x * invRenderTargetWidth + halfViewportWidth;
	viewportCenterY = viewport.y * invRenderTargetHeight + halfViewportHeight;
	viewportCenterX += invRenderTargetWidth * 0.5f;
	viewportCenterY += invRenderTargetHeight * 0.5f;
	RB_SetCodeConstant(43, renderTargetWidth, renderTargetHeight, invRenderTargetWidth, invRenderTargetHeight);
	RB_SetCodeConstant(46, halfViewportWidth, -halfViewportHeight, 0.0f, 1.0f);
	RB_SetCodeConstant(47, viewportCenterX, viewportCenterY, 0.0f, 0.0f);
}

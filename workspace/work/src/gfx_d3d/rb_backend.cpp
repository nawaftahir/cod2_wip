// Backend frame driver: GPU fence sync and benchmarking.
#include "r_local.h"
#include "rb_backend.h"
#include "rb_tess.h"
#include <dxerr9.h>

// Mac source places this shared setter in rb_backend, not an inline header.
void RB_SetCodeConstant(int constant, float x, float y, float z, float w)
{
	backEnd.codeConsts[constant][0] = x;
	backEnd.codeConsts[constant][1] = y;
	backEnd.codeConsts[constant][2] = z;
	backEnd.codeConsts[constant][3] = w;
}

// PINNED 100307e0: replicate the one-channel table for the target swap chain.
void RB_SetGammaRamp(const GfxGammaRamp *gammaTable)
{
	D3DGAMMARAMP ramp;
	for (int index = 0; index < 256; ++index)
	{
		ramp.red[index] = gammaTable->entries[index];
		ramp.green[index] = gammaTable->entries[index];
		ramp.blue[index] = gammaTable->entries[index];
	}
	dx.device->SetGammaRamp(dx.targetWindowIndex, 0, &ramp);
}

// PINNED 106d3194, distinct from frontEndDataOut at 101da9c8.
struct GfxBackEndData;
GfxBackEndData *backEndData;
#include "universal/com_math.h"

#include "rb_commands.h"

void RB_SetViewport(const GfxViewport *viewport);
void R_QuantizeCachedColor(const float *color, byte *out);

// PINNED 1002fe70: full-target viewport and BGRA color conversion.
void RB_ClearScreen(byte whichToClear, const float *color, float depth, byte stencil)
{
	DWORD clearFlags = 0;
	if (whichToClear & 2)
		clearFlags |= D3DCLEAR_ZBUFFER;
	if (whichToClear & 4)
		clearFlags |= D3DCLEAR_STENCIL;
	if (whichToClear & 1)
		clearFlags |= D3DCLEAR_TARGET;
	GfxViewport viewport;
	viewport.x = 0;
	viewport.y = 0;
	viewport.width = dxState.renderTargetWidth;
	viewport.height = dxState.renderTargetHeight;
	RB_SetViewport(&viewport);
	backEnd.viewportIsDirty = 1;
	byte nativeColor[4];
	DWORD packedColor;
	R_QuantizeCachedColor(color, nativeColor);
	packedColor = *(DWORD *)nativeColor;
	R_DX_CALL(dx.device->Clear( 0, 0, clearFlags, packedColor, depth, stencil ));
}

// PINNED 1002ff50: advance using the possibly updated execution-state pointer.
void RB_ClearScreenCmd(GfxRenderCommandExecState *execState)
{
	const GfxCmdClearScreen *cmd = (const GfxCmdClearScreen *)execState->cmd;
	RB_ClearScreen(cmd->whichToClear, cmd->color, cmd->depth, cmd->stencil);
	const GfxCmdHeader *header = (const GfxCmdHeader *)execState->cmd;
	execState->cmd = (const byte *)header + header->byteCount;
}

#pragma warning(disable: 4035)

// Mac rdtsc_lo; retail inlines a raw rdtsc and keeps edx:eax.
static __forceinline __int64 RB_Rdtsc()
{
	__asm rdtsc
}

// Kisak name (r_setstate_d3d.cpp); always inlined in retail.
static Bool RB_IsGpuFinished()
{
	HRESULT hr;

	hr = dx.flushGpuQuery->GetData( 0, 0, D3DGETDATA_FLUSH );
	if (hr == D3DERR_DEVICELOST)
		return true;
	return hr != S_FALSE;
}

// refexport slot 104 (Mac RB_IsGpuFenceFinished follows AbortRenderCommands).
int RB_IsGpuFenceFinished()
{
	if (!dx.flushGpuQueryIssued)
		return true;
	if (!RB_IsGpuFinished())
		return false;
	dx.flushGpuQueryIssued = 0;
	return true;
}

// Kisak name.
void R_FinishGpuFence()
{
	while (!RB_IsGpuFenceFinished())
		;
}

// Kisak name.
void R_InsertGpuFence()
{
	R_DX_CALL(dx.flushGpuQuery->Issue( D3DISSUE_END ));
	dx.flushGpuQueryIssued = 1;
}

// refexport slot 106.
void RB_GpuWaited(int ticks)
{
	dx.gpuSyncAlreadyWaited = ticks;
}

// refexport slot 105.
void RB_AdaptiveGpuSyncWait()
{
	__int64 startTime;
	__int64 waitedTime;

	if (dx.gpuSync != 3)
	{
		R_FinishGpuFence();
		return;
	}
	waitedTime = 0;
	startTime = RB_Rdtsc() - dx.gpuSyncAlreadyWaited;
	dx.gpuSyncAlreadyWaited = 0;
	while (!RB_IsGpuFenceFinished())
	{
		waitedTime = RB_Rdtsc() - startTime;
		if (waitedTime > 0x7fffffff)
			return;
	}
	dx.gpuSyncDelay -= (dx.gpuSyncDelay - (int)waitedTime) / 2;
}

void RB_AdaptiveGpuSyncTarget()
{
	int delay;

	if (!RB_IsGpuFenceFinished())
		return;
	delay = dx.gpuSyncDelay - 20000;
	dx.gpuSyncDelay = delay & ~(delay >> 31);
}

// Kisak name.
void RB_AbandonGpuFence()
{
	dx.flushGpuQueryIssued = 0;
}

// Kisak name; CoD2 abandons the fence once the wait exceeds gpuSyncDelay.
void RB_AdaptiveGpuSyncFinal()
{
	__int64 startTime;

	if (RB_IsGpuFenceFinished())
		return;
	startTime = RB_Rdtsc();
	while (!RB_IsGpuFenceFinished())
	{
		if ((int)(RB_Rdtsc() - startTime) > dx.gpuSyncDelay)
		{
			RB_AbandonGpuFence();
			break;
		}
	}
	dx.gpuSyncDelay += (int)(RB_Rdtsc() - startTime) * 3 / 4;
}

void RB_BeginBenchmarkGpu(LARGE_INTEGER *time)
{
	R_FinishGpuFence();
	R_InsertGpuFence();
	R_FinishGpuFence();
	QueryPerformanceCounter(time);
	dx.inScene = 1;
	R_DX_CALL(dx.device->BeginScene());
}

void RB_EndBenchmarkGpu(LARGE_INTEGER *time)
{
	R_DX_CALL(dx.device->EndScene());
	dx.inScene = 0;
	R_FinishGpuFence();
	R_InsertGpuFence();
	R_FinishGpuFence();
	QueryPerformanceCounter(time);
}

// name unconfirmed: BeginScene tail of RB_ExecuteRenderCommands
void RB_BeginScene()
{
	if (dx.gpuSync == 3)
		RB_AdaptiveGpuSyncFinal();
	else if (dx.gpuSync == 1)
	{
		R_FinishGpuFence();
		R_InsertGpuFence();
	}
	dx.inScene = 1;
	R_DX_CALL(dx.device->BeginScene());
	backEnd.frameCount++;
}

// name unconfirmed: frustum vectors from RB_BeginViewCmd
void RB_SetFrustumConstants()
{
	const GfxViewParms *viewParms;
	float invProjDist;
	float twoInvProjDist;

	viewParms = backEnd.viewParms;
	invProjDist = 1.0f / viewParms->inverseViewProjectionMatrix._44;
	RB_SetCodeConstant(15, invProjDist * viewParms->inverseViewProjectionMatrix._41 - viewParms->origin[0], invProjDist * viewParms->inverseViewProjectionMatrix._42 - viewParms->origin[1], invProjDist * viewParms->inverseViewProjectionMatrix._43 - viewParms->origin[2], 0.0f);
	twoInvProjDist = invProjDist * 2.0f;
	RB_SetCodeConstant(16, twoInvProjDist * viewParms->inverseViewProjectionMatrix._11, twoInvProjDist * viewParms->inverseViewProjectionMatrix._12, twoInvProjDist * viewParms->inverseViewProjectionMatrix._13, 0.0f);
	RB_SetCodeConstant(17, -(twoInvProjDist * viewParms->inverseViewProjectionMatrix._21), -(twoInvProjDist * viewParms->inverseViewProjectionMatrix._22), -(twoInvProjDist * viewParms->inverseViewProjectionMatrix._23), 0.0f);
}

extern const dvar_t *r_glow;
extern const dvar_t *r_fullbright;
extern const dvar_t *r_showFbColorDebug;
extern const dvar_t *r_blur;

// name unconfirmed: needCopy test from the late post-effects command
unsigned char RB_NeedsSceneCopy(float blurRadius)
{
	int renderer;

	renderer = r_rendererInUse->current.integer;
	if (renderer != 2 && dx.hasSeparateAlphaBlend && r_glow->current.enabled && !r_fullbright->current.enabled)
		return 1;
	if (r_showFbColorDebug->current.integer == 2)
		return 1;
	if (renderer == 2)
		return 0;
	if (r_blur->current.value > 0.0f)
		return 1;
	if (blurRadius > 0.0f)
		return 1;
	return 0;
}

void RB_InitSceneViewport();

void RB_InitBackendGlobalStructs()
{
	memset(&backEnd, 0, sizeof(backEnd));
	backEnd.worldEntityReType = 3;	// RT_MODEL
	backEnd.resolvedPostSunTarget = 0xe;
	backEnd.resolvedSceneTarget = 0xe;
	RB_InitSceneViewport();
}

// Mac name RB_UpdateColorInternal.
static void RB_UpdateColorInternal(const float *floatColor, unsigned char *color)
{
	color[0] = (unsigned char)I_fround(floatColor[0] * 255.0f);
	color[1] = (unsigned char)I_fround(floatColor[1] * 255.0f);
	color[2] = (unsigned char)I_fround(floatColor[2] * 255.0f);
	color[3] = (unsigned char)I_fround(floatColor[3] * 255.0f);
}

// Retail symbol R_ShutdownDebug is a Ghidra mislabel; Mac name RB_UpdateColor.
void RB_UpdateColor(const float *color_allies, const float *color_axis)
{
	RB_UpdateColorInternal(color_allies, (unsigned char *)&backEnd.color_allies);
	RB_UpdateColorInternal(color_axis, (unsigned char *)&backEnd.color_axis);
}

// Leaf helpers (names unconfirmed); retail passes the first operands in eax/ecx.
// 8 corner points, 3 floats each, stored as 3 rows of 8; flip to 8 rows of 3.
void R_TransposeCorners(const float *in, float *out)
{
	out[0] = in[0];
	out[1] = in[8];
	out[2] = in[16];
	out[3] = in[1];
	out[4] = in[9];
	out[5] = in[17];
	out[6] = in[2];
	out[7] = in[10];
	out[8] = in[18];
	out[9] = in[3];
	out[10] = in[11];
	out[11] = in[19];
	out[12] = in[4];
	out[13] = in[12];
	out[14] = in[20];
	out[15] = in[5];
	out[16] = in[13];
	out[17] = in[21];
	out[18] = in[6];
	out[19] = in[14];
	out[20] = in[22];
	out[21] = in[7];
	out[22] = in[15];
	out[23] = in[23];
}

// Mean of the 8 corners.
void R_CornersCenter(float *center, const float *in)
{
	int i;

	center[0] = 0.0f;
	center[1] = 0.0f;
	center[2] = 0.0f;
	for (i = 0; i < 8; i++)
	{
		center[0] += in[i];
		center[1] += in[8 + i];
		center[2] += in[16 + i];
	}
	center[0] *= 0.125f;
	center[1] *= 0.125f;
	center[2] *= 0.125f;
}

void R_ScaleFloats24(float *values, float scale)
{
	values[0] = scale * values[0];
	values[1] = scale * values[1];
	values[2] = scale * values[2];
	values[3] = scale * values[3];
	values[4] = scale * values[4];
	values[5] = scale * values[5];
	values[6] = scale * values[6];
	values[7] = scale * values[7];
	values[8] = scale * values[8];
	values[9] = scale * values[9];
	values[10] = scale * values[10];
	values[11] = scale * values[11];
	values[12] = scale * values[12];
	values[13] = scale * values[13];
	values[14] = scale * values[14];
	values[15] = scale * values[15];
	values[16] = scale * values[16];
	values[17] = scale * values[17];
	values[18] = scale * values[18];
	values[19] = scale * values[19];
	values[20] = scale * values[20];
	values[21] = scale * values[21];
	values[22] = scale * values[22];
	values[23] = scale * values[23];
}

void R_AccumulateBytes24(float *sum, const unsigned char *bytes, float scale)
{
	float *dst;
	const unsigned char *src;
	int row;

	src = bytes + 2;
	scale = scale * (1.0f / 255.0f);
	dst = sum + 2;
	for (row = 3; row; row--)
	{
		dst[-2] = (float)src[-2] * scale + dst[-2];
		dst[-1] = (float)src[-1] * scale + dst[-1];
		dst[0] = (float)src[0] * scale + dst[0];
		dst[1] = (float)src[1] * scale + dst[1];
		dst[2] = (float)src[2] * scale + dst[2];
		dst[3] = (float)src[3] * scale + dst[3];
		dst[4] = (float)src[4] * scale + dst[4];
		dst[5] = (float)src[5] * scale + dst[5];
		dst += 8;
		src += 8;
	}
}

typedef unsigned int GfxColor;

struct GfxVertex
{
	float xyzw[4];
	float normal[3];
	GfxColor color;
	float texCoord[2];
	float binormal[3];
	float tangent[3];
};

struct GfxVertexDx7
{
	float xyz[3];
	float normal[3];
	GfxColor color;
	float texCoord[2];
};

// PINNED 1002e470: packed color is passed by value on the 2D path.
void RB_SetVertex2D(int index, float x, float y, float s, float t, GfxColor color)
{
    if (r_rendererInUse->current.integer == 2)
    {
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[0] = x;
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[1] = y;
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[2] = 0.0f;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[0] = 0.0f;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[1] = 0.0f;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[2] = 1.0f;
        ((GfxVertexDx7 *)tess.vertexData)[index].color = color;
        ((GfxVertexDx7 *)tess.vertexData)[index].texCoord[0] = s;
        ((GfxVertexDx7 *)tess.vertexData)[index].texCoord[1] = t;
    }
    else
    {
        ((GfxVertex *)tess.vertexData)[index].xyzw[0] = x;
        ((GfxVertex *)tess.vertexData)[index].xyzw[1] = y;
        ((GfxVertex *)tess.vertexData)[index].xyzw[2] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].xyzw[3] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].normal[0] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].normal[1] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].normal[2] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].color = color;
        ((GfxVertex *)tess.vertexData)[index].texCoord[0] = s;
        ((GfxVertex *)tess.vertexData)[index].texCoord[1] = t;
        ((GfxVertex *)tess.vertexData)[index].tangent[0] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].tangent[1] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].tangent[2] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[0] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[1] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[2] = 0.0f;
    }
}

// PINNED 1002e550: XYZ is unprojected and packed color is passed by pointer.
void RB_SetVertex3D(int index, float x, float y, float z,
    float s, float t, const GfxColor *color)
{
    if (r_rendererInUse->current.integer == 2)
    {
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[0] = x;
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[1] = y;
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[2] = z;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[0] = 0.0f;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[1] = 0.0f;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[2] = 1.0f;
        ((GfxVertexDx7 *)tess.vertexData)[index].color = *color;
        ((GfxVertexDx7 *)tess.vertexData)[index].texCoord[0] = s;
        ((GfxVertexDx7 *)tess.vertexData)[index].texCoord[1] = t;
    }
    else
    {
        ((GfxVertex *)tess.vertexData)[index].xyzw[0] = x;
        ((GfxVertex *)tess.vertexData)[index].xyzw[1] = y;
        ((GfxVertex *)tess.vertexData)[index].xyzw[2] = z;
        ((GfxVertex *)tess.vertexData)[index].xyzw[3] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].normal[0] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].normal[1] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].normal[2] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].color = *color;
        ((GfxVertex *)tess.vertexData)[index].texCoord[0] = s;
        ((GfxVertex *)tess.vertexData)[index].texCoord[1] = t;
        ((GfxVertex *)tess.vertexData)[index].tangent[0] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].tangent[1] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].tangent[2] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[0] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[1] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[2] = 0.0f;
    }
}

// PINNED 1002e640: only DX7 divides homogeneous coordinates by W.
void RB_SetVertex4D(int index, float x, float y, float z, float w,
    float s, float t, const GfxColor *color)
{
    if (r_rendererInUse->current.integer == 2)
    {
        w = 1.0f / w;
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[0] = x * w;
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[1] = y * w;
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[2] = w * z;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[0] = 0.0f;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[1] = 0.0f;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[2] = 1.0f;
        ((GfxVertexDx7 *)tess.vertexData)[index].color = *color;
        ((GfxVertexDx7 *)tess.vertexData)[index].texCoord[0] = s;
        ((GfxVertexDx7 *)tess.vertexData)[index].texCoord[1] = t;
    }
    else
    {
        ((GfxVertex *)tess.vertexData)[index].xyzw[0] = x;
        ((GfxVertex *)tess.vertexData)[index].xyzw[1] = y;
        ((GfxVertex *)tess.vertexData)[index].xyzw[2] = z;
        ((GfxVertex *)tess.vertexData)[index].xyzw[3] = w;
        ((GfxVertex *)tess.vertexData)[index].normal[0] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].normal[1] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].normal[2] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].color = *color;
        ((GfxVertex *)tess.vertexData)[index].texCoord[0] = s;
        ((GfxVertex *)tess.vertexData)[index].texCoord[1] = t;
        ((GfxVertex *)tess.vertexData)[index].tangent[0] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].tangent[1] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].tangent[2] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[0] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[1] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[2] = 0.0f;
    }
}

// PINNED 1002e740: explicit normal; no historical helper name is asserted.
void RB_SetLitVertex4D(int index, float x, float y, float z, float w,
    float nx, float ny, float nz, float s, float t, const GfxColor *color)
{
    if (r_rendererInUse->current.integer == 2)
    {
        w = 1.0f / w;
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[0] = x * w;
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[1] = y * w;
        ((GfxVertexDx7 *)tess.vertexData)[index].xyz[2] = w * z;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[0] = nx;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[1] = ny;
        ((GfxVertexDx7 *)tess.vertexData)[index].normal[2] = nz;
        ((GfxVertexDx7 *)tess.vertexData)[index].color = *color;
        ((GfxVertexDx7 *)tess.vertexData)[index].texCoord[0] = s;
        ((GfxVertexDx7 *)tess.vertexData)[index].texCoord[1] = t;
    }
    else
    {
        ((GfxVertex *)tess.vertexData)[index].xyzw[0] = x;
        ((GfxVertex *)tess.vertexData)[index].xyzw[1] = y;
        ((GfxVertex *)tess.vertexData)[index].xyzw[2] = z;
        ((GfxVertex *)tess.vertexData)[index].xyzw[3] = w;
        ((GfxVertex *)tess.vertexData)[index].normal[0] = nx;
        ((GfxVertex *)tess.vertexData)[index].normal[1] = ny;
        ((GfxVertex *)tess.vertexData)[index].normal[2] = nz;
        ((GfxVertex *)tess.vertexData)[index].color = *color;
        ((GfxVertex *)tess.vertexData)[index].texCoord[0] = s;
        ((GfxVertex *)tess.vertexData)[index].texCoord[1] = t;
        ((GfxVertex *)tess.vertexData)[index].tangent[0] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].tangent[1] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].tangent[2] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[0] = 0.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[1] = 1.0f;
        ((GfxVertex *)tess.vertexData)[index].binormal[2] = 0.0f;
    }
}

// name unconfirmed: write a lit +Z-facing 3D point into tess vertex slot vertIndex.
void RB_WritePointVertex(int vertIndex, const float *xyz, GfxColor color)
{
	if (r_rendererInUse->current.integer == 2)
	{
		GfxVertexDx7 *v = (GfxVertexDx7 *)(tess.vertexData + vertIndex * sizeof(GfxVertexDx7));

		v->xyz[0] = xyz[0];
		v->xyz[1] = xyz[1];
		v->xyz[2] = xyz[2];
		v->normal[0] = 0.0f;
		v->normal[1] = 0.0f;
		v->normal[2] = 1.0f;
		v->color = color;
		v->texCoord[0] = 0.0f;
		v->texCoord[1] = 0.0f;
	}
	else
	{
		GfxVertex *v = (GfxVertex *)(tess.vertexData + vertIndex * sizeof(GfxVertex));

		v->xyzw[0] = xyz[0];
		v->xyzw[1] = xyz[1];
		v->xyzw[2] = xyz[2];
		v->xyzw[3] = 1.0f;
		v->normal[0] = 0.0f;
		v->normal[1] = 0.0f;
		v->normal[2] = 1.0f;
		v->color = color;
		v->binormal[0] = 0.0f;
		v->binormal[1] = 1.0f;
		v->binormal[2] = 0.0f;
		v->tangent[0] = 1.0f;
		v->tangent[1] = 0.0f;
		v->tangent[2] = 0.0f;
		v->texCoord[0] = 0.0f;
		v->texCoord[1] = 0.0f;
	}
}

// name unconfirmed: seconds between two QueryPerformanceCounter samples.
double RB_BenchmarkSeconds(const LARGE_INTEGER *end, const LARGE_INTEGER *start)
{
	LARGE_INTEGER frequency;

	QueryPerformanceFrequency(&frequency);
	__int64 startTicks = start->QuadPart;
	__int64 endTicks = end->QuadPart;

	return (double)(endTicks - startTicks) / (double)frequency.QuadPart;
}

// Backend command handlers.
void RB_EndSurface();
void RB_SetRenderTarget(GfxRenderTargetId target);
void RB_UpdateViewportConstants();

// PINNED 1002eb60: jump without touching the return stack.
static void RB_GotoCmd(GfxRenderCommandExecState *state)
{
    state->cmd = ((const GfxCmdJump *)state->cmd)->next;
}

// PINNED 1002eb70: save the variable-sized return address before jumping.
static void RB_CallCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdJump *cmd = (const GfxCmdJump *)state->cmd;
    state->retCmd[state->stackPos] = (const byte *)cmd + cmd->header.byteCount;
    ++state->stackPos;
    state->cmd = cmd->next;
}

// PINNED 1002eb90: the command producer owns the two-level stack bounds.
static void RB_ReturnCmd(GfxRenderCommandExecState *state)
{
    --state->stackPos;
    state->cmd = state->retCmd[state->stackPos];
}

// PINNED 10031f10: capture the payload before flushing; advance from live state.
static void RB_SetMaterialColorCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdSetMaterialColor *cmd = (const GfxCmdSetMaterialColor *)state->cmd;
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    memcpy(backEnd.codeConsts[27], cmd->color, sizeof(cmd->color));
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 100320e0: target selection can change the live command pointer.
static void RB_SetRenderTargetCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdSetRenderTarget *cmd = (const GfxCmdSetRenderTarget *)state->cmd;
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    RB_SetRenderTarget(cmd->renderTargetId);
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 10032310: copy the captured rectangle, then update constants.
static void RB_SetViewportCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdSetViewport *cmd = (const GfxCmdSetViewport *)state->cmd;
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    backEnd.sceneViewport = cmd->viewport;
    backEnd.viewportIsDirty = 1;
    RB_UpdateViewportConstants();
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// Backend 2D commands.
void RB_DrawStretchPic(const Material *material, float x, float y, float w, float h,
    float s0, float t0, float s1, float t1, unsigned int color);
void RB_Set2D();
void RB_BeginSurface(const Material *material, int technique, int lightmap);
void RB_TessOverflow();

// PINNED 1002ebb0: arguments are captured before the drawing helper runs.
static void RB_StretchPicCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdStretchPic *cmd = (const GfxCmdStretchPic *)state->cmd;
    RB_DrawStretchPic(cmd->material, cmd->x, cmd->y, cmd->w, cmd->h,
        cmd->s0, cmd->t0, cmd->s1, cmd->t1, cmd->color);
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 1002f0c0: use the current target extent, not the scene viewport.
static void RB_DrawFullScreenColoredQuadCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdDrawFullScreenColoredQuad *cmd = (const GfxCmdDrawFullScreenColoredQuad *)state->cmd;
    RB_DrawStretchPic(cmd->material, 0.0f, 0.0f,
        (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight,
        cmd->s0, cmd->t0, cmd->s1, cmd->t1, cmd->color);
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 1002ee80: publish counts before calling the vertex setters.
static void RB_DrawQuadPicCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdDrawQuadPic *cmd = (const GfxCmdDrawQuadPic *)state->cmd;
    if (!backEnd.projection2D)
        RB_Set2D();
    const Material *material = cmd->material;
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
        RB_TessOverflow();
    int vertex = (unsigned short)tess.vertexCount;
    int index = tess.indexCount;
    tess.vertexCount += 4;
    tess.indexCount += 6;
    tess.indices[index] = (unsigned short)(vertex + 3);
    tess.indices[index + 1] = (unsigned short)vertex;
    tess.indices[index + 2] = (unsigned short)(vertex + 2);
    tess.indices[index + 3] = (unsigned short)(vertex + 2);
    tess.indices[index + 4] = (unsigned short)vertex;
    tess.indices[index + 5] = (unsigned short)(vertex + 1);
    RB_SetVertex2D(vertex, cmd->verts[0][0], cmd->verts[0][1], 0.0f, 0.0f, cmd->color);
    RB_SetVertex2D(vertex + 1, cmd->verts[1][0], cmd->verts[1][1], 1.0f, 0.0f, cmd->color);
    RB_SetVertex2D(vertex + 2, cmd->verts[2][0], cmd->verts[2][1], 1.0f, 1.0f, cmd->color);
    RB_SetVertex2D(vertex + 3, cmd->verts[3][0], cmd->verts[3][1], 0.0f, 1.0f, cmd->color);
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 1002ec00: reuse the existing FSINCOS helper; no new authored assembly.
static void RB_StretchPicRotateCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdStretchPicRotate *cmd = (const GfxCmdStretchPicRotate *)state->cmd;
    if (!backEnd.projection2D)
        RB_Set2D();
    const Material *material = cmd->material;
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
        RB_TessOverflow();
    int vertex = (unsigned short)tess.vertexCount;
    int index = tess.indexCount;
    tess.vertexCount += 4;
    tess.indexCount += 6;
    tess.indices[index] = (unsigned short)(vertex + 3);
    tess.indices[index + 1] = (unsigned short)vertex;
    tess.indices[index + 2] = (unsigned short)(vertex + 2);
    tess.indices[index + 3] = (unsigned short)(vertex + 2);
    tess.indices[index + 4] = (unsigned short)vertex;
    tess.indices[index + 5] = (unsigned short)(vertex + 1);
    float halfWidth = cmd->w * 0.5f, halfHeight = cmd->h * 0.5f;
    float centerX = cmd->x + halfWidth, centerY = cmd->y + halfHeight;
    float sine, cosine;
    FastSinCos(cmd->rotation * 0.017453292f, &sine, &cosine);
    float widthCos = cosine * halfWidth, widthSin = sine * halfWidth;
    float heightSin = -(sine * halfHeight), heightCos = cosine * halfHeight;
    float leftX = centerX - widthCos, topY = centerY - widthSin;
    RB_SetVertex2D(vertex, leftX - heightSin, topY - heightCos, cmd->s0, cmd->t0, cmd->color);
    RB_SetVertex2D(vertex + 1, centerX + widthCos - heightSin,
        centerY + widthSin - heightCos, cmd->s1, cmd->t0, cmd->color);
    RB_SetVertex2D(vertex + 2, centerX + widthCos + heightSin,
        centerY + widthSin + heightCos, cmd->s1, cmd->t1, cmd->color);
    RB_SetVertex2D(vertex + 3, leftX + heightSin, topY + heightCos, cmd->s0, cmd->t1, cmd->color);
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// Backend light, stencil, shadow and clip commands.
// PINNED 10031f60: keep the original payload across the surface flush.
static void RB_SetLightPropertiesCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdSetLightProperties *cmd = (const GfxCmdSetLightProperties *)state->cmd;
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    GfxBackEndLightSettings *light = &backEnd.light[cmd->lightIndex];
    memcpy(light->ambient, cmd->ambient, sizeof(light->ambient));
    memcpy(light->color, cmd->color, sizeof(light->color));
    memcpy(light->specular, cmd->specular, sizeof(light->specular));
    light->def = cmd->lightDef;
    memcpy(light->position, cmd->position, sizeof(light->position));
    memcpy(backEnd.codeConsts[3 + cmd->lightIndex], light->position, 16);
    memcpy(backEnd.codeConsts[7 + cmd->lightIndex], light->ambient, 16);
    memcpy(backEnd.codeConsts[5 + cmd->lightIndex], light->color, 16);
    memcpy(backEnd.codeConsts[9 + cmd->lightIndex], light->specular, 16);
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 1002fa50: cache publication follows the retried device call.
static void RB_SetStencilRefValueCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdSetStencilRefValue *cmd = (const GfxCmdSetStencilRefValue *)state->cmd;
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    if (dxState.stencilRefValue != cmd->refValue)
    {
        R_DX_CALL(dx.device->SetRenderState( D3DRS_STENCILREF, cmd->refValue ));
        dxState.stencilRefValue = cmd->refValue;
    }
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 1002f990: invalidate stack zero, regardless of the active stack level.
static void RB_SetShadowCookieCmd(GfxRenderCommandExecState *state)
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    const GfxCmdSetShadowCookie *cmd = (const GfxCmdSetShadowCookie *)state->cmd;
    float size = (float)dx.renderTargets[R_RENDERTARGET_SHADOWCOOKIE].width;
    memcpy(&backEnd.shadowLookupMatrix, cmd->shadowLookupMatrix, 64);
    for (int index = 0; index < 4; ++index)
        backEnd.codeMatrixStack[0].shadowLookupMatrix.valid[index] = 0;
    backEnd.codeConsts[44][0] = size;
    backEnd.codeConsts[44][1] = size;
    backEnd.codeConsts[44][2] = 1.0f / size;
    backEnd.codeConsts[44][3] = 1.0f / size;
    backEnd.codeConsts[45][0] = 0.0f;
    backEnd.codeConsts[45][1] = 0.0f;
    backEnd.codeConsts[45][2] = 0.0f;
    backEnd.codeConsts[45][3] = cmd->fade;
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 1002fd60: no surface flush; counts are reloaded after device callbacks.
static void RB_SetClipPlanesCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdSetClipPlanes *cmd = (const GfxCmdSetClipPlanes *)state->cmd;
    if (dxState.clipPlaneCount != cmd->clipPlaneCount)
    {
        R_DX_CALL(dx.device->SetRenderState( D3DRS_CLIPPLANEENABLE,
            (1u << (cmd->clipPlaneCount & 31)) - 1 ));
        dxState.clipPlaneCount = cmd->clipPlaneCount;
    }
    const float *plane = &cmd->clipPlanes[0][0];
    for (int index = 0; index < cmd->clipPlaneCount; ++index, plane += 4)
        R_DX_CALL(dx.device->SetClipPlane( index, plane ));
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// Backend view setup.
void MatrixIdentity44(float matrix[4][4]);
void RB_ChangedWorldMatrix(float scale);
void RB_SetMatricesForView(const GfxViewParms *viewParms);

// PINNED 1002e380: restore 3D matrices before publishing fresh view vectors.
void RB_Set3D()
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    backEnd.projection2D = 0;
    MatrixIdentity44(backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].world.matrix[0].m);
    RB_ChangedWorldMatrix(1.0f);
    RB_SetMatricesForView(backEnd.viewParms);
    const GfxViewParms *viewParms = backEnd.viewParms;
    RB_SetCodeConstant(11, viewParms->origin[0], viewParms->origin[1], viewParms->origin[2], 1.0f);
    RB_SetCodeConstant(12, viewParms->axis[0][0], viewParms->axis[0][1], viewParms->axis[0][2], 0.0f);
    RB_SetCodeConstant(13, viewParms->axis[1][0], viewParms->axis[1][1], viewParms->axis[1][2], 0.0f);
    RB_SetCodeConstant(14, viewParms->axis[2][0], viewParms->axis[2][1], viewParms->axis[2][2], 0.0f);
}

// PINNED 100321f0: retain packet across flush, then use shared viewport/matrix code.
static void RB_BeginViewCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdBeginView *cmd = (const GfxCmdBeginView *)state->cmd;
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    backEnd.viewCount = cmd->viewCount;
    backEnd.sceneDef = cmd->sceneDef;
    backEnd.viewParms = cmd->viewParms;
    backEnd.lodParms = cmd->lodParms;
    backEnd.sceneViewport.x = backEnd.viewParms->viewport.X;
    backEnd.sceneViewport.y = backEnd.viewParms->viewport.Y;
    backEnd.sceneViewport.width = backEnd.viewParms->viewport.Width;
    backEnd.sceneViewport.height = backEnd.viewParms->viewport.Height;
    backEnd.viewProjectionMatrix = backEnd.viewParms->viewProjectionMatrix;
    backEnd.tileIndex = 0;
    backEnd.tileCount = 1;
    backEnd.width = vidConfig.width;
    backEnd.height = vidConfig.height;
    if (!dxState.viewportBehavior)
        RB_UpdateViewportConstants();
    RB_SetFrustumConstants();
    RB_Set3D();
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// Backend image residency command.
void RB_TouchAllImages();

// PINNED 10031ef0: image traversal may replace the live command cursor.
static void RB_TouchAllImagesCmd(GfxRenderCommandExecState *state)
{
    RB_TouchAllImages();
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// Backend raw-frame command.
// PINNED 1002f110: role name; PC creates a surface rather than a texture.
static void RB_DrawRawSurface(int x, int y, int w, int h, int cols, int rows,
    const byte *data)
{
    IDirect3DSurface9 *rawSurf;
    HRESULT result = dx.device->CreateOffscreenPlainSurface(cols, rows,
        D3DFMT_X8R8G8B8, D3DPOOL_DEFAULT, &rawSurf, 0);
    if (result < 0)
        return;
    D3DLOCKED_RECT lockedRect;
    R_DX_CALL(rawSurf->LockRect( &lockedRect, 0, D3DLOCK_DISCARD ));
    byte *destination = (byte *)lockedRect.pBits;
    int rowSkip = lockedRect.Pitch - 4 * cols;
    for (int row = 0; row < rows; ++row)
    {
        for (int col = 0; col < cols; ++col)
        {
            byte green = data[1], alpha = data[3], blue = data[2], red = data[0];
            destination[2] = red;
            destination[1] = green;
            destination[0] = blue;
            destination[3] = alpha;
            data += 4;
            destination += 4;
        }
        destination += rowSkip;
    }
    rawSurf->UnlockRect();
    RECT rect;
    rect.left = x;
    rect.top = y;
    rect.right = x + w;
    rect.bottom = y + h;
    dx.device->StretchRect(rawSurf, 0, dx.renderTargets[0].colorSurface, &rect,
        D3DTEXF_LINEAR);
    rawSurf->Release();
}

// PINNED 1002f260: capture arguments before COM work; advance from live state.
static void RB_StretchRawCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdStretchRaw *cmd = (const GfxCmdStretchRaw *)state->cmd;
    RB_DrawRawSurface(cmd->x, cmd->y, cmd->w, cmd->h, cmd->cols, cmd->rows, cmd->data);
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// Backend screen copy, shadow blur and saved-screen commands.
#include "r_permanent.h"
#include <math.h>
extern const dvar_t *sc_blur;
extern const dvar_t *r_distortion;
IDirect3DSurface9 *Image_GetSurface(GfxImage *image);

// PINNED 1002eaa0: both the copy and the release use the original retry path.
static void RB_CopyBackBufferToSurface(GfxImage *image)
{
    IDirect3DSurface9 *imageSurface = Image_GetSurface(image);
    R_DX_CALL(dx.device->StretchRect( dxState.renderTargetSurface, 0, imageSurface, 0, D3DTEXF_LINEAR ));
    R_DX_CALL(imageSurface->Release());
}

// PINNED 10030c10, command25: publish the resolved target only after copying.
static void RB_ApplyEarlyPostEffectsCmd(GfxRenderCommandExecState *state)
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    backEnd.resolvedPostSunTarget = R_RENDERTARGET_NONE;
    if (r_distortion->current.enabled || (r_rendererInUse->current.integer != 2
        && dx.hasSeparateAlphaBlend && r_glow->current.enabled && !r_fullbright->current.enabled))
    {
        RB_CopyBackBufferToSurface(dx.renderTargets[R_RENDERTARGET_RESOLVED_POST_SUN].image);
        backEnd.resolvedPostSunTarget = R_RENDERTARGET_RESOLVED_POST_SUN;
    }
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 10030c90: publish current scene time after the surface callbacks.
static void RB_SaveScreenCmd(GfxRenderCommandExecState *state)
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    RB_CopyBackBufferToSurface(dx.renderTargets[R_RENDERTARGET_SAVED_SCREEN].image);
    rgp.savedScreenTime = backEnd.sceneDef.time;
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 10030920: role name; dimensions/image precede copy, material follows it.
static void RB_BlurShadowCookiePass(float minCoord, float maxCoord)
{
    float width = (float)dxState.renderTargetWidth;
    float height = (float)dxState.renderTargetHeight;
    GfxImage *image = dx.renderTargets[R_RENDERTARGET_SHADOWCOOKIE_BLUR].image;
    RB_CopyBackBufferToSurface(image);
    backEnd.currentFeedbackImage = image;
    RB_DrawStretchPic(rgp.shadowCookieBlurMaterial, 1.0f, 1.0f, width - 2.0f, height - 2.0f,
        minCoord, minCoord, maxCoord, maxCoord, 0xffffffff);
    RB_EndSurface();
}

// PINNED 100309a0, command28: complete both passes before reloading sc_blur.
static void RB_BlurShadowCookieCmd(GfxRenderCommandExecState *state)
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    for (int iteration = 0; iteration < sc_blur->current.integer; ++iteration)
    {
        RB_BlurShadowCookiePass(0.01171875f, 0.99609375f);
        RB_BlurShadowCookiePass(0.00390625f, 0.98828125f);
    }
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 10030cd0: alpha is the high byte; existing I_fround stays uncredited.
static void RB_BlendSavedScreenCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdBlendSavedScreen *cmd = (const GfxCmdBlendSavedScreen *)state->cmd;
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    if (!backEnd.projection2D)
        RB_Set2D();
    int elapsed = (int)((unsigned int)backEnd.sceneDef.time - (unsigned int)rgp.savedScreenTime);
    if (elapsed >= 0 && elapsed < cmd->fadeMsec)
    {
        double alpha = pow((double)0.01f, (double)elapsed / cmd->fadeMsec);
        if (alpha > 0.99f)
            alpha = 0.99f;
        float scaled = (float)(alpha * 255.0f);
        unsigned int color = ((unsigned int)(byte)I_fround(scaled) << 24) | 0x00ffffff;
        backEnd.currentFeedbackImage = dx.renderTargets[R_RENDERTARGET_SAVED_SCREEN].image;
        RB_DrawStretchPic(rgp.shellShockMaterial, 0.0f, 0.0f,
            (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight,
            0.0f, 0.0f, 1.0f, 1.0f, color);
    }
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

typedef char screenCopyStateLayoutCheck[(offsetof(r_global_permanent_t, savedScreenTime) == 0x10e0
    && offsetof(r_global_permanent_t, shadowCookieBlurMaterial) == 0x1054
    && offsetof(r_global_permanent_t, shellShockMaterial) == 0x10d0) ? 1 : -1];

// Backend stencil-plane and triangle geometry.
// PINNED 1002faf0: geometry follows overflow, counts follow all vertex/index writes.
static void RB_StencilPlanesCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdStencilPlanes *cmd = (const GfxCmdStencilPlanes *)state->cmd;
    const Material *material = rgp.stencilPlaneMaterial;
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    const GfxColor white = 0xffffffff;
    for (int plane = 0; plane < cmd->planeCount; ++plane)
    {
        if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
            RB_TessOverflow();
        float distance = cmd->planeDists[plane];
        float depth = distance - cmd->nearDist;
        float negative = -distance;
        RB_SetVertex4D(tess.vertexCount, negative, negative, depth, distance, 0.0f, 0.0f, &white);
        RB_SetVertex4D(tess.vertexCount + 1, negative, distance, depth, distance, 0.0f, 0.0f, &white);
        RB_SetVertex4D(tess.vertexCount + 2, distance, distance, depth, distance, 0.0f, 0.0f, &white);
        RB_SetVertex4D(tess.vertexCount + 3, distance, negative, depth, distance, 0.0f, 0.0f, &white);
        int base = tess.vertexCount;
        int first = tess.indexCount;
        tess.indices[first] = (unsigned short)base;
        tess.indices[first + 1] = (unsigned short)(base + 1);
        tess.indices[first + 2] = (unsigned short)(base + 2);
        tess.indices[first + 3] = (unsigned short)(base + 2);
        tess.indices[first + 4] = (unsigned short)(base + 3);
        tess.indices[first + 5] = (unsigned short)base;
        tess.vertexCount += 4;
        tess.indexCount += 6;
    }
    RB_EndSurface();
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// PINNED 10031d20: role name; retain packet arrays/counts across surface callbacks.
static void RB_DrawTriangles(const Material *material, int technique, short indexCount,
    const unsigned short *indices, short vertexCount, const float (*xyzw)[4],
    const float (*normals)[3], const GfxColor *colors, const float (*texCoords)[2])
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    if (backEnd.projection2D)
        RB_Set3D();
    if (tess.material != material || tess.techType != technique)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, technique, 31);
    }
    if (tess.vertexCount + vertexCount > 5450 || tess.indexCount + indexCount > 0x100000)
        RB_TessOverflow();
    for (int index = 0; index < indexCount; ++index)
        tess.indices[tess.indexCount + index] = (unsigned short)(tess.vertexCount + indices[index]);
    for (int vertex = 0; vertex < vertexCount; ++vertex)
        RB_SetLitVertex4D(tess.vertexCount + vertex, xyzw[vertex][0], xyzw[vertex][1],
            xyzw[vertex][2], xyzw[vertex][3], normals[vertex][0], normals[vertex][1],
            normals[vertex][2], texCoords[vertex][0], texCoords[vertex][1], colors + vertex);
    tess.indexCount += indexCount;
    tess.vertexCount += vertexCount;
    RB_EndSurface();
}

// PINNED 10031e90, command32: signed short counts determine the five packed arrays.
static void RB_DrawTrianglesCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdDrawTriangles *cmd = (const GfxCmdDrawTriangles *)state->cmd;
    int count = cmd->vertexCount;
    const byte *positions = (const byte *)cmd + sizeof(*cmd);
    const byte *normals = positions + count * 16;
    const byte *colors = normals + count * 12;
    const byte *texCoords = colors + count * 4;
    const unsigned short *indices = (const unsigned short *)(texCoords + count * 8);
    RB_DrawTriangles(cmd->material, cmd->techType, cmd->indexCount, indices, cmd->vertexCount,
        (const float (*)[4])positions, (const float (*)[3])normals,
        (const GfxColor *)colors, (const float (*)[2])texCoords);
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// Backend point geometry.
void RB_ProjectionMatrixChanged();
void RB_SetViewMatrix(const D3DMATRIX *matrix);

// PINNED 10030de0: size stays captured; geometry follows any overflow callback.
static void RB_DrawPoints2D(const GfxCmdDrawPoints *cmd)
{
    const Material *material = rgp.whiteMaterial;
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    float halfSize = cmd->size * 0.5f;
    const GfxPointVertex *point = cmd->verts;
    for (int index = 0; index < cmd->pointCount; ++index, ++point)
    {
        if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
            RB_TessOverflow();
        int first = tess.indexCount;
        int base = tess.vertexCount;
        tess.indices[first] = (unsigned short)(base + 1);
        tess.indices[first + 1] = (unsigned short)base;
        tess.indices[first + 2] = (unsigned short)(base + 2);
        tess.indices[first + 3] = (unsigned short)(base + 2);
        tess.indices[first + 4] = (unsigned short)base;
        tess.indices[first + 5] = (unsigned short)(base + 3);
        tess.indexCount += 6;
        const GfxColor *color = (const GfxColor *)point->color;
        RB_SetVertex4D(tess.vertexCount, point->xyz[0] - halfSize,
            point->xyz[1] - halfSize, point->xyz[2], 1.0f, 0.0f, 0.0f, color);
        RB_SetVertex4D(tess.vertexCount + 1, point->xyz[0] - halfSize,
            point->xyz[1] + halfSize, point->xyz[2], 1.0f, 0.0f, 1.0f, color);
        RB_SetVertex4D(tess.vertexCount + 2, point->xyz[0] + halfSize,
            point->xyz[1] + halfSize, point->xyz[2], 1.0f, 1.0f, 1.0f, color);
        RB_SetVertex4D(tess.vertexCount + 3, point->xyz[0] + halfSize,
            point->xyz[1] - halfSize, point->xyz[2], 1.0f, 1.0f, 0.0f, color);
        tess.vertexCount += 4;
    }
}

// PINNED 10031070: retain clip coordinates across overflow, restore the live view.
static void RB_DrawPoints3D(const GfxCmdDrawPoints *cmd)
{
    const Material *material = rgp.pointMaterial;
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    D3DMATRIX identity;
    MatrixIdentity44(identity.m);
    backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0] = identity;
    RB_ProjectionMatrixChanged();
    RB_SetViewMatrix(&identity);
    const D3DMATRIX *matrix = &backEnd.viewParms->viewProjectionMatrix;
    float size = (float)cmd->size;
    float scaleX = size / (float)dxState.renderTargetWidth;
    float scaleY = size / (float)dxState.renderTargetHeight;
    const GfxPointVertex *point = cmd->verts;
    for (int index = 0; index < cmd->pointCount; ++index, ++point)
    {
        float clip[4];
        for (int component = 0; component < 4; ++component)
            clip[component] = point->xyz[2] * matrix->m[2][component]
                + point->xyz[1] * matrix->m[1][component]
                + point->xyz[0] * matrix->m[0][component] + matrix->m[3][component];
        float offsetX = clip[3] * scaleX;
        float offsetY = clip[3] * scaleY;
        clip[2] -= clip[3] * 0.001f;
        if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
            RB_TessOverflow();
        int first = tess.indexCount;
        int base = tess.vertexCount;
        tess.indices[first] = (unsigned short)(base + 3);
        tess.indices[first + 1] = (unsigned short)base;
        tess.indices[first + 2] = (unsigned short)(base + 2);
        tess.indices[first + 3] = (unsigned short)(base + 2);
        tess.indices[first + 4] = (unsigned short)base;
        tess.indices[first + 5] = (unsigned short)(base + 1);
        tess.indexCount += 6;
        const GfxColor *color = (const GfxColor *)point->color;
        RB_SetVertex4D(tess.vertexCount, clip[0] - offsetX, clip[1] - offsetY,
            clip[2], clip[3], 0.0f, 0.0f, color);
        RB_SetVertex4D(tess.vertexCount + 1, clip[0] - offsetX, clip[1] + offsetY,
            clip[2], clip[3], 0.0f, 1.0f, color);
        RB_SetVertex4D(tess.vertexCount + 2, clip[0] + offsetX, clip[1] + offsetY,
            clip[2], clip[3], 1.0f, 1.0f, color);
        RB_SetVertex4D(tess.vertexCount + 3, clip[0] + offsetX, clip[1] - offsetY,
            clip[2], clip[3], 1.0f, 0.0f, color);
        tess.vertexCount += 4;
    }
    RB_EndSurface();
    RB_SetMatricesForView(backEnd.viewParms);
}

// PINNED 10031420, command30: the cursor is reloaded after drawing.
static void RB_DrawPointsCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdDrawPoints *cmd = (const GfxCmdDrawPoints *)state->cmd;
    if (backEnd.projection2D)
        RB_DrawPoints2D(cmd);
    else
        RB_DrawPoints3D(cmd);
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// Backend line geometry.
struct GfxLineMaterialStateView
{
    byte prefix[0x2c];
    unsigned int stateBits[2];
};
typedef char lineMaterialStateLayoutCheck[(offsetof(GfxLineMaterialStateView, stateBits) + sizeof(unsigned int) == 0x30) ? 1 : -1];

// PINNED 10031470: PC takes no width; perpendicular offsets precede overflow.
static void RB_DrawLines2D(int count, const GfxPointVertex *verts)
{
    const Material *material = rgp.whiteMaterial;
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    for (; count > 0; --count, verts += 2)
    {
        float delta[2];
        delta[0] = verts[1].xyz[1] - verts[0].xyz[1];
        delta[1] = verts[0].xyz[0] - verts[1].xyz[0];
        Vec2Normalize(delta);
        delta[0] *= 0.5f;
        delta[1] *= 0.5f;
        if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
            RB_TessOverflow();
        int first = tess.indexCount;
        int base = tess.vertexCount;
        tess.indices[first] = (unsigned short)(base + 1);
        tess.indices[first + 1] = (unsigned short)base;
        tess.indices[first + 2] = (unsigned short)(base + 2);
        tess.indices[first + 3] = (unsigned short)(base + 2);
        tess.indices[first + 4] = (unsigned short)base;
        tess.indices[first + 5] = (unsigned short)(base + 3);
        tess.indexCount += 6;
        RB_SetVertex3D(tess.vertexCount, verts[0].xyz[0] - delta[0],
            verts[0].xyz[1] - delta[1], verts[0].xyz[2], 0.0f, 0.0f, (const GfxColor *)verts[0].color);
        RB_SetVertex3D(tess.vertexCount + 1, verts[1].xyz[0] - delta[0],
            verts[1].xyz[1] - delta[1], verts[1].xyz[2], 0.0f, 1.0f, (const GfxColor *)verts[1].color);
        RB_SetVertex3D(tess.vertexCount + 2, verts[1].xyz[0] + delta[0],
            verts[1].xyz[1] + delta[1], verts[1].xyz[2], 1.0f, 1.0f, (const GfxColor *)verts[1].color);
        RB_SetVertex3D(tess.vertexCount + 3, verts[0].xyz[0] + delta[0],
            verts[0].xyz[1] + delta[1], verts[0].xyz[2], 1.0f, 0.0f, (const GfxColor *)verts[0].color);
        tess.vertexCount += 4;
    }
}

// PINNED 10031780: debug callers also pass depthTest0; command31 passes1.
void RB_DrawLines3D(int count, int width, const GfxPointVertex *verts, bool depthTest)
{
    const Material *material = rgp.lineMaterial;
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    if (!depthTest)
    {
        // Preserve both PC stores without claiming historical volatile provenance.
        volatile unsigned int *bits = &((GfxLineMaterialStateView *)rgp.lineMaterial)->stateBits[1];
        unsigned int cleared = *bits & ~0xeu;
        *bits = cleared;
        *bits = cleared | 2;
    }
    D3DMATRIX identity;
    MatrixIdentity44(identity.m);
    backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0] = identity;
    RB_ProjectionMatrixChanged();
    RB_SetViewMatrix(&identity);
    const D3DMATRIX *matrix = &backEnd.viewParms->viewProjectionMatrix;
    float scaleX = (float)width / (float)dxState.renderTargetWidth;
    float scaleY = (float)width / (float)dxState.renderTargetHeight;
    for (; count > 0; --count, verts += 2)
    {
        float from[4], to[4];
        from[0] = verts[0].xyz[0] * matrix->m[0][0] + verts[0].xyz[1] * matrix->m[1][0]
            + verts[0].xyz[2] * matrix->m[2][0] + matrix->m[3][0];
        from[1] = verts[0].xyz[1] * matrix->m[1][1] + verts[0].xyz[2] * matrix->m[2][1]
            + verts[0].xyz[0] * matrix->m[0][1] + matrix->m[3][1];
        from[2] = verts[0].xyz[2] * matrix->m[2][2] + verts[0].xyz[0] * matrix->m[0][2]
            + verts[0].xyz[1] * matrix->m[1][2] + matrix->m[3][2];
        from[3] = verts[0].xyz[1] * matrix->m[1][3] + verts[0].xyz[2] * matrix->m[2][3]
            + verts[0].xyz[0] * matrix->m[0][3] + matrix->m[3][3];
        to[0] = verts[1].xyz[2] * matrix->m[2][0] + verts[1].xyz[1] * matrix->m[1][0]
            + verts[1].xyz[0] * matrix->m[0][0] + matrix->m[3][0];
        to[1] = verts[1].xyz[2] * matrix->m[2][1] + verts[1].xyz[1] * matrix->m[1][1]
            + verts[1].xyz[0] * matrix->m[0][1] + matrix->m[3][1];
        to[2] = verts[1].xyz[0] * matrix->m[0][2] + verts[1].xyz[2] * matrix->m[2][2]
            + verts[1].xyz[1] * matrix->m[1][2] + matrix->m[3][2];
        to[3] = verts[1].xyz[2] * matrix->m[2][3] + verts[1].xyz[1] * matrix->m[1][3]
            + verts[1].xyz[0] * matrix->m[0][3] + matrix->m[3][3];
        float delta[2];
        delta[0] = from[3] * to[1] - from[1] * to[3];
        delta[1] = from[0] * to[3] - from[3] * to[0];
        Vec2Normalize(delta);
        delta[0] *= scaleX;
        delta[1] *= scaleY;
        float fromX = from[3] * delta[0], fromY = from[3] * delta[1];
        float toX = to[3] * delta[0], toY = to[3] * delta[1];
        if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
            RB_TessOverflow();
        int first = tess.indexCount;
        int base = tess.vertexCount;
        tess.indices[first] = (unsigned short)(base + 3);
        tess.indices[first + 1] = (unsigned short)base;
        tess.indices[first + 2] = (unsigned short)(base + 2);
        tess.indices[first + 3] = (unsigned short)(base + 2);
        tess.indices[first + 4] = (unsigned short)base;
        tess.indices[first + 5] = (unsigned short)(base + 1);
        tess.indexCount += 6;
        RB_SetVertex4D(tess.vertexCount, from[0] - fromX, from[1] - fromY,
            from[2], from[3], 0.0f, 0.0f, (const GfxColor *)verts[0].color);
        RB_SetVertex4D(tess.vertexCount + 1, to[0] - toX, to[1] - toY,
            to[2], to[3], 0.0f, 1.0f, (const GfxColor *)verts[1].color);
        RB_SetVertex4D(tess.vertexCount + 2, to[0] + toX, to[1] + toY,
            to[2], to[3], 1.0f, 1.0f, (const GfxColor *)verts[1].color);
        RB_SetVertex4D(tess.vertexCount + 3, from[0] + fromX, from[1] + fromY,
            from[2], from[3], 1.0f, 0.0f, (const GfxColor *)verts[0].color);
        tess.vertexCount += 4;
    }
    RB_EndSurface();
    RB_SetMatricesForView(backEnd.viewParms);
    if (!depthTest)
    {
        volatile unsigned int *bits = &((GfxLineMaterialStateView *)rgp.lineMaterial)->stateBits[1];
        unsigned int cleared = *bits & ~0xeu;
        *bits = cleared;
        *bits = cleared | 4;
    }
}

// PINNED 10031cc0: capture signed scalar arguments, advance the live cursor.
static void RB_DrawLinesCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdDrawLines *cmd = (const GfxCmdDrawLines *)state->cmd;
    if (backEnd.projection2D)
        RB_DrawLines2D(cmd->lineCount, cmd->verts);
    else
        RB_DrawLines3D(cmd->lineCount, cmd->width, cmd->verts, true);
    const GfxCmdHeader *header = (const GfxCmdHeader *)state->cmd;
    state->cmd = (const byte *)header + header->byteCount;
}

// Backend presentation.
extern const dvar_t *r_gamma;
extern const dvar_t *r_ignoreHwGamma;
void R_FlushStaticModelCache();
void RB_UpdateLogging();
void R_SetColorMappings();

typedef char framePresentationLayoutCheck[(offsetof(r_backEndGlobals_t, projection2D) == 0x4bd
    && offsetof(DxGlobals, dynamicIndexBuffer) == 0x2d8c
    && offsetof(vidConfig_t, deviceSupportsGamma) == 0x28) ? 1 : -1];

// PINNED 10033b20: present once; a returning fatal error still takes the lost path.
void RB_EndFrame()
{
    RB_LogPrint("***************** RB_SwapBuffers *****************\n\n\n");
    HRESULT result = dx.windows[dx.targetWindowIndex].swapChain->Present(0, 0, 0, 0, 0);
    if (result < 0)
    {
        if (result != D3DERR_DEVICELOST)
            R_Error(ERR_FATAL, "Direct3DDevice9::Present failed: %s\n", DXGetErrorDescription9(result));
        dx.deviceLost = 1;
        R_FlushStaticModelCache();
    }
    dx.dynamicIndexBuffer->used = 0;
    backEnd.projection2D = 0;
    RB_UpdateLogging();
    if (r_gamma->modified || r_ignoreHwGamma->modified)
    {
        ri.Dvar_ClearModified(r_gamma);
        ri.Dvar_ClearModified(r_ignoreHwGamma);
        if (!r_ignoreHwGamma->current.enabled && vidConfig.deviceSupportsGamma)
            R_SetColorMappings();
    }
}

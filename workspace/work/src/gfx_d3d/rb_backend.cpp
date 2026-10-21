// Backend frame driver: GPU fence sync and benchmarking.
#include "r_local.h"
#include "rb_backend.h"

// Mac source places this shared setter in rb_backend, not an inline header.
void RB_SetCodeConstant(int constant, float x, float y, float z, float w)
{
	backEnd.codeConsts[constant][0] = x;
	backEnd.codeConsts[constant][1] = y;
	backEnd.codeConsts[constant][2] = z;
	backEnd.codeConsts[constant][3] = w;
}

// PINNED 106d3194, distinct from frontEndDataOut at 101da9c8.
struct GfxBackEndData;
GfxBackEndData *backEndData;
#include "universal/com_math.h"

struct GfxCmdHeader
{
	unsigned short id, byteCount;
};

struct GfxCmdClearScreen
{
	GfxCmdHeader header;
	byte whichToClear, stencil;
	float depth;
	float color[4];
};

struct GfxRenderCommandExecState
{
	const void *cmd;
	int stackPos;
	const void *retCmd[2];
};

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

// Same layout as the tess in rb_sky.cpp.
struct GfxTess
{
	char vertexData[0x5a7b0];
	unsigned short *indices;
	char pad[0x1c];
	int indexCount;
	int vertexCount;
};

extern GfxTess tess;

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

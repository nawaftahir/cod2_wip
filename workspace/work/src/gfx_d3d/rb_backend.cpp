// Backend frame driver: GPU fence sync and benchmarking.
#include "r_local.h"
#include "rb_backend.h"
#include "rb_tess.h"
#include <dxerr9.h>
#include "r_tess_dispatch.h"
#include "r_entity.h"

// PINNED: seven surface implementations and the raw-geometry null entry.
GfxTessSurfaceFunction const rb_tessTable[SF_NUM_SURFACE_TYPES] =
{
    RB_TessBad, RB_TessPoly, RB_TessBackEndEntity, RB_TessXModelSkinned,
    RB_TessXModelRigid, RB_TessStaticModelCached, RB_TessTriangles, 0
};

// 2D state, stretch quads and tess overflow.
extern const float identityMatrix44[4][4];
void RB_EndSurface();
void RB_BeginSurface(const Material *material, int technique, int lightmap);
void RB_SetVertex2D(int index, float x, float y, float s, float t, unsigned int color);

#pragma optimize("p", on)
// PINNED 1002e020: preserve unused cache fields and use live state after flush.
void RB_Set2D()
{
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    backEnd.projection2D = 1;
    GfxViewport viewport;
    if (dxState.viewportBehavior == 1)
    {
        viewport.width = dxState.renderTargetWidth;
        viewport.height = dxState.renderTargetHeight;
    }
    else
    {
        viewport = backEnd.sceneViewport;
    }
    D3DMATRIX transform, identity;
    memset(&transform, 0, sizeof(transform));
    memcpy(&identity, identityMatrix44, sizeof(identity));
    float inverseWidth = 1.0f / (float)viewport.width;
    float inverseHeight = 1.0f / (float)viewport.height;
    transform._11 = inverseWidth + inverseWidth;
    transform._22 = inverseHeight * -2.0f;
    transform._41 = -1.0f - inverseWidth;
    transform._42 = inverseHeight + 1.0f;
    transform._44 = 1.0f;
    GfxCodeMatrices *matrices = &backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel];
    matrices->projection.valid[0] = 1;
    matrices->projection.matrix[0] = transform;
    *(unsigned short *)&matrices->projection.valid[1] = 0;
    matrices->projection.valid[3] = 0;
    for (int index = 0; index <= 3; ++index)
    {
        matrices->world.matrix[index] = identity;
        matrices->world.valid[index] = 1;
    }
    matrices->view = matrices->world;
    matrices->worldView = matrices->world;
    matrices->viewProjection = matrices->projection;
    matrices->worldViewProjection = matrices->projection;
    matrices->normalizedWorld = matrices->world;
    matrices->normalizedWorldView = matrices->world;
    matrices->normalizedWorldViewProjection = matrices->world;
    if (r_rendererInUse->current.integer == 2)
    {
        R_DX_CALL(dx.device->SetTransform( (D3DTRANSFORMSTATETYPE)(0 + 256), &identity ));
        R_DX_CALL(dx.device->SetTransform( D3DTS_VIEW, &identity ));
        R_DX_CALL(dx.device->SetTransform( D3DTS_PROJECTION, &transform ));
    }
    backEnd.codeConsts[11][0] = 0.0f;
    backEnd.codeConsts[11][1] = 0.0f;
    backEnd.codeConsts[12][0] = 0.0f;
    backEnd.codeConsts[12][1] = 0.0f;
    backEnd.codeConsts[12][3] = 0.0f;
    backEnd.codeConsts[13][1] = 0.0f;
    backEnd.codeConsts[13][2] = 0.0f;
    backEnd.codeConsts[13][3] = 0.0f;
    backEnd.codeConsts[14][0] = 0.0f;
    backEnd.codeConsts[14][2] = 0.0f;
    backEnd.codeConsts[14][3] = 0.0f;
    backEnd.codeConsts[11][2] = 1.0f;
    backEnd.codeConsts[11][3] = 1.0f;
    backEnd.codeConsts[12][2] = 1.0f;
    backEnd.codeConsts[13][0] = 1.0f;
    backEnd.codeConsts[14][1] = 1.0f;
}
#pragma optimize("", on)

// PINNED 1002df40: resume the current material while preserving declaration type.
void RB_TessOverflow()
{
    int declaration = tess.declType;
    RB_EndSurface();
    RB_BeginSurface(tess.material, tess.techType, tess.lmapIndex);
    if (tess.declType != declaration)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        tess.declType = declaration;
    }
}

// PINNED 1002e850: PC has eight float arguments and a packed color, no stats arg.
void RB_DrawStretchPic(const Material *material, float x, float y, float width, float height,
    float s0, float t0, float s1, float t1, unsigned int color)
{
    if (!backEnd.projection2D)
        RB_Set2D();
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
        RB_TessOverflow();
    int vertex = tess.vertexCount;
    tess.indices[tess.indexCount] = (unsigned short)(vertex + 3);
    tess.indices[tess.indexCount + 1] = (unsigned short)vertex;
    tess.indices[tess.indexCount + 2] = (unsigned short)(vertex + 2);
    tess.indices[tess.indexCount + 3] = (unsigned short)(vertex + 2);
    tess.indices[tess.indexCount + 4] = (unsigned short)vertex;
    tess.indices[tess.indexCount + 5] = (unsigned short)(vertex + 1);
    RB_SetVertex2D(tess.vertexCount, x, y, s0, t0, color);
    float right = x + width;
    RB_SetVertex2D(tess.vertexCount + 1, right, y, s1, t0, color);
    float bottom = y + height;
    RB_SetVertex2D(tess.vertexCount + 2, right, bottom, s1, t1, color);
    RB_SetVertex2D(tess.vertexCount + 3, x, bottom, s0, t1, color);
    tess.vertexCount += 4;
    tess.indexCount += 6;
}

// Backend frame driver.
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
	union { DWORD packed; byte array[4]; } nativeColor;
	R_QuantizeCachedColor(color, nativeColor.array);
	R_DX_CALL(dx.device->Clear( 0, 0, clearFlags, nativeColor.packed, depth, stencil ));
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

// PINNED PC backend dvar updates, 10033c50/207.
extern const dvar_t *r_textureMode;
extern const dvar_t *r_anisotropy;
extern const dvar_t *r_cosinePowerMapShift;
extern const dvar_t *r_outdoorFeather;
extern const dvar_t *r_aaAlpha;
void RB_DecideDefaultSamplerState();
void RB_SetAnisotropy();
void RB_SetAlphaAntiAliasingState(int stateBits0);
void Image_RebuildCosinePowerMap(float shift);

typedef char backendDvarFieldsCheck[(offsetof(r_backEndGlobals_t, codeConsts) + 50 * 16 == 0x320
    && offsetof(DxGlobals, hasTransparencyMsaa) == 0x2d7e
    && offsetof(DxState, activeStateBits) == 0x2008) ? 1 : -1];

// The private PC helper name is unconfirmed.
void RB_UpdateBackendDvars()
{
    if (r_textureMode->modified)
    {
        ri.Dvar_ClearModified(r_textureMode);
        RB_DecideDefaultSamplerState();
    }
    if (r_anisotropy->modified)
    {
        ri.Dvar_ClearModified(r_anisotropy);
        RB_SetAnisotropy();
    }
    if (r_cosinePowerMapShift->modified)
    {
        ri.Dvar_ClearModified(r_cosinePowerMapShift);
        Image_RebuildCosinePowerMap(r_cosinePowerMapShift->current.value);
    }
    if (r_outdoorFeather->modified)
    {
        ri.Dvar_ClearModified(r_outdoorFeather);
        float value = r_outdoorFeather->current.value;
        backEnd.codeConsts[50][0] = value;
        backEnd.codeConsts[50][1] = value;
        backEnd.codeConsts[50][2] = value;
        backEnd.codeConsts[50][3] = value;
    }
    if (r_aaAlpha->modified)
    {
        ri.Dvar_ClearModified(r_aaAlpha);
        if (dx.hasTransparencyMsaa)
            RB_SetAlphaAntiAliasingState(dxState.activeStateBits[0]);
    }
}

// PINNED PC text drawing, 10032370..10032c92.

#include "r_font.h"
struct GfxCmdDrawText
{
    GfxCmdHeader header;
    float x, y;
    Font_s *font;
    float xScale, yScale;
    unsigned int color;
    int style, cursorPos;
    char cursor;
    int maxChars;
    char text[3];
};
struct GfxCmdDrawTextInSpace
{
    GfxCmdHeader header;
    float org[3];
    Font_s *font;
    float xPixelStep[3], yPixelStep[3];
    unsigned int color;
    char text[4];
};
typedef char commandTextLayoutCheck[(sizeof(Glyph) == 24 && sizeof(Font_s) == 20
    && offsetof(Glyph, s0) == 8 && offsetof(Font_s, material) == 12
    && offsetof(GfxCmdDrawText, color) == 24 && offsetof(GfxCmdDrawText, maxChars) == 40
    && offsetof(GfxCmdDrawText, text) == 44
    && offsetof(GfxCmdDrawTextInSpace, font) == 16
    && offsetof(GfxCmdDrawTextInSpace, color) == 44
    && offsetof(GfxCmdDrawTextInSpace, text) == 48) ? 1 : -1];

void RB_LookupColor(byte c, byte *color)
{
    static const byte color_table[8][4] = {
        {0, 0, 0, 255}, {255, 0, 0, 255}, {0, 255, 0, 255}, {255, 255, 0, 255},
        {0, 0, 255, 255}, {0, 255, 255, 255}, {255, 0, 255, 255}, {255, 255, 255, 255}
    };
    unsigned int index = (byte)(c - '0');
    if (index >= 10)
        index = 7;
    if (index < 8)
        memcpy(color, color_table[index], 4);
    else if (c == '8')
        memcpy(color, &backEnd.color_allies, 4);
    else if (c == '9')
        memcpy(color, &backEnd.color_axis, 4);
    else
        color[0] = color[1] = color[2] = color[3] = 255;
}

// Private name unconfirmed; the PC cursor has one pass and signed time division.
static void RB_DrawTextCursor(const Material *material, char cursor, float x, float y,
    Font_s *font, float xScale, float yScale, GfxColor color)
{
    if ((ri.Milliseconds() / 256) & 1)
        return;
    Glyph *glyph = R_GetCharacterGlyph(font, (byte)cursor);
    RB_DrawStretchPic(material, x, glyph->y0 * yScale + y,
        glyph->pixelWidth * xScale, glyph->pixelHeight * yScale,
        glyph->s0, glyph->t0, glyph->s1, glyph->t1, color);
}

static void RB_DrawTextWithCursor(const char *text, int maxChars, Font_s *font,
    float x, float y, float xScale, float yScale, GfxColor color,
    int style, int cursorPos, char cursor)
{
    const Material *material = font->material;
    GfxColor newColor = color;
    GfxColor black = color & 0xff000000;
    x -= xScale * 0.5f;
    y -= yScale * 0.5f;
    float startX = x;
    float xOffset = 0.0f;
    int count = 0;
    while (*text && maxChars)
    {
        unsigned int letter = ri.SEH_ReadCharFromString(&text, 0);
        if (letter == '^' && text && *text != '^' && *text >= '0' && *text <= '9')
        {
            if ((byte)(*text - '0') == 7)
                newColor = color;
            else
            {
                byte rgba[4];
                RB_LookupColor((byte)*text, rgba);
                newColor = (color & 0xff000000) | (rgba[0] << 16) | (rgba[1] << 8) | rgba[2];
            }
            ++text;
            count += 2;
            continue;
        }
        if (letter == '\n')
        {
            y += font->pixelHeight * yScale;
            x = startX;
            continue;
        }
        if (letter == '\r')
        {
            x = startX;
            continue;
        }
        Glyph *glyph = R_GetCharacterGlyph(font, letter);
        xOffset = glyph->x0 * xScale;
        float yOffset = glyph->y0 * yScale;
        if (style == 3 || style == 6)
        {
            float offset = (float)(byte)((style != 3) + 1);
            RB_DrawStretchPic(material, offset + xOffset + x, yOffset + offset + y,
                glyph->pixelWidth * xScale, glyph->pixelHeight * yScale,
                glyph->s0, glyph->t0, glyph->s1, glyph->t1, black);
        }
        float glyphX = xOffset + x;
        RB_DrawStretchPic(material, glyphX, yOffset + y,
            glyph->pixelWidth * xScale, glyph->pixelHeight * yScale,
            glyph->s0, glyph->t0, glyph->s1, glyph->t1, newColor);
        if (count == cursorPos)
            RB_DrawTextCursor(material, cursor, glyphX, y, font, xScale, yScale, newColor);
        ++count;
        --maxChars;
        x += glyph->dx * xScale;
    }
    if (count == cursorPos)
        RB_DrawTextCursor(material, cursor, xOffset + x, y, font, xScale, yScale, newColor);
}

static void RB_DrawTextCmd(GfxRenderCommandExecState *execState)
{
    const GfxCmdDrawText *cmd = (const GfxCmdDrawText *)execState->cmd;
    RB_DrawTextWithCursor(cmd->text, cmd->maxChars, cmd->font, cmd->x, cmd->y,
        cmd->xScale, cmd->yScale, cmd->color, cmd->style, cmd->cursorPos, cmd->cursor);
    const byte *next = (const byte *)execState->cmd;
    execState->cmd = next + ((const GfxCmdHeader *)next)->byteCount;
}

// Private name unconfirmed; PC 10032890 uses a 16-bit index write cursor.
static void RB_DrawTextQuad(const Material *material, const float *org,
    const float *width, const float *height, const Glyph *glyph, GfxColor color)
{
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    if (tess.vertexCount + 4 > 5450 || tess.indexCount + 6 > 0x100000)
        RB_TessOverflow();
    int vertex = tess.vertexCount;
    unsigned short index = (unsigned short)tess.indexCount;
    tess.vertexCount += 4;
    tess.indexCount += 6;
    tess.indices[index] = (unsigned short)(vertex + 3);
    tess.indices[index + 1] = (unsigned short)vertex;
    tess.indices[index + 2] = (unsigned short)(vertex + 2);
    tess.indices[index + 3] = (unsigned short)(vertex + 2);
    tess.indices[index + 4] = (unsigned short)vertex;
    tess.indices[index + 5] = (unsigned short)(vertex + 1);
    vertex = (unsigned short)vertex;
    RB_SetVertex3D(vertex, org[0], org[1], org[2], glyph->s0, glyph->t0, &color);
    RB_SetVertex3D(vertex + 1, org[0] + width[0], width[1] + org[1], org[2] + width[2],
        glyph->s1, glyph->t0, &color);
    RB_SetVertex3D(vertex + 2, org[0] + width[0] + height[0], width[1] + org[1] + height[1],
        org[2] + width[2] + height[2], glyph->s1, glyph->t1, &color);
    RB_SetVertex3D(vertex + 3, org[0] + height[0], org[1] + height[1], org[2] + height[2],
        glyph->s0, glyph->t1, &color);
}

void RB_DrawTextInSpace(const char *text, Font_s *font, const float *org,
    const float *xPixelStep, const float *yPixelStep, GfxColor color)
{
    const Material *material = font->material;
    RB_SetMatricesForView(backEnd.viewParms);
    float start[3];
    start[0] = org[0] - xPixelStep[0] * 0.5f - yPixelStep[0] * 0.5f;
    start[1] = org[1] - xPixelStep[1] * 0.5f - yPixelStep[1] * 0.5f;
    start[2] = org[2] - xPixelStep[2] * 0.5f - yPixelStep[2] * 0.5f;
    while (*text)
    {
        unsigned int letter = ri.SEH_ReadCharFromString(&text, 0);
        Glyph *glyph = R_GetCharacterGlyph(font, letter);
        float pos[3], width[3], height[3];
        for (int axis = 0; axis < 3; ++axis)
        {
            pos[axis] = glyph->x0 * xPixelStep[axis] + start[axis] + glyph->y0 * yPixelStep[axis];
            width[axis] = glyph->pixelWidth * xPixelStep[axis];
            height[axis] = glyph->pixelHeight * yPixelStep[axis];
        }
        RB_DrawTextQuad(material, pos, width, height, glyph, color);
        for (int axis = 0; axis < 3; ++axis)
            start[axis] += glyph->dx * xPixelStep[axis];
    }
}

static void RB_DrawTextInSpaceCmd(GfxRenderCommandExecState *execState)
{
    const GfxCmdDrawTextInSpace *cmd = (const GfxCmdDrawTextInSpace *)execState->cmd;
    RB_DrawTextInSpace(cmd->text, cmd->font, cmd->org, cmd->xPixelStep, cmd->yPixelStep, cmd->color);
    const byte *next = (const byte *)execState->cmd;
    execState->cmd = next + ((const GfxCmdHeader *)next)->byteCount;
}

// Backend sprite command.
void RB_TessEntity(const GfxEntity *ent);

// PINNED 1002eff0: capture packet, read fields after callbacks, advance live cursor.
static void RB_DrawSpriteCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdDrawSprite *cmd = (const GfxCmdDrawSprite *)state->cmd;
    if (backEnd.projection2D)
        RB_Set3D();
    const Material *material = cmd->material;
    if (tess.material != material || tess.techType != 3)
    {
        if (tess.indexCount || tess.optimizedIndexCount)
            RB_EndSurface();
        RB_BeginSurface(material, 3, 31);
    }
    GfxEntity entity;
    memset(&entity, 0, sizeof(entity));
    entity.reType = RT_SPRITE;
    entity.renderFxFlags = cmd->renderFxFlags;
    for (int axis = 0; axis < 3; ++axis)
        entity.origin[axis] = cmd->pos[axis];
    entity.customMaterial = cmd->material;
    memcpy(entity.materialRGBA, &cmd->rgbaColor, sizeof(entity.materialRGBA));
    entity.radius[0] = entity.radius[1] = cmd->radius;
    entity.minScreenRadius = cmd->minScreenRadius;
    RB_TessEntity(&entity);
    const byte *next = (const byte *)state->cmd;
    state->cmd = next + ((const GfxCmdHeader *)next)->byteCount;
}

// Backend draw-surface dispatch.
struct GfxDrawSurf
{
    unsigned int sort;
    const surfaceType_t *surface;
};
struct GfxDrawMaterialView
{
    byte beforeState[0x2c];
    unsigned int stateBits[2];
    unsigned short textureCount, constantCount;
    struct TechniqueSet { const char *name; const void *techniques[34]; } *techniqueSet;
};
typedef char drawMaterialLayoutCheck[(offsetof(GfxDrawMaterialView, techniqueSet) == 0x38
    && sizeof(GfxDrawSurf) == 8) ? 1 : -1];
enum GfxFogOffset { FOG_OFFSET_NONE, FOG_OFFSET_LINEAR, FOG_OFFSET_EXP, FOG_OFFSET_COUNT };
GfxFogOffset RB_FogOffset();
extern const dvar_t *r_depthPrepassModels, *r_drawDecals;
void RB_PushMatrixStack();
void RB_PopMatrixStack();
void RB_SetDepthRange(float nearValue, float farValue);
void RB_SetDepthHackNearClip(float nearClip);
void RB_ProjectionMatrixChanged();
void RB_UpdateViewport();
void MatrixSet44(float out[4][4], const vec3_t origin, const vec3_t axis[3], float scale);

// PINNED 1019806c: entity types whose vertices already use world coordinates.
static const Bool refEntIsInWorldSpace[10] = {0,0,0,0,1,1,0,1,1,1};

// PINNED 1002f2a0: keep the fractional frame time for both render paths.
static void RB_SetMaterialTime(float time)
{
    float fraction = (float)(time - floor((double)time));
    if (r_rendererInUse->current.integer == 2)
        backEnd.texScrollAmountDx7 = fraction;
    else
    {
        float sine, cosine;
        FastSinCos(fraction * 6.2831855f, &sine, &cosine);
        backEnd.codeConsts[2][0] = sine;
        backEnd.codeConsts[2][1] = cosine;
        backEnd.codeConsts[2][2] = fraction;
        backEnd.codeConsts[2][3] = time;
    }
}

// PINNED 1002f330: choose the light source and filter model depth passes.
static int RB_DrawSurfTechnique(int technique, int entityIndex, int lightmap)
{
    if (technique == 6 && lightmap == 31)
    {
        if (entityIndex == 2046)
            technique = 9;
        else if (entityIndex == 2047)
            technique = 15;
        else
            technique = backEnd.sceneDef.entities[entityIndex].reType == RT_STATICMODEL ? 12 : 9;
        return technique + RB_FogOffset();
    }
    if (!r_depthPrepassModels->current.enabled && (technique == 0 || technique == 2))
    {
        if (entityIndex == 2047 || (entityIndex < 2046
            && backEnd.sceneDef.entities[entityIndex].reType <= RT_STATICMODEL
            && !(backEnd.sceneDef.entities[entityIndex].renderFxFlags & 0x100)))
            return -1;
    }
    if (technique >= 3 && technique <= 26)
        technique += RB_FogOffset();
    return technique;
}

// PINNED 1002f430: sorted runs share surfaces only across compatible entities.
static void RB_RenderDrawSurfList(GfxDrawSurf *drawSurfs, int count, int technique, int order)
{
    const Material *previousMaterial = 0;
    int previousLightmap = 31, previousTechnique = technique, previousEntity = 2046;
    unsigned int previousSort = 0xffffffff;
    float materialTime = 0.0f, previousTime = 3.402823466e+38F;
    bool ignored = false, previousWorldSpace = true, worldSpace = true;
    int depthRange = 0;
    backEnd.currentEntity = (GfxEntity *)&backEnd.worldEntityReType;
    backEnd.currentEntityLighting = 0;
    GfxDrawSurf *drawSurf = order ? drawSurfs + count - 1 : drawSurfs;
    int step = order ? -1 : 1;
    for (int remaining = count; remaining > 0; --remaining, drawSurf += step)
    {
        unsigned int sort = drawSurf->sort;
        if (sort != previousSort)
        {
            previousSort = sort;
            bool extended = (sort & 0x80000000) != 0;
            int entityIndex = (sort >> (extended ? 19 : 4)) & 0xfff;
            if (entityIndex >= 2048)
                entityIndex = 2046;
            const Material *material = rgp.sortedMaterials[(sort >> (extended ? 9 : 21)) & 0x3ff];
            int lightmap = (sort >> (extended ? 4 : 16)) & 31;
            int actualTechnique = RB_DrawSurfTechnique(technique, entityIndex, lightmap);
            const GfxDrawMaterialView *view = (const GfxDrawMaterialView *)material;
            if ((!r_drawDecals->current.enabled && (view->stateBits[1] & 0x30))
                || actualTechnique == -1 || !view->techniqueSet->techniques[actualTechnique])
            {
                ignored = true;
                continue;
            }
            ignored = false;
            bool mergeable = true;
            if (entityIndex != previousEntity)
            {
                worldSpace = entityIndex == 2046 || entityIndex == 2047
                    || refEntIsInWorldSpace[backEnd.sceneDef.entities[entityIndex].reType] != 0;
                mergeable = worldSpace && previousWorldSpace;
                materialTime = entityIndex == 2046 ? 0.0f
                    : backEnd.sceneDef.entities[entityIndex].materialTime;
            }
            if (material != previousMaterial || lightmap != previousLightmap
                || actualTechnique != previousTechnique || materialTime != previousTime || !mergeable)
            {
                if (tess.indexCount || tess.optimizedIndexCount)
                    RB_EndSurface();
                if (materialTime != previousTime)
                    RB_SetMaterialTime(backEnd.sceneDef.floatTime - materialTime);
                RB_BeginSurface(material, actualTechnique, lightmap);
                previousMaterial = material;
                previousLightmap = lightmap;
                previousTechnique = actualTechnique;
                previousTime = materialTime;
            }
            if (entityIndex != previousEntity)
            {
                if (entityIndex == 2046 || entityIndex == 2047)
                {
                    backEnd.currentEntity = (GfxEntity *)&backEnd.worldEntityReType;
                    backEnd.currentEntityLighting = 0;
                }
                else
                {
                    backEnd.currentEntity = &backEnd.sceneDef.entities[entityIndex];
                    backEnd.currentEntityLighting = backEnd.currentEntity->reType <= RT_XMODEL
                        ? &backEnd.entityLighting[entityIndex] : 0;
                }
                if (worldSpace)
                {
                    if (!previousWorldSpace)
                        RB_PopMatrixStack();
                    if (depthRange)
                    {
                        RB_SetDepthRange(0.0f, 1.0f);
                        depthRange = 0;
                    }
                }
                else
                {
                    if (previousWorldSpace)
                        RB_PushMatrixStack();
                    GfxEntity *entity = backEnd.currentEntity;
                    MatrixSet44(backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].world.matrix[0].m,
                        entity->origin, entity->axis, entity->scale);
                    RB_ChangedWorldMatrix(entity->scale);
                    int nextDepth = backEnd.currentEntity->renderFxFlags & 0x18;
                    if (nextDepth != depthRange)
                    {
                        if (tess.indexCount || tess.optimizedIndexCount)
                            RB_TessOverflow();
                        switch (nextDepth)
                        {
                        case 0: RB_SetDepthRange(0.0f, 1.0f); break;
                        case 8:
                            RB_SetDepthHackNearClip(backEnd.viewParms->depthHackNearClip);
                            RB_SetDepthRange(0.0f, 0.2f);
                            break;
                        case 16: case 24: RB_SetDepthRange(0.0f, 0.5f); break;
                        }
                        if (depthRange == 8)
                        {
                            backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0]._43 =
                                backEnd.viewParms->projectionMatrix._43;
                            RB_ProjectionMatrixChanged();
                        }
                        depthRange = nextDepth;
                    }
                }
                previousWorldSpace = worldSpace;
                previousEntity = entityIndex;
            }
        }
        if (!ignored)
            rb_tessTable[*drawSurf->surface](drawSurf->surface);
    }
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    if (depthRange)
    {
        RB_SetDepthRange(0.0f, 1.0f);
        if (depthRange == 8)
        {
            backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0]._43 =
                backEnd.viewParms->projectionMatrix._43;
            RB_ProjectionMatrixChanged();
        }
    }
    if (!previousWorldSpace)
        RB_PopMatrixStack();
    backEnd.currentEntity = 0;
    backEnd.currentEntityLighting = 0;
}

// PINNED 1002f900: advance the packet before any render callbacks.
static void RB_DrawSurfsCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdDrawSurfs *cmd = (const GfxCmdDrawSurfs *)state->cmd;
    state->cmd = (const byte *)cmd + cmd->header.byteCount;
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    if (backEnd.projection2D)
        RB_Set3D();
    if (backEnd.viewportIsDirty)
        RB_UpdateViewport();
    if (!dxState.viewportIsNull)
        RB_RenderDrawSurfList(cmd->drawSurfs, cmd->drawSurfCount, cmd->techType, cmd->order);
}

// Backend sun commands.
struct GfxCmdSunView { GfxCmdHeader header; int viewIndex; };
void RB_DrawSun(int viewIndex);
void RB_DrawSunPostEffects(int viewIndex);

// PINNED 1002f970: draw directly, then advance the live packet.
static void RB_DrawSunCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdSunView *cmd = (const GfxCmdSunView *)state->cmd;
    RB_DrawSun(cmd->viewIndex);
    const byte *next = (const byte *)state->cmd;
    state->cmd = next + ((const GfxCmdHeader *)next)->byteCount;
}

// PINNED 10030b60: capture packet before the flush; advance live state after effects.
static void RB_DrawSunPostEffectsCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdSunView *cmd = (const GfxCmdSunView *)state->cmd;
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    RB_DrawSunPostEffects(cmd->viewIndex);
    const byte *next = (const byte *)state->cmd;
    state->cmd = next + ((const GfxCmdHeader *)next)->byteCount;
}

// Backend late-post effects.
extern const dvar_t *r_glowRadius[2], *r_glowSkyBleedIntensity[2], *r_glowBloomIntensity[2];
extern const dvar_t *r_glowBloomCutoff, *r_glowBloomDesaturation, *r_showFloatZDebug, *sc_showDebug;
void RB_GlowFilterImage(float radius[2]);
void RB_GaussianFilterImage(float radius, GfxRenderTargetId target);
struct GfxPostWorldView { byte beforeSky[0x20]; GfxImage *skyImage; };

// PINNED 1002ff80: preserve constant27 across four channel mixer draws.
static void RB_DrawResolvedChannelDebug()
{
    float width = dxState.renderTargetWidth * 0.5f;
    float height = dxState.renderTargetHeight * 0.5f;
    float saved[4]; memcpy(saved, backEnd.codeConsts[27], sizeof(saved));
    backEnd.currentFeedbackImage = dx.renderTargets[R_RENDERTARGET_DYNAMICSHADOWS].image;
    float quarterWidth = width * 0.5f, quarterHeight = height * 0.5f;
    RB_SetRenderTarget(R_RENDERTARGET_FRAME_BUFFER);
    for (int channel = 0; channel < 4; ++channel)
    {
        for (int component = 0; component < 4; ++component)
            backEnd.codeConsts[27][component] = component == channel ? 1.0f : 0.0f;
        float x = channel & 1 ? width : quarterWidth;
        float y = channel & 2 ? height : quarterHeight;
        float s = channel & 1 ? 0.5f : 0.25f;
        float t = channel & 2 ? 0.5f : 0.25f;
        RB_DrawStretchPic(rgp.colorChannelMixerMaterial, x, y, quarterWidth, quarterHeight,
            s, t, s + 0.25f, t + 0.25f, 0xffffffff);
        RB_EndSurface();
    }
    memcpy(backEnd.codeConsts[27], saved, sizeof(saved));
}

// PINNED 10030190: three color quadrants and a separate alpha quadrant.
static void RB_DrawFrameColorDebug()
{
    float width = dxState.renderTargetWidth * 0.5f;
    float height = dxState.renderTargetHeight * 0.5f;
    float quarterWidth = width * 0.5f, quarterHeight = height * 0.5f;
    RB_DrawStretchPic(rgp.frameColorDebugMaterial, quarterWidth, quarterHeight, quarterWidth,
        quarterHeight, 0.0f, 0.0f, 1.0f, 1.0f, 0xffff0000);
    RB_DrawStretchPic(rgp.frameColorDebugMaterial, width, quarterHeight, quarterWidth,
        quarterHeight, 0.0f, 0.0f, 1.0f, 1.0f, 0xff00ff00);
    RB_DrawStretchPic(rgp.frameColorDebugMaterial, quarterWidth, height, quarterWidth,
        quarterHeight, 0.0f, 0.0f, 1.0f, 1.0f, 0xff0000ff);
    RB_DrawStretchPic(rgp.frameAlphaDebugMaterial, width, height, quarterWidth,
        quarterHeight, 0.0f, 0.0f, 1.0f, 1.0f, 0xffffffff);
    RB_EndSurface();
}

// PINNED 100302b0: the existence check tests the float-Z SURFACE, not its image.
static void RB_DrawFloatZDebug()
{
    if (!dx.renderTargets[R_RENDERTARGET_FLOAT_Z].colorSurface)
        return;
    float width = dxState.renderTargetWidth * 0.5f;
    float height = dxState.renderTargetHeight * 0.5f;
    float saved[4]; memcpy(saved, backEnd.codeConsts[27], sizeof(saved));
    RB_SetRenderTarget(R_RENDERTARGET_FRAME_BUFFER);
    backEnd.currentFeedbackImage = dx.renderTargets[R_RENDERTARGET_FLOAT_Z].image;
    backEnd.codeConsts[27][0] = 0.001f;
    backEnd.codeConsts[27][1] = backEnd.codeConsts[27][2] = backEnd.codeConsts[27][3] = 0.0f;
    RB_DrawStretchPic(rgp.colorChannelMixerMaterial, width * 0.5f, height * 0.5f,
        width, height, 0.25f, 0.25f, 0.75f, 0.75f, 0xffffffff);
    RB_EndSurface();
    memcpy(backEnd.codeConsts[27], saved, sizeof(saved));
}

// PINNED 100303c0: the dynamic-shadow RGB view uses the original luminance mix.
static void RB_DrawShadowDebug()
{
    float width = dxState.renderTargetWidth * 0.5f;
    float height = dxState.renderTargetHeight * 0.5f;
    float saved[4]; memcpy(saved, backEnd.codeConsts[27], sizeof(saved));
    RB_SetRenderTarget(R_RENDERTARGET_FRAME_BUFFER);
    backEnd.currentFeedbackImage = dx.renderTargets[R_RENDERTARGET_DYNAMICSHADOWS].image;
    backEnd.codeConsts[27][0] = 0.333f;
    backEnd.codeConsts[27][1] = 0.334f;
    backEnd.codeConsts[27][2] = 0.333f;
    backEnd.codeConsts[27][3] = 0.0f;
    RB_DrawStretchPic(rgp.colorChannelMixerMaterial, width * 0.5f, height * 0.5f,
        width, height, 0.25f, 0.25f, 0.75f, 0.75f, 0xffffffff);
    RB_EndSurface();
    memcpy(backEnd.codeConsts[27], saved, sizeof(saved));
}

// PINNED 100304d0: intensity indexing follows the sorted glow radius index.
static void RB_DrawGlowImage(int index, GfxImage *image)
{
    float sky = ((const GfxPostWorldView *)rgp.world)->skyImage
        ? r_glowSkyBleedIntensity[index]->current.value : 0.0f;
    float bloom = r_glowBloomIntensity[index]->current.value;
    const Material *material = sky == 0.0f ? rgp.glowApplyBloomMaterial : rgp.glowApplySkyBleedMaterial;
    backEnd.codeConsts[33][0] = sky;
    backEnd.codeConsts[33][1] = 0.0f;
    backEnd.codeConsts[33][2] = 0.0f;
    backEnd.codeConsts[33][3] = bloom;
    backEnd.currentFeedbackImage = image;
    RB_DrawStretchPic(material, 0.0f, 0.0f, (float)dxState.renderTargetWidth,
        (float)dxState.renderTargetHeight, 0.0f, 0.0f, 1.0f, 1.0f, 0xffffffff);
    RB_EndSurface();
}

// PINNED 10030580: images stay in filter order; intensity index alternates.
static void RB_DrawGlowImages()
{
    int index = backEnd.glowIndexFirst;
    for (int pass = 0; pass < backEnd.glowCount; ++pass)
    {
        RB_DrawGlowImage(index, backEnd.glowImage[pass]);
        index = 1 - index;
    }
    backEnd.glowCount = 0;
}

// PINNED 100305d0: ascending active radii and their original intensity ordering.
static int RB_GetGlowRadii(float radius[2])
{
    radius[0] = 0.0f;
    if (r_glowBloomIntensity[0]->current.value > 0.0f
        || (((const GfxPostWorldView *)rgp.world)->skyImage && r_glowSkyBleedIntensity[0]->current.value > 0.0f))
        radius[0] = r_glowRadius[0]->current.value;
    radius[1] = 0.0f;
    if (r_glowBloomIntensity[1]->current.value > 0.0f
        || (((const GfxPostWorldView *)rgp.world)->skyImage && r_glowSkyBleedIntensity[1]->current.value > 0.0f))
        radius[1] = r_glowRadius[1]->current.value;
    if (radius[1] != 0.0f && (radius[0] == 0.0f || radius[0] > radius[1]))
    {
        float swap = radius[0]; radius[0] = radius[1]; radius[1] = swap;
        return 1;
    }
    return 0;
}

// PINNED 100306b0: float desaturation, no invented pass counters.
static void RB_GenerateGlowImages()
{
    float cutoff = r_glowBloomCutoff->current.value;
    float desaturation = r_glowBloomDesaturation->current.value;
    backEnd.codeConsts[32][0] = cutoff;
    backEnd.codeConsts[32][1] = 1.0f / (1.0f - cutoff);
    backEnd.codeConsts[32][2] = 0.0f;
    backEnd.codeConsts[32][3] = desaturation;
    float radius[2];
    backEnd.glowIndexFirst = RB_GetGlowRadii(radius);
    RB_GlowFilterImage(radius);
}

// PINNED 10030710: small radii use a fixed filter with reduced HIGH alpha.
static void RB_DrawBlur(float radius)
{
    float minimum = ri.GetVirtualWidthFromRealWidth(3.0f);
    unsigned int color = 0xffffffff;
    if (radius < minimum)
    {
        byte alpha = (byte)I_fround(radius / minimum * 255.0f);
        color = (color & 0xffffff) | ((unsigned int)alpha << 24);
        radius = minimum;
    }
    RB_GaussianFilterImage(radius, R_RENDERTARGET_BLURRED_SCREEN);
    RB_SetRenderTarget(R_RENDERTARGET_FRAME_BUFFER);
    backEnd.currentFeedbackImage = dx.renderTargets[R_RENDERTARGET_BLURRED_SCREEN].image;
    RB_DrawStretchPic(rgp.feedbackBlendMaterial, 0.0f, 0.0f, (float)dxState.renderTargetWidth,
        (float)dxState.renderTargetHeight, 0.0f, 0.0f, 1.0f, 1.0f, color);
    RB_EndSurface();
}

// PINNED 100308c0: debug paths are mutually exclusive and ordered.
static void RB_DrawPostDebug()
{
    int debug = r_showFbColorDebug->current.integer;
    if (debug == 1)
        RB_DrawFrameColorDebug();
    else if (r_rendererInUse->current.integer != 2)
    {
        if (debug == 2)
            RB_DrawResolvedChannelDebug();
        else if (r_showFloatZDebug->current.enabled)
            RB_DrawFloatZDebug();
        else if (sc_showDebug->current.enabled)
            RB_DrawShadowDebug();
    }
}

// PINNED 10030ab0: resolve once, glow first, blur second.
static void RB_ApplyLatePostEffects(float blurRadius)
{
    if (backEnd.resolvedSceneTarget == R_RENDERTARGET_NONE)
    {
        RB_CopyBackBufferToSurface(dx.renderTargets[R_RENDERTARGET_RESOLVED_SCENE].image);
        backEnd.resolvedSceneTarget = R_RENDERTARGET_RESOLVED_SCENE;
    }
    if (r_rendererInUse->current.integer != 2 && dx.hasSeparateAlphaBlend
        && r_glow->current.enabled && !r_fullbright->current.enabled)
    {
        RB_GenerateGlowImages();
        RB_SetRenderTarget(R_RENDERTARGET_FRAME_BUFFER);
        RB_DrawGlowImages();
    }
    if (r_rendererInUse->current.integer != 2
        && (r_blur->current.value > 0.0f || blurRadius > 0.0f))
    {
        float blur = r_blur->current.value;
        RB_DrawBlur(sqrtf(blur * blur + blurRadius * blurRadius));
    }
}

struct GfxCmdLatePost { GfxCmdHeader header; float blurRadius; };

// PINNED 10030ba0: capture packet before flush, target after it; advance live cursor.
static void RB_ApplyLatePostEffectsCmd(GfxRenderCommandExecState *state)
{
    const GfxCmdLatePost *cmd = (const GfxCmdLatePost *)state->cmd;
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    GfxRenderTargetId target = dxState.renderTargetId;
    backEnd.resolvedSceneTarget = R_RENDERTARGET_NONE;
    if (RB_NeedsSceneCopy(cmd->blurRadius))
        RB_ApplyLatePostEffects(cmd->blurRadius);
    RB_SetRenderTarget(target);
    RB_DrawPostDebug();
    const byte *next = (const byte *)state->cmd;
    state->cmd = next + ((const GfxCmdHeader *)next)->byteCount;
}

// Complete retail command dispatch.
typedef void (*GfxRenderCommandFunction)(GfxRenderCommandExecState *state);
extern GfxRenderCommandFunction const RB_RenderCommandTable[34];
// PINNED 10190518: command0 terminates; every other slot is a real handler.
GfxRenderCommandFunction const RB_RenderCommandTable[34] =
{
    0,
    RB_GotoCmd,
    RB_CallCmd,
    RB_ReturnCmd,
    RB_SetMaterialColorCmd,
    RB_SetLightPropertiesCmd,
    RB_StencilPlanesCmd,
    RB_SetStencilRefValueCmd,
    RB_SetShadowCookieCmd,
    RB_SetClipPlanesCmd,
    RB_SaveScreenCmd,
    RB_ClearScreenCmd,
    RB_BeginViewCmd,
    RB_SetViewportCmd,
    RB_SetRenderTargetCmd,
    RB_StretchPicCmd,
    RB_StretchPicRotateCmd,
    RB_StretchRawCmd,
    RB_DrawQuadPicCmd,
    RB_DrawSpriteCmd,
    RB_DrawFullScreenColoredQuadCmd,
    RB_DrawTextCmd,
    RB_DrawTextInSpaceCmd,
    RB_DrawSurfsCmd,
    RB_DrawSunCmd,
    RB_ApplyEarlyPostEffectsCmd,
    RB_ApplyLatePostEffectsCmd,
    RB_DrawSunPostEffectsCmd,
    RB_BlurShadowCookieCmd,
    RB_BlendSavedScreenCmd,
    RB_DrawTrianglesCmd,
    RB_DrawLinesCmd,
    RB_DrawPointsCmd,
    RB_TouchAllImagesCmd
};

// GPU fill and transform benchmarks.
extern const dvar_t *r_testFill, *r_testFillEnable, *r_testTransform;
Bool Material_IsDefault(const Material *material);
void MatrixForViewer(float matrix[4][4], const vec3_t origin, const vec3_t axis[3]);
void InfinitePerspectiveMatrix(float matrix[4][4], float fovX, float fovY, float nearClip);

// PINNED 100330c0: count is captured before timing; default aliases return zero.
static float RB_Benchmark2D(const Material *material, float width, float height, int count)
{
    if (Material_IsDefault(material))
        return 0.0f;
    LARGE_INTEGER start, end;
    RB_BeginBenchmarkGpu(&start);
    for (int index = 0; index < count; ++index)
        RB_DrawStretchPic(material, 0.0f, 0.0f, width, height, 0.0f, 0.0f, 1.0f, 1.0f, 0xffffffff);
    RB_EndSurface();
    RB_EndBenchmarkGpu(&end);
    return count / RB_BenchmarkSeconds(&end, &start);
}

// PINNED 100331d0: retail writes all four setup corners to vertex ZERO.
static float RB_Benchmark3D(const Material *material, int technique)
{
    vec3_t origin = {0.0f, 0.0f, 0.0f};
    vec3_t axis[3] = {{1.0f, 0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}, {0.0f, 0.0f, 1.0f}};
    D3DMATRIX view, projection;
    MatrixForViewer(view.m, origin, axis);
    InfinitePerspectiveMatrix(projection.m, 90.0f, 90.0f, 0.9f);
    RB_Set3D();
    RB_PushMatrixStack();
    memcpy(&backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].world.matrix[0], identityMatrix44, 64);
    RB_ChangedWorldMatrix(1.0f);
    RB_SetViewMatrix(&view);
    backEnd.codeMatrixStack[backEnd.codeMatrixStackLevel].projection.matrix[0] = projection;
    RB_ProjectionMatrixChanged();
    backEnd.currentEntity = (GfxEntity *)&backEnd.worldEntityReType;
    backEnd.currentEntityLighting = 0;
    RB_SetCodeConstant(5, 1.0f, 1.0f, 1.0f, 1.0f);
    RB_SetCodeConstant(3, 0.0f, 0.0f, 0.0f, 1.0f);
    RB_SetCodeConstant(11, 0.0f, 0.0f, 0.0f, 1.0f);
    RB_BeginSurface(material, technique, 0);
    vec3_t center;
    for (int component = 0; component < 3; ++component)
        center[component] = origin[component] + axis[0][component];
    GfxColor color = 0xffffffff;
    RB_SetVertex3D(0, center[0] + axis[1][0] + axis[2][0],
        center[1] + axis[1][1] + axis[2][1], center[2] + axis[1][2] + axis[2][2], 0.0f, 0.0f, &color);
    RB_SetVertex3D(0, center[0] - axis[1][0] + axis[2][0],
        center[1] - axis[1][1] + axis[2][1], center[2] - axis[1][2] + axis[2][2], 1.0f, 0.0f, &color);
    RB_SetVertex3D(0, center[0] - axis[1][0] - axis[2][0],
        center[1] - axis[1][1] - axis[2][1], center[2] - axis[1][2] - axis[2][2], 1.0f, 1.0f, &color);
    RB_SetVertex3D(0, center[0] + axis[1][0] - axis[2][0],
        center[1] + axis[1][1] - axis[2][1], center[2] + axis[1][2] - axis[2][2], 0.0f, 1.0f, &color);
    tess.vertexCount = 4;
    int count = r_testFill->current.integer;
    for (int index = 0; index < count; ++index)
    {
        tess.indices[tess.indexCount] = 3;
        tess.indices[tess.indexCount + 1] = 0;
        tess.indices[tess.indexCount + 2] = 2;
        tess.indices[tess.indexCount + 3] = 2;
        tess.indices[tess.indexCount + 4] = 0;
        tess.indices[tess.indexCount + 5] = 1;
        tess.indexCount += 6;
    }
    LARGE_INTEGER start, end;
    RB_BeginBenchmarkGpu(&start);
    RB_EndSurface();
    RB_EndBenchmarkGpu(&end);
    RB_PopMatrixStack();
    return (float)(count / RB_BenchmarkSeconds(&end, &start) / 60.0);
}

// PINNED 100335d0: preserve the live iteration count and original report order.
static void RB_TestFill()
{
    if (!r_testFillEnable->current.enabled)
    {
        ri.Printf(0, "Fill testing uses extra textures and materials, so it is usually unavailable.\n");
        ri.Printf(0, "You must set 'r_testFillEnable' to 1 and vid_restart to test fill rates.\n");
        return;
    }
    ri.Printf(0, "-----------------------------------------------\n");
    ri.Printf(0, "normal fill                 %4.1f overdraw @ 60Hz\n", RB_Benchmark2D(rgp.normalFillMaterial,
        (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight, r_testFill->current.integer) * 0.016666668f);
    ri.Printf(0, "alpha blend fill            %4.1f overdraw @ 60Hz\n", RB_Benchmark2D(rgp.alphaBlendFillMaterial,
        (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight, r_testFill->current.integer) * 0.016666668f);
    ri.Printf(0, "alpha test pass fill        %4.1f overdraw @ 60Hz\n", RB_Benchmark2D(rgp.alphaTestPassFillMaterial,
        (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight, r_testFill->current.integer) * 0.016666668f);
    ri.Printf(0, "alpha test fail fill        %4.1f overdraw @ 60Hz\n", RB_Benchmark2D(rgp.alphaTestFailFillMaterial,
        (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight, r_testFill->current.integer) * 0.016666668f);
    ri.Printf(0, "additive fill               %4.1f overdraw @ 60Hz\n", RB_Benchmark2D(rgp.additiveFillMaterial,
        (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight, r_testFill->current.integer) * 0.016666668f);
    ri.Printf(0, "depth only fill             %4.1f overdraw @ 60Hz\n", RB_Benchmark2D(rgp.depthOnlyFillMaterial,
        (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight, r_testFill->current.integer) * 0.016666668f);
    ri.Printf(0, "1-sided stencil keep fill   %4.1f overdraw @ 60Hz\n", RB_Benchmark2D(rgp.stencilOneSideKeepFillMaterial,
        (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight, r_testFill->current.integer) * 0.016666668f);
    ri.Printf(0, "1-sided stencil reject fill %4.1f overdraw @ 60Hz\n", RB_Benchmark2D(rgp.stencilOneSideRejectFillMaterial,
        (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight, r_testFill->current.integer) * 0.016666668f);
    if (dx.stencilTwoSided)
    {
        ri.Printf(0, "2-sided stencil keep fill   %4.1f overdraw @ 60Hz\n", RB_Benchmark2D(rgp.stencilTwoSideKeepFillMaterial,
            (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight, r_testFill->current.integer) * 0.016666668f);
        ri.Printf(0, "2-sided stencil reject fill %4.1f overdraw @ 60Hz\n", RB_Benchmark2D(rgp.stencilTwoSideRejectFillMaterial,
            (float)dxState.renderTargetWidth, (float)dxState.renderTargetHeight, r_testFill->current.integer) * 0.016666668f);
    }
    ri.Printf(0, "phong point bump fill       %4.1f overdraw @ 60Hz\n", (double)RB_Benchmark3D(rgp.phongBumpFillMaterial, 18));
    ri.Printf(0, "phong point bump+spec fill  %4.1f overdraw @ 60Hz\n", (double)RB_Benchmark3D(rgp.phongBumpSpecFillMaterial, 18));
    ri.Printf(0, "phong dir bump fill         %4.1f overdraw @ 60Hz\n", (double)RB_Benchmark3D(rgp.phongBumpFillMaterial, 9));
    ri.Printf(0, "phong dir bump+spec fill    %4.1f overdraw @ 60Hz\n", (double)RB_Benchmark3D(rgp.phongBumpSpecFillMaterial, 9));
    ri.Printf(0, "-----------------------------------------------\n");
}

// PINNED 100339b0: four static/skinned report values are genuinely zero.
static void RB_TestTransform()
{
    float result = (float)(RB_Benchmark2D(rgp.whiteMaterial, 0.0f, 0.0f, 1362) * 0.016666668f);
    ri.Printf(0, "-----------------------------------------------\n");
    ri.Printf(0, "static vertex data    %8.0f verts/sec @ 60Hz\n", 0.0);
    ri.Printf(0, "static vertex data    %8.0f tris/sec @ 60Hz\n", 0.0);
    ri.Printf(0, "skinned vertex data   %8.0f verts/sec @ 60Hz\n", 0.0);
    ri.Printf(0, "skinned vertex data   %8.0f tris/sec @ 60Hz\n", 0.0);
    ri.Printf(0, "dynamic vertex data   %8.0f verts/sec @ 60Hz\n", (double)result * 4.0);
    ri.Printf(0, "dynamic vertex data   %8.0f tris/sec @ 60Hz\n", (double)result * 2.0);
    ri.Printf(0, "-----------------------------------------------\n");
}

// Render-command execution.
// Role name from the reference; PINNED standalone zero-initialized word101d0a8c.
int g_disableRendering;
extern const dvar_t *r_skipBackEnd, *developer;
Bool R_RecoverLostDevice();
void RB_DrawDebug(const GfxViewParms *view);
void RB_ChangeIndices(IDirect3DIndexBuffer9 *indices);
void RB_ClearAllStreamSources();

// PINNED 10033d20: recover, begin, dispatch, clean up, benchmark, then fence.
void RB_ExecuteRenderCommands(const void *data)
{
    int disabled = g_disableRendering;
    backEndData = 0;
    if (disabled)
        return;
    if (!dx.deviceLost)
    {
        HRESULT result = dx.device->TestCooperativeLevel();
        if (result == D3DERR_DEVICELOST || result == D3DERR_DEVICENOTRESET)
            dx.deviceLost = 1;
    }
    Bool touchImages = dx.deviceLost;
    if (touchImages && !R_RecoverLostDevice())
        return;
    backEndData = (GfxBackEndData *)data;
    RB_UpdateBackendDvars();
    RB_BeginScene();
    if (touchImages)
        RB_TouchAllImages();
    if (!r_skipBackEnd->current.enabled)
    {
        GfxRenderCommandExecState state;
        // PINNED frame command array begins at219d0c; see r_rendercmds layout check.
        state.cmd = (const byte *)backEndData + 0x219d0c;
        state.stackPos = 0;
        while (((const GfxCmdHeader *)state.cmd)->id)
            RB_RenderCommandTable[((const GfxCmdHeader *)state.cmd)->id](&state);
    }
    else
    {
        if (backEnd.viewportIsDirty)
            RB_UpdateViewport();
        R_DX_CALL(dx.device->Clear( 0, 0, D3DCLEAR_TARGET, 0, 0, 0 ));
    }
    if (tess.indexCount || tess.optimizedIndexCount)
        RB_EndSurface();
    if (backEnd.viewParms && developer->current.integer)
        RB_DrawDebug(backEnd.viewParms);
    if (dxState.indexBuffer)
        RB_ChangeIndices(0);
    RB_ClearAllStreamSources();
    R_DX_CALL(dx.device->EndScene());
    dx.inScene = 0;
    if (r_testFill->current.integer > 0)
    {
        RB_TestFill();
        ri.Dvar_SetInt(r_testFill, 0);
    }
    if (r_testTransform->current.integer > 0)
    {
        RB_TestTransform();
        ri.Dvar_SetInt(r_testTransform, 0);
    }
    if (dx.gpuSync == 2)
        R_FinishGpuFence();
    if (dx.gpuSync == 2 || dx.gpuSync == 3)
        R_InsertGpuFence();
}

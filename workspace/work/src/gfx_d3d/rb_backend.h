// Backend globals shared by the rb_* translation units.
#pragma once

#include <stddef.h>
#include "r_scene_records.h"

struct GfxEntityLighting
{
    int viewCount;
    float sunVisibility;
    float colorForDir[6][4];
};

// Mac type; PINNED PC gamma builders consume exactly256 ushort entries.
struct GfxGammaRamp
{
	unsigned short entries[256];
};

struct GfxViewport
{
	int x;
	int y;
	int width;
	int height;
};

// PINNED PC 1.0: backEnd 0x1072da00, codeMatrixStack 0x1072dee0 (0xcd0 each), level 0x10730550.
__declspec(align(16)) struct GfxCodeMatrix
{
	D3DMATRIX matrix[4];
	Bool valid[4];
};

struct GfxCodeMatrices
{
	float worldScale;
	GfxCodeMatrix world;
	GfxCodeMatrix normalizedWorld;
	GfxCodeMatrix view;
	GfxCodeMatrix projection;
	GfxCodeMatrix worldView;
	GfxCodeMatrix normalizedWorldView;
	GfxCodeMatrix viewProjection;
	GfxCodeMatrix worldViewProjection;
	GfxCodeMatrix normalizedWorldViewProjection;
	GfxCodeMatrix shadowLookupMatrix;
	GfxCodeMatrix lightGridLookupMatrix;
	GfxCodeMatrix worldOutdoorLookup;
};

struct GfxViewParms
{
	float origin[3];
	float axis[3][3];
	D3DVIEWPORT9 viewport;
	D3DMATRIX viewMatrix;
	D3DMATRIX projectionMatrix;
	D3DMATRIX viewProjectionMatrix;
	D3DMATRIX inverseViewProjectionMatrix;
	float depthHackNearClip;
};

struct GfxLightDef;
struct GfxBackEndLightSettings
{
	float position[4], ambient[4], color[4], specular[4];
	GfxLightDef *def;
};

struct r_backEndGlobals_t
{
	float codeConsts[59][4];
	int frameCount;
	int viewCount;
	GfxSceneDef sceneDef;
	const GfxViewParms *viewParms;
	GfxLodParms lodParms;
	GfxViewport sceneViewport;
	D3DMATRIX viewProjectionMatrix;
	int tileIndex;
	int tileCount;
	int width;
	int height;
	GfxEntity *currentEntity;
	GfxEntityLighting *currentEntityLighting;
	int worldEntityReType;	// GfxEntity worldEntity; only its leading reType is modelled
	char worldEntityRest[0x70];
	Bool viewportIsDirty;
	Bool projection2D;
	unsigned char defaultSamplerState;
	char pad1[1];
	unsigned int color_axis;
	unsigned int color_allies;
	unsigned int fogColor;
	int glowIndexFirst;
	int glowCount;
	GfxImage *glowImage[2];
	float texScrollAmountDx7;
	GfxCodeMatrices codeMatrixStack[3];
	int codeMatrixStackLevel;
	int resolvedPostSunTarget;
	int resolvedSceneTarget;
	GfxImage *currentFeedbackImage;
	GfxBackEndLightSettings light[2];
	GfxEntityLighting entityLighting[2046];
	D3DMATRIX shadowLookupMatrix;
	void *debugFont;
};

// PINNED PC 1.0 offsets (R_InitGlobalStructs 0x10012e70 clears 0x36b60 bytes).
typedef char backEndLayoutCheck[
	(offsetof(r_backEndGlobals_t, sceneViewport) == 0x3e0
	&& offsetof(r_backEndGlobals_t, worldEntityReType) == 0x448
	&& offsetof(r_backEndGlobals_t, defaultSamplerState) == 0x4be
	&& offsetof(r_backEndGlobals_t, color_axis) == 0x4c0
	&& offsetof(r_backEndGlobals_t, resolvedPostSunTarget) == 0x2b54
	&& offsetof(r_backEndGlobals_t, currentFeedbackImage) == 0x2b5c
	&& offsetof(r_backEndGlobals_t, light) == 0x2b60
	&& offsetof(r_backEndGlobals_t, glowIndexFirst) == 0x4cc
	&& offsetof(r_backEndGlobals_t, glowImage) == 0x4d4
	&& sizeof(GfxEntityLighting) == 104
	&& offsetof(r_backEndGlobals_t, entityLighting) == 0x2be8
	&& offsetof(GfxViewParms, depthHackNearClip) == 0x148
	&& offsetof(r_backEndGlobals_t, shadowLookupMatrix) == 0x36b18
	&& sizeof(r_backEndGlobals_t) == 0x36b60) ? 1 : -1];

extern r_backEndGlobals_t backEnd;

void RB_SetCodeConstant(int constant, float x, float y, float z, float w);
void RB_UpdateViewportConstants();

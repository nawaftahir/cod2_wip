// PC backend command records; include r_local.h and rb_backend.h first.
#pragma once
#include <stddef.h>
#include "r_scene_records.h"
struct Material;

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

struct GfxCmdJump
{
    GfxCmdHeader header;
    const void *next;
};

struct GfxCmdSetMaterialColor
{
    GfxCmdHeader header;
    float color[4];
};

struct GfxCmdSetViewport
{
    GfxCmdHeader header;
    GfxViewport viewport;
};

struct GfxCmdSetRenderTarget
{
    GfxCmdHeader header;
    GfxRenderTargetId renderTargetId;
};

typedef char commandStateLayoutCheck[(sizeof(GfxRenderCommandExecState) == 16
    && offsetof(GfxRenderCommandExecState, retCmd) == 8
    && sizeof(GfxCmdJump) == 8 && sizeof(GfxCmdSetMaterialColor) == 20
    && sizeof(GfxCmdSetViewport) == 20 && sizeof(GfxCmdSetRenderTarget) == 8) ? 1 : -1];

struct GfxCmdStretchPic
{
    GfxCmdHeader header;
    const Material *material;
    float x, y, w, h, s0, t0, s1, t1;
    unsigned int color;
};

struct GfxCmdStretchPicRotate
{
    GfxCmdHeader header;
    const Material *material;
    float x, y, w, h, s0, t0, s1, t1;
    unsigned int color;
    float rotation;
};

struct GfxCmdDrawQuadPic
{
    GfxCmdHeader header;
    const Material *material;
    float verts[4][2];
    unsigned int color;
};

struct GfxCmdDrawFullScreenColoredQuad
{
    GfxCmdHeader header;
    const Material *material;
    float s0, t0, s1, t1;
    unsigned int color;
};

typedef char command2DLayoutCheck[(sizeof(GfxCmdStretchPic) == 44
    && sizeof(GfxCmdStretchPicRotate) == 48 && sizeof(GfxCmdDrawQuadPic) == 44
    && sizeof(GfxCmdDrawFullScreenColoredQuad) == 28
    && offsetof(GfxCmdStretchPic, color) == 40
    && offsetof(GfxCmdStretchPicRotate, rotation) == 44) ? 1 : -1];

struct GfxLightDef;
struct GfxCmdSetLightProperties
{
    GfxCmdHeader header;
    int lightIndex;
    float position[4], ambient[4], color[4], specular[4];
    GfxLightDef *lightDef;
};

struct GfxCmdSetStencilRefValue
{
    GfxCmdHeader header;
    int refValue;
};

struct GfxCmdSetShadowCookie
{
    GfxCmdHeader header;
    float shadowLookupMatrix[4][4];
    float fade;
};

struct GfxCmdSetClipPlanes
{
    GfxCmdHeader header;
    int clipPlaneCount;
    float clipPlanes[1][4];
};

typedef char commandStatePayloadLayoutCheck[(sizeof(GfxCmdSetLightProperties) == 76
    && offsetof(GfxCmdSetLightProperties, lightDef) == 72
    && sizeof(GfxCmdSetStencilRefValue) == 8
    && sizeof(GfxCmdSetShadowCookie) == 72
    && offsetof(GfxCmdSetShadowCookie, fade) == 68
    && offsetof(GfxCmdSetClipPlanes, clipPlanes) == 8) ? 1 : -1];

struct GfxViewParms;
struct GfxCmdBeginView
{
    GfxCmdHeader header;
    GfxSceneDef sceneDef;
    const GfxViewParms *viewParms;
    GfxLodParms lodParms;
    int viewCount;
};

typedef char commandBeginViewLayoutCheck[(sizeof(GfxCmdBeginView) == 48
    && offsetof(GfxCmdBeginView, viewParms) == 20
    && offsetof(GfxCmdBeginView, lodParms) == 24
    && offsetof(GfxCmdBeginView, viewCount) == 44) ? 1 : -1];

struct GfxCmdStretchRaw
{
    GfxCmdHeader header;
    int x, y, w, h;
    int cols, rows;
    const byte *data;
};

typedef char commandStretchRawLayoutCheck[(sizeof(GfxCmdStretchRaw) == 32
    && offsetof(GfxCmdStretchRaw, cols) == 20
    && offsetof(GfxCmdStretchRaw, data) == 28) ? 1 : -1];

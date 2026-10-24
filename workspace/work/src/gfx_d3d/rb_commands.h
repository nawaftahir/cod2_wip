// PC backend command records; include r_local.h and rb_backend.h first.
#pragma once
#include <stddef.h>
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

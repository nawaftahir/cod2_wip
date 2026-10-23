// PC backend command records; include r_local.h and rb_backend.h first.
#pragma once
#include <stddef.h>

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

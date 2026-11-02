// Render command buffers.
#include "gfx.h"
#include "rb_tess.h"
#include "r_scene_commands.h"
#include <stddef.h>

GfxBackEndData *frontEndDataOut;

// PINNED 10020cb0/10020cc0 and client CL_InitRef: API59 imports166/165.
typedef char effectImportOffsets[
    (offsetof(refimport_t, FX_UpdateBolt) == 166 * 4 &&
     offsetof(refimport_t, FX_UpdateNonBolt) == 165 * 4 &&
     sizeof(refimport_t) == 169 * 4) ? 1 : -1];

void R_UpdateEffectsBolt()
{
    ri.FX_UpdateBolt();
}

void R_UpdateEffectsNonBolt()
{
    ri.FX_UpdateNonBolt();
}

// PINNED 101e4a00: saved frame pointers, lock flag and the debug frame payload.
GfxDebugFrameGlob s_debugFrameGlob;
GfxCmdArray *s_cmdList;

// PINNED 1042e780: normal frame storage, distinct from the embedded debug frame.
static GfxBackEndData s_backEndData;

typedef char debugFrameLayoutCheck[
    (offsetof(GfxDebugFrameGlob, frontEndDataOut) == 12 &&
     offsetof(GfxBackEndData, commands) == 0x219d0c) ? 1 : -1];

extern DxGlobals dx;
void R_UnlockSkinnedCache();
void R_LockSkinnedCache(int lockType);
void RB_ExecuteRenderCommands(const void *data);
void RB_EndFrame();
void RB_AdaptiveGpuSyncTarget();
void R_TransferDebugGlobals(DebugGlobals *debugGlobalsEntry);

typedef char normalFrameLayoutCheck[
    sizeof(GfxBackEndData) == 0x249d6c &&
    offsetof(GfxBackEndData, skinnedCacheVb) == 0x217c78 &&
    offsetof(GfxBackEndData, viewParmCount) == 0x217c7c &&
    offsetof(GfxBackEndData, debugGlobals) == 0x249d18 &&
    offsetof(DxGlobals, skinnedCacheVbPool) == 0x2d90 &&
    offsetof(DxGlobals, dynamicBufferFrame) == 0x2dcc ? 1 : -1];

// PINNED 10021040/143: selecting a normal frame does not reset command counters.
void R_InitFrameBackendData()
{
    frontEndDataOut = &s_backEndData;
    frontEndDataOut->frameCount = ++rg.frameCountInternal;
    R_UnlockSkinnedCache();
    dx.dynamicBufferFrame = (dx.dynamicBufferFrame + 1) % 2;
    GfxBackEndData *data = frontEndDataOut;
    data->skinnedCacheVb = &dx.skinnedCacheVbPool[dx.dynamicBufferFrame];
    data->skinnedCacheVb->used = 0;
    data->drawSurfCount = 0;
    data->surfPos = 0;
    data->entityCount = 0;
    data->polyCount = 0;
    data->polyVertCount = 0;
    data->viewParmCount = 0;
    s_cmdList = &data->commands;
    data->debugGlobals.lineCount = 0;
    data->debugGlobals.stringCount = 0;
    data->debugGlobals.vertCount = 0;
}

// PINNED 10020b50/126: both index allocations belong to tess, not frame storage.
void R_InitRenderCmds()
{
    memset(&s_backEndData.debugGlobals, 0, sizeof(s_backEndData.debugGlobals));
    s_backEndData.debugGlobals.vertLimit = 4096;
    s_backEndData.debugGlobals.polyLimit = 512;
    s_backEndData.debugGlobals.stringLimit = 4096;
    s_backEndData.debugGlobals.lineLimit = 16384;
    s_backEndData.debugGlobals.plumeLimit = 4096;
    tess.indices = (unsigned short *)ri.Hunk_AllocInternal(0x200000);
    tess.secondaryIndices = (unsigned short *)ri.Hunk_AllocInternal(0x200000);
    if (!frontEndDataOut)
        R_InitFrameBackendData();
    else
    {
        frontEndDataOut->commands.usedTotal = 0;
        frontEndDataOut->commands.usedCritical = 0;
        frontEndDataOut->commands.lastCmd = 0;
    }
}

// PINNED in 10013080: release the normal frame's debug storage first.
void R_ShutdownDebugEntry(DebugGlobals *entry);

void R_ShutdownBackendData()
{
    R_ShutdownDebugEntry(&s_backEndData.debugGlobals);
}

// PINNED 10021ff0: API59 slot49; save before unlocking the original cache.
void R_BeginDebugFrame()
{
    if (!rg.registered)
        return;
    s_debugFrameGlob.restoreCmdList = s_cmdList;
    s_debugFrameGlob.restoreFrontEndDataOut = frontEndDataOut;
    if (dx.skinnedCacheLockAddr)
    {
        s_debugFrameGlob.restoreSkinnedCache = 1;
        R_UnlockSkinnedCache();
    }
    s_cmdList = &s_debugFrameGlob.frontEndDataOut.commands;
    frontEndDataOut = &s_debugFrameGlob.frontEndDataOut;
}

// Retail: ids <= 0xe count as critical, 0x15+ reserve space; the exact split in 0xf..0x15 is unobservable.
#define RC_FIRST_NONCRITICAL 0xf

// Non-critical commands leave 0x2000 bytes reserved for critical ones.
static GfxCmdHeader *R_GetCommandBuffer(int renderCmd, int bytes)
{
    GfxCmdHeader *header;
    int sizeLimit;

    sizeLimit = sizeof(s_cmdList->cmds) - s_cmdList->usedTotal;
    if (renderCmd >= RC_FIRST_NONCRITICAL)
        sizeLimit -= 0x2000 - s_cmdList->usedCritical;
    if (bytes > sizeLimit)
    {
        s_cmdList->lastCmd = 0;
        return 0;
    }
    header = (GfxCmdHeader *)&s_cmdList->cmds[s_cmdList->usedTotal];
    s_cmdList->usedTotal += bytes;
    if (renderCmd < RC_FIRST_NONCRITICAL)
        s_cmdList->usedCritical += bytes;
    s_cmdList->lastCmd = header;
    header->id = (unsigned short)renderCmd;
    header->byteCount = (unsigned short)bytes;
    return header;
}

void R_AddCmdTouchAllImages()
{
    R_GetCommandBuffer(0x21, sizeof(GfxCmdHeader));
}

void R_ConvertColorToBytes(const vec_t *colorFloat, byte *colorBytes);

extern const dvar_t *r_lightTweakAmbient;
extern const dvar_t *r_lightTweakDiffuseFraction;
extern const dvar_t *r_lightTweakSunLight;
extern const dvar_t *r_lightTweakAmbientColor;
extern const dvar_t *r_lightTweakSunColor;
extern const dvar_t *r_lightTweakSunDiffuseColor;
extern const dvar_t *r_lightTweakSunDirection;

static bool R_ClearModifiedDvar(const dvar_t *dvar)
{
    if (!dvar->modified)
        return false;
    ri.Dvar_ClearModified(dvar);
    return true;
}

bool R_ClearModifiedLightDvars()
{
    bool changed;

    if (!rgp.world)
        return false;
    changed = R_ClearModifiedDvar(r_lightTweakAmbient);
    changed |= R_ClearModifiedDvar(r_lightTweakDiffuseFraction);
    changed |= R_ClearModifiedDvar(r_lightTweakSunLight);
    changed |= R_ClearModifiedDvar(r_lightTweakAmbientColor);
    changed |= R_ClearModifiedDvar(r_lightTweakSunColor);
    changed |= R_ClearModifiedDvar(r_lightTweakSunDiffuseColor);
    changed |= R_ClearModifiedDvar(r_lightTweakSunDirection);
    return changed;
}

// PC 1.0 layouts of the small commands, PINNED by the retail writers (fields named by role where known).
struct RcCmdDelayedEnd { GfxCmdHeader header; };
struct RcCmdDelayedBegin { GfxCmdHeader header; int marker; };
struct RcCmdBlendSavedScreen { GfxCmdHeader header; int fadeMsec; int unused; };
struct RcCmdId9 { GfxCmdHeader header; RcWords16 data; int extra; };

// PINNED 10021bf0, API59 slot56: these are viewport integers, not clear flags.
void R_AddCmdSetViewport(int x, int y, int width, int height)
{
    GfxCmdSetViewport *cmd;

    cmd = (GfxCmdSetViewport *)R_GetCommandBuffer(0xd, sizeof(GfxCmdSetViewport));
    cmd->viewport.x = x;
    cmd->viewport.y = y;
    cmd->viewport.width = width;
    cmd->viewport.height = height;
}

// PINNED 100222f0, API59 slot54: enqueue blending only for a positive duration.
void R_AddCmdBlendSavedScreen(int fadeMsec)
{
    RcCmdBlendSavedScreen *cmd;

    if (fadeMsec > 0)
    {
        cmd = (RcCmdBlendSavedScreen *)R_GetCommandBuffer(0x1d, sizeof(RcCmdBlendSavedScreen));
        if (!cmd)
            return;
        cmd->fadeMsec = fadeMsec;
    }
}

int R_BeginDelayedDrawing()
{
    int marker;
    RcCmdDelayedBegin *cmd;

    marker = s_cmdList->usedTotal;
    cmd = (RcCmdDelayedBegin *)R_GetCommandBuffer(1, sizeof(RcCmdDelayedBegin));
    cmd->marker = 0;
    return marker;
}

void R_EndDelayedDrawing(int marker)
{
    R_GetCommandBuffer(3, sizeof(GfxCmdHeader));
    *(int *)((byte *)s_cmdList + 4 + marker) = (int)((byte *)s_cmdList + s_cmdList->usedTotal);
}

void R_IssueDelayedDrawing(int marker)
{
    RcCmdDelayedBegin *cmd;

    cmd = (RcCmdDelayedBegin *)R_GetCommandBuffer(2, sizeof(RcCmdDelayedBegin));
    cmd->marker = (int)((byte *)s_cmdList + 8 + marker);
}

// PINNED 10021890: PC has an explicit fourth order argument.
void R_AddCmdDrawSurfs(GfxDrawSurf *drawSurfs, int drawSurfCount,
    MaterialTechniqueType techType, GfxDrawSurfOrder order)
{
    GfxCmdDrawSurfs *cmd;

    cmd = (GfxCmdDrawSurfs *)R_GetCommandBuffer(0x17, sizeof(GfxCmdDrawSurfs));
    if (!cmd)
        return;
    cmd->order = order;
    cmd->drawSurfs = drawSurfs;
    cmd->drawSurfCount = drawSurfCount;
    cmd->techType = techType;
}

void R_AddCmdId9(const RcWords16 *data, int extra)
{
    RcCmdId9 *cmd;

    cmd = (RcCmdId9 *)R_GetCommandBuffer(9, sizeof(RcCmdId9));
    cmd->data = *data;
    cmd->extra = extra;
}

// PINNED 10022220, API59 slot55: copy float payloads without arithmetic.
void R_AddCmdClearScreen(int whichToClear, const float *color, float depth, int stencil)
{
    GfxCmdClearScreen *cmd;

    cmd = (GfxCmdClearScreen *)R_GetCommandBuffer(0xb, sizeof(GfxCmdClearScreen));
    cmd->whichToClear = (byte)whichToClear;
    cmd->stencil = (byte)stencil;
    memcpy(&cmd->depth, &depth, sizeof(depth));
    memcpy(&cmd->color[0], &color[0], sizeof(float));
    memcpy(&cmd->color[1], &color[1], sizeof(float));
    memcpy(&cmd->color[2], &color[2], sizeof(float));
    memcpy(&cmd->color[3], &color[3], sizeof(float));
}


// Mac command layouts; PC 1.0 offsets PINNED by the retail writers.

void R_AddCmdSetMaterialColor(const vec_t *color)
{
    GfxCmdSetMaterialColor *cmd;

    cmd = (GfxCmdSetMaterialColor *)R_GetCommandBuffer(4, sizeof(GfxCmdSetMaterialColor));
    if (color)
    {
        cmd->color[0] = color[0];
        cmd->color[1] = color[1];
        cmd->color[2] = color[2];
        cmd->color[3] = color[3];
    }
    else
    {
        cmd->color[0] = 0.0f;
        cmd->color[1] = 0.0f;
        cmd->color[2] = 0.0f;
        cmd->color[3] = 0.0f;
    }
}

void R_AddCmdDrawStretchPic(float x, float y, float w, float h, float s0, float t0, float s1, float t1, const vec_t *color, MaterialHandle material)
{
    GfxCmdStretchPic *cmd;

    cmd = (GfxCmdStretchPic *)R_GetCommandBuffer(0xf, sizeof(GfxCmdStretchPic));
    if (!cmd)
        return;
    cmd->material = material;
    cmd->x = x;
    cmd->y = y;
    cmd->w = w;
    cmd->h = h;
    cmd->s0 = s0;
    cmd->t0 = t0;
    cmd->s1 = s1;
    cmd->t1 = t1;
    R_ConvertColorToBytes(color, cmd->color.array);
}

void R_AddCmdDrawStretchPicRotate(float x, float y, float w, float h, float s0, float t0, float s1, float t1, float angle, const vec_t *color, MaterialHandle material)
{
    GfxCmdStretchPicRotate *cmd;
    volatile float quantizedAngle;

    cmd = (GfxCmdStretchPicRotate *)R_GetCommandBuffer(0x10, sizeof(GfxCmdStretchPicRotate));
    if (!cmd)
        return;
    cmd->material = material;
    cmd->x = x;
    cmd->y = y;
    cmd->w = w;
    cmd->h = h;
    cmd->s0 = s0;
    cmd->t0 = t0;
    cmd->s1 = s1;
    cmd->t1 = t1;
    R_ConvertColorToBytes(color, cmd->color.array);
    quantizedAngle = (float)ANGLE2SHORT(angle);
    cmd->rotation = SHORT2ANGLE(quantizedAngle);
}

void R_AddCmdDrawStretchRaw(int x, int y, int w, int h, int cols, int rows, const byte *data, int client, qboolean dirty)
{
    GfxCmdStretchRaw *cmd;

    cmd = (GfxCmdStretchRaw *)R_GetCommandBuffer(0x11, sizeof(GfxCmdStretchRaw));
    if (!cmd)
        return;
    cmd->x = x;
    cmd->y = y;
    cmd->w = w;
    cmd->h = h;
    cmd->cols = cols;
    cmd->rows = rows;
    cmd->data = data;
    cmd->client = client;
    cmd->dirty = dirty;
}

void R_AddCmdDrawTextWithCursor(const char *text, int maxChars, FontHandle font, float x, float y, float xScale, float yScale, const vec_t *color, int style, int cursorPos, char cursor)
{
    int len;
    GfxCmdDrawText *cmd;

    if (!*text && cursorPos < 0)
        return;
    len = strlen(text);
    cmd = (GfxCmdDrawText *)R_GetCommandBuffer(0x15, (offsetof(GfxCmdDrawText, text) + len + 4) & ~3);
    if (!cmd)
        return;
    cmd->x = x;
    cmd->y = y;
    cmd->font = font;
    cmd->xScale = xScale;
    cmd->yScale = yScale;
    R_ConvertColorToBytes(color, cmd->color.array);
    cmd->style = style;
    cmd->cursorPos = cursorPos;
    cmd->cursor = cursor;
    cmd->maxChars = maxChars;
    memcpy(cmd->text, text, len);
    cmd->text[len] = 0;
}

void R_AddCmdDrawTextInSpace(const char *text, FontHandle font, const vec_t *org, const vec_t *xPixelStep, const vec_t *yPixelStep, const vec_t *color)
{
    int len;
    GfxCmdDrawTextInSpace *cmd;

    if (!*text)
        return;
    len = strlen(text);
    cmd = (GfxCmdDrawTextInSpace *)R_GetCommandBuffer(0x16, (offsetof(GfxCmdDrawTextInSpace, text) + len + 4) & ~3);
    if (!cmd)
        return;
    VectorCopy(org, cmd->org);
    cmd->font = font;
    cmd->xPixelStep[0] = xPixelStep[0];
    cmd->xPixelStep[1] = xPixelStep[1];
    cmd->xPixelStep[2] = xPixelStep[2];
    cmd->yPixelStep[0] = yPixelStep[0];
    cmd->yPixelStep[1] = yPixelStep[1];
    cmd->yPixelStep[2] = yPixelStep[2];
    R_ConvertColorToBytes(color, cmd->color.array);
    memcpy(cmd->text, text, len);
    cmd->text[len] = 0;
}

void R_AddCmdDrawQuadPic(vec2_t *verts, const vec_t *color, MaterialHandle material)
{
    GfxCmdDrawQuadPic *cmd;

    cmd = (GfxCmdDrawQuadPic *)R_GetCommandBuffer(0x12, sizeof(GfxCmdDrawQuadPic));
    if (!cmd)
        return;
    cmd->material = material;
    cmd->verts[0][0] = verts[0][0];
    cmd->verts[0][1] = verts[0][1];
    cmd->verts[1][0] = verts[1][0];
    cmd->verts[1][1] = verts[1][1];
    cmd->verts[2][0] = verts[2][0];
    cmd->verts[2][1] = verts[2][1];
    cmd->verts[3][0] = verts[3][0];
    cmd->verts[3][1] = verts[3][1];
    if (!color)
    {
        *(int *)cmd->color.array = -1;
    }
    else
    {
        cmd->color.array[0] = (byte)(color[2] * 255.0f);
        cmd->color.array[1] = (byte)(color[1] * 255.0f);
        cmd->color.array[2] = (byte)(color[0] * 255.0f);
        cmd->color.array[3] = (byte)(color[3] * 255.0f);
    }
}

void R_AddCmdDrawSprite(MaterialHandle material, const byte *rgbaColor, const vec_t *pos, float radius, float minScreenRadius, int renderFxFlags)
{
    GfxCmdDrawSprite *cmd;

    cmd = (GfxCmdDrawSprite *)R_GetCommandBuffer(0x13, sizeof(GfxCmdDrawSprite));
    if (!cmd)
        return;
    cmd->material = material;
    cmd->rgbaColor.packed = *(const unsigned int *)rgbaColor;
    cmd->pos[0] = pos[0];
    cmd->pos[1] = pos[1];
    cmd->pos[2] = pos[2];
    cmd->radius = radius;
    cmd->minScreenRadius = minScreenRadius;
    cmd->renderFxFlags = renderFxFlags;
}

void R_AddCmdDrawFullScreenColoredQuad(float s0, float t0, float s1, float t1, const vec_t *color, MaterialHandle material)
{
    GfxCmdDrawFullScreenColoredQuad *cmd;

    cmd = (GfxCmdDrawFullScreenColoredQuad *)R_GetCommandBuffer(0x14, sizeof(GfxCmdDrawFullScreenColoredQuad));
    if (!cmd)
        return;
    cmd->material = material;
    cmd->s0 = s0;
    cmd->t0 = t0;
    cmd->s1 = s1;
    cmd->t1 = t1;
    R_ConvertColorToBytes(color, cmd->color.array);
}

// Retail 1.0 header-only commands; ids 0x19/0xa match the Mac R_AddCmdApplyEarlyPostEffects/R_AddCmdSaveScreen.
void R_AddCmdApplyEarlyPostEffects()
{
    R_GetCommandBuffer(0x19, sizeof(GfxCmdHeader));
}

// name unconfirmed: header-only command id 0x1c
void R_AddCmdHeaderOnly1C()
{
    R_GetCommandBuffer(0x1c, sizeof(GfxCmdHeader));
}

// name unconfirmed: header-only command id 0 (end of list)
void R_AddCmdEndOfList()
{
    R_GetCommandBuffer(0, sizeof(GfxCmdHeader));
}

// PINNED 10020d50: counters reset before execution, while command bytes remain.
void R_IssueRenderCommands()
{
    R_AddCmdEndOfList();
    frontEndDataOut->commands.usedTotal = 0;
    frontEndDataOut->commands.usedCritical = 0;
    frontEndDataOut->commands.lastCmd = 0;
    RB_ExecuteRenderCommands(frontEndDataOut);
    RB_EndFrame();
    R_InitFrameBackendData();
}

// PINNED 10022040: restore saved pointers before relocking the normal frame.
void R_EndDebugFrame()
{
    if (!rg.registered)
        return;
    R_AddCmdEndOfList();
    frontEndDataOut->commands.usedTotal = 0;
    frontEndDataOut->commands.usedCritical = 0;
    frontEndDataOut->commands.lastCmd = 0;
    RB_ExecuteRenderCommands(frontEndDataOut);
    RB_EndFrame();
    s_cmdList = s_debugFrameGlob.restoreCmdList;
    frontEndDataOut = s_debugFrameGlob.restoreFrontEndDataOut;
    if (s_debugFrameGlob.restoreSkinnedCache)
    {
        s_debugFrameGlob.restoreSkinnedCache = 0;
        R_LockSkinnedCache(1);
    }
    s_debugFrameGlob.restoreCmdList = 0;
    s_debugFrameGlob.restoreFrontEndDataOut = 0;
}

void R_AddCmdSaveScreen()
{
    R_GetCommandBuffer(0xa, sizeof(GfxCmdHeader));
}

void R_AddCmdApplyLatePostEffects(float blurRadius)
{
    GfxCmdApplyLatePostEffects *cmd;

    cmd = (GfxCmdApplyLatePostEffects *)R_GetCommandBuffer(0x1a, sizeof(GfxCmdApplyLatePostEffects));
    if (!cmd)
        return;
    cmd->blurRadius = blurRadius;
}

void R_AddCmdDrawSunPostEffects(int viewIndex)
{
    GfxCmdDrawSunPostEffects *cmd;

    cmd = (GfxCmdDrawSunPostEffects *)R_GetCommandBuffer(0x1b, sizeof(GfxCmdDrawSunPostEffects));
    if (!cmd)
        return;
    cmd->viewIndex = viewIndex;
}

extern const dvar_t *r_zFeather;
extern const dvar_t *r_sun_from_dvars;
extern const dvar_t *r_gpuSync;
extern const dvar_t *r_multiGpu;
extern const dvar_t *r_skinCache;
extern const dvar_t *r_forceLod;
extern const dvar_t *r_highLodDist;
extern const dvar_t *r_mediumLodDist;
extern const dvar_t *r_lowLodDist;
extern const dvar_t *r_lowestLodDist;
void R_UpdateLightsFromDvars();
void R_SetSunFromDvars(sunflare_t *sun);
void Material_Sort();

typedef char frameDvarLayoutCheck[(offsetof(dvar_t, reset) == 0x10
    && offsetof(GfxWorld, sun) == 0x160
    && offsetof(r_global_permanent_t, world) == 0x109c
    && offsetof(DxGlobals, renderTargets) + 6 * sizeof(GfxRenderTarget)
        + offsetof(GfxRenderTarget, colorSurface) == 0x2cac
    && offsetof(refimport_t, Dvar_ClearModified) == 0x94
    && offsetof(refimport_t, CL_FlushDebugData) == 0x12c
    && offsetof(refimport_t, XModelSetTestLods) == 0x184) ? 1 : -1];

// Role name; PINNED 10021db0: the selected forced LOD gets zero distance.
static void R_UpdateLodDistances()
{
    if (r_forceLod->current.integer != r_forceLod->reset.integer)
    {
        for (int index = 0; index < 4; ++index)
            ri.XModelSetTestLods(index, index == r_forceLod->current.integer ? 0.0f : 0.001f);
    }
    else
    {
        ri.XModelSetTestLods(0, r_highLodDist->current.value);
        ri.XModelSetTestLods(1, r_mediumLodDist->current.value);
        ri.XModelSetTestLods(2, r_lowLodDist->current.value);
        ri.XModelSetTestLods(3, r_lowestLodDist->current.value);
    }
}

// Role name; PINNED 10021e50: clear modified flags before reading live values.
static void R_UpdateFrameDvars()
{
    if (R_ClearModifiedLightDvars())
        R_UpdateLightsFromDvars();
    if (r_zFeather->modified)
    {
        ri.Dvar_ClearModified(r_zFeather);
        if (r_rendererInUse->current.integer != 2 && r_zFeather->current.enabled
            && !dx.renderTargets[6].colorSurface)
            ri.Printf(0, "Because r_zFeather was 0 during renderer initialization,\nyou must do a vid_restart with r_zFeather set to 1 to see it.\n");
    }
    if (r_sun_from_dvars->current.enabled && rgp.world)
        R_SetSunFromDvars(&rgp.world->sun);
    bool gpuChanged = R_ClearModifiedDvar(r_gpuSync);
    bool multiChanged = R_ClearModifiedDvar(r_multiGpu);
    if (gpuChanged || multiChanged)
        dx.gpuSync = r_multiGpu->current.enabled ? 0 : r_gpuSync->current.integer;
    R_UpdateLodDistances();
}

// PINNED 10021f40: API59 slot47; sorting and settings precede client flushing.
void R_BeginFrame()
{
    if (!rg.registered)
        return;
    if (rgp.materialLoaded)
    {
        rgp.materialLoaded = 0;
        Material_Sort();
    }
    R_UpdateFrameDvars();
    ri.CL_FlushDebugData(0);
    if (r_skinCache->current.enabled)
        R_LockSkinnedCache(0);
}

// PINNED 10021f90: API59 slot48 and import74 precede frame submission.
typedef char frameDebugImportOffset[
    offsetof(refimport_t, CL_UpdateDebugData) == 74 * 4 ? 1 : -1];

void R_EndFrame()
{
    if (!rg.registered)
        return;
    RB_AdaptiveGpuSyncTarget();
    R_UnlockSkinnedCache();
    ri.CL_UpdateDebugData();
    R_TransferDebugGlobals(&frontEndDataOut->debugGlobals);
    R_IssueRenderCommands();
    if (dx.tempSkinPos)
    {
        ri.Z_VirtualDecommitInternal(dx.tempSkinBuf, dx.tempSkinPos);
        dx.tempSkinPos = 0;
    }
}

void R_AbortRenderCommands()
{
    if (!rg.registered)
        return;
    R_UnlockSkinnedCache();
    frontEndDataOut->commands.usedTotal = 0;
    frontEndDataOut->commands.usedCritical = 0;
    frontEndDataOut->commands.lastCmd = 0;
    if (!dx.tempSkinPos)
        return;
    ri.Z_VirtualDecommitInternal(dx.tempSkinBuf, dx.tempSkinPos);
    dx.tempSkinPos = 0;
}

// PC 1.0 has no render thread, so the sync is empty and only the main-thread query survives.
void R_SyncRenderThread()
{
}

void R_UpdateGfxEntityBounds(GfxEntity *ent);
void R_SkinGfxEntity(GfxEntity *ent);
// PINNED 10020ce0/12: API59's wrapper calls the shared entity skinning body.
void R_SkinGfxEntityCmd(GfxEntity *ent)
{
    R_SkinGfxEntity(ent);
}

void R_SkinRigidXModelCmd(SkinRigidXModelCmd *cmd);
void R_SkinXModelCmd(SkinXModelCmd *cmd, int context);
void R_SkinStaticModelCachedCmd(SkinStaticModelCachedCmd *cmd, SkinBuffers *buffers);
extern SkinBuffers g_skinBuffers[1];

// PINNED 10020be0/153: the PC renderer executes all eight frontend cases inline.
static void R_ProcessFrontendCmdInternal(int type, void *data, int context)
{
    switch (type)
    {
    case 0:
        R_UpdateGfxEntityBounds(*(GfxEntity **)data);
        return;
    case 1:
        R_SkinGfxEntity(*(GfxEntity **)data);
        return;
    case 2:
        R_SkinRigidXModelCmd((SkinRigidXModelCmd *)data);
        return;
    case 3:
        ri.FX_UpdateNonBolt();
        return;
    case 4:
        ri.FX_UpdateBolt();
        return;
    case 5:
        R_SkinStaticModelCachedCmd((SkinStaticModelCachedCmd *)data, &g_skinBuffers[context]);
        return;
    case 6:
    case 7:
        R_SkinXModelCmd((SkinXModelCmd *)data, context);
        return;
    }
}

// SUPPORTED Mac wrapper; PC callers fold this context-zero dispatch.
void R_AddFrontendCmd(int type, void *data)
{
    R_ProcessFrontendCmdInternal(type, data, 0);
}

// Scene command producers.
extern const dvar_t *r_specularColorScale;

// PINNED 10021770/195: critical allocation; specular alpha also receives the scale.
void R_AddCmdLightProperties(int lightIndex, const GfxLight *light)
{
    GfxCmdSetLightProperties *cmd = (GfxCmdSetLightProperties *)R_GetCommandBuffer(5, sizeof(GfxCmdSetLightProperties));
    cmd->lightIndex = lightIndex;
    cmd->position[0] = light->position[0];
    cmd->position[1] = light->position[1];
    cmd->position[2] = light->position[2];
    cmd->position[3] = light->position[3];
    cmd->color[0] = light->color[0];
    cmd->color[1] = light->color[1];
    cmd->color[2] = light->color[2];
    cmd->color[3] = 1.0f;
    cmd->ambient[0] = light->u.dir.ambientColor[0];
    cmd->ambient[1] = light->u.dir.ambientColor[1];
    cmd->ambient[2] = light->u.dir.ambientColor[2];
    cmd->ambient[3] = 1.0f;
    float scale = r_specularColorScale->current.value;
    cmd->specular[0] = scale * cmd->color[0];
    cmd->specular[1] = scale * cmd->color[1];
    cmd->specular[2] = scale * cmd->color[2];
    cmd->specular[3] = scale * cmd->color[3];
    cmd->lightDef = light->def;
}

// PINNED 10021840/79: target selection consumes critical command space.
void R_AddCmdSetRenderTarget(GfxRenderTargetId renderTargetId)
{
    GfxCmdSetRenderTarget *cmd = (GfxCmdSetRenderTarget *)R_GetCommandBuffer(0xe, sizeof(GfxCmdSetRenderTarget));
    cmd->renderTargetId = renderTargetId;
}

// PINNED 10021920/87: sun commands use the noncritical reservation rule.
void R_AddCmdDrawSun(int viewIndex)
{
    GfxCmdDrawSunPostEffects *cmd = (GfxCmdDrawSunPostEffects *)R_GetCommandBuffer(0x18, sizeof(GfxCmdDrawSunPostEffects));
    cmd->viewIndex = viewIndex;
}

// PINNED 10021b50/146: copy scene/LOD state, retain the view-parameter pointer.
void R_AddCmdBeginView(int viewCount, const GfxSceneDef *sceneDef,
    const GfxViewParms *viewParms, const GfxLodParms *lodParms)
{
    GfxCmdBeginView *cmd = (GfxCmdBeginView *)R_GetCommandBuffer(0xc, sizeof(GfxCmdBeginView));
    cmd->viewCount = viewCount;
    cmd->sceneDef = *sceneDef;
    cmd->viewParms = viewParms;
    cmd->lodParms = *lodParms;
}

// PINNED PC fog state; the Mac draft omits the device-call logging.
#include "gfx.h"
#include "rb_tess.h"
#include <stddef.h>
#include <stdio.h>

extern r_backEndGlobals_t backEnd;
extern DxState dxState;
extern DxGlobals dx;
extern GfxBackEndData *backEndData;
extern const dvar_t *r_fog;
extern const dvar_t *r_zfar;
extern const dvar_t *r_logFile;
extern int alwaysfails;
void RB_LogPrint(const char *text);
bool RB_IsLogging();
struct r_logfile_globals_t { FILE *fp; };
extern r_logfile_globals_t r_logFileGlob;

// The PC view-parameter array differs from the Mac layout.
struct RBFogFrontEndView
{
    byte beforeFog[0x219cec];
    GfxFog fogSettings;
};
typedef char rbFogLayoutCheck[(offsetof(r_backEndGlobals_t, fogColor) == 0x4c8
    && offsetof(GfxTess, techType) == 0x5a7c0
    && offsetof(DxState, fog) == 0x2158
    && offsetof(RBFogFrontEndView, fogSettings) == 0x219cec) ? 1 : -1];

// common_types.h models the device as an opaque function pointer.
#define RB_FOG_DX_CALL(state, value, text)                       \
    do {                                                       \
        if (r_logFile->current.integer) RB_LogPrint(text "\n");   \
        void *device = (void *)dx.device;                       \
        typedef int (__stdcall *SetState)(void *, int, DWORD);   \
        ((SetState)(*(void ***)device)[57])(device, state, value); \
    } while (alwaysfails)
static DWORD FloatAsInt(const float *value);
void Byte4UnpackBgra(const byte *from, float *to);
GfxFogOffset RB_FogOffset();
void RB_UpdateFogColor(FogColorSrcEnum source);
void RB_SetIteratorFog();

static DWORD FloatAsInt(const float *value)
{
    return *(const DWORD *)value;
}

GfxFogOffset RB_FogOffset()
{
    if (!r_fog->current.enabled)
        return FOG_OFFSET_NONE;
    return ((const RBFogFrontEndView *)backEndData)->fogSettings.techniqueOffset;
}

void RB_SetIteratorFog()
{
    if (tess.techType == 3)
        return;
    const GfxFog *fog = &((const RBFogFrontEndView *)backEndData)->fogSettings;
    if (!fog->techniqueOffset || !fog->registered)
        return;
    backEnd.fogColor = fog->color;
    RB_UpdateFogColor(FOG_COLOR_SRC_UNSPECIFIED);
    float color[4];
    Byte4UnpackBgra(fog->color.array, color);
    backEnd.codeConsts[29][0] = color[0];
    backEnd.codeConsts[29][1] = color[1];
    backEnd.codeConsts[29][2] = color[2];
    backEnd.codeConsts[29][3] = color[3];
    float end = r_zfar->current.value != 0.0f ? r_zfar->current.value : fog->fogEnd;
    float inverseRange = 1.0f / (end - fog->fogStart);
    vec4_t parameters;
    Vector4Set(parameters, -inverseRange, inverseRange * end,
        -fog->density, 0.0f);
    backEnd.codeConsts[28][0] = parameters[0];
    backEnd.codeConsts[28][1] = parameters[1];
    backEnd.codeConsts[28][2] = parameters[2];
    backEnd.codeConsts[28][3] = parameters[3];
    if (r_rendererInUse->current.integer != 2)
        return;
    if (fog->techniqueOffset == FOG_OFFSET_LINEAR)
    {
        if (dxState.fog.mode != 3)
        {
            RB_FOG_DX_CALL(140, 3,
                "dx.device->SetRenderState( D3DRS_FOGVERTEXMODE, D3DFOG_LINEAR )");
            dxState.fog.mode = (D3DFOGMODE)3;
        }
        if (dxState.fog.start != fog->fogStart)
        {
            RB_FOG_DX_CALL(36, FloatAsInt(&fog->fogStart),
                "dx.device->SetRenderState( D3DRS_FOGSTART, FloatAsInt( &fog->fogStart ) )");
            dxState.fog.start = fog->fogStart;
        }
        if (dxState.fog.end != end)
        {
            RB_FOG_DX_CALL(37, FloatAsInt(&end),
                "dx.device->SetRenderState( D3DRS_FOGEND, FloatAsInt( &end ) )");
            dxState.fog.end = end;
        }
    }
    else
    {
        if (dxState.fog.mode != 1)
        {
            RB_FOG_DX_CALL(140, 1,
                "dx.device->SetRenderState( D3DRS_FOGVERTEXMODE, D3DFOG_EXP )");
            dxState.fog.mode = (D3DFOGMODE)1;
        }
        if (dxState.fog.density != fog->density)
        {
            RB_FOG_DX_CALL(38, FloatAsInt(&fog->density),
                "dx.device->SetRenderState( D3DRS_FOGDENSITY, FloatAsInt( &fog->density ) )");
            dxState.fog.density = fog->density;
        }
    }
}

void RB_UpdateFogColor(FogColorSrcEnum source)
{
    unsigned int fogColor;
    unsigned int cachedColor;
    if (!rg.fogIndex)
        return;
    if (source == FOG_COLOR_SRC_UNSPECIFIED)
    {
        if ((dxState.refStateBits[0] & 0xf0) == 0x20)
            goto black;
    }
    else if (source == FOG_COLOR_SRC_BLACK)
        goto black;
    fogColor = backEnd.fogColor.packed;
opaqueAlpha:
    cachedColor = dxState.fog.color.packed;
    ((byte *)&fogColor)[3] = 255;
    if (cachedColor == fogColor)
        return;
    // PINNED this leaf expands logging; the iterator calls RB_LogPrint.
    do {
        if (RB_IsLogging())
        {
            fprintf(r_logFileGlob.fp, "%s",
                "dx.device->SetRenderState( D3DRS_FOGCOLOR, fogColor.packed )\n");
            fflush(r_logFileGlob.fp);
        }
        void *device = (void *)dx.device;
        typedef int (__stdcall *SetState)(void *, int, DWORD);
        ((SetState)(*(void ***)device)[57])(device, 34, fogColor);
    } while (alwaysfails);
    dxState.fog.color.packed = fogColor;
    return;
black:
    fogColor = 0;
    goto opaqueAlpha;
}

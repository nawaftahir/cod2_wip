// Renderer initialization.
#include "gfx.h"
#include "universal/com_math.h"
#include <stddef.h>

refimport_t ri;
r_globals_t rg;
r_global_permanent_t rgp;
vidConfig_t vidConfig;

extern const dvar_t *r_aspectRatio;
void R_GetMonitorDimensions(int *width, int *height);

// PINNED 100115f0: reuse the existing rounding helper; its assembly is not C++ credit.
void R_StoreWindowSettings(const GfxWindowParms *parms)
{
    vidConfig.width = parms->width;
    vidConfig.height = parms->height;
    vidConfig.displayFrequency = parms->hz;
    vidConfig.isFullscreen = parms->fullscreen;
    switch (r_aspectRatio->current.integer)
    {
    case 0:
    {
        int width, height;
        R_GetMonitorDimensions(&width, &height);
        float ratio = (float)height * 16.0f / width;
        int rounded = I_fround(ratio);
        if (rounded < 10)
            vidConfig.aspectRatioWindow = 16.0f / 9.0f;
        else if (rounded == 10)
            vidConfig.aspectRatioWindow = 16.0f / 10.0f;
        else
            vidConfig.aspectRatioWindow = 4.0f / 3.0f;
        break;
    }
    case 1:
        vidConfig.aspectRatioWindow = 4.0f / 3.0f;
        break;
    case 2:
        vidConfig.aspectRatioWindow = 16.0f / 10.0f;
        break;
    case 3:
        vidConfig.aspectRatioWindow = 16.0f / 9.0f;
        break;
    }
    vidConfig.aspectRatioPixel = (float)vidConfig.height * vidConfig.aspectRatioWindow / vidConfig.width;
}

// r_material.cpp keeps its own Material view and cannot see r_globals_t; inlined there.
Material **R_GetMaterialHashTable()
{
    return rg.materialHashTable;
}

void R_AddCmdTouchAllImages();

void R_EndRegistration()
{
    R_AddCmdTouchAllImages();
}

int R_EndDrawGroupLoop(int group, int view);
void R_EndDrawGroupSection(int group);

void R_EndView(int viewIndex)
{
    R_EndDrawGroupLoop(4, viewIndex);
    R_EndDrawGroupSection(4);
}

void R_IssueDrawGroups();

void R_DoneRenderingViews()
{
    R_IssueDrawGroups();
}

void R_TrackStatistics(trStatistics_t *stats)
{
    rg.stats = stats;
}

extern "C" __declspec(dllimport) int __stdcall GetSystemMetrics(int nIndex);

// name unconfirmed: virtual-desktop extent, never smaller than the primary screen
static void R_GetDesktopExtent(int *width, int *height)
{
    int virtualWidth;
    int virtualHeight;
    int screenWidth;
    int screenHeight;

    virtualWidth = GetSystemMetrics(78);
    virtualHeight = GetSystemMetrics(79);
    screenWidth = GetSystemMetrics(0);
    screenHeight = GetSystemMetrics(1);
    *width = I_max(virtualWidth, screenWidth);
    *height = I_max(virtualHeight, screenHeight);
}

// name unconfirmed: fullscreen uses the mode size, windowed the desktop extent
void R_GetFrameBufferExtent(int *width, int *height)
{
    if (vidConfig.isFullscreen)
    {
        int modeWidth = vidConfig.width;
        int modeHeight = vidConfig.height;
        *width = modeWidth;
        *height = modeHeight;
        return;
    }
    R_GetDesktopExtent(width, height);
}

// PINNED PC 1.0 sizes: rg 0x31a0, rgp 0x10f0
typedef char rgSizeCheck[(sizeof(r_globals_t) == 0x31a0 && sizeof(r_global_permanent_t) == 0x10f0) ? 1 : -1];

void RB_InitBackendGlobalStructs();
void RB_DecideDefaultSamplerState();

// KisakCOD name; Mac 1.3 inlines these steps into R_Init
void R_InitGlobalStructs()
{
    memset(&rg, 0, sizeof(rg));
    memset(&rgp, 0, sizeof(rgp));
    RB_InitBackendGlobalStructs();
    RB_DecideDefaultSamplerState();
}

// name unconfirmed: Mac 1.3 inlines this into R_Init
void R_InitSinTable()
{
    int i;
    float angle;

    for (i = 0; i < 1024; i++)
    {
        angle = i * 0.3515625f;
        rg.sinTable[i] = (float)sin(angle * 0.017453292f);
    }
}

// name unconfirmed: builds the one-model DObj used for model scene entities (Mac inlines it into R_BeginRegistration)
void R_InitModelDObj()
{
    DObjModel_s model;

    model.model = 0;
    model.boneName = 0;
    model.ignoreCollision = 0;
    ri.DObjCreate(&model, 1, 0, rg.modelDObjBuf, 0);
    rg.modelDObj = (DObj_s *)rg.modelDObjBuf;
}

extern const dvar_t *r_gamma;

#pragma intrinsic(pow)
// PINNED 10011f10: the existing I_fround expansion is accounted as assembly.
static __declspec(noinline) void R_BuildGammaTable(GfxGammaRamp *gammaTable)
{
    float inverseGamma = 1.0f / r_gamma->current.value;
    int index = 0;
    int remaining = 256;
    unsigned short *entry = gammaTable->entries;
    do
    {
        int value;
        if (inverseGamma == 1.0f)
            value = index + (index << 8);
        else
            value = I_fround((float)(pow(index * (1.0f / 255.0f), inverseGamma) * 65535.0f));
        ++index;
        *entry++ = (unsigned short)value;
    } while (--remaining);
}
#pragma function(pow)

void RB_SetGammaRamp(const GfxGammaRamp *gammaTable);

// PINNED 10011fb0: the other real caller of the shared one-channel builder.
void R_SetColorMappings()
{
    GfxGammaRamp gammaTable;
    if (vidConfig.deviceSupportsGamma)
    {
        R_BuildGammaTable(&gammaTable);
        RB_SetGammaRamp(&gammaTable);
    }
}

// PINNED 10011fe0: signed integer division after widening the ushort entry.
void R_GammaCorrect(int bufferSize, byte *buffer)
{
    GfxGammaRamp gammaTable;
    R_BuildGammaTable(&gammaTable);
    for (int index = 0; index < bufferSize; ++index)
        buffer[index] = (byte)(gammaTable.entries[buffer[index]] * 255 / 65535);
}

GfxImage *Image_Register(const char *name, int imageTrack, int semantic);
GfxImage *Image_AllocProg(int imageProgType, int category);
void R_SetPicmip();
void RB_SetSampler(int samplerIndex, unsigned char samplerState, GfxImage *image);
extern DxState dxState;

typedef char imageStartupLayoutCheck[
    offsetof(r_global_permanent_t, whiteImage) == 0x1008 &&
    offsetof(r_global_permanent_t, rawImage) == 0x1098 &&
    offsetof(r_global_permanent_t, waterColorImage) == 0x10a4 &&
    offsetof(r_global_permanent_t, rawTexdef) == 0x10e4 &&
    offsetof(MaterialTextureDef, samplerState) == 4 &&
    offsetof(MaterialTextureDef, semantic) == 5 &&
    offsetof(MaterialTextureDef, u) == 8 &&
    offsetof(DxState, samplerState) == 0x20e4 ? 1 : -1];

// PINNED 1000d560/276: DX7 creates water color instead of the DX9 lookup family.
void R_RegisterBuiltinImages()
{
    rgp.whiteImage = Image_Register("$white", 0, 1);
    rgp.blackImage = Image_Register("$black", 0, 1);
    if (r_rendererInUse->current.integer == 2)
        rgp.waterColorImage = Image_Register("$watercolor", 0, 1);
    else
    {
        rgp.identityNormalMapImage = Image_Register("$identitynormalmap", 0, 1);
        rgp.specularityImage = Image_Register("$specularity", 0, 1);
        rgp.lightGridWeightsImage[0] = Image_Register("$lightgridweights0", 0, 1);
        rgp.lightGridWeightsImage[1] = Image_Register("$lightgridweights1", 0, 1);
        rgp.lightmapWeightsImage = Image_Register("$lightmapweights", 0, 1);
    }
}

// PINNED 1000d880/124: preserve raw texture-definition name and padding fields.
void R_InitImages()
{
    R_SetPicmip();
    R_RegisterBuiltinImages();
    for (int sampler = 0; sampler < 16; ++sampler)
        RB_SetSampler(sampler, dxState.samplerState[sampler], rgp.whiteImage);
    rgp.rawImage = Image_AllocProg(12, 4);
    rgp.rawTexdef.samplerState = 0x32;
    rgp.rawTexdef.semantic = 0;
    rgp.rawTexdef.u.image = rgp.rawImage;
}

void Material_Init();
GfxLightDef *R_RegisterLightDef(const char *name);
extern DebugGlobals debugGlobals;

typedef char rendererSystemsLayoutCheck[(sizeof(GfxFog) == 32 &&
    offsetof(r_globals_t, sceneWaterMapSetupsCount) == 0x1028 &&
    offsetof(r_globals_t, fogSettings) == 0x146c &&
    offsetof(r_globals_t, fogIndex) == 0x150c && sizeof(DebugGlobals) == 84 &&
    offsetof(DebugGlobals, vertLimit) == 8 && offsetof(DebugGlobals, polyLimit) == 20 &&
    offsetof(DebugGlobals, stringLimit) == 32 && offsetof(DebugGlobals, lineLimit) == 56 &&
    offsetof(DebugGlobals, plumeLimit) == 80) ? 1 : -1];

// PINNED 10012040/116: reset the normal debug globals, not the frame's debug block.
void R_InitSystems()
{
    R_InitImages();
    Material_Init();
    rg.sceneWaterMapSetupsCount = 0;
    rgp.dlightDef = R_RegisterLightDef("light_dynamic");
    memset(rg.fogSettings, 0, sizeof(rg.fogSettings));
    memset(&debugGlobals, 0, sizeof(debugGlobals));
    rg.fogIndex = 0;
    debugGlobals.vertLimit = 4096;
    debugGlobals.polyLimit = 512;
    debugGlobals.stringLimit = 4096;
    debugGlobals.lineLimit = 16384;
    debugGlobals.plumeLimit = 4096;
    rg.registered = 1;
}

void R_ScreenShot_f();
void R_ScreenShotJpeg_f();
void R_ImageList_f();
void R_ApplyPicmip_f();
void Material_ReloadTextures_f();
void R_LoadSun_f();
void R_SaveSun_f();
void R_StaticModelCacheStats_f();
void R_StaticModelCacheFlush_f();

// PINNED 100052c0/151: every callback has real source in its owning module.
void R_RegisterCmds()
{
    ri.Cmd_AddCommand("screenshot", R_ScreenShot_f);
    ri.Cmd_AddCommand("screenshotJpeg", R_ScreenShotJpeg_f);
    ri.Cmd_AddCommand("imagelist", R_ImageList_f);
    ri.Cmd_AddCommand("r_applyPicmip", R_ApplyPicmip_f);
    ri.Cmd_AddCommand("reloadmaterialtextures", Material_ReloadTextures_f);
    ri.Cmd_AddCommand("r_loadsun", R_LoadSun_f);
    ri.Cmd_AddCommand("r_savesun", R_SaveSun_f);
    ri.Cmd_AddCommand("r_smc_stats", R_StaticModelCacheStats_f);
    ri.Cmd_AddCommand("r_smc_flush", R_StaticModelCacheFlush_f);
}

void Swap_Init();
void R_RegisterDvars();
void R_InitRenderCmds();
void R_InitDrawGroups();
void R_InitHardware();
Font_s *R_RegisterFont(const char *name, int imageTrack);
void FFT_Init(int *bitswap, complex_s *trigTable);
int RB_CalcSunSpriteSamples();
extern r_backEndGlobals_t backEnd;
extern DxGlobals dx;
typedef char rendererInitLayoutCheck[(offsetof(r_globals_t, fftTrigTable) == 0x2510
    && offsetof(r_globals_t, fftBitswap) == 0x2d10
    && offsetof(r_backEndGlobals_t, debugFont) == 0x36b58
    && offsetof(DxGlobals, sunSpriteSamples) == 0x2c2c) ? 1 : -1];

// PINNED 10012f80: preserve the retail startup and publication order.
void R_Init()
{
    ri.Printf(0, "----- R_Init -----\n");
    Swap_Init();
    R_RegisterDvars();
    R_RegisterCmds();
    R_InitGlobalStructs();
    R_InitRenderCmds();
    R_InitDrawGroups();
    R_InitHardware();
    backEnd.debugFont = R_RegisterFont("fonts/smalldevfont", 1);
    R_InitSinTable();
    FFT_Init(rg.fftBitswap, rg.fftTrigTable);
    R_InitModelDObj();
    dx.sunSpriteSamples = RB_CalcSunSpriteSamples();
}

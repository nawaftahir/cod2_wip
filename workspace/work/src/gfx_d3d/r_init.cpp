// Renderer initialization.
#include "gfx.h"
#include "universal/com_math.h"

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

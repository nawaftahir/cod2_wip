// Renderer initialization.
#include "gfx.h"
#include "universal/com_math.h"

refimport_t ri;
r_globals_t rg;
r_global_permanent_t rgp;
vidConfig_t vidConfig;

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

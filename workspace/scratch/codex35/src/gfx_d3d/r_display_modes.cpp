// PINNED PC 1.0 10012320/10012360/100123a0/100123d0/10012820.
// Names describe the operations; historical TU boundaries are unconfirmed.
#include "r_local.h"
#include <algorithm>

const dvar_t *r_mode;
const dvar_t *r_displayRefresh;

void R_FatalInitError(const char *message);
void R_StoreDirect3DCaps(UINT adapter);
unsigned int R_ChooseAdapter();

struct GfxResolution { int width; int height; };

static bool R_DisplayModeLess(const D3DDISPLAYMODE &a, const D3DDISPLAYMODE &b)
{
    if (a.Width > b.Width)
        return false;
    if (a.Width < b.Width)
        return true;
    if (a.Height > b.Height)
        return false;
    if (a.Height < b.Height)
        return true;
    return a.RefreshRate < b.RefreshRate;
}

static int R_AddRefreshRate(int count, int *rates, int rate)
{
    int index;
    for (index = 0; index < count; ++index)
        if (rates[index] == rate)
            return count;
    for (index = count; index > 0 && rates[index - 1] > rate; --index)
        rates[index] = rates[index - 1];
    rates[index] = rate;
    return count + 1;
}

static int R_AddResolution(int count, GfxResolution *resolutions, int width, int height)
{
    if (count > 0 && resolutions[count - 1].width == width && resolutions[count - 1].height == height)
        return count;
    if (width >= 640 && height >= 480)
    {
        resolutions[count].width = width;
        resolutions[count].height = height;
        ++count;
    }
    return count;
}

void R_EnumerateDisplayModes(UINT adapter)
{
    int refreshRates[256];
    GfxResolution resolutions[256];
    unsigned int modeCount;
    unsigned int index;
    int resolutionCount;
    int refreshCount = 0;
    int defaultIndex;
    int i;
    char *text;

    modeCount = dx.d3d9->GetAdapterModeCount(adapter, D3DFMT_X8R8G8B8);
    dx.displayModeCount = 0;
    for (index = 0; index < modeCount; ++index)
    {
        if ((unsigned int)dx.displayModeCount >= 256)
            break;
        if (dx.d3d9->EnumAdapterModes(adapter, D3DFMT_X8R8G8B8, index,
            &dx.displayModes[dx.displayModeCount]) >= 0)
        {
            if (!dx.displayModes[dx.displayModeCount].RefreshRate)
                dx.displayModes[dx.displayModeCount].RefreshRate = 60;
            ++dx.displayModeCount;
        }
    }
    std::sort(dx.displayModes, dx.displayModes + dx.displayModeCount, R_DisplayModeLess);
    resolutionCount = 0;
    for (index = 0; index < (unsigned int)dx.displayModeCount; ++index)
    {
        resolutionCount = R_AddResolution(resolutionCount, resolutions,
            dx.displayModes[index].Width, dx.displayModes[index].Height);
        refreshCount = R_AddRefreshRate(refreshCount, refreshRates, dx.displayModes[index].RefreshRate);
    }
    text = dx.modeText;
    if (!resolutionCount)
        R_FatalInitError(va("No valid resolutions of %i x %i or above found", 640, 480));
    defaultIndex = 0;
    for (i = 0; i < resolutionCount; ++i)
    {
        dx.resolutionNameTable[i] = text;
        text += sprintf(text, "%ix%i", resolutions[i].width, resolutions[i].height) + 1;
        if (resolutions[defaultIndex].width < 640 || resolutions[defaultIndex].height < 480)
            defaultIndex = i;
    }
    dx.resolutionNameTable[i] = 0;
    r_mode = ri.Dvar_RegisterEnum("r_mode", dx.resolutionNameTable, defaultIndex, 0x2021);
    defaultIndex = 0;
    for (i = 0; i < refreshCount; ++i)
    {
        dx.refreshRateNameTable[i] = text;
        text += sprintf(text, "%i Hz", refreshRates[i]) + 1;
        if (refreshRates[defaultIndex] < 60)
            defaultIndex = i;
    }
    dx.refreshRateNameTable[i] = 0;
    r_displayRefresh = ri.Dvar_RegisterEnum("r_displayRefresh", dx.refreshRateNameTable, defaultIndex, 0x2021);
}

bool R_CreateDirect3D()
{
    UINT adapter;
    if (!dx.d3d9)
    {
        ri.Printf(0, "Getting Direct3D 9 interface...\n");
        dx.d3d9 = Direct3DCreate9(D3D_SDK_VERSION);
        if (!dx.d3d9)
        {
            ri.Printf(0, "Direct3D 9 failed to initialize\n");
            return false;
        }
    }
    adapter = R_ChooseAdapter();
    dx.adapterIndex = adapter;
    R_StoreDirect3DCaps(adapter);
    R_EnumerateDisplayModes(dx.adapterIndex);
    return true;
}

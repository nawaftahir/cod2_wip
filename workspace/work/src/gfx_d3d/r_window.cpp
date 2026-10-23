// Game window creation.
#include "r_local.h"
#include "r_window.h"

// PINNED 100129c0/248: rectangle-adjust failure does not skip window creation.
Bool R_CreateGameWindow(GfxWindowParms *parms)
{
    DWORD extendedStyle;
    DWORD style;
    if (parms->fullscreen)
    {
        ri.Printf(0, "Attempting %i x %i fullscreen with 32 bpp at %i hz\n",
            parms->width, parms->height, parms->hz);
        extendedStyle = WS_EX_TOPMOST;
        style = WS_POPUP;
    }
    else
    {
        ri.Printf(0, "Attempting %i x %i window at (%i, %i)\n",
            parms->width, parms->height, parms->x, parms->y);
        extendedStyle = 0;
        style = WS_CAPTION | WS_SYSMENU;
    }
    RECT rect;
    rect.left = 0;
    rect.top = 0;
    rect.right = parms->width;
    rect.bottom = parms->height;
    AdjustWindowRectEx(&rect, style, FALSE, extendedStyle);
    parms->hwnd = CreateWindowExA(extendedStyle, "CoD2", "Call of Duty 2 Multiplayer",
        style, parms->x, parms->y, rect.right - rect.left, rect.bottom - rect.top,
        0, 0, GetModuleHandleA(0), 0);
    if (!parms->hwnd)
    {
        ri.Printf(0, "Couldn't create a window.\n");
        return 0;
    }
    ri.Printf(0, "Game window successfully created.\n");
    return 1;
}

// PINNED 10012b00/131: prefer the preceding rate only for the same resolution.
int R_ChooseRefreshRate(int width, int height, int hz)
{
    int low = 0;
    int high = dx.displayModeCount - 1;
    while (low <= high)
    {
        int middle = (high + low) / 2;
        int difference = (int)dx.displayModes[middle].Width - width;
        if (!difference)
            difference = (int)dx.displayModes[middle].Height - height;
        if (!difference)
            difference = (int)dx.displayModes[middle].RefreshRate - hz;
        if (!difference)
            return hz;
        if (difference < 0)
            low = middle + 1;
        else
            high = middle - 1;
    }
    if (dx.displayModes[high].Width == (UINT)width &&
        dx.displayModes[high].Height == (UINT)height)
        return dx.displayModes[high].RefreshRate;
    return dx.displayModes[low].RefreshRate;
}

// PINNED 10012b90/133: the PC startup path forces fullscreen and preserves tileCount.
void R_SetupWindowParms(GfxWindowParms *parms)
{
    int hz;
    sscanf(ri.Dvar_EnumToString((dvar_t *)r_mode), "%ix%i", &parms->width, &parms->height);
    sscanf(ri.Dvar_EnumToString((dvar_t *)r_displayRefresh), "%i Hz", &hz);
    parms->hz = R_ChooseRefreshRate(parms->width, parms->height, hz);
    parms->x = vid_xpos->current.integer;
    parms->y = vid_ypos->current.integer;
    parms->hwnd = 0;
    parms->fullscreen = 1;
    parms->aaSamples = r_aaSamples->current.integer;
}

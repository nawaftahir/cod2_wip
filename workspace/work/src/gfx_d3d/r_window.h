// PINNED 100129c0/10012b90: PC window parameters, not the Mac window record.
#pragma once
#include <stddef.h>

struct GfxWindowParms
{
    HWND hwnd;
    int hz;
    Bool fullscreen;
    int x;
    int y;
    int width;
    int height;
    int tileCount;
    int aaSamples;
};

typedef char windowParmsLayoutCheck[(sizeof(GfxWindowParms) == 36 &&
    offsetof(GfxWindowParms, fullscreen) == 8 &&
    offsetof(GfxWindowParms, x) == 12 &&
    offsetof(GfxWindowParms, width) == 20 &&
    offsetof(GfxWindowParms, aaSamples) == 32) ? 1 : -1];

Bool R_CreateGameWindow(GfxWindowParms *parms);

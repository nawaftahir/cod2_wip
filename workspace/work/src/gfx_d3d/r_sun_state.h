// Shared PC sun-query storage; the common type view must keep the same layout.
#pragma once
#include <stddef.h>

#ifndef GFX_OC_TYPES
struct SunFlareDynamic
{
    float flareIntensity;
    float currentBlind;
    float currentGlare;
    int lastTime;
    Bool error;
    float cumulVisibility;
    float lastVisibility;
    float lastDot;
    int hitNum;
    IDirect3DQuery9 *sunQuery[2];
    Bool sunQueryIssued[2];
};
#endif

extern SunFlareDynamic sunFlareState[4];
typedef char sunQueryLayoutCheck[(sizeof(SunFlareDynamic) == 48 &&
    offsetof(SunFlareDynamic, sunQuery) == 36 &&
    offsetof(SunFlareDynamic, sunQueryIssued) == 44) ? 1 : -1];

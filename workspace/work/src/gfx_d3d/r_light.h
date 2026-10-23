// Shared light definition view; offsets are pinned on the PC loader and shader use.
#pragma once
#include <stddef.h>

#ifndef GFX_OC_TYPES
struct GfxLightImage
{
    GfxImage *image;
    byte samplerState;
};
struct GfxLightDef
{
    int type;
    GfxLightImage cookie;
    GfxLightImage attenuation;
    const char *name;
};
#endif

typedef char lightDefinitionLayoutCheck[(sizeof(GfxLightDef) == 24 &&
    sizeof(GfxLightImage) == 8 && offsetof(GfxLightDef, cookie) == 4 &&
    offsetof(GfxLightDef, attenuation) == 12 && offsetof(GfxLightDef, name) == 20) ? 1 : -1];
GfxLightDef *R_RegisterLightDef(const char *name);

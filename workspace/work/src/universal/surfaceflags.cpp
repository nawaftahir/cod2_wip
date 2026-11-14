// PINNED home: Mac STABS path PC/universal/surfaceflags.cpp; retail links it as its own TU.
#include <ctype.h>
#include <string.h>
#include "q_shared.h"

infoParm_t infoParms[] =
{
    { "bark", 0, 0x100000, 0, 0 },
    { "brick", 0, 0x200000, 0, 0 },
    { "carpet", 0, 0x300000, 0, 0 },
    { "cloth", 0, 0x400000, 0, 0 },
    { "concrete", 0, 0x500000, 0, 0 },
    { "dirt", 0, 0x600000, 0, 0 },
    { "flesh", 0, 0x700000, 0, 0 },
    { "foliage", 1, 0x800000, 0x2, 0 },
    { "glass", 1, 0x900000, 0x10, 0 },
    { "grass", 0, 0xa00000, 0, 0 },
    { "gravel", 0, 0xb00000, 0, 0 },
    { "ice", 0, 0xc00000, 0, 0 },
    { "metal", 0, 0xd00000, 0, 0 },
    { "mud", 0, 0xe00000, 0, 0 },
    { "paper", 0, 0xf00000, 0, 0 },
    { "plaster", 0, 0x1000000, 0, 0 },
    { "rock", 0, 0x1100000, 0, 0 },
    { "sand", 0, 0x1200000, 0, 0 },
    { "snow", 0, 0x1300000, 0, 0 },
    { "water", 1, 0x1400000, 0x20, 0 },
    { "wood", 0, 0x1500000, 0, 0 },
    { "asphalt", 0, 0x1600000, 0, 0 },
    { "opaqueglass", 0, 0x900000, 0, 0 },
    { "clipmissile", 1, 0, 0x80, 0 },
    { "ai_nosight", 1, 0, 0x1000, 0 },
    { "clipshot", 1, 0, 0x2000, 0 },
    { "playerclip", 1, 0, 0x10000, 0 },
    { "monsterclip", 1, 0, 0x20000, 0 },
    { "vehicleclip", 1, 0, 0x200, 0 },
    { "itemclip", 1, 0, 0x400, 0 },
    { "nodrop", 1, 0, 0x80000000, 0 },
    { "nonsolid", 1, 0x4000, 0, 0 },
    { "detail", 0, 0, 0x8000000, 0 },
    { "structural", 0, 0, 0x10000000, 0 },
    { "portal", 1, 0x80000000, 0, 0 },
    { "canshootclip", 0, 0, 0x40, 0 },
    { "origin", 1, 0, 0, 0x4 },
    { "sky", 0, 0x4, 0x800, 0 },
    { "alphashadow", 0, 0x10000, 0, 0 },
    { "nocastshadow", 0, 0x40000, 0, 0 },
    { "slick", 0, 0x2, 0, 0 },
    { "noimpact", 0, 0x10, 0, 0 },
    { "nomarks", 0, 0x20, 0, 0 },
    { "ladder", 0, 0x8, 0, 0 },
    { "nodamage", 0, 0x1, 0, 0 },
    { "mantleOn", 0, 0x2000000, 0x1000000, 0 },
    { "mantleOver", 0, 0x4000000, 0x1000000, 0 },
    { "nosteps", 0, 0x2000, 0, 0 },
    { "nodraw", 0, 0x80, 0, 0 },
    { "pointlight", 0, 0x800, 0, 0 },
    { "nolightmap", 0, 0x400, 0, 0 },
    { "nodlight", 0, 0x20000, 0, 0 },
    { NULL, 0, 0, 0, 0 }
};

// Mac names; PINNED 10041690/96 and 100416f0/26 (retail links this TU after rb_tess).
int Com_SurfaceTypeFromName(const char *name)
{
    if (!_stricmp(name, "default"))
        return 0;
    for (int i = 0; i < 22; i++)
    {
        if (!_stricmp(name, infoParms[i].name))
            return (infoParms[i].surfaceFlags & 0x1f00000) >> 20;
    }
    return -1;
}

const char *Com_SurfaceTypeToName(int iTypeIndex)
{
    if (iTypeIndex < 1 || iTypeIndex > 22)
        return "default";
    return infoParms[iTypeIndex - 1].name;
}

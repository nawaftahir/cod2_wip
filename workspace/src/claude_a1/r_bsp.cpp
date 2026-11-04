// World queries.
#include "a1.h"

void R_GetWorldBounds(vec_t *mins, vec_t *maxs)
{
    VectorCopy(rgp.world->mins, mins);
    VectorCopy(rgp.world->maxs, maxs);
}

void R_InterpretSunLightParseParamsIntoLights(SunLightParseParams *sunParse, GfxLight *sunLight);

void R_InterpretSunLightParseParams(SunLightParseParams *sunParse)
{
    R_InterpretSunLightParseParamsIntoLights(sunParse, &rgp.world->sunLight);
    VectorCopy(rgp.world->sunLight.color, rgp.world->sunColorFromBsp);
}

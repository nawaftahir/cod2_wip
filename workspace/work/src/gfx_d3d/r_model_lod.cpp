// PC 1.0 1001d960; descriptive name, historical TU grouping unconfirmed.
#include "gfx.h"

float R_GetModelLodDistance(const float *origin, float scale)
{
    float distance = Vec3Distance(origin, rg.lodParms.origin);
    distance = rg.lodParms.scale * distance + rg.lodParms.bias;
    if (scale != 0.0f)
        distance /= scale;
    return distance;
}

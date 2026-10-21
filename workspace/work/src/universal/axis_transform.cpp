#include "com_math.h"

void AxisTransformVector(const vec3_t *axes, float x, float y, float z, float *out)
{
    out[0] = x * axes[0][0] + y * axes[1][0] + z * axes[2][0];
    out[1] = x * axes[0][1] + y * axes[1][1] + z * axes[2][1];
    out[2] = x * axes[0][2] + y * axes[1][2] + z * axes[2][2];
}

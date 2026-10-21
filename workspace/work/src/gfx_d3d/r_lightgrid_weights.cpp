/* PINNED 100104a0/465; Mac names this cubemap-weight callback.
   Isolated floating-point build; original TU grouping is unconfirmed. */
#include "r_local.h"
#include "universal/com_math.h"
#include <math.h>

int VecLargestAxis(const float vector[3]);
void R_QuantizeCachedColor(const float *color, byte *out);
void AxisTransformVector(const vec3_t *axes, float x, float y, float z, float *out);

static __forceinline void Image_TransformLightGridVector(float x, float y, float z, float *out)
{
    static const vec3_t basis[3] = {
        {0.81649655f, -0.40824828f, -0.40824828f},
        {0.0f, 0.70710677f, -0.70710677f},
        {0.57735026f, 0.57735026f, 0.57735026f}
    };
    AxisTransformVector(basis, x, y, z, out);
}

void Image_GetLightGridWeightsForVector(const float *facePos, int subMap, byte *pixel)
{
    float transformed[3];
    float weights[4];
    float smooth[3];
    float value;
    Image_TransformLightGridVector(facePos[0], facePos[1], facePos[2], transformed);
    int majorAxis = VecLargestAxis(transformed);
    float scale = 1.0f / fabsf(transformed[majorAxis]);
    VectorScale(transformed, scale, transformed);
    value = (transformed[0] + 1.0f) * 0.5f;
    smooth[0] = (3.0f - (value + value)) * value * value;
    value = (transformed[1] + 1.0f) * 0.5f;
    smooth[1] = (3.0f - (value + value)) * value * value;
    if (subMap == 0)
        value = 0.5f - transformed[2] * 0.5f;
    else
        value = (transformed[2] + 1.0f) * 0.5f;
    smooth[2] = (3.0f - (value + value)) * value * value;
    float bottom = 1.0f - smooth[1];
    float left = 1.0f - smooth[0];
    weights[0] = left * bottom * smooth[2];
    weights[1] = bottom * smooth[2] * smooth[0];
    weights[2] = left * smooth[2] * smooth[1];
    weights[3] = smooth[2] * smooth[1] * smooth[0];
    R_QuantizeCachedColor(weights, pixel);
}

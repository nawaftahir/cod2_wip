// Private TU experiment for the binary-pinned skeleton matrix operations.
#include "gfx.h"

void R_TransformSkelVector(const DObjSkelMat *bone, const float *in, float *out)
{
    out[0] = in[0] * bone->axis[0][0] + in[1] * bone->axis[1][0] + in[2] * bone->axis[2][0];
    out[1] = in[0] * bone->axis[0][1] + in[1] * bone->axis[1][1] + in[2] * bone->axis[2][1];
    out[2] = in[0] * bone->axis[0][2] + in[1] * bone->axis[1][2] + in[2] * bone->axis[2][2];
}

void R_TransformSkelPosition(const DObjSkelMat *bone, const float *in, float *out)
{
    out[0] = in[0] * bone->axis[0][0] + in[1] * bone->axis[1][0] + in[2] * bone->axis[2][0] + bone->origin[0];
    out[1] = in[0] * bone->axis[0][1] + in[1] * bone->axis[1][1] + in[2] * bone->axis[2][1] + bone->origin[1];
    out[2] = in[0] * bone->axis[0][2] + in[1] * bone->axis[1][2] + in[2] * bone->axis[2][2] + bone->origin[2];
}

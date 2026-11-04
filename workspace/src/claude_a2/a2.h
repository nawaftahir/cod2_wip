// Worker a2 shared declarations.
#pragma once
#include "gfx.h"
#include <stdlib.h>
#include <string.h>
#include <float.h>

static inline void Vec3Add(const float *a, const float *b, float *sum)
{
    sum[0] = a[0] + b[0];
    sum[1] = a[1] + b[1];
    sum[2] = a[2] + b[2];
}

static inline void Vec3Scale(const float *v, float scale, float *result)
{
    result[0] = scale * v[0];
    result[1] = scale * v[1];
    result[2] = scale * v[2];
}

static inline void VectorCopy(const float *from, float *to)
{
    to[0] = from[0];
    to[1] = from[1];
    to[2] = from[2];
}

static inline void AxisCopy(const float (*in)[3], float (*out)[3])
{
    VectorCopy(in[0], out[0]);
    VectorCopy(in[1], out[1]);
    VectorCopy(in[2], out[2]);
}

extern r_globals_t rg;
extern r_global_permanent_t rgp;
extern GfxScene scene;
extern GfxBackEndData *frontEndDataOut;
extern const dvar_t *r_drawEntities;
extern const dvar_t *r_rendererInUse;

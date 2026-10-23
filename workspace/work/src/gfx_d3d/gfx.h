// gfx_d3d_mp_x86_s.dll 1.0 shared declarations.
#pragma once

// Mac 1.3 decompile types (opencod2); PC 1.0 layouts are confirmed per function by bindcheck.
#define refimport_t refimport_mac_t
#include "common_types.h"
#undef refimport_t

#define GFX_OC_TYPES
#include "ri.h"

#include <stdlib.h>
#include <string.h>
#include <float.h>
#include "universal/com_math.h"

/* PINNED PC 1.0: three 0xcd0 matrix frames; debugFont is at 10764558. */
typedef char rendererCodeMatrixSizeCheck[(sizeof(GfxCodeMatrix) == 0x110) ? 1 : -1];
typedef char rendererCodeMatricesSizeCheck[(sizeof(GfxCodeMatrices) == 0xcd0) ? 1 : -1];
typedef char rendererMatrixStackOffsetCheck[(offsetof(r_backEndGlobals_t, codeMatrixStack) == 0x4e0) ? 1 : -1];
typedef char rendererMatrixLevelOffsetCheck[(offsetof(r_backEndGlobals_t, codeMatrixStackLevel) == 0x2b50) ? 1 : -1];
typedef char rendererDebugFontOffsetCheck[(offsetof(r_backEndGlobals_t, debugFont) == 0x36b58) ? 1 : -1];
typedef char rendererBackendSizeCheck[(sizeof(r_backEndGlobals_t) == 0x36b60) ? 1 : -1];


// common.cpp / client universal sources
void R_Error(errorParm_t code, const char *fmt, ...);
void Com_Printf(const char *fmt, ...);
void Com_Error(errorParm_t code, const char *fmt, ...);
char *va(const char *format, ...);
int Com_sprintf(char *dest, unsigned int size, const char *format, ...);

extern r_globals_t rg;
extern r_global_permanent_t rgp;
extern GfxScene scene;
extern GfxBackEndData *frontEndDataOut;

// client universal sources (universal/)
char *Com_Parse(const char **data_p);
void I_strncpyz(char *dest, const char *src, int destsize);
int I_stricmp(const char *s0, const char *s1);
int I_strnicmp(const char *s0, const char *s1, int n);
float Vec3ScaleToUnitMax(const vec3_t v, vec3_t out);

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

static inline void AxisCopy(const float (*in)[3], float (*out)[3])
{
    VectorCopy(in[0], out[0]);
    VectorCopy(in[1], out[1]);
    VectorCopy(in[2], out[2]);
}

extern const dvar_t *r_drawEntities;
extern const dvar_t *r_rendererInUse;

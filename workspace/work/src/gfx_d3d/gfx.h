// gfx_d3d_mp_x86_s.dll 1.0 shared declarations.
#pragma once

/* After r_local.h (real d3d9.h): the PC headers own their types and the Mac
   copies are skipped (COD2_SDK_TYPES guards, tools/sdk_guard.py). */
#ifdef DIRECT3D_VERSION
#include <d3dx9shader.h>
#include "r_window.h"
#include "r_permanent.h"
#include "r_sun_state.h"
#include "rb_backend.h"
#include "rb_tess.h"
#include "rb_commands.h"
#include "rb_drawargs.h"
#include "r_light.h"
#include "r_image_registry.h"
#include "r_material_shader.h"
#include "r_image_wavelet_types.h"
#include "universal/com_math.h"
#define COD2_SDK_TYPES
#endif

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

void AxisCopy(const float in[3][3], float out[3][3]);

extern const dvar_t *r_drawEntities;
extern const dvar_t *r_rendererInUse;

// Worker a1 shared declarations.
#pragma once
#include "gfx.h"
#include "../cl/universal/com_math.h"

extern DxGlobals dx;

// common.cpp / client universal sources
void R_Error(errorParm_t code, const char *fmt, ...);
void Com_Printf(const char *fmt, ...);
void Com_Error(errorParm_t code, const char *fmt, ...);
char *va(const char *format, ...);

extern r_globals_t rg;
extern r_global_permanent_t rgp;
extern GfxScene scene;
extern GfxBackEndData *frontEndDataOut;

// client universal sources (src/cl/universal)
char *Com_Parse(const char **data_p);
void I_strncpyz(char *dest, const char *src, int destsize);
int I_stricmp(const char *s0, const char *s1);
int I_strnicmp(const char *s0, const char *s1, int n);
float Vec3ScaleToUnitMax(const vec3_t v, vec3_t out);

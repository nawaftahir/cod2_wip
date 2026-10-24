// Renderer-side copies of the engine print and error entry points.
#include "../gfx_d3d/r_local.h"
#include <stdio.h>
#include <stdarg.h>

void R_Error(errorParm_t code, const char *fmt, ...);

void Com_Printf(const char *fmt, ...)
{
    char msg[4096];
    va_list ap;

    va_start(ap, fmt);
    _vsnprintf(msg, sizeof(msg), fmt, ap);
    va_end(ap);
    msg[sizeof(msg) - 1] = 0;
    ri.Printf(0, "%s", msg);
}

void Com_Error(errorParm_t code, const char *fmt, ...)
{
    char msg[4096];
    va_list ap;

    va_start(ap, fmt);
    _vsnprintf(msg, sizeof(msg), fmt, ap);
    va_end(ap);
    msg[sizeof(msg) - 1] = 0;
    R_Error(code, "%s", msg);
}

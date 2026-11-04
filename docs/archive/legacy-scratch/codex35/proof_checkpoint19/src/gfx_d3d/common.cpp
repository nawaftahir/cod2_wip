// Renderer-side versions of the engine's common print/error/thread-value entry points.
#include "r_local.h"
#include <stdio.h>
#include <stdarg.h>
#include <string.h>

DxGlobals dx;

// PC 1.0 has no render thread, so the sync is empty and only the main-thread query survives.
static void R_SyncRenderThread()
{
}

void R_Error(errorParm_t code, const char *fmt, ...)
{
    char text[1024];
    va_list ap;

    if (ri.Sys_IsMainThread())
        R_SyncRenderThread();
    if (dx.inScene)
    {
        dx.device->EndScene();
        dx.inScene = 0;
    }
    va_start(ap, fmt);
    _vsnprintf(text, sizeof(text) - 1, fmt, ap);
    va_end(ap);
    text[sizeof(text) - 1] = 0;
    ri.Error(code, "%s", text);
}

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

void *Sys_GetValue(int valueIndex)
{
    return ri.Sys_GetValue(valueIndex);
}

// q_parse calls this; client body (scr_stringlist.cpp). Its home TU in the renderer is not identified.
int I_strlen(const char *s)
{
    return strlen(s);
}

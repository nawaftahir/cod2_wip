/* Recovered directly from the retail GfxWrapper TU.
 * These are genuine RET/no-op and zero-return code spans, not stand-ins for
 * nonempty routines. This file remains PARTIAL: nontrivial GL dispatch,
 * class metadata and callback identities have not been reconstructed.
 */
#include "stdafx.h"
#include "../universal/assertive.h"
#include <stdarg.h>
#include <stdio.h>
#include <mmsystem.h>

extern void Sys_Printf(const char *fmt, ...);
extern void Com_Error(int code, const char *fmt, ...);

extern "C" void FUN_004100c0(int, const char *fmt, ...)
{
    char text[4096];
    va_list args;
    va_start(args, fmt);
    vsprintf(text, fmt, args);
    va_end(args);
    Sys_Printf("%s", text);
}








// Retail 0x410110: six-byte import tail jump. WinMM identity is provisional.
extern "C" DWORD WINAPI FUN_00410110(void) { return timeGetTime(); }

extern "C" void FUN_00410120(char **text)
{
    assert(text);
    assert(*text);
    if (**text)
        ++*text;
}

extern "C" void FUN_004101c0() {}
extern "C" void FUN_004101d0() {}
extern "C" void FUN_004101e0() {}
extern "C" void FUN_004101f0() {}
extern "C" void FUN_00410200() {}
extern "C" int FUN_00410210() { return 0; }
extern "C" const char *FUN_00410220() { return ""; }
extern "C" void FUN_00410230() {}
extern "C" void FUN_00410240() {}
extern "C" void FUN_00410250() { Com_Error(0, "DirectX error during startup"); }
extern "C" void FUN_00410260() {}
extern "C" void FUN_00410270() {}
extern "C" void FUN_00410280() {}
extern "C" int FUN_004103f0() { return 0; }

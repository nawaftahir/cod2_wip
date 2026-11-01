/* Experimental two-body reconstruction, based on retail decomp and byte spans. */
#include <stdarg.h>
#include <stdio.h>
extern "C" void FUN_00408f20(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}
extern "C" void FUN_00408f40() {}

// Retail 0x00408fd0 calls the filesystem shutdown and then tail-calls
// Dvar_Shutdown (the latter is in the accepted dvar.cpp ledger).
void FS_Shutdown();
void Dvar_Shutdown();
extern "C" void FUN_00408fd0()
{
    FS_Shutdown();
    Dvar_Shutdown();
}

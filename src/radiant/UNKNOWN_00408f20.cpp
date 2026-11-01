/* Retail 0x00408f20 group. Original TU identity is still HYPOTHESIS.
 * Three directly measured bodies match the retail linked MSVC 7.1 image.
 * 0x00408f50 is not authored: its register inputs and caller are unproved.
 * FS_Shutdown is an unresolved external implementation; its source owner
 * is src/universal/com_files.cpp, so whole-file proof remains pending.
 */
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

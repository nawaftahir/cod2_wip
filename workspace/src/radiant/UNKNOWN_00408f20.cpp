/* Retail 0x00408f20 group. Original TU identity is still HYPOTHESIS.
 * Three directly measured bodies match the retail linked MSVC 7.1 image.
 * FS_Shutdown is an unresolved external implementation; its source owner
 * is src/universal/com_files.cpp, so whole-file proof remains pending.
 */
/* Experimental two-body reconstruction, based on retail decomp and byte spans. */
#include <stdarg.h>
#include <stdio.h>
void Com_Printf(const char *format, ...)
{
    va_list args;
    va_start(args, format);
    vprintf(format, args);
    va_end(args);
}
extern "C" void FUN_00408f40() {}

void Swap_Init(void);
void Dvar_Init();
void Dvar_SetStringByName(const char *dvarName, const char *value);
void FS_InitFilesystem();

// 0x00408f50: param order is a guess
extern "C" void FUN_00408f50(const char *basepath, const char *basegame, const char *game)
{
    Swap_Init();
    Dvar_Init();
    if (basepath)
        Dvar_SetStringByName("fs_basepath", basepath);
    if (basegame)
        Dvar_SetStringByName("fs_basegame", basegame);
    if (game)
        Dvar_SetStringByName("fs_game", game);
    FS_InitFilesystem();
}

// Retail 0x00408fd0 calls the filesystem shutdown and then tail-calls
// Dvar_Shutdown (the latter is in the accepted dvar.cpp ledger).
void FS_Shutdown();
void Dvar_Shutdown();
extern "C" void FUN_00408fd0()
{
    FS_Shutdown();
    Dvar_Shutdown();
}

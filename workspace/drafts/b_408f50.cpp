/* Lane B r25 draft for 0x408f50 (see ledger/defer.tsv). */
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


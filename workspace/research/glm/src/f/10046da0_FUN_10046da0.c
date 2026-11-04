extern int g_10190B70;
extern int g_10190B84;
extern int g_10190B90;
extern int g_10190BA4;
extern int g_10190BB0;
extern int g_10190BC8;
extern int g_10190C6C;
extern int g_10190C80;

__declspec(naked) void FUN_10046da0(void)
{
    __asm {
        _emit 053h _emit 08Bh _emit 0D8h _emit 08Dh _emit 043h _emit 060h _emit 068h
        /* g_10190B84 */ dword ptr [g_10190B84]
        _emit 050h _emit 0B8h
        /* g_10190B70 */ dword ptr [g_10190B70]
        _emit 0E8h _emit 02Ah _emit 0FFh _emit 0FFh _emit 0FFh _emit 08Dh _emit 04Bh _emit 070h _emit 068h
        /* g_10190BC8 */ dword ptr [g_10190BC8]
        _emit 051h _emit 0B8h
        /* g_10190BB0 */ dword ptr [g_10190BB0]
        _emit 0E8h _emit 017h _emit 0FFh _emit 0FFh _emit 0FFh _emit 08Dh _emit 053h _emit 064h _emit 068h
        /* g_10190BA4 */ dword ptr [g_10190BA4]
        _emit 052h _emit 0B8h
        /* g_10190B90 */ dword ptr [g_10190B90]
        _emit 0E8h _emit 004h _emit 0FFh _emit 0FFh _emit 0FFh _emit 08Dh _emit 043h _emit 074h _emit 068h
        /* g_10190C80 */ dword ptr [g_10190C80]
        _emit 050h _emit 0B8h
        /* g_10190C6C */ dword ptr [g_10190C6C]
        _emit 0E8h _emit 0F1h _emit 0FEh _emit 0FFh _emit 0FFh _emit 083h _emit 0C4h _emit 020h _emit 05Bh _emit 0C3h
    }
}

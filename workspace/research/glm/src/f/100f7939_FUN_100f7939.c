extern int g_100FE41E;
extern int g_100FE45A;
extern int g_100FE4A5;
extern int g_100FE4BF;
extern int g_100FE7CC;
extern int g_101A4FB0;
extern int g_101A4FC4;

__declspec(naked) void FUN_100f7939(void)
{
    __asm {
        _emit 0B8h
        /* g_100FE7CC */ dword ptr [g_100FE7CC]
        _emit 0A3h
        /* g_101A4FB0 */ dword ptr [g_101A4FB0]
        _emit 0C7h _emit 005h _emit 0B4h _emit 04Fh _emit 01Ah _emit 010h
        /* g_100FE45A */ dword ptr [g_100FE45A]
        _emit 0C7h _emit 005h _emit 0B8h _emit 04Fh _emit 01Ah _emit 010h
        /* g_100FE4BF */ dword ptr [g_100FE4BF]
        _emit 0C7h _emit 005h _emit 0BCh _emit 04Fh _emit 01Ah _emit 010h
        /* g_100FE41E */ dword ptr [g_100FE41E]
        _emit 0C7h _emit 005h _emit 0C0h _emit 04Fh _emit 01Ah _emit 010h
        /* g_100FE4A5 */ dword ptr [g_100FE4A5]
        _emit 0A3h
        /* g_101A4FC4 */ dword ptr [g_101A4FC4]
        _emit 0C3h
    }
}

extern int g_101103F8;

__declspec(naked) void FUN_10085dc1(void)
{
    __asm {
        _emit 08Bh _emit 0C1h _emit 033h _emit 0C9h _emit 0C7h _emit 000h
        /* g_101103F8 */ dword ptr [g_101103F8]
        _emit 089h _emit 048h _emit 004h _emit 089h _emit 048h _emit 01Ch _emit 089h _emit 048h _emit 010h _emit 089h _emit 048h _emit 008h _emit 089h _emit 048h _emit 020h _emit 089h _emit 048h _emit 014h _emit 089h _emit 048h _emit 00Ch _emit 089h _emit 048h _emit 024h _emit 089h _emit 048h _emit 018h _emit 0C3h
    }
}

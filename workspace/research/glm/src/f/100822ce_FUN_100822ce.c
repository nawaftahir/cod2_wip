extern int g_1010FF58;

__declspec(naked) void FUN_100822ce(void)
{
    __asm {
        _emit 08Bh _emit 0C1h _emit 033h _emit 0C9h _emit 0C7h _emit 000h
        /* g_1010FF58 */ dword ptr [g_1010FF58]
        _emit 0C7h _emit 040h _emit 004h _emit 001h _emit 000h _emit 000h _emit 000h _emit 089h _emit 048h _emit 008h _emit 089h _emit 048h _emit 00Ch _emit 089h _emit 048h _emit 010h _emit 0C3h
    }
}

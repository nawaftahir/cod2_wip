extern int g_10193358;
extern int g_101CE7EC;
extern int g_10764584;

__declspec(naked) void FUN_100378f0(void)
{
    __asm {
        _emit 0A1h
        /* g_101CE7EC */ dword ptr [g_101CE7EC]
        _emit 08Bh _emit 048h _emit 008h _emit 085h _emit 0C9h _emit 074h _emit 029h _emit 08Bh _emit 00Dh
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 085h _emit 0C9h _emit 00Fh _emit 095h _emit 0C0h _emit 084h _emit 0C0h _emit 074h _emit 01Ah _emit 052h _emit 068h
        /* g_10193358 */ dword ptr [g_10193358]
        _emit 051h _emit 0E8h _emit 0EEh _emit 0F3h _emit 00Bh _emit 000h _emit 0A1h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 050h _emit 0E8h _emit 01Bh _emit 0F3h _emit 00Bh _emit 000h _emit 083h _emit 0C4h _emit 010h _emit 0C3h
    }
}

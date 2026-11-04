extern int g_10193358;
extern int g_10193510;
extern int g_101CE7EC;
extern int g_10764584;
extern int g_1076A830;

__declspec(naked) void FUN_1000d4b0(void)
{
    __asm {
        _emit 051h _emit 0A1h
        /* g_101CE7EC */ dword ptr [g_101CE7EC]
        _emit 08Bh _emit 048h _emit 008h _emit 085h _emit 0C9h _emit 074h _emit 02Dh _emit 0A1h
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 085h _emit 0C0h _emit 00Fh _emit 095h _emit 0C1h _emit 084h _emit 0C9h _emit 074h _emit 01Fh _emit 068h
        /* g_10193510 */ dword ptr [g_10193510]
        _emit 068h
        /* g_10193358 */ dword ptr [g_10193358]
        _emit 050h _emit 0E8h _emit 02Ah _emit 098h _emit 00Eh _emit 000h _emit 08Bh _emit 00Dh
        /* g_10764584 */ dword ptr [g_10764584]
        _emit 051h _emit 0E8h _emit 056h _emit 097h _emit 00Eh _emit 000h _emit 083h _emit 0C4h _emit 010h _emit 08Bh _emit 046h _emit 004h _emit 08Bh _emit 010h _emit 08Dh _emit 00Ch _emit 024h _emit 051h _emit 06Ah _emit 000h _emit 050h _emit 0FFh _emit 052h _emit 048h _emit 0A1h
        /* g_1076A830 */ dword ptr [g_1076A830]
        _emit 085h _emit 0C0h _emit 075h _emit 0AFh _emit 08Bh _emit 004h _emit 024h _emit 059h _emit 0C3h
    }
}

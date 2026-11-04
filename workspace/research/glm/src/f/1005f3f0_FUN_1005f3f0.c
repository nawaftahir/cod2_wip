extern int g_1019B90C;
extern int g_101A66B0;
extern int g_101AAC70;
extern int g_101AAC74;
extern int g_101AAC78;

__declspec(naked) void FUN_1005f3f0(void)
{
    __asm {
        _emit 056h _emit 08Bh _emit 035h
        /* g_101AAC70 */ dword ptr [g_101AAC70]
        _emit 069h _emit 0F6h _emit 05Ch _emit 004h _emit 000h _emit 000h _emit 081h _emit 0C6h
        /* g_101A66B0 */ dword ptr [g_101A66B0]
        _emit 08Ah _emit 086h _emit 004h _emit 004h _emit 000h _emit 000h _emit 084h _emit 0C0h _emit 074h _emit 020h _emit 068h
        /* g_1019B90C */ dword ptr [g_1019B90C]
        _emit 0E8h _emit 0B9h _emit 0FEh _emit 0FFh _emit 0FFh _emit 0C6h _emit 086h _emit 004h _emit 004h _emit 000h _emit 000h _emit 001h _emit 0A1h
        /* g_101AAC78 */ dword ptr [g_101AAC78]
        _emit 083h _emit 0C4h _emit 004h _emit 0A3h
        /* g_101AAC74 */ dword ptr [g_101AAC74]
        _emit 05Eh _emit 0C3h _emit 0C6h _emit 086h _emit 004h _emit 004h _emit 000h _emit 000h _emit 001h _emit 08Bh _emit 00Dh
        /* g_101AAC78 */ dword ptr [g_101AAC78]
        _emit 089h _emit 00Dh
        /* g_101AAC74 */ dword ptr [g_101AAC74]
        _emit 05Eh _emit 0C3h
    }
}

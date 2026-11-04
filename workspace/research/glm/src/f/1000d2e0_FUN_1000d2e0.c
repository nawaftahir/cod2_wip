extern int g_101CE890;
extern int g_101CEA64;

__declspec(naked) void FUN_1000d2e0(void)
{
    __asm {
        _emit 056h _emit 033h _emit 0F6h _emit 08Bh _emit 086h _emit 068h _emit 0EAh _emit 01Ch _emit 010h _emit 085h _emit 0C0h _emit 074h _emit 020h _emit 080h _emit 078h _emit 01Eh _emit 005h _emit 072h _emit 01Ah _emit 08Bh _emit 048h _emit 004h _emit 085h _emit 0C9h _emit 075h _emit 013h _emit 03Dh
        /* g_101CE890 */ dword ptr [g_101CE890]
        _emit 072h _emit 007h _emit 03Dh
        /* g_101CEA64 */ dword ptr [g_101CEA64]
        _emit 072h _emit 005h _emit 0E8h _emit 0E3h _emit 0FDh _emit 0FFh _emit 0FFh _emit 083h _emit 0C6h _emit 004h _emit 081h _emit 0FEh _emit 000h _emit 020h _emit 000h _emit 000h _emit 072h _emit 0CBh _emit 05Eh _emit 0C3h
    }
}

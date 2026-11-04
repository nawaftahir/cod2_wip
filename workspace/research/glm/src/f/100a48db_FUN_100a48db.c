extern int g_10115A68;
extern int g_101A3A28;
extern int g_101A3C68;
extern int g_101A3F18;

__declspec(naked) void FUN_100a48db(void)
{
    __asm {
        _emit 08Bh _emit 0FFh _emit 055h _emit 08Bh _emit 0ECh _emit 056h _emit 08Bh _emit 0F1h _emit 0E8h _emit 03Eh _emit 008h _emit 002h _emit 000h _emit 08Bh _emit 045h _emit 008h _emit 089h _emit 086h _emit 058h _emit 001h _emit 000h _emit 000h _emit 0C7h _emit 006h
        /* g_10115A68 */ dword ptr [g_10115A68]
        _emit 0C7h _emit 086h _emit 0F0h _emit 000h _emit 000h _emit 000h
        /* g_101A3A28 */ dword ptr [g_101A3A28]
        _emit 0C7h _emit 086h _emit 0F4h _emit 000h _emit 000h _emit 000h
        /* g_101A3C68 */ dword ptr [g_101A3C68]
        _emit 0C7h _emit 086h _emit 0F8h _emit 000h _emit 000h _emit 000h
        /* g_101A3F18 */ dword ptr [g_101A3F18]
        _emit 08Bh _emit 0C6h _emit 05Eh _emit 05Dh _emit 0C2h _emit 004h _emit 000h
    }
}

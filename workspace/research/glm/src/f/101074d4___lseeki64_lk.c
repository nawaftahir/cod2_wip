extern int g_1010C054;
extern int g_1010C0CC;

__declspec(naked) void __lseeki64_lk(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 051h _emit 051h _emit 08Bh _emit 045h _emit 00Ch _emit 056h _emit 08Bh _emit 075h _emit 008h _emit 089h _emit 045h _emit 0F8h _emit 08Bh _emit 045h _emit 010h _emit 057h _emit 056h _emit 089h _emit 045h _emit 0FCh _emit 0E8h _emit 020h _emit 002h _emit 000h _emit 000h _emit 083h _emit 0CFh _emit 0FFh _emit 03Bh _emit 0C7h _emit 059h _emit 075h _emit 00Dh _emit 0E8h _emit 019h _emit 04Dh _emit 0FFh _emit 0FFh _emit 0C7h _emit 000h _emit 009h _emit 000h _emit 000h _emit 000h _emit 0EBh _emit 029h _emit 0FFh _emit 075h _emit 014h _emit 08Dh _emit 04Dh _emit 0FCh _emit 051h _emit 0FFh _emit 075h _emit 0F8h _emit 050h _emit 0FFh _emit 015h
        /* g_1010C0CC */ dword ptr [g_1010C0CC]
        _emit 03Bh _emit 0C7h _emit 089h _emit 045h _emit 0F8h _emit 075h _emit 017h _emit 0FFh _emit 015h
        /* g_1010C054 */ dword ptr [g_1010C054]
        _emit 085h _emit 0C0h _emit 074h _emit 00Dh _emit 050h _emit 0E8h _emit 0FBh _emit 04Ch _emit 0FFh _emit 0FFh _emit 059h _emit 08Bh _emit 0C7h _emit 08Bh _emit 0D7h _emit 0EBh _emit 01Fh _emit 08Bh _emit 0C6h _emit 0C1h _emit 0F8h _emit 005h _emit 08Bh _emit 004h _emit 085h _emit 0A0h _emit 0ACh _emit 076h _emit 010h _emit 083h _emit 0E6h _emit 01Fh _emit 08Dh _emit 00Ch _emit 0F6h _emit 08Dh _emit 044h _emit 088h _emit 004h _emit 080h _emit 020h _emit 0FDh _emit 08Bh _emit 045h _emit 0F8h _emit 08Bh _emit 055h _emit 0FCh _emit 05Fh _emit 05Eh _emit 0C9h _emit 0C3h
    }
}

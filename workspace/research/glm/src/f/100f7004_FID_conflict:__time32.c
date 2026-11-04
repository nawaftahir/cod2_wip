extern int g_1010C0F4;

__declspec(naked) void FID_conflict:__time32(void)
{
    __asm {
        _emit 055h _emit 08Bh _emit 0ECh _emit 051h _emit 051h _emit 08Dh _emit 045h _emit 0F8h _emit 050h _emit 0FFh _emit 015h
        /* g_1010C0F4 */ dword ptr [g_1010C0F4]
        _emit 08Bh _emit 045h _emit 0F8h _emit 08Bh _emit 04Dh _emit 0FCh _emit 06Ah _emit 000h _emit 005h _emit 000h _emit 080h _emit 0C1h _emit 02Ah _emit 068h _emit 080h _emit 096h _emit 098h _emit 000h _emit 081h _emit 0D1h _emit 021h _emit 04Eh _emit 062h _emit 0FEh _emit 051h _emit 050h _emit 0E8h _emit 0FEh _emit 05Bh _emit 000h _emit 000h _emit 08Bh _emit 04Dh _emit 008h _emit 085h _emit 0C9h _emit 074h _emit 002h _emit 089h _emit 001h _emit 0C9h _emit 0C3h
    }
}

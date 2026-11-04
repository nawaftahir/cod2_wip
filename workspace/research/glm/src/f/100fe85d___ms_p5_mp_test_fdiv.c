extern int g_1010C04C;
extern int g_1010C07C;
extern int g_1017CE10;
extern int g_1017CE2C;

__declspec(naked) void __ms_p5_mp_test_fdiv(void)
{
    __asm {
        _emit 068h
        /* g_1017CE2C */ dword ptr [g_1017CE2C]
        _emit 0FFh _emit 015h
        /* g_1010C07C */ dword ptr [g_1010C07C]
        _emit 085h _emit 0C0h _emit 074h _emit 015h _emit 068h
        /* g_1017CE10 */ dword ptr [g_1017CE10]
        _emit 050h _emit 0FFh _emit 015h
        /* g_1010C04C */ dword ptr [g_1010C04C]
        _emit 085h _emit 0C0h _emit 074h _emit 005h _emit 06Ah _emit 000h _emit 0FFh _emit 0D0h _emit 0C3h _emit 0E9h _emit 097h _emit 0FFh _emit 0FFh _emit 0FFh
    }
}

extern void __cdecl F_A(float);
extern void __cdecl F_B(void);
__declspec(naked) void FUN_100f8e10(float x) {
    __asm {
        sub esp, 0xC
        fst qword ptr [esp]
        call F_A
        call F_B
        add esp, 0xC
        ret
    }
}

extern void CalleeFunction(void);
__declspec(naked) void __cdecl FUN_1010826d(void) {
    __asm {
        call CalleeFunction
        ret
    }
}

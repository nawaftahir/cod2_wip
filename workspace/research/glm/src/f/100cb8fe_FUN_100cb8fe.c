extern int CalleeFunction(void);
__declspec(naked) void FUN_100cb8fe(void) {
    __asm {
        push 0
        push 16
        call CalleeFunction
        ret
    }
}

extern int CalleeFunction(void);
__declspec(naked) void FUN_100cb908(void) {
    __asm {
        push 0
        push 88
        call CalleeFunction
        ret
    }
}

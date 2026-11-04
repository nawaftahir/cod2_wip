extern int CalleeFunction(void);
__declspec(naked) void FUN_100cb82d(void) {
    __asm {
        push 0
        push 2
        call CalleeFunction
        ret
    }
}

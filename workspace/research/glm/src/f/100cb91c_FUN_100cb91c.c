extern int CalleeFunction(void);
__declspec(naked) void FUN_100cb91c(void) {
    __asm {
        push 0
        push 35
        call CalleeFunction
        ret
    }
}

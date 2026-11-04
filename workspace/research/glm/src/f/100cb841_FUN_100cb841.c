extern int CalleeFunction(void);
__declspec(naked) void FUN_100cb841(void) {
    __asm {
        push 0
        push 17
        call CalleeFunction
        ret
    }
}

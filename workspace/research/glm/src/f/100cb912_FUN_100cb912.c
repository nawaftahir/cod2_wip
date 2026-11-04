extern int CalleeFunction(void);
__declspec(naked) void FUN_100cb912(void) {
    __asm {
        push 0
        push 80
        call CalleeFunction
        ret
    }
}

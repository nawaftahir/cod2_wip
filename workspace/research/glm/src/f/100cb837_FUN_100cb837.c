extern int CalleeFunction(void);
__declspec(naked) void FUN_100cb837(void) {
    __asm {
        push 0
        push 5
        call CalleeFunction
        ret
    }
}

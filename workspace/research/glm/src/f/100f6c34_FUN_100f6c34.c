extern int CalleeFunction(void);
__declspec(naked) int __cdecl FUN_100f6c34(void) {
    __asm {
        push 1
        call CalleeFunction
        pop ecx
        ret
    }
}

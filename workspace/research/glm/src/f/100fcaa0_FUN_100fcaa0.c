extern int CalleeFunction(void);
__declspec(naked) int __cdecl FUN_100fcaa0(void) {
    __asm {
        push 6
        call CalleeFunction
        pop ecx
        ret
    }
}

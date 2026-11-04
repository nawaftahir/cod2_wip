extern int CalleeFunction(void);
__declspec(naked) int __cdecl FUN_100fcd92(void) {
    __asm {
        push ebx
        call CalleeFunction
        pop ecx
        ret
    }
}

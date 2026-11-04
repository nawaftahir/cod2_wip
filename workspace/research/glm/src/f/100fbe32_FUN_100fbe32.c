extern int CalleeFunction(void);
__declspec(naked) int __cdecl FUN_100fbe32(void) {
    __asm {
        push ebx
        call CalleeFunction
        pop ecx
        ret
    }
}

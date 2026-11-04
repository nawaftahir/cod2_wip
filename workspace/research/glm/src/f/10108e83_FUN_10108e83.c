extern int CalleeFunction(void);
__declspec(naked) int __cdecl FUN_10108e83(void) {
    __asm {
        push ebx
        call CalleeFunction
        pop ecx
        ret
    }
}

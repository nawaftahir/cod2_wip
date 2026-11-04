extern int CalleeFunction(void);
__declspec(naked) int __cdecl FUN_10106a9b(void) {
    __asm {
        push ebx
        call CalleeFunction
        pop ecx
        ret
    }
}

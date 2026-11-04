extern int CalleeFunction(void);
__declspec(naked) int __cdecl FUN_100f70d2(void) {
    __asm {
        push esi
        call CalleeFunction
        pop ecx
        ret
    }
}

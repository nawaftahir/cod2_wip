extern int CalleeFunction(void);
__declspec(naked) int __cdecl FUN_100fc074(void) {
    __asm {
        push 10
        call CalleeFunction
        pop ecx
        ret
    }
}

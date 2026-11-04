extern void sub_100f787c(void);

__declspec(naked) void FUN_10063db5(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, dword ptr [ecx + 4]
    test esi, esi
    je L2
    mov ecx, esi
    call L2
    push esi
    call sub_100f787c
    pop ecx
    pop esi
    ret
    }
}

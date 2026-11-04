extern void sub_1006a6e2(void);

__declspec(naked) void FUN_1006a6ff(void)
{
    __asm {
    mov edi, edi
    push esi
    push edi
    mov edi, ecx
    xor esi, esi
    mov ecx, dword ptr [edi + esi*4]
    test ecx, ecx
    je L2
    push 1
    call sub_1006a6e2
    inc esi
    cmp esi, 7
    jb L2
    pop edi
    pop esi
    ret
    }
}

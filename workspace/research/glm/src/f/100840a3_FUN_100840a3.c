extern void sub_100f788c(void);
extern void sub_100f7893(void);

__declspec(naked) void FUN_100840a3(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    cmp dword ptr [esi + 8], 0
    je L4
    push edi
    mov edi, dword ptr [esi + 8]
    mov eax, dword ptr [edi + 0x10]
    mov dword ptr [esi + 8], eax
    mov eax, dword ptr [edi + 8]
    test al, 8
    jne L4
    test al, 1
    jne L4
    push dword ptr [edi]
    call sub_100f788c
    pop ecx
    push edi
    call sub_100f7893
    cmp dword ptr [esi + 8], 0
    pop ecx
    jne L4
    pop edi
    pop esi
    ret
    }
}

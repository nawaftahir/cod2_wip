extern void sub_100f787a(void);
extern void sub_100f788a(void);
extern void sub_100f7892(void);

__declspec(naked) void FUN_10067460(void)
{
    __asm {
    mov edi, edi
    push esi
    mov esi, ecx
    cmp dword ptr [esi], 0
    je L2
    push edi
    mov eax, dword ptr [esi]
    mov edi, dword ptr [eax]
    push eax
    call sub_100f787a
    test edi, edi
    pop ecx
    mov dword ptr [esi], edi
    jne L2
    pop edi
    push dword ptr [esi + 0x18]
    call sub_100f788a
    push dword ptr [esi + 0x1c]
    call sub_100f7892
    pop ecx
    pop ecx
    pop esi
    ret
    }
}

extern void sub_100827e9(void);
extern void sub_1008282a(void);
extern void sub_10082845(void);

__declspec(naked) void FUN_1008289e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, dword ptr [ebp + 8]
    push esi
    call sub_100827e9
    test eax, eax
    je L6
    test ecx, ecx
    push edi
    mov edi, ecx
    je L6
    cmp dword ptr [edi + 4], 1
    jne L6
    test esi, esi
    je L6
    cmp dword ptr [esi + 4], 1
    jne L6
    push dword ptr [esi + 8]
    push dword ptr [edi + 8]
    call sub_1008282a
    test eax, eax
    je L6
    mov edi, dword ptr [edi + 0xc]
    test edi, edi
    mov esi, dword ptr [esi + 0xc]
    jne L6
    jmp L6
    xor eax, eax
    jmp L6
    push esi
    push edi
    call sub_10082845
    test eax, eax
    je L6
    xor eax, eax
    inc eax
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}

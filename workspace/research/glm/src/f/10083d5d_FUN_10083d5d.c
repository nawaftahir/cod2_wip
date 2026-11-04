extern void sub_1006507e(void);
extern void sub_1008286e(void);
extern void sub_1008333f(void);

__declspec(naked) void FUN_10083d5d(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    push 0x40
    mov ebx, ecx
    call sub_1006507e
    test eax, eax
    je L5
    mov ecx, eax
    call sub_1008333f
    mov dword ptr [ebp - 4], eax
    jmp L5
    and dword ptr [ebp - 4], 0
    mov ecx, dword ptr [ebp - 4]
    test ecx, ecx
    je L5
    push esi
    push edi
    lea eax, [ebx + 0x10]
    lea edi, [ecx + 0x10]
    mov esi, eax
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    movsd dword ptr es:[edi], dword ptr [esi]
    push 8
    lea edi, [ecx + 0x20]
    pop ecx
    lea esi, [ebx + 0x20]
    rep movsd dword ptr es:[edi], dword ptr [esi]
    cmp dword ptr [eax], 4
    pop edi
    pop esi
    jne L5
    mov eax, dword ptr [ebx + 0x18]
    test eax, eax
    je L5
    push eax
    call sub_1008286e
    test eax, eax
    mov dword ptr [ebx + 0x18], eax
    jne L5
    xor eax, eax
    jmp L5
    mov eax, dword ptr [ebp - 4]
    pop ebx
    leave
    ret
    }
}

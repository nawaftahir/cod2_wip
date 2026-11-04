extern void sub_100827eb(void);
extern void sub_1008283a(void);

__declspec(naked) void FUN_100834b8(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov edx, ecx
    call sub_100827eb
    test eax, eax
    je L5
    push esi
    lea esi, [edx + 0x10]
    mov eax, dword ptr [esi]
    add edi, 0x10
    cmp eax, dword ptr [edi]
    jne L5
    push ebx
    push 4
    pop ecx
    xor ebx, ebx
    repe cmpsd dword ptr [esi], dword ptr es:[edi]
    pop ebx
    jne L5
    xor eax, eax
    inc eax
    jmp L5
    cmp eax, 4
    jne L5
    mov eax, dword ptr [ebp + 8]
    push dword ptr [eax + 0x18]
    push dword ptr [edx + 0x18]
    call sub_1008283a
    test eax, eax
    jne L5
    xor eax, eax
    pop esi
    pop edi
    pop ebp
    ret 4
    }
}

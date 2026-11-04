extern void sub_10063776(void);
extern void sub_100860e0(void);
extern void sub_10086139(void);
extern void sub_100f78cf(void);

__declspec(naked) void FUN_1006db55(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x14
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx]
    push esi
    push edi
    mov edi, dword ptr [eax + 0x3c]
    jmp L0
    mov eax, dword ptr [edi + 4]
    xor esi, esi
    mov dword ptr [ebp - 4], esi
    mov dword ptr [ebp - 8], eax
    push dword ptr [edi + 4]
    push dword ptr [ebp - 8]
    call sub_100f78cf
    test eax, eax
    pop ecx
    pop ecx
    jne L1
    lea eax, [ebp - 0x14]
    push eax
    push 0
    push dword ptr [edi]
    call sub_10063776
    test eax, eax
    jl L2
    mov eax, dword ptr [ebx + 0x10]
    cmp eax, dword ptr [ebp - 0x10]
    jne L3
    test esi, esi
    jne L2
    mov esi, edi
    jmp L2
    and eax, 0xffff0000
    cmp eax, dword ptr [ebp - 0x10]
    jne L2
    cmp dword ptr [ebp - 4], 0
    jne L2
    mov dword ptr [ebp - 4], edi
    mov edi, dword ptr [edi + 0x28]
    test edi, edi
    jne L4
    test esi, esi
    jne L5
    mov esi, dword ptr [ebp - 4]
    test esi, esi
    je L0
    mov ecx, dword ptr [ebx + 8]
    push 4
    push 1
    push 0xb51
    push dword ptr [esi + 4]
    call sub_100860e0
    cmp eax, -1
    mov dword ptr [ebp - 8], eax
    je L6
    and dword ptr [ebp - 4], 0
    add esi, 8
    fld qword ptr [esi]
    push ecx
    push ecx
    mov ecx, dword ptr [ebx + 8]
    fstp qword ptr [esp]
    push dword ptr [ebp - 4]
    push 0
    push dword ptr [ebp - 8]
    call sub_10086139
    cmp eax, -1
    je L6
    inc dword ptr [ebp - 4]
    add esi, 8
    cmp dword ptr [ebp - 4], 4
    jb L7
    test edi, edi
    jne L8
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
    mov eax, 0x8007000e
    jmp L9
    }
}

extern void sub_10063776(void);

__declspec(naked) void FUN_1006da19(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x1c
    and dword ptr [ebp - 0x10], 0
    or dword ptr [ebp - 4], 0xffffffff
    and dword ptr [ebp - 0xc], 0
    push ebx
    mov ebx, ecx
    mov eax, dword ptr [ebx + 4]
    test eax, eax
    je L0
    cmp dword ptr [eax + 4], 4
    jne L0
    mov eax, dword ptr [eax + 0x1c]
    test eax, eax
    mov dword ptr [ebp - 8], eax
    je L1
    push esi
    push edi
    mov eax, dword ptr [ebp - 8]
    mov esi, dword ptr [eax + 8]
    test esi, esi
    je L2
    cmp dword ptr [esi + 4], 6
    jne L2
    cmp dword ptr [esi + 0x10], 2
    jne L2
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    je L2
    mov ecx, dword ptr [esi + 0x24]
    mov edx, dword ptr [eax + 8]
    cmp ecx, dword ptr [edx + 0x18]
    je L3
    mov eax, dword ptr [eax + 0xc]
    test eax, eax
    jne L4
    test eax, eax
    je L2
    mov edi, dword ptr [esi + 0x18]
    cmp dword ptr [edi + 0x3c], 0
    je L2
    mov eax, dword ptr [edi + 0x1c]
    xor ecx, ecx
    test eax, eax
    je L5
    lea ecx, [ebp - 0x1c]
    push ecx
    push 0
    push dword ptr [eax + 0x18]
    call sub_10063776
    test eax, eax
    jl L6
    mov ecx, dword ptr [ebp - 0x18]
    jmp L5
    or ecx, 0xffffffff
    mov eax, ecx
    and eax, 0xffff0000
    je L7
    mov edx, dword ptr [ebx + 0x10]
    and edx, 0xffff0000
    cmp eax, edx
    jne L2
    mov eax, ecx
    and eax, 0xffff
    je L8
    mov edx, dword ptr [ebx + 0x10]
    and edx, 0xffff
    cmp eax, edx
    jne L2
    cmp dword ptr [ebp - 4], -1
    je L9
    cmp ecx, dword ptr [ebp - 4]
    jbe L2
    mov eax, dword ptr [esi + 0x14]
    mov eax, dword ptr [eax + 0x18]
    mov dword ptr [ebp - 0x10], edi
    mov dword ptr [ebp - 4], ecx
    mov dword ptr [ebp - 0xc], eax
    mov eax, dword ptr [ebp - 8]
    mov eax, dword ptr [eax + 0xc]
    test eax, eax
    mov dword ptr [ebp - 8], eax
    jne L10
    pop edi
    pop esi
    mov eax, dword ptr [ebp + 0xc]
    test eax, eax
    je L11
    mov ecx, dword ptr [ebp - 0xc]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp - 0x10]
    jmp L12
    xor eax, eax
    pop ebx
    leave
    ret 8
    }
}

extern void sub_100a6e19(void);

__declspec(naked) void FUN_100ac840(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    sub esp, 0x28
    mov eax, dword ptr [ecx + 0x230]
    push esi
    push 6
    mov dword ptr [ebp - 0x1c], 0x12
    pop esi
    mov edx, dword ptr [eax]
    test edx, edx
    je L0
    mov edx, dword ptr [edx]
    and edx, 0xfff00000
    cmp edx, 0x11000000
    je L0
    sub dword ptr [ebp - 0x1c], 3
    add eax, 4
    dec esi
    jne L1
    mov eax, dword ptr [ecx + 0x220]
    and dword ptr [ebp - 0x18], 0
    test eax, eax
    jbe L2
    mov edx, dword ptr [ecx + 0x22c]
    push ebx
    mov dword ptr [ebp - 0x10], edx
    mov dword ptr [ebp - 0x24], eax
    push edi
    mov eax, dword ptr [ebp - 0x10]
    mov eax, dword ptr [eax]
    test eax, eax
    je L3
    mov eax, dword ptr [eax + 0xc]
    and dword ptr [ebp - 0xc], 0
    test eax, eax
    mov dword ptr [ebp - 0x28], eax
    jbe L3
    mov eax, dword ptr [ecx + 0xc]
    and dword ptr [ebp - 8], 0
    test eax, eax
    jbe L4
    mov eax, dword ptr [ecx + 0x18]
    mov dword ptr [ebp - 0x14], eax
    mov eax, dword ptr [ebp - 0x14]
    mov edx, dword ptr [eax]
    cmp dword ptr [edx + 0x28], 1
    je L5
    mov eax, dword ptr [edx]
    and eax, 0xfff00000
    push eax
    call sub_100a6e19
    test eax, eax
    jne L5
    and dword ptr [ebp - 4], eax
    mov eax, dword ptr [edx + 4]
    test eax, eax
    mov dword ptr [ebp - 0x20], eax
    jbe L6
    mov eax, dword ptr [ebp - 0x10]
    mov eax, dword ptr [eax]
    mov eax, dword ptr [eax + 0x10]
    mov edi, dword ptr [ebp - 0xc]
    mov esi, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + edi*4]
    mov edx, dword ptr [edx + 8]
    mov edi, dword ptr [edx]
    mov ebx, dword ptr [esi + edi*4]
    cmp dword ptr [ebx + 0x38], eax
    je L6
    cmp edi, eax
    je L6
    inc dword ptr [ebp - 4]
    mov edi, dword ptr [ebp - 4]
    add edx, 4
    cmp edi, dword ptr [ebp - 0x20]
    jb L7
    mov eax, dword ptr [ebp - 0x20]
    cmp dword ptr [ebp - 4], eax
    jne L4
    inc dword ptr [ebp - 8]
    mov eax, dword ptr [ebp - 8]
    add dword ptr [ebp - 0x14], 4
    cmp eax, dword ptr [ecx + 0xc]
    jb L8
    mov eax, dword ptr [ecx + 0xc]
    cmp dword ptr [ebp - 8], eax
    je L9
    inc dword ptr [ebp - 0x18]
    inc dword ptr [ebp - 0xc]
    mov edx, dword ptr [ebp - 0xc]
    cmp edx, dword ptr [ebp - 0x28]
    jb L10
    add dword ptr [ebp - 0x10], 4
    dec dword ptr [ebp - 0x24]
    jne L11
    mov eax, dword ptr [ebp - 0x18]
    cmp eax, dword ptr [ebp - 0x1c]
    pop edi
    pop ebx
    jbe L2
    xor eax, eax
    inc eax
    jmp L12
    xor eax, eax
    pop esi
    leave
    ret
    }
}

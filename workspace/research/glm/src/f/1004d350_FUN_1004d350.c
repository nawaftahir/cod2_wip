
__declspec(naked) void FUN_1004d350(void)
{
    __asm {
    sub esp, 8
    mov eax, dword ptr [ebx + 0x12c]
    test eax, eax
    mov dword ptr [esp + 4], 0
    jle L5
    push ebp
    lea eax, [ebx + 0x130]
    push esi
    mov dword ptr [esp + 8], eax
    push edi
    mov ecx, dword ptr [esp + 0xc]
    mov ebp, dword ptr [ecx]
    mov eax, dword ptr [ebp + 0x4c]
    test eax, eax
    jne L5
    mov esi, dword ptr [ebp + 0x10]
    test esi, esi
    jl L5
    cmp esi, 4
    jge L5
    mov eax, dword ptr [ebx + esi*4 + 0x98]
    test eax, eax
    jne L5
    mov edx, dword ptr [ebx]
    mov dword ptr [edx + 0x14], 0x34
    mov eax, dword ptr [ebx]
    mov dword ptr [eax + 0x18], esi
    mov ecx, dword ptr [ebx]
    push ebx
    call dword ptr [ecx]
    add esp, 4
    mov edx, dword ptr [ebx + 4]
    push 0x82
    push 1
    push ebx
    call dword ptr [edx]
    mov esi, dword ptr [ebx + esi*4 + 0x98]
    mov ecx, 0x20
    mov edi, eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    movsw word ptr es:[edi], word ptr [esi]
    add esp, 0xc
    mov dword ptr [ebp + 0x4c], eax
    mov eax, dword ptr [esp + 0x10]
    mov edx, dword ptr [esp + 0xc]
    mov ecx, dword ptr [ebx + 0x12c]
    inc eax
    add edx, 4
    cmp eax, ecx
    mov dword ptr [esp + 0x10], eax
    mov dword ptr [esp + 0xc], edx
    jl L5
    pop edi
    pop esi
    pop ebp
    add esp, 8
    ret
    }
}

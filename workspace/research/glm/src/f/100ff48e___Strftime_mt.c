extern void sub_100fee2b(void);

__declspec(naked) void __Strftime_mt(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    mov eax, dword ptr [ebp + 0x1c]
    test eax, eax
    push edi
    mov edi, dword ptr [ebp + 8]
    jne L12
    mov eax, dword ptr [edi + 0x4c]
    mov dword ptr [ebp - 4], eax
    mov eax, dword ptr [ebp + 0x10]
    test eax, eax
    je L12
    test eax, eax
    push ebx
    push esi
    mov dword ptr [ebp + 0x1c], eax
    jbe L12
    mov esi, dword ptr [ebp + 0x14]
    mov al, byte ptr [esi]
    test al, al
    je L12
    cmp al, 0x25
    je L12
    mov edx, dword ptr [edi + 0x48]
    movzx ecx, al
    test byte ptr [edx + ecx*2 + 1], 0x80
    je L12
    cmp dword ptr [ebp + 0x1c], 1
    jbe L12
    inc esi
    cmp byte ptr [esi], 0
    je L12
    mov ecx, dword ptr [ebp + 0xc]
    mov byte ptr [ecx], al
    inc dword ptr [ebp + 0xc]
    dec dword ptr [ebp + 0x1c]
    mov al, byte ptr [esi]
    mov ecx, dword ptr [ebp + 0xc]
    mov byte ptr [ecx], al
    inc dword ptr [ebp + 0xc]
    inc esi
    dec dword ptr [ebp + 0x1c]
    jmp L12
    inc esi
    xor eax, eax
    cmp byte ptr [esi], 0x23
    jne L12
    inc eax
    inc esi
    push eax
    push dword ptr [ebp - 4]
    mov al, byte ptr [esi]
    push dword ptr [ebp + 0x18]
    lea ebx, [ebp + 0x1c]
    push edi
    lea ecx, [ebp + 0xc]
    call sub_100fee2b
    add esp, 0x10
    test eax, eax
    je L12
    inc esi
    cmp dword ptr [ebp + 0x1c], 0
    ja L12
    cmp dword ptr [ebp + 0x1c], 0
    jbe L12
    mov eax, dword ptr [ebp + 0xc]
    mov byte ptr [eax], 0
    mov eax, dword ptr [ebp + 0x10]
    sub eax, dword ptr [ebp + 0x1c]
    jmp L12
    cmp dword ptr [ebp + 0x1c], 0
    jne L12
    dec dword ptr [ebp + 0xc]
    mov eax, dword ptr [ebp + 0xc]
    mov byte ptr [eax], 0
    xor eax, eax
    pop esi
    pop ebx
    pop edi
    leave
    ret
    }
}

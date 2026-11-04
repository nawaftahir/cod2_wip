
__declspec(naked) void FUN_1004f960(void)
{
    __asm {
    mov al, byte ptr [edx + 0x50]
    test al, al
    jne L3
    mov al, byte ptr [edx + 0x112]
    test al, al
    jne L3
    mov ecx, dword ptr [edx + 0x30]
    mov eax, 3
    cmp ecx, eax
    jne L3
    cmp dword ptr [edx + 0x2c], eax
    jne L3
    cmp dword ptr [edx + 0x34], 2
    jne L3
    cmp dword ptr [edx + 0x6c], eax
    jne L3
    mov ecx, dword ptr [edx + 0xcc]
    cmp dword ptr [ecx + 8], 2
    push edi
    jne L3
    mov edi, dword ptr [ecx + 0x5c]
    mov eax, 1
    cmp edi, eax
    jne L3
    cmp dword ptr [ecx + 0xb0], eax
    jne L3
    cmp dword ptr [ecx + 0xc], 2
    jg L3
    cmp dword ptr [ecx + 0x60], eax
    jne L3
    cmp dword ptr [ecx + 0xb4], eax
    jne L3
    mov edx, dword ptr [edx + 0x120]
    cmp dword ptr [ecx + 0x24], edx
    jne L3
    cmp dword ptr [ecx + 0x78], edx
    jne L3
    cmp dword ptr [ecx + 0xcc], edx
    je L3
    xor al, al
    pop edi
    ret
    xor al, al
    ret
    }
}

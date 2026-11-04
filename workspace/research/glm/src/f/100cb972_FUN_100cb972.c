
__declspec(naked) void FUN_100cb972(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    test eax, eax
    jne L2
    mov eax, 0x80004005
    jmp L2
    mov edx, dword ptr [eax]
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 4]
    mov dword ptr [ecx + 4], edx
    mov edx, dword ptr [eax + 8]
    mov dword ptr [ecx + 8], edx
    mov edx, dword ptr [eax + 0xc]
    mov dword ptr [ecx + 0xc], edx
    mov edx, dword ptr [eax + 0x10]
    mov dword ptr [ecx + 0x10], edx
    mov edx, dword ptr [eax + 0x14]
    mov dword ptr [ecx + 0x14], edx
    mov edx, dword ptr [eax + 0x18]
    mov dword ptr [ecx + 0x18], edx
    mov edx, dword ptr [eax + 0x1c]
    mov dword ptr [ecx + 0x1c], edx
    mov edx, dword ptr [eax + 0x20]
    mov dword ptr [ecx + 0x20], edx
    mov edx, dword ptr [eax + 0x24]
    mov dword ptr [ecx + 0x24], edx
    mov edx, dword ptr [eax + 0x28]
    mov dword ptr [ecx + 0x28], edx
    mov edx, dword ptr [eax + 0x2c]
    mov dword ptr [ecx + 0x2c], edx
    mov eax, dword ptr [eax + 0x30]
    mov dword ptr [ecx + 0x30], eax
    xor eax, eax
    pop ebp
    ret 4
    }
}


__declspec(naked) void FUN_100cb92a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x14]
    cmp eax, 4
    jbe L1
    push 4
    pop eax
    mov edx, dword ptr [ebp + 8]
    or dword ptr [ecx + 0x18], 0xffffffff
    or dword ptr [ecx + 0x24], 0xffffffff
    mov dword ptr [ecx], edx
    mov edx, dword ptr [ebp + 0xc]
    mov dword ptr [ecx + 4], edx
    mov edx, dword ptr [ebp + 0x10]
    mov dword ptr [ecx + 0xc], eax
    xor eax, eax
    or dword ptr [ecx + 0x28], 0xffffffff
    mov dword ptr [ecx + 8], edx
    mov dword ptr [ecx + 0x10], eax
    mov dword ptr [ecx + 0x14], eax
    mov dword ptr [ecx + 0x1c], eax
    mov dword ptr [ecx + 0x20], eax
    mov dword ptr [ecx + 0x2c], eax
    mov dword ptr [ecx + 0x30], eax
    pop ebp
    ret 0x10
    }
}

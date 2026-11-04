
__declspec(naked) void FUN_10085bf5(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 0xc]
    fld qword ptr [ebp + 0x14]
    mov eax, dword ptr [ebp + 8]
    fst qword ptr [ecx + 0x20]
    mov dword ptr [ecx + 0xc], edx
    fstp qword ptr [ecx + 0x28]
    mov edx, dword ptr [ebp + 0x10]
    mov dword ptr [ecx + 4], eax
    or eax, 0xffffffff
    mov dword ptr [ecx + 0x10], edx
    xor edx, edx
    mov dword ptr [ecx + 8], eax
    mov dword ptr [ecx + 0x14], eax
    mov dword ptr [ecx + 0x30], eax
    mov dword ptr [ecx + 0x34], eax
    mov dword ptr [ecx + 0x38], eax
    mov dword ptr [ecx + 0x40], eax
    mov dword ptr [ecx + 0x44], eax
    mov dword ptr [ecx + 0x48], eax
    mov dword ptr [ecx + 0x4c], eax
    mov dword ptr [ecx + 0x50], eax
    mov dword ptr [ecx + 0x54], eax
    mov dword ptr [ecx + 0x58], eax
    mov dword ptr [ecx + 0x6c], eax
    mov dword ptr [ecx + 0x74], eax
    mov dword ptr [ecx + 0x18], 1
    mov dword ptr [ecx], edx
    mov dword ptr [ecx + 0x3c], edx
    mov dword ptr [ecx + 0x5c], edx
    mov dword ptr [ecx + 0x60], edx
    mov dword ptr [ecx + 0x64], edx
    mov dword ptr [ecx + 0x68], edx
    mov dword ptr [ecx + 0x70], edx
    xor eax, eax
    pop ebp
    ret 0x14
    }
}

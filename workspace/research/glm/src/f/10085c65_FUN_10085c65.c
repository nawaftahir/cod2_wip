
__declspec(naked) void FUN_10085c65(void)
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
    fld qword ptr [eax + 0x20]
    fstp qword ptr [ecx + 0x20]
    fld qword ptr [eax + 0x28]
    fstp qword ptr [ecx + 0x28]
    mov edx, dword ptr [eax]
    mov dword ptr [ecx], edx
    mov edx, dword ptr [eax + 0x30]
    mov dword ptr [ecx + 0x30], edx
    mov edx, dword ptr [eax + 0x34]
    mov dword ptr [ecx + 0x34], edx
    mov edx, dword ptr [eax + 0x38]
    mov dword ptr [ecx + 0x38], edx
    mov edx, dword ptr [eax + 0x40]
    mov dword ptr [ecx + 0x40], edx
    mov edx, dword ptr [eax + 0x3c]
    mov dword ptr [ecx + 0x3c], edx
    mov edx, dword ptr [eax + 0x44]
    mov dword ptr [ecx + 0x44], edx
    mov edx, dword ptr [eax + 0x48]
    mov dword ptr [ecx + 0x48], edx
    mov edx, dword ptr [eax + 0x4c]
    mov dword ptr [ecx + 0x4c], edx
    mov edx, dword ptr [eax + 0x50]
    mov dword ptr [ecx + 0x50], edx
    mov edx, dword ptr [eax + 0x54]
    mov dword ptr [ecx + 0x54], edx
    mov edx, dword ptr [eax + 0x58]
    mov dword ptr [ecx + 0x58], edx
    mov edx, dword ptr [eax + 0x5c]
    mov dword ptr [ecx + 0x5c], edx
    mov edx, dword ptr [eax + 0x60]
    mov dword ptr [ecx + 0x60], edx
    mov edx, dword ptr [eax + 0x64]
    mov dword ptr [ecx + 0x64], edx
    mov edx, dword ptr [eax + 0x68]
    mov dword ptr [ecx + 0x68], edx
    mov edx, dword ptr [eax + 0x6c]
    mov dword ptr [ecx + 0x6c], edx
    mov edx, dword ptr [eax + 0x70]
    mov dword ptr [ecx + 0x70], edx
    mov eax, dword ptr [eax + 0x74]
    mov dword ptr [ecx + 0x74], eax
    xor eax, eax
    pop ebp
    ret 4
    }
}

extern void sub_10014230(void);

__declspec(naked) void FUN_100142f0(void)
{
    __asm {
    sub esp, 0x10
    push ebx
    push ebp
    mov ebx, ecx
    lea ecx, [eax - 0x10]
    push esi
    push edi
    mov edi, ecx
    mov edx, dword ptr [edi]
    mov esi, dword ptr [edi + 4]
    mov ebp, dword ptr [edi + 8]
    mov edi, dword ptr [edi + 0xc]
    mov dword ptr [esp + 0x1c], edi
    mov dword ptr [esp + 0x18], ebp
    mov edi, ebx
    mov ebp, dword ptr [edi]
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [edi + 4]
    mov dword ptr [ecx + 4], ebp
    mov ebp, dword ptr [edi + 8]
    mov dword ptr [ecx + 8], ebp
    mov edi, dword ptr [edi + 0xc]
    mov dword ptr [ecx + 0xc], edi
    mov ecx, dword ptr [esp + 0x24]
    push ecx
    sub esp, 0x10
    sub eax, ebx
    mov ecx, esp
    mov dword ptr [ecx], edx
    mov edx, dword ptr [esp + 0x2c]
    sub eax, 0x10
    mov dword ptr [ecx + 4], esi
    sar eax, 4
    mov dword ptr [ecx + 8], edx
    mov edx, dword ptr [esp + 0x30]
    push eax
    xor eax, eax
    mov dword ptr [ecx + 0xc], edx
    call sub_10014230
    add esp, 0x18
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 0x10
    ret
    }
}

extern void sub_1001d320(void);

__declspec(naked) void FUN_1001d3d0(void)
{
    __asm {
    sub esp, 0xc
    push ebx
    push ebp
    mov ebx, ecx
    lea ecx, [eax - 0xc]
    push esi
    push edi
    mov edi, ecx
    mov edx, dword ptr [edi]
    mov esi, dword ptr [edi + 4]
    mov edi, dword ptr [edi + 8]
    mov dword ptr [esp + 0x18], edi
    mov edi, ebx
    mov ebp, dword ptr [edi]
    mov dword ptr [ecx], ebp
    mov ebp, dword ptr [edi + 4]
    mov dword ptr [ecx + 4], ebp
    mov edi, dword ptr [edi + 8]
    mov dword ptr [ecx + 8], edi
    mov ecx, dword ptr [esp + 0x20]
    push ecx
    sub eax, ebx
    sub esp, 0xc
    sub eax, 0xc
    mov ecx, esp
    mov dword ptr [ecx], edx
    mov edx, dword ptr [esp + 0x28]
    mov dword ptr [ecx + 4], esi
    mov dword ptr [ecx + 8], edx
    mov ecx, eax
    mov eax, 0x2aaaaaab
    imul ecx
    sar edx, 1
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    push eax
    xor eax, eax
    call sub_1001d320
    add esp, 0x14
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 0xc
    ret
    }
}

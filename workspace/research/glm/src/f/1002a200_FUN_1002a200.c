extern void sub_1002a050(void);

__declspec(naked) void FUN_1002a200(void)
{
    __asm {
    mov edx, dword ptr [esi + 0xf8]
    imul eax, eax, 0x3c
    push edi
    add eax, dword ptr [esi + 0x100]
    mov edi, eax
    sub ecx, edx
    mov eax, 0x2aaaaaab
    imul ecx
    mov ecx, dword ptr [edi + 0x1c]
    sar edx, 4
    mov eax, edx
    shr eax, 0x1f
    add eax, edx
    mov edx, dword ptr [ecx + 0x20]
    test edx, edx
    je L2
    mov edi, dword ptr [ecx + 0x24]
    cmp dword ptr [edi + edx*4 - 4], eax
    je L2
    push eax
    push ecx
    push esi
    call sub_1002a050
    add esp, 0xc
    pop edi
    ret
    }
}

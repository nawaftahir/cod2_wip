
__declspec(naked) void FUN_1002a730(void)
{
    __asm {
    xor eax, eax
    add ecx, 0x18
    push esi
    fld dword ptr [edx + eax*4]
    mov esi, dword ptr [edx + eax*4]
    fld dword ptr [edx + eax*4]
    inc eax
    fld dword ptr [edx + eax*4 - 4]
    mov dword ptr [ecx - 0x18], esi
    fstp dword ptr [ecx - 0x14]
    add ecx, 0x20
    cmp eax, 3
    fstp dword ptr [ecx - 0x30]
    fstp dword ptr [ecx - 0x2c]
    mov esi, dword ptr [edx + eax*4 - 4]
    fld dword ptr [edx + eax*4 - 4]
    fld dword ptr [edx + eax*4 - 4]
    fld dword ptr [edx + eax*4 - 4]
    mov dword ptr [ecx - 0x28], esi
    fstp dword ptr [ecx - 0x24]
    fstp dword ptr [ecx - 0x20]
    fstp dword ptr [ecx - 0x1c]
    jne L1
    mov eax, dword ptr [edx + 0xc]
    mov ecx, dword ptr [esp + 8]
    mov dword ptr [ecx], eax
    pop esi
    ret
    }
}

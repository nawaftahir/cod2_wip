extern void sub_10032560(void);

__declspec(naked) void FUN_10032c10(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi]
    mov edx, dword ptr [eax + 0x20]
    xor ecx, ecx
    mov cl, byte ptr [eax + 0x24]
    add eax, 0x2c
    push ecx
    mov ecx, dword ptr [eax - 0x10]
    push edx
    mov edx, dword ptr [eax - 0x14]
    push ecx
    mov ecx, dword ptr [eax - 0x18]
    push edx
    mov edx, dword ptr [eax - 0x1c]
    push ecx
    mov ecx, dword ptr [eax - 0x24]
    push edx
    mov edx, dword ptr [eax - 0x28]
    push ecx
    mov ecx, dword ptr [eax - 0x20]
    push edx
    mov edx, dword ptr [eax - 4]
    push ecx
    push edx
    push eax
    call sub_10032560
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add ecx, eax
    add esp, 0x2c
    mov dword ptr [esi], ecx
    pop esi
    ret
    }
}

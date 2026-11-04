extern void sub_1002f110(void);

__declspec(naked) void FUN_1002f260(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    mov ecx, dword ptr [esi]
    mov eax, dword ptr [ecx + 0x14]
    mov edx, dword ptr [ecx + 0x10]
    push eax
    mov eax, dword ptr [ecx + 0xc]
    push edx
    mov edx, dword ptr [ecx + 8]
    push eax
    mov eax, dword ptr [ecx + 4]
    push edx
    push eax
    mov eax, dword ptr [ecx + 0x1c]
    mov ecx, dword ptr [ecx + 0x18]
    call sub_1002f110
    mov eax, dword ptr [esi]
    movzx ecx, word ptr [eax + 2]
    add ecx, eax
    add esp, 0x14
    mov dword ptr [esi], ecx
    pop esi
    ret
    }
}

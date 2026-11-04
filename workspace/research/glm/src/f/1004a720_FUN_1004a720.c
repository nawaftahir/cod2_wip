extern void sub_1004a55d(void);

__declspec(naked) void FUN_1004a720(void)
{
    __asm {
    push esi
    push edi
    mov esi, ecx
    mov edi, eax
    mov eax, dword ptr [esi + 0x14]
    cmp eax, 0xcf
    je L3
    cmp eax, 0xcc
    je L3
    mov eax, dword ptr [esi]
    mov dword ptr [eax + 0x14], 0x14
    mov ecx, dword ptr [esi]
    mov edx, dword ptr [esi + 0x14]
    mov dword ptr [ecx + 0x18], edx
    mov eax, dword ptr [esi]
    push esi
    call dword ptr [eax]
    add esp, 4
    test edi, edi
    jg L3
    mov edi, 1
    mov ecx, dword ptr [esi + 0x198]
    mov al, byte ptr [ecx + 0x11]
    test al, al
    je L3
    mov eax, dword ptr [esi + 0x84]
    cmp edi, eax
    jle L3
    mov edi, eax
    mov dword ptr [esi + 0x8c], edi
    call sub_1004a55d
    pop edi
    pop esi
    ret
    }
}

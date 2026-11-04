extern void sub_1006507a(void);
extern void sub_10082e26(void);

__declspec(naked) void FUN_100839cd(void)
{
    __asm {
    mov edi, edi
    push esi
    push 0x24
    mov esi, ecx
    call sub_1006507a
    test eax, eax
    je L3
    mov ecx, eax
    call sub_10082e26
    jmp L3
    xor eax, eax
    test eax, eax
    jne L3
    pop esi
    ret
    mov ecx, dword ptr [esi + 0x10]
    mov dword ptr [eax + 0x10], ecx
    mov ecx, dword ptr [esi + 0x14]
    mov dword ptr [eax + 0x14], ecx
    mov ecx, dword ptr [esi + 0x18]
    mov dword ptr [eax + 0x18], ecx
    mov ecx, dword ptr [esi + 0x1c]
    mov dword ptr [eax + 0x1c], ecx
    mov ecx, dword ptr [esi + 0x20]
    mov dword ptr [eax + 0x20], ecx
    pop esi
    ret
    }
}

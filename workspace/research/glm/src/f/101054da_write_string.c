extern void sub_101054bb(void);

__declspec(naked) void write_string(void)
{
    __asm {
    test byte ptr [edi + 0xc], 0x40
    push ebx
    push esi
    mov esi, eax
    mov ebx, ecx
    je L3
    cmp dword ptr [edi + 8], 0
    jne L3
    mov eax, dword ptr [esp + 0xc]
    add dword ptr [esi], eax
    jmp L3
    dec dword ptr [esp + 0xc]
    xor eax, eax
    mov ax, word ptr [ebx]
    push eax
    mov eax, edi
    call sub_101054bb
    inc ebx
    inc ebx
    cmp dword ptr [esi], -1
    pop ecx
    je L3
    cmp dword ptr [esp + 0xc], 0
    jg L3
    pop esi
    pop ebx
    ret
    }
}

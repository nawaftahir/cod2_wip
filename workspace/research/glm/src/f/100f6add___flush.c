extern void sub_100fbddc(void);

__declspec(naked) void __flush(void)
{
    __asm {
    push ebx
    push esi
    mov esi, dword ptr [esp + 0xc]
    mov eax, dword ptr [esi + 0xc]
    mov ecx, eax
    and cl, 3
    xor ebx, ebx
    cmp cl, 2
    jne L3
    test ax, 0x108
    je L3
    mov eax, dword ptr [esi + 8]
    push edi
    mov edi, dword ptr [esi]
    sub edi, eax
    test edi, edi
    jle L3
    push edi
    push eax
    push dword ptr [esi + 0x10]
    call sub_100fbddc
    add esp, 0xc
    cmp eax, edi
    jne L3
    mov eax, dword ptr [esi + 0xc]
    test al, al
    jns L3
    and eax, 0xfffffffd
    mov dword ptr [esi + 0xc], eax
    jmp L3
    or dword ptr [esi + 0xc], 0x20
    or ebx, 0xffffffff
    pop edi
    mov eax, dword ptr [esi + 8]
    and dword ptr [esi + 4], 0
    mov dword ptr [esi], eax
    pop esi
    mov eax, ebx
    pop ebx
    ret
    }
}

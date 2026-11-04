extern void sub_1001e3e7(void);

__declspec(naked) void FUN_1001ee00(void)
{
    __asm {
    sub esp, 0x28
    push ebx
    mov ebx, dword ptr [eax + 0xc]
    movsx eax, word ptr [eax + 2]
    add edx, ecx
    test eax, eax
    push ebp
    mov ebp, dword ptr [esp + 0x34]
    mov dword ptr [esp + 8], edx
    jle L2
    push esi
    mov dword ptr [esp + 0x38], eax
    push edi
    mov eax, dword ptr [ebx + 0xc]
    mov ecx, dword ptr [ebx + 0x1c]
    mov edx, dword ptr [ebx + 0x2c]
    mov dword ptr [esp + 0x2c], eax
    mov eax, dword ptr [esp + 0x10]
    mov dword ptr [esp + 0x30], ecx
    mov dword ptr [esp + 0x34], edx
    lea edx, [ebx + 0x30]
    lea esi, [esp + 0x14]
    mov ecx, ebx
    call sub_1001e3e7
    mov eax, dword ptr [esp + 0x3c]
    mov edi, ebp
    add ebx, 0x40
    add ebp, 0x24
    mov ecx, 9
    dec eax
    rep movsd dword ptr es:[edi], dword ptr [esi]
    mov dword ptr [esp + 0x3c], eax
    jne L2
    pop edi
    pop esi
    pop ebp
    pop ebx
    add esp, 0x28
    ret
    }
}

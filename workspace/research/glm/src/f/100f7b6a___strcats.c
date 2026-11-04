extern void sub_100fe8bc(void);

__declspec(naked) void __strcats(void)
{
    __asm {
    push edi
    mov edi, dword ptr [esp + 0xc]
    test edi, edi
    jle L2
    push esi
    lea esi, [esp + 0x10]
    add esi, 4
    push dword ptr [esi]
    push dword ptr [esp + 0x10]
    call sub_100fe8bc
    dec edi
    pop ecx
    pop ecx
    jne L2
    pop esi
    pop edi
    ret
    }
}

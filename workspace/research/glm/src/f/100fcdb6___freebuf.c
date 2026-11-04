extern void sub_100f84e8(void);

__declspec(naked) void __freebuf(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    mov eax, dword ptr [esi + 0xc]
    test al, 0x83
    je L1
    test al, 8
    je L1
    push dword ptr [esi + 8]
    call sub_100f84e8
    and word ptr [esi + 0xc], 0xfbf7
    xor eax, eax
    pop ecx
    mov dword ptr [esi], eax
    mov dword ptr [esi + 8], eax
    mov dword ptr [esi + 4], eax
    pop esi
    ret
    }
}

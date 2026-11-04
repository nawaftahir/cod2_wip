extern void sub_100f6ae8(void);
extern void sub_100fbe79(void);

__declspec(naked) void __fflush_lk(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    push esi
    call sub_100f6ae8
    test eax, eax
    pop ecx
    je L2
    or eax, 0xffffffff
    pop esi
    ret
    test byte ptr [esi + 0xd], 0x40
    je L2
    push dword ptr [esi + 0x10]
    call sub_100fbe79
    pop ecx
    neg eax
    sbb eax, eax
    pop esi
    ret
    xor eax, eax
    pop esi
    ret
    }
}

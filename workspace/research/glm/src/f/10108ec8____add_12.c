extern void sub_10108ebb(void);
extern void sub_10108ecf(void);
extern void sub_10108ee7(void);
extern void sub_10108eff(void);

__declspec(naked) void ___add_12(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    push edi
    mov edi, dword ptr [esp + 0x10]
    push esi
    push dword ptr [edi]
    push dword ptr [esi]
    call sub_10108ebb
    add esp, 0xc
    test eax, eax
    je L2
    lea eax, [esi + 4]
    push eax
    push 1
    push dword ptr [eax]
    call sub_10108ecf
    add esp, 0xc
    test eax, eax
    je L2
    inc dword ptr [esi + 8]
    lea eax, [esi + 4]
    push eax
    push dword ptr [edi + 4]
    push dword ptr [eax]
    call sub_10108ee7
    add esp, 0xc
    test eax, eax
    je L2
    inc dword ptr [esi + 8]
    lea eax, [esi + 8]
    push eax
    push dword ptr [edi + 8]
    push dword ptr [eax]
    call sub_10108eff
    add esp, 0xc
    pop edi
    pop esi
    ret
    }
}

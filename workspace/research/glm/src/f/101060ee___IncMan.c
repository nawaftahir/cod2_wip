extern void sub_10108ecf(void);
extern void sub_10108ee6(void);

__declspec(naked) void __IncMan(void)
{
    __asm {
    mov eax, dword ptr [esp + 8]
    push esi
    push edi
    push 0x20
    pop ecx
    cdq
    idiv ecx
    mov edi, dword ptr [esp + 0xc]
    mov esi, eax
    lea eax, [edi + esi*4]
    push eax
    push 0x1f
    pop ecx
    sub ecx, edx
    xor edx, edx
    inc edx
    shl edx, cl
    push edx
    push dword ptr [eax]
    call sub_10108ecf
    add esp, 0xc
    dec esi
    js L2
    lea edi, [edi + esi*4]
    test eax, eax
    je L2
    push edi
    push 1
    push dword ptr [edi]
    call sub_10108ee6
    add esp, 0xc
    dec esi
    sub edi, 4
    test esi, esi
    jge L2
    pop edi
    pop esi
    ret
    }
}

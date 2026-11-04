extern int g_101a50d0;
extern int g_101ae16c;
extern int g_101ae170;
extern int g_101ae174;
extern int g_101ae178;
extern int g_101ae184;
extern int g_101ae188;
extern void (__stdcall *fp_101ae18c)(void);
extern void sub_100f78cf(void);
extern void sub_10100619(void);
extern void sub_101006ff(void);
extern void sub_10100d4d(void);
extern void sub_1010864b(void);

__declspec(naked) void _LanguageEnumProc@4(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x7c
    mov eax, dword ptr g_101a50d0
    mov edx, dword ptr [ebp + 8]
    push esi
    mov dword ptr [ebp - 4], eax
    call sub_10100619
    mov esi, eax
    push 0x78
    lea eax, [ebp - 0x7c]
    push eax
    mov eax, dword ptr g_101ae178
    neg eax
    sbb eax, eax
    and eax, 0xfffff002
    add eax, 0x1001
    push eax
    push esi
    call fp_101ae18c
    test eax, eax
    jne L0
    and dword ptr g_101ae16c, eax
    inc eax
    jmp L1
    lea eax, [ebp - 0x7c]
    push eax
    push dword ptr g_101ae188
    call sub_100f78cf
    test eax, eax
    pop ecx
    pop ecx
    jne L2
    cmp dword ptr g_101ae178, eax
    jne L3
    push 1
    jmp L4
    cmp dword ptr g_101ae178, 0
    jne L5
    mov eax, dword ptr g_101ae184
    test eax, eax
    je L5
    push eax
    lea eax, [ebp - 0x7c]
    push eax
    push dword ptr g_101ae188
    call sub_1010864b
    add esp, 0xc
    test eax, eax
    jne L5
    push eax
    push esi
    call sub_101006ff
    test eax, eax
    pop ecx
    pop ecx
    je L5
    or dword ptr g_101ae16c, 4
    mov dword ptr g_101ae174, esi
    mov dword ptr g_101ae170, esi
    mov eax, dword ptr g_101ae16c
    shr eax, 2
    not eax
    and eax, 1
    mov ecx, dword ptr [ebp - 4]
    pop esi
    call sub_10100d4d
    leave
    ret 4
    }
}

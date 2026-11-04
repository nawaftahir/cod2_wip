extern int g_101a50d0;
extern int g_101ae16c;
extern int g_101ae170;
extern int g_101ae174;
extern int g_101ae17c;
extern int g_101ae180;
extern void (__stdcall *fp_101ae18c)(void);
extern void sub_100f7925(void);
extern void sub_1010057a(void);
extern void sub_10100630(void);
extern void sub_10100ddd(void);

__declspec(naked) void _CountryEnumProc@4(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x7c
    mov eax, dword ptr g_101a50d0
    mov edx, dword ptr [ebp + 8]
    push esi
    mov dword ptr [ebp - 4], eax
    call sub_10100630
    mov esi, eax
    push 0x78
    lea eax, [ebp - 0x7c]
    push eax
    mov eax, dword ptr g_101ae17c
    neg eax
    sbb eax, eax
    and eax, 0xfffff005
    add eax, 0x1002
    push eax
    push esi
    call fp_101ae18c
    test eax, eax
    jne L3
    and dword ptr g_101ae16c, eax
    inc eax
    jmp L3
    lea eax, [ebp - 0x7c]
    push eax
    push dword ptr g_101ae180
    call sub_100f7925
    test eax, eax
    pop ecx
    pop ecx
    jne L3
    push esi
    call sub_1010057a
    test eax, eax
    pop ecx
    je L3
    or dword ptr g_101ae16c, 4
    mov dword ptr g_101ae174, esi
    mov dword ptr g_101ae170, esi
    mov eax, dword ptr g_101ae16c
    shr eax, 2
    not eax
    and eax, 1
    mov ecx, dword ptr [ebp - 4]
    pop esi
    call sub_10100ddd
    leave
    ret 4
    }
}

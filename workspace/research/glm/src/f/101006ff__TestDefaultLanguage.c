extern int g_101a50d0;
extern int g_101ae188;
extern void (__stdcall *fp_101ae18c)(void);
extern void sub_100fa24d(void);
extern void sub_1010064f(void);
extern void sub_101006a9(void);
extern void sub_10100dbc(void);

__declspec(naked) void _TestDefaultLanguage(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x7c
    mov eax, dword ptr g_101a50d0
    mov dword ptr [ebp - 4], eax
    push 0x78
    lea eax, [ebp - 0x7c]
    push eax
    mov eax, dword ptr [ebp + 8]
    and eax, 0x3ff
    push 1
    or eax, 0x400
    push eax
    call fp_101ae18c
    test eax, eax
    je L3
    lea edx, [ebp - 0x7c]
    call sub_1010064f
    cmp dword ptr [ebp + 8], eax
    je L3
    cmp dword ptr [ebp + 0xc], 0
    je L3
    push esi
    push dword ptr g_101ae188
    call sub_100fa24d
    mov edx, dword ptr g_101ae188
    pop ecx
    mov esi, eax
    call sub_101006a9
    cmp eax, esi
    pop esi
    jne L3
    xor eax, eax
    jmp L3
    xor eax, eax
    inc eax
    mov ecx, dword ptr [ebp - 4]
    call sub_10100dbc
    leave
    ret
    }
}

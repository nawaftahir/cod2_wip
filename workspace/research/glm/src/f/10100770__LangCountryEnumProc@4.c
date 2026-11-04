extern int g_101a50d0;
extern int g_101ae16c;
extern int g_101ae16d;
extern int g_101ae170;
extern int g_101ae174;
extern int g_101ae178;
extern int g_101ae17c;
extern int g_101ae180;
extern int g_101ae184;
extern int g_101ae188;
extern void (__stdcall *fp_101ae18c)(void);
extern void sub_100f78cf(void);
extern void sub_100fa200(void);
extern void sub_10100518(void);
extern void sub_10100619(void);
extern void sub_101006ff(void);
extern void sub_10100d4d(void);
extern void sub_1010864b(void);

__declspec(naked) void _LangCountryEnumProc@4(void)
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
    mov eax, dword ptr g_101ae17c
    neg eax
    sbb eax, eax
    and eax, 0xfffff005
    add eax, 0x1002
    push eax
    push esi
    call fp_101ae18c
    test eax, eax
    jne L0
    and dword ptr g_101ae16c, eax
    inc eax
    jmp L1
    push ebx
    push edi
    lea eax, [ebp - 0x7c]
    push eax
    push dword ptr g_101ae180
    call sub_100f78cf
    test eax, eax
    pop ecx
    pop ecx
    mov ebx, 0xfffff002
    mov edi, 0x1001
    jne L2
    push 0x78
    lea eax, [ebp - 0x7c]
    push eax
    mov eax, dword ptr g_101ae178
    neg eax
    sbb eax, eax
    and eax, ebx
    add eax, edi
    push eax
    push esi
    call fp_101ae18c
    test eax, eax
    je L3
    lea eax, [ebp - 0x7c]
    push eax
    push dword ptr g_101ae188
    call sub_100f78cf
    test eax, eax
    pop ecx
    pop ecx
    jne L4
    or word ptr g_101ae16c, 0x304
    mov dword ptr g_101ae170, esi
    jmp L5
    test byte ptr g_101ae16c, 2
    jne L2
    mov eax, dword ptr g_101ae184
    test eax, eax
    je L6
    push eax
    lea eax, [ebp - 0x7c]
    push eax
    push dword ptr g_101ae188
    call sub_1010864b
    add esp, 0xc
    test eax, eax
    jne L6
    push dword ptr g_101ae188
    or dword ptr g_101ae16c, 2
    mov dword ptr g_101ae174, esi
    call sub_100fa200
    cmp eax, dword ptr g_101ae184
    pop ecx
    jne L2
    mov dword ptr g_101ae170, esi
    jmp L2
    test byte ptr g_101ae16c, 1
    jne L2
    push esi
    call sub_10100518
    test eax, eax
    pop ecx
    je L2
    or dword ptr g_101ae16c, 1
    mov dword ptr g_101ae174, esi
    mov ecx, dword ptr g_101ae16c
    mov eax, 0x300
    and ecx, eax
    cmp ecx, eax
    je L7
    push 0x78
    lea eax, [ebp - 0x7c]
    push eax
    mov eax, dword ptr g_101ae178
    neg eax
    sbb eax, eax
    and eax, ebx
    add eax, edi
    push eax
    push esi
    call fp_101ae18c
    test eax, eax
    jne L8
    and dword ptr g_101ae16c, 0
    xor eax, eax
    inc eax
    jmp L9
    lea eax, [ebp - 0x7c]
    push eax
    push dword ptr g_101ae188
    call sub_100f78cf
    pop ecx
    xor edi, edi
    test eax, eax
    pop ecx
    jne L10
    or byte ptr g_101ae16d, 2
    cmp dword ptr g_101ae178, edi
    jne L11
    cmp dword ptr g_101ae184, edi
    je L11
    push dword ptr g_101ae188
    call sub_100fa200
    cmp eax, dword ptr g_101ae184
    pop ecx
    jne L11
    push 1
    jmp L12
    cmp dword ptr g_101ae178, edi
    jne L7
    mov eax, dword ptr g_101ae184
    cmp eax, edi
    je L7
    push eax
    lea eax, [ebp - 0x7c]
    push eax
    push dword ptr g_101ae188
    call sub_1010864b
    add esp, 0xc
    test eax, eax
    jne L7
    push edi
    push esi
    call sub_101006ff
    test eax, eax
    pop ecx
    pop ecx
    je L7
    or byte ptr g_101ae16d, 1
    cmp dword ptr g_101ae170, edi
    jne L7
    mov dword ptr g_101ae170, esi
    mov eax, dword ptr g_101ae16c
    shr eax, 2
    not eax
    and eax, 1
    pop edi
    pop ebx
    mov ecx, dword ptr [ebp - 4]
    pop esi
    call sub_10100d4d
    leave
    ret 4
    }
}

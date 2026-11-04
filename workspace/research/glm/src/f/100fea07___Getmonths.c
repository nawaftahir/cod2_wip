extern int g_101a4fd0;
extern void sub_100fa224(void);
extern void sub_100fa22d(void);
extern void sub_100fa26b(void);
extern void sub_100fa27f(void);
extern void sub_100fc4ac(void);
extern void sub_100fe8f5(void);
extern void sub_100fe909(void);

__declspec(naked) void __Getmonths(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    and dword ptr [ebp - 4], 0
    push ebx
    push esi
    push edi
    mov edi, dword ptr g_101a4fd0
    lea esi, [edi + 0x38]
    mov dword ptr [ebp - 8], 0xc
    push dword ptr [esi + 0x30]
    call sub_100fa224
    push dword ptr [esi]
    mov ebx, eax
    call sub_100fa22d
    add eax, dword ptr [ebp - 4]
    pop ecx
    lea eax, [eax + ebx + 2]
    add esi, 4
    dec dword ptr [ebp - 8]
    pop ecx
    mov dword ptr [ebp - 4], eax
    jne L3
    inc eax
    push eax
    call sub_100fc4ac
    mov esi, eax
    test esi, esi
    pop ecx
    mov dword ptr [ebp - 8], esi
    je L3
    push 0xc
    add edi, 0x68
    pop ebx
    mov byte ptr [esi], 0x3a
    push dword ptr [edi - 0x30]
    inc esi
    push esi
    call sub_100fe8f5
    push eax
    call sub_100fa26b
    add esi, eax
    mov byte ptr [esi], 0x3a
    push dword ptr [edi]
    inc esi
    push esi
    call sub_100fe909
    push eax
    call sub_100fa27f
    add esp, 0x18
    add esi, eax
    add edi, 4
    dec ebx
    jne L3
    mov byte ptr [esi], 0
    mov eax, dword ptr [ebp - 8]
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}

extern int g_101a4684;
extern void sub_100f7530(void);
extern void sub_100f753e(void);
extern void sub_100f7cd2(void);
extern void sub_100fb11e(void);
extern void sub_10109d26(void);

__declspec(naked) void __strnicmp(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ebx
    call sub_100fb11e
    mov ebx, dword ptr [eax + 0x64]
    cmp ebx, dword ptr g_101a4684
    je L6
    call sub_100f7cd2
    mov ebx, eax
    cmp dword ptr [ebp + 0x10], 0
    je L6
    cmp dword ptr [ebx + 0x14], 0
    jne L6
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10109d26
    add esp, 0xc
    jmp L6
    push esi
    mov esi, dword ptr [ebp + 8]
    push edi
    mov edi, dword ptr [ebp + 0xc]
    movzx eax, byte ptr [esi]
    push eax
    push ebx
    call sub_100f7530
    mov dword ptr [ebp - 4], eax
    movzx eax, byte ptr [edi]
    push eax
    push ebx
    inc esi
    call sub_100f753e
    add esp, 0x10
    inc edi
    dec dword ptr [ebp + 0x10]
    mov ecx, eax
    je L6
    cmp dword ptr [ebp - 4], 0
    je L6
    cmp dword ptr [ebp - 4], ecx
    je L6
    mov eax, dword ptr [ebp - 4]
    pop edi
    sub eax, ecx
    pop esi
    jmp L6
    xor eax, eax
    pop ebx
    leave
    ret
    }
}

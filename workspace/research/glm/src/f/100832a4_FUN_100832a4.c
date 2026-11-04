extern void sub_100827ec(void);
extern void sub_10082845(void);
extern void sub_10082854(void);
extern void sub_10082863(void);
extern void sub_100829da(void);

__declspec(naked) void FUN_100832a4(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    mov edi, dword ptr [ebp + 8]
    push edi
    mov esi, ecx
    call sub_100827ec
    test eax, eax
    je L2
    mov eax, dword ptr [esi + 0x14]
    cmp eax, dword ptr [edi + 0x14]
    jne L2
    mov eax, dword ptr [esi + 0x18]
    cmp eax, dword ptr [edi + 0x18]
    jne L2
    mov eax, dword ptr [esi + 0x1c]
    cmp eax, dword ptr [edi + 0x1c]
    jne L2
    mov eax, dword ptr [esi + 0x28]
    cmp eax, dword ptr [edi + 0x28]
    jne L2
    lea eax, [edi + 0x30]
    lea ecx, [esi + 0x30]
    call sub_100829da
    test eax, eax
    je L2
    push dword ptr [edi + 0x10]
    push dword ptr [esi + 0x10]
    call sub_10082845
    test eax, eax
    je L2
    push dword ptr [edi + 0x20]
    push dword ptr [esi + 0x20]
    call sub_10082854
    test eax, eax
    je L2
    push dword ptr [edi + 0x24]
    push dword ptr [esi + 0x24]
    call sub_10082863
    test eax, eax
    je L2
    xor eax, eax
    inc eax
    jmp L2
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}

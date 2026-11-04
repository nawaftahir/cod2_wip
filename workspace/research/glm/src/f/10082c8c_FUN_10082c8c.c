extern void sub_100827ec(void);
extern void sub_1008283e(void);
extern void sub_1008284d(void);
extern void sub_1008285c(void);

__declspec(naked) void FUN_10082c8c(void)
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
    mov eax, dword ptr [esi + 0x10]
    cmp eax, dword ptr [edi + 0x10]
    jne L2
    mov eax, dword ptr [esi + 0x20]
    cmp eax, dword ptr [edi + 0x20]
    jne L2
    mov eax, dword ptr [esi + 0x24]
    cmp eax, dword ptr [edi + 0x24]
    jne L2
    mov eax, dword ptr [esi + 0x28]
    cmp eax, dword ptr [edi + 0x28]
    jne L2
    mov eax, dword ptr [esi + 0x2c]
    cmp eax, dword ptr [edi + 0x2c]
    jne L2
    push dword ptr [edi + 0x14]
    push dword ptr [esi + 0x14]
    call sub_1008283e
    test eax, eax
    je L2
    push dword ptr [edi + 0x18]
    push dword ptr [esi + 0x18]
    call sub_1008284d
    test eax, eax
    je L2
    push dword ptr [edi + 0x1c]
    push dword ptr [esi + 0x1c]
    call sub_1008285c
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

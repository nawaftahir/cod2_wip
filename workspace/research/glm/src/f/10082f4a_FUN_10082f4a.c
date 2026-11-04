extern void sub_100827ec(void);
extern void sub_1008284a(void);
extern void sub_10082859(void);
extern void sub_10082868(void);
extern void sub_10082877(void);
extern void sub_10082886(void);
extern void sub_10082895(void);
extern void sub_100828a4(void);

__declspec(naked) void FUN_10082f4a(void)
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
    mov eax, dword ptr [esi + 0x14]
    cmp eax, dword ptr [edi + 0x14]
    jne L2
    mov eax, dword ptr [esi + 0x18]
    cmp eax, dword ptr [edi + 0x18]
    jne L2
    mov eax, dword ptr [esi + 0x38]
    cmp eax, dword ptr [edi + 0x38]
    jne L2
    mov eax, dword ptr [esi + 0x3c]
    cmp eax, dword ptr [edi + 0x3c]
    jne L2
    push dword ptr [edi + 0x1c]
    push dword ptr [esi + 0x1c]
    call sub_1008284a
    test eax, eax
    je L2
    push dword ptr [edi + 0x20]
    push dword ptr [esi + 0x20]
    call sub_10082859
    test eax, eax
    je L2
    push dword ptr [edi + 0x24]
    push dword ptr [esi + 0x24]
    call sub_10082868
    test eax, eax
    je L2
    push dword ptr [edi + 0x28]
    push dword ptr [esi + 0x28]
    call sub_10082877
    test eax, eax
    je L2
    push dword ptr [edi + 0x2c]
    push dword ptr [esi + 0x2c]
    call sub_10082886
    test eax, eax
    je L2
    push dword ptr [edi + 0x30]
    push dword ptr [esi + 0x30]
    call sub_10082895
    test eax, eax
    je L2
    push dword ptr [edi + 0x34]
    push dword ptr [esi + 0x34]
    call sub_100828a4
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

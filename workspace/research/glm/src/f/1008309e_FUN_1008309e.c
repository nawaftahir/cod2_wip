extern void sub_100827ec(void);
extern void sub_1008284a(void);
extern void sub_10082859(void);
extern void sub_10082868(void);
extern void sub_10082877(void);
extern void sub_10082886(void);

__declspec(naked) void FUN_1008309e(void)
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
    je L3
    mov eax, dword ptr [esi + 0x10]
    cmp eax, dword ptr [edi + 0x10]
    jne L3
    mov eax, dword ptr [esi + 0x14]
    cmp eax, dword ptr [edi + 0x14]
    jne L3
    mov eax, dword ptr [esi + 0x18]
    cmp eax, dword ptr [edi + 0x18]
    jne L3
    mov eax, dword ptr [esi + 0x1c]
    cmp eax, dword ptr [edi + 0x1c]
    jne L3
    mov eax, dword ptr [esi + 0x34]
    cmp eax, dword ptr [edi + 0x34]
    jne L3
    push dword ptr [edi + 0x20]
    push dword ptr [esi + 0x20]
    call sub_1008284a
    test eax, eax
    je L3
    push dword ptr [edi + 0x24]
    push dword ptr [esi + 0x24]
    call sub_10082859
    test eax, eax
    je L3
    push dword ptr [edi + 0x28]
    push dword ptr [esi + 0x28]
    call sub_10082868
    test eax, eax
    je L3
    push dword ptr [edi + 0x2c]
    push dword ptr [esi + 0x2c]
    call sub_10082877
    test eax, eax
    je L3
    push dword ptr [edi + 0x30]
    push dword ptr [esi + 0x30]
    call sub_10082886
    test eax, eax
    je L3
    mov eax, dword ptr [esi + 0x34]
    test eax, eax
    je L3
    mov edi, dword ptr [edi + 0x38]
    mov esi, dword ptr [esi + 0x38]
    mov ecx, eax
    shl ecx, 2
    xor eax, eax
    repe cmpsb byte ptr [esi], byte ptr es:[edi]
    jne L3
    xor eax, eax
    inc eax
    jmp L3
    xor eax, eax
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}

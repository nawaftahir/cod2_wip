extern void sub_100827ec(void);
extern void sub_1008282a(void);
extern void sub_10082839(void);

__declspec(naked) void FUN_10082948(void)
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
    jne L3
    xor eax, eax
    jmp L3
    mov eax, dword ptr [esi + 0x10]
    cmp eax, dword ptr [edi + 0x10]
    jne L3
    mov eax, dword ptr [esi + 0x14]
    cmp eax, dword ptr [edi + 0x14]
    jne L3
    push dword ptr [edi + 8]
    push dword ptr [esi + 8]
    call sub_1008282a
    test eax, eax
    je L3
    push dword ptr [edi + 0xc]
    push dword ptr [esi + 0xc]
    call sub_10082839
    neg eax
    sbb eax, eax
    neg eax
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}

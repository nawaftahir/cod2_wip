extern void sub_100827e8(void);
extern void sub_1008281e(void);

__declspec(naked) void FUN_10082ddb(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    push edx
    call sub_100827e8
    test eax, eax
    jne L3
    xor eax, eax
    jmp L3
    mov eax, dword ptr [ecx + 0x14]
    cmp eax, dword ptr [edx + 0x14]
    jne L3
    push dword ptr [edx + 0x10]
    push dword ptr [ecx + 0x10]
    call sub_1008281e
    neg eax
    sbb eax, eax
    neg eax
    pop ebp
    ret 4
    }
}

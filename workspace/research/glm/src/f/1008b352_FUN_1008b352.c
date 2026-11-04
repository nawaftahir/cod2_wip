extern void sub_1008b1c8(void);

__declspec(naked) void FUN_1008b352(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    push esi
    push dword ptr [ebp + 0x10]
    mov esi, dword ptr [ebp + 0xc]
    push esi
    call sub_1008b1c8
    test eax, eax
    jne L2
    cmp esi, dword ptr [ebp + 8]
    jbe L2
    or eax, 0xffffffff
    jmp L2
    sbb eax, eax
    neg eax
    pop esi
    pop ebp
    ret 0xc
    }
}

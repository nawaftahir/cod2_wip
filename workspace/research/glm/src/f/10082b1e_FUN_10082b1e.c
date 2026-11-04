extern void sub_100827e8(void);
extern void sub_1008282a(void);

__declspec(naked) void FUN_10082b1e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    push edx
    call sub_100827e8
    test eax, eax
    je L2
    mov eax, dword ptr [ecx + 0x10]
    cmp eax, dword ptr [edx + 0x10]
    jne L2
    mov eax, dword ptr [ecx + 0x14]
    cmp eax, dword ptr [edx + 0x14]
    jne L2
    mov eax, dword ptr [ecx + 0x18]
    cmp eax, dword ptr [edx + 0x18]
    jne L2
    push dword ptr [edx + 0x1c]
    push dword ptr [ecx + 0x1c]
    call sub_1008282a
    neg eax
    sbb eax, eax
    neg eax
    jmp L2
    xor eax, eax
    pop ebp
    ret 4
    }
}

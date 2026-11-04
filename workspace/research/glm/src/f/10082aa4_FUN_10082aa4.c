extern void sub_100827e8(void);
extern void sub_100829b6(void);

__declspec(naked) void FUN_10082aa4(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    push edx
    call sub_100827e8
    test eax, eax
    je L1
    lea eax, [edx + 0x10]
    add ecx, 0x10
    call sub_100829b6
    neg eax
    sbb eax, eax
    neg eax
    pop ebp
    ret 4
    }
}

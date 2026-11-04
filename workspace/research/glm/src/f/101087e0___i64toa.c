extern void sub_1010879f(void);

__declspec(naked) void __i64toa(void)
{
    __asm {
    push ebp
    mov ebp, esp
    xor eax, eax
    cmp dword ptr [ebp + 0x14], 0xa
    jne L2
    cmp dword ptr [ebp + 0xc], eax
    jg L2
    jl L2
    cmp dword ptr [ebp + 8], eax
    jae L2
    xor eax, eax
    inc eax
    push eax
    push dword ptr [ebp + 0x14]
    mov eax, dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_1010879f
    mov eax, dword ptr [ebp + 0x10]
    pop ebp
    ret
    }
}

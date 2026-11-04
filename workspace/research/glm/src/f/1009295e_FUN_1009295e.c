extern void sub_100926bb(void);

__declspec(naked) void FUN_1009295e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x14]
    mov edx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 0x14]
    cmp eax, -1
    je L2
    push -1
    push -1
    push 0
    push eax
    push dword ptr [ebp + 8]
    call sub_100926bb
    test eax, eax
    jl L2
    xor eax, eax
    pop ebp
    ret 8
    }
}

extern void sub_1008a4e5(void);

__declspec(naked) void FUN_1008a646(void)
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
    je L1
    push dword ptr [ebp + 0x10]
    push eax
    push dword ptr [ebp + 8]
    call sub_1008a4e5
    pop ebp
    ret 0xc
    }
}

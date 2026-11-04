extern void sub_101086ea(void);

__declspec(naked) void __ltoa(void)
{
    __asm {
    push ebp
    mov ebp, esp
    xor eax, eax
    cmp dword ptr [ebp + 0x10], 0xa
    jne L1
    cmp dword ptr [ebp + 8], eax
    jge L1
    inc eax
    mov ecx, dword ptr [ebp + 0xc]
    push eax
    push dword ptr [ebp + 0x10]
    mov eax, dword ptr [ebp + 8]
    call sub_101086ea
    mov eax, dword ptr [ebp + 0xc]
    pop ecx
    pop ecx
    pop ebp
    ret
    }
}

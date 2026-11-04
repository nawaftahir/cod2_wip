extern void sub_101086ed(void);

__declspec(naked) void __itoa(void)
{
    __asm {
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 0x10], 0xa
    mov eax, dword ptr [ebp + 8]
    jne L2
    test eax, eax
    jge L2
    push 1
    push 0xa
    jmp L2
    push 0
    push dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp + 0xc]
    call sub_101086ed
    mov eax, dword ptr [ebp + 0xc]
    pop ecx
    pop ecx
    pop ebp
    ret
    }
}


__declspec(naked) void __sptype(void)
{
    __asm {
    push ebp
    mov ebp, esp
    xor edx, edx
    cmp dword ptr [ebp + 0xc], 0x7ff00000
    jne L6
    cmp dword ptr [ebp + 8], edx
    jne L6
    xor eax, eax
    inc eax
    pop ebp
    ret
    cmp dword ptr [ebp + 0xc], 0xfff00000
    jne L6
    cmp dword ptr [ebp + 8], edx
    jne L6
    push 2
    jmp L6
    mov ecx, dword ptr [ebp + 0xe]
    mov eax, 0x7ff8
    and ecx, eax
    cmp cx, ax
    jne L6
    push 3
    jmp L6
    cmp cx, 0x7ff0
    jne L6
    test dword ptr [ebp + 0xc], 0x7ffff
    jne L6
    cmp dword ptr [ebp + 8], edx
    je L6
    push 4
    pop eax
    pop ebp
    ret
    xor eax, eax
    pop ebp
    ret
    }
}

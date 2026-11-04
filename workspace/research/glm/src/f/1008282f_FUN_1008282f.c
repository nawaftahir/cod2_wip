
__declspec(naked) void FUN_1008282f(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    cmp dword ptr [ebp + 8], 0
    jne L3
    mov eax, dword ptr [ebp + 0xc]
    jmp L3
    lea eax, [ebp + 8]
    mov eax, dword ptr [eax]
    add eax, 0xc
    cmp dword ptr [eax], 0
    jne L3
    mov ecx, dword ptr [ebp + 0xc]
    mov dword ptr [eax], ecx
    mov eax, dword ptr [ebp + 8]
    pop ebp
    ret 8
    }
}

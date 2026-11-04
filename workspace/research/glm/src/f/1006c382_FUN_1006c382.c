
__declspec(naked) void FUN_1006c382(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ecx + 0xc]
    jae L2
    mov ecx, dword ptr [ecx + 0x18]
    mov eax, dword ptr [ecx + eax*4]
    jmp L2
    xor eax, eax
    pop ebp
    ret 4
    }
}


__declspec(naked) void FUN_1006c34c(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, dword ptr [ecx + 4]
    jae L2
    mov ecx, dword ptr [ecx + 0x10]
    mov eax, dword ptr [ecx + eax*4]
    jmp L2
    xor eax, eax
    pop ebp
    ret 4
    }
}

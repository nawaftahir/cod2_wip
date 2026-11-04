
__declspec(naked) void FUN_10086c88(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov edx, dword ptr [ebp + 8]
    cmp edx, -1
    je L2
    mov eax, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + edx*4]
    mov eax, dword ptr [eax + 0x38]
    cmp eax, -1
    jne L2
    mov eax, edx
    pop ebp
    ret 4
    }
}

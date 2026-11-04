
__declspec(naked) void FUN_1007da77(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x18]
    movzx edx, word ptr [eax + 0xa]
    mov eax, dword ptr [ebp + 8]
    cmp eax, edx
    jb L2
    xor eax, eax
    jmp L2
    mov ecx, dword ptr [ecx + 0x38]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 4
    }
}

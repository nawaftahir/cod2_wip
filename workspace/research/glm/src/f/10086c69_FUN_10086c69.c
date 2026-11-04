
__declspec(naked) void FUN_10086c69(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    cmp eax, -1
    je L2
    mov ecx, dword ptr [ecx + 0x14]
    mov eax, dword ptr [ecx + eax*4]
    mov eax, dword ptr [eax + 0x30]
    jmp L2
    or eax, 0xffffffff
    pop ebp
    ret 4
    }
}

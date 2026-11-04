
__declspec(naked) void FUN_100afe3a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x100]
    cmp dword ptr [eax + 0x24], 1
    mov eax, dword ptr [ebp + 8]
    jne L1
    or eax, 0x40000000
    pop ebp
    ret 4
    }
}

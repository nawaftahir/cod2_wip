
__declspec(naked) void FUN_100b97aa(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0xe8]
    and eax, dword ptr [ebp + 8]
    mov ecx, dword ptr [ecx + 0xec]
    shr eax, cl
    pop ebp
    ret 4
    }
}

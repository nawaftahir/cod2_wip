
__declspec(naked) void FUN_100b9798(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0xe4]
    and eax, dword ptr [ebp + 8]
    pop ebp
    ret 4
    }
}

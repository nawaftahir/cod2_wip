
__declspec(naked) void FUN_100b9777(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    mov edx, ecx
    mov ecx, dword ptr [edx + 0xec]
    shl eax, cl
    mov ecx, dword ptr [edx + 0xe4]
    and ecx, dword ptr [ebp + 8]
    or eax, ecx
    pop ebp
    ret 8
    }
}

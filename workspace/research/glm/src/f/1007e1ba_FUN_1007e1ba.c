
__declspec(naked) void FUN_1007e1ba(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0xc]
    mov eax, ecx
    shr eax, 2
    mov edx, eax
    and edx, 3
    and ecx, 3
    lea ecx, [ecx + edx*4]
    mov edx, dword ptr [ebp + 8]
    shr eax, 2
    mov eax, dword ptr [edx + eax*4]
    mov eax, dword ptr [eax + ecx*4]
    pop ebp
    ret 8
    }
}

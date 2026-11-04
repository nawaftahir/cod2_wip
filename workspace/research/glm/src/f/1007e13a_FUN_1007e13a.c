
__declspec(naked) void FUN_1007e13a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0xc]
    mov eax, ecx
    shr eax, 2
    mov edx, eax
    and eax, 3
    shr edx, 2
    lea eax, [eax + edx*4]
    and ecx, 3
    lea eax, [ecx + eax*4]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 8
    }
}

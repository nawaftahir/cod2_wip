
__declspec(naked) void FUN_1007e23a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 0xc]
    mov eax, ecx
    shr eax, 2
    mov edx, eax
    and ecx, 3
    shr edx, 2
    lea ecx, [ecx + edx*4]
    and eax, 3
    lea eax, [eax + ecx*4]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 8
    }
}

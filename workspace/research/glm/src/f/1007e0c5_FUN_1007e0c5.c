
__declspec(naked) void FUN_1007e0c5(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0xc]
    mov ecx, eax
    shr ecx, 2
    and eax, 3
    lea eax, [eax + ecx*4]
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + eax*4]
    pop ebp
    ret 8
    }
}

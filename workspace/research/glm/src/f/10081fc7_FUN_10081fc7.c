
__declspec(naked) void FUN_10081fc7(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    mov eax, dword ptr [ecx + 0x10]
    push dword ptr [ecx + 0xc]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 0x2c]
    pop ebp
    ret 4
    }
}

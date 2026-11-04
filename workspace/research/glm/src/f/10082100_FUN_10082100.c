
__declspec(naked) void FUN_10082100(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push dword ptr [ebp + 0x10]
    mov ecx, dword ptr [ebp + 8]
    push dword ptr [ebp + 0xc]
    mov eax, dword ptr [ecx + 0x10]
    push dword ptr [ecx + 0xc]
    mov edx, dword ptr [eax]
    push eax
    call dword ptr [edx + 0x54]
    pop ebp
    ret 0xc
    }
}

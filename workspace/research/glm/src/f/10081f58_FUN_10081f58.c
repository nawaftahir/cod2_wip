
__declspec(naked) void FUN_10081f58(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push dword ptr [ebp + 0x14]
    mov eax, dword ptr [ebp + 8]
    push dword ptr [ebp + 0x10]
    mov eax, dword ptr [eax + 0x10]
    push dword ptr [ebp + 0xc]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x18]
    pop ebp
    ret 0x10
    }
}

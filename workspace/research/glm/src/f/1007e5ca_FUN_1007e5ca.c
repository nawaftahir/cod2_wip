
__declspec(naked) void FUN_1007e5ca(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push dword ptr [ebp + 0x18]
    mov eax, dword ptr [ebp + 8]
    push dword ptr [ebp + 0x10]
    mov ecx, dword ptr [eax]
    push dword ptr [ebp + 0xc]
    push eax
    call dword ptr [ecx + 0x1c4]
    pop ebp
    ret 0x14
    }
}

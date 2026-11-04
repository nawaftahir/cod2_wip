
__declspec(naked) void FUN_10081f40(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + 0x10]
    push dword ptr [ebp + 0xc]
    mov ecx, dword ptr [eax]
    push eax
    call dword ptr [ecx + 0x14]
    pop ebp
    ret 8
    }
}

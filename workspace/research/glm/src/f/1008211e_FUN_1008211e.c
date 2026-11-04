
__declspec(naked) void FUN_1008211e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push dword ptr [ebp + 0x14]
    mov ecx, dword ptr [ebp + 8]
    push dword ptr [ebp + 0x10]
    mov eax, dword ptr [ecx + 0x10]
    push dword ptr [ebp + 0xc]
    mov edx, dword ptr [eax]
    push dword ptr [ecx + 0xc]
    push eax
    call dword ptr [edx + 0x58]
    pop ebp
    ret 0x10
    }
}

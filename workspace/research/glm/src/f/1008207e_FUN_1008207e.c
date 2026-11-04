
__declspec(naked) void FUN_1008207e(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp + 8]
    fld dword ptr [ebp + 0x10]
    mov eax, dword ptr [ecx + 0x10]
    mov edx, dword ptr [eax]
    push ecx
    fstp dword ptr [esp]
    push dword ptr [ebp + 0xc]
    push dword ptr [ecx + 0xc]
    push eax
    call dword ptr [edx + 0x44]
    pop ebp
    ret 0xc
    }
}

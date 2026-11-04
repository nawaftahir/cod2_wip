
__declspec(naked) void FUN_100868f2(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    mov eax, dword ptr [eax + 0x14]
    mov ecx, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + ecx*4]
    mov edx, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 0x40]
    mov eax, dword ptr [eax + 0x40]
    cmp eax, ecx
    jbe L2
    or eax, 0xffffffff
    jmp L2
    sbb eax, eax
    neg eax
    pop ebp
    ret 0xc
    }
}


__declspec(naked) void FUN_100865e0(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    mov eax, dword ptr [eax + 0x18]
    mov edx, dword ptr [ebp + 8]
    mov ecx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [ecx + 0x30]
    push esi
    mov esi, dword ptr [ebp + 0xc]
    mov eax, dword ptr [eax + esi*4]
    mov eax, dword ptr [eax + 0x30]
    cmp ecx, eax
    jge L4
    or eax, 0xffffffff
    jmp L4
    jle L4
    xor eax, eax
    inc eax
    jmp L4
    cmp esi, edx
    ja L4
    sbb eax, eax
    neg eax
    pop esi
    pop ebp
    ret 0xc
    }
}

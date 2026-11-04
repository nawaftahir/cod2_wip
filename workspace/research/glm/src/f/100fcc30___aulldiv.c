
__declspec(naked) void __aulldiv(void)
{
    __asm {
    push ebx
    push esi
    mov eax, dword ptr [esp + 0x18]
    or eax, eax
    jne L5
    mov ecx, dword ptr [esp + 0x14]
    mov eax, dword ptr [esp + 0x10]
    xor edx, edx
    div ecx
    mov ebx, eax
    mov eax, dword ptr [esp + 0xc]
    div ecx
    mov edx, ebx
    jmp L5
    mov ecx, eax
    mov ebx, dword ptr [esp + 0x14]
    mov edx, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0xc]
    shr ecx, 1
    rcr ebx, 1
    shr edx, 1
    rcr eax, 1
    or ecx, ecx
    jne L5
    div ebx
    mov esi, eax
    mul dword ptr [esp + 0x18]
    mov ecx, eax
    mov eax, dword ptr [esp + 0x14]
    mul esi
    add edx, ecx
    jb L5
    cmp edx, dword ptr [esp + 0x10]
    ja L5
    jb L5
    cmp eax, dword ptr [esp + 0xc]
    jbe L5
    dec esi
    xor edx, edx
    mov eax, esi
    pop esi
    pop ebx
    ret 0x10
    }
}

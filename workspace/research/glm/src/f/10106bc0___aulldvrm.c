
__declspec(naked) void __aulldvrm(void)
{
    __asm {
    push esi
    mov eax, dword ptr [esp + 0x14]
    or eax, eax
    jne L5
    mov ecx, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0xc]
    xor edx, edx
    div ecx
    mov ebx, eax
    mov eax, dword ptr [esp + 8]
    div ecx
    mov esi, eax
    mov eax, ebx
    mul dword ptr [esp + 0x10]
    mov ecx, eax
    mov eax, esi
    mul dword ptr [esp + 0x10]
    add edx, ecx
    jmp L5
    mov ecx, eax
    mov ebx, dword ptr [esp + 0x10]
    mov edx, dword ptr [esp + 0xc]
    mov eax, dword ptr [esp + 8]
    shr ecx, 1
    rcr ebx, 1
    shr edx, 1
    rcr eax, 1
    or ecx, ecx
    jne L5
    div ebx
    mov esi, eax
    mul dword ptr [esp + 0x14]
    mov ecx, eax
    mov eax, dword ptr [esp + 0x10]
    mul esi
    add edx, ecx
    jb L5
    cmp edx, dword ptr [esp + 0xc]
    ja L5
    jb L5
    cmp eax, dword ptr [esp + 8]
    jbe L5
    dec esi
    sub eax, dword ptr [esp + 0x10]
    sbb edx, dword ptr [esp + 0x14]
    xor ebx, ebx
    sub eax, dword ptr [esp + 8]
    sbb edx, dword ptr [esp + 0xc]
    neg edx
    neg eax
    sbb edx, 0
    mov ecx, edx
    mov edx, ebx
    mov ebx, ecx
    mov ecx, eax
    mov eax, esi
    pop esi
    ret 0x10
    }
}

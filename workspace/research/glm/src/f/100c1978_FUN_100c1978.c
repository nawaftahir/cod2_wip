
__declspec(naked) void FUN_100c1978(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ecx + 0x14]
    push ebx
    mov ebx, dword ptr [ebp + 8]
    mov eax, dword ptr [eax + ebx*4]
    mov edx, dword ptr [eax + 0x54]
    cmp edx, -1
    push esi
    push edi
    je L6
    test byte ptr [ecx + 0x6f], 0x20
    jne L6
    mov eax, dword ptr [eax + 0x58]
    cmp edx, eax
    mov dword ptr [ebp + 8], eax
    ja L6
    mov eax, dword ptr [ecx + 0x18]
    lea eax, [eax + edx*4]
    mov ecx, dword ptr [eax]
    mov esi, dword ptr [ecx]
    and esi, 0xf0000000
    cmp esi, 0x60000000
    jne L6
    mov esi, dword ptr [ecx + 4]
    xor edi, edi
    test esi, esi
    jbe L6
    mov ecx, dword ptr [ecx + 8]
    cmp dword ptr [ecx], ebx
    je L6
    inc edi
    add ecx, 4
    cmp edi, esi
    jb L6
    inc edx
    add eax, 4
    cmp edx, dword ptr [ebp + 8]
    jbe L6
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 4
    xor eax, eax
    inc eax
    jmp L6
    }
}

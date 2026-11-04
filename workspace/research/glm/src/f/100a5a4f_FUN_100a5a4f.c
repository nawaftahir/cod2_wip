
__declspec(naked) void FUN_100a5a4f(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ecx + 0x14]
    push esi
    mov esi, dword ptr [ebp + 8]
    mov eax, dword ptr [esi]
    mov esi, dword ptr [esi + 8]
    mov edx, eax
    and eax, 0xfffff
    imul eax, dword ptr [ebp + 0xc]
    mov eax, dword ptr [esi + eax*4]
    mov eax, dword ptr [ecx + eax*4]
    and edx, 0xfff00000
    cmp dword ptr [eax + 0x6c], 0x11
    pop esi
    jne L6
    cmp edx, 0x30000000
    jne L6
    cmp dword ptr [ebp + 0xc], 0
    jne L6
    xor eax, eax
    inc eax
    pop ebp
    ret 8
    mov eax, 0x73800000
    cmp edx, eax
    ja L6
    je L6
    cmp edx, 0x10f00000
    je L6
    cmp edx, 0x73500000
    je L6
    cmp edx, 0x73600000
    je L6
    cmp edx, 0x73700000
    jmp L6
    cmp edx, 0x74400000
    je L6
    cmp edx, 0x74500000
    je L6
    cmp edx, 0x74600000
    je L6
    cmp edx, 0x74700000
    je L6
    xor eax, eax
    jmp L6
    }
}

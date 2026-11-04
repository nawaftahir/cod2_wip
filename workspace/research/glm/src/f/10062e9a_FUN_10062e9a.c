
__declspec(naked) void FUN_10062e9a(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push edi
    mov edi, dword ptr [ebp + 8]
    test edi, edi
    jne L8
    xor eax, eax
    jmp L8
    push ebx
    lea eax, [edi + 4]
    mov edx, 0xffff
    push esi
    mov ecx, dword ptr [eax]
    test ecx, ecx
    js L8
    mov esi, ecx
    and esi, edx
    cmp esi, edx
    je L8
    cmp esi, 0xfffe
    jne L8
    shr ecx, 0x10
    and ecx, 0x7fff
    jmp L8
    mov ebx, dword ptr [edi]
    and ebx, edx
    cmp ebx, 0x200
    jb L8
    shr ecx, 0x18
    and ecx, 0xf
    lea eax, [eax + ecx*4]
    jmp L8
    cmp esi, 0x51
    jne L8
    add eax, 0x14
    add eax, 4
    jmp L8
    sub eax, edi
    add eax, 4
    sar eax, 2
    pop esi
    shl eax, 2
    pop ebx
    pop edi
    pop ebp
    ret 4
    }
}

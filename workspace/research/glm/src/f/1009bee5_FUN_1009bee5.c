extern void sub_1009be4b(void);

__declspec(naked) void FUN_1009bee5(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    fldz
    mov esi, dword ptr [ebp + 8]
    push edi
    xor edi, edi
    test esi, esi
    push 5
    lea eax, [ecx + 0x20]
    pop edx
    je L9
    cmp dword ptr [esi + 4], 3
    jne L9
    lea eax, [esi + 0x10]
    mov esi, dword ptr [eax]
    dec esi
    dec esi
    je L9
    dec esi
    je L9
    dec esi
    je L9
    dec esi
    je L9
    dec esi
    je L9
    dec esi
    je L9
    dec esi
    jne L9
    push 0xc
    fstp st(0)
    pop edx
    fld qword ptr [eax + 8]
    jmp L9
    push 0xb
    jmp L9
    push 0xa
    jmp L9
    push 9
    jmp L9
    push 8
    mov edi, dword ptr [eax + 8]
    pop edx
    jmp L9
    push 4
    jmp L9
    mov esi, dword ptr [eax + 8]
    mov edx, esi
    and edx, 0xbfffffff
    or edx, 0x20000000
    shr edx, 0x1d
    mov edi, esi
    push eax
    push ecx
    push ecx
    fstp qword ptr [esp]
    push edi
    push edx
    call sub_1009be4b
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}

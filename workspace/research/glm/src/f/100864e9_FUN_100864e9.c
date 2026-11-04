
__declspec(naked) void FUN_100864e9(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    mov eax, dword ptr [ebp + 0x10]
    mov eax, dword ptr [eax + 0x14]
    mov ecx, dword ptr [ebp + 8]
    mov edx, dword ptr [ebp + 0xc]
    mov edx, dword ptr [eax + edx*4]
    mov ecx, dword ptr [eax + ecx*4]
    mov eax, dword ptr [ecx + 4]
    push esi
    mov esi, dword ptr [edx + 4]
    cmp eax, esi
    jb L5
    ja L5
    fld qword ptr [ecx + 0x20]
    fcomp qword ptr [edx + 0x20]
    fnstsw ax
    test ah, 5
    jp L5
    or eax, 0xffffffff
    jmp L5
    fld qword ptr [ecx + 0x20]
    fcomp qword ptr [edx + 0x20]
    fnstsw ax
    test ah, 0x41
    jne L5
    xor eax, eax
    inc eax
    jmp L5
    xor eax, eax
    pop esi
    pop ebp
    ret 0xc
    }
}

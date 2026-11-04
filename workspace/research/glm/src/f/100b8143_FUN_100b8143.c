extern void sub_100b7444(void);

__declspec(naked) void FUN_100b8143(void)
{
    __asm {
    push ebx
    push esi
    push edi
    mov edi, dword ptr [eax + 4]
    xor ebx, ebx
    test edi, edi
    jbe L4
    mov esi, dword ptr [ecx + 0x14]
    mov eax, dword ptr [eax + 8]
    mov edx, dword ptr [eax]
    mov edx, dword ptr [esi + edx*4]
    cmp dword ptr [edx + 8], -1
    jne L4
    inc ebx
    add eax, 4
    cmp ebx, edi
    jb L4
    jmp L4
    push dword ptr [edx + 8]
    call sub_100b7444
    test eax, eax
    jl L4
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    ret
    }
}

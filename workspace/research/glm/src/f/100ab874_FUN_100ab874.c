extern void sub_100a6e41(void);

__declspec(naked) void FUN_100ab874(void)
{
    __asm {
    mov edi, edi
    push ebx
    push esi
    xor ebx, ebx
    xor esi, esi
    cmp dword ptr [ecx + 0xc], ebx
    push edi
    jbe L6
    lea edi, [ecx + 0x450]
    mov eax, dword ptr [ecx + 0x18]
    mov eax, dword ptr [eax + esi*4]
    mov edx, dword ptr [eax]
    and edx, 0xfff00000
    push edx
    call sub_100a6e41
    test eax, eax
    jne L6
    cmp edx, 0x72100000
    je L6
    cmp edx, 0x11000000
    jne L6
    cmp ebx, 0xc
    jae L6
    mov dword ptr [edi], esi
    inc ebx
    add edi, 4
    inc esi
    cmp esi, dword ptr [ecx + 0xc]
    jb L6
    xor eax, eax
    mov dword ptr [ecx + 0x480], ebx
    inc eax
    mov ecx, ebx
    shl eax, cl
    pop edi
    pop esi
    pop ebx
    ret
    or eax, 0xffffffff
    jmp L6
    }
}

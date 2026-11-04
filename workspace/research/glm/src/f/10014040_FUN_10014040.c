extern void sub_1001427e(void);

__declspec(naked) void FUN_10014040(void)
{
    __asm {
    push ebx
    mov ebx, ecx
    sub eax, ebx
    sar eax, 4
    push ebp
    mov ebp, eax
    cdq
    push esi
    sub eax, edx
    mov esi, eax
    sar esi, 1
    test esi, esi
    push edi
    jle L2
    mov edi, esi
    shl edi, 4
    add edi, ebx
    nop
    mov eax, dword ptr [esp + 0x14]
    push eax
    sub edi, 0x10
    sub esp, 0x10
    mov ecx, edi
    mov eax, dword ptr [ecx]
    mov edx, esp
    mov dword ptr [edx], eax
    mov eax, dword ptr [ecx + 4]
    mov dword ptr [edx + 4], eax
    mov eax, dword ptr [ecx + 8]
    mov ecx, dword ptr [ecx + 0xc]
    mov dword ptr [edx + 8], eax
    dec esi
    push ebp
    mov eax, esi
    mov dword ptr [edx + 0xc], ecx
    call sub_1001427e
    add esp, 0x18
    test esi, esi
    jg L2
    pop edi
    pop esi
    pop ebp
    pop ebx
    ret
    }
}

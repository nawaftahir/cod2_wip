extern void sub_10014311(void);

__declspec(naked) void FUN_10013e50(void)
{
    __asm {
    push ebp
    mov ebp, dword ptr [esp + 8]
    push esi
    mov esi, eax
    push edi
    mov edi, esi
    sub edi, ebx
    mov eax, edi
    sar eax, 4
    cmp eax, 1
    jle L2
    push ebp
    mov eax, esi
    mov ecx, ebx
    call sub_10014311
    sub edi, 0x10
    mov eax, edi
    sar eax, 4
    add esp, 4
    sub esi, 0x10
    cmp eax, 1
    jg L2
    pop edi
    pop esi
    pop ebp
    ret
    }
}

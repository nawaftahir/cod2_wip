extern int g_101ce5c0;
extern int g_101ce5c4;
extern void sub_10007ea5(void);

__declspec(naked) void FUN_10009700(void)
{
    __asm {
    push ebp
    mov ebp, dword ptr g_101ce5c0
    push esi
    xor esi, esi
    test ebp, ebp
    push edi
    jle L3
    mov edi, dword ptr g_101ce5c4
    mov eax, dword ptr [edi + esi*4]
    mov ecx, dword ptr [eax + 0x1c]
    mov edx, dword ptr [eax + 0x20]
    mov eax, ebx
    call sub_10007ea5
    test al, al
    jne L3
    inc esi
    cmp esi, ebp
    jl L3
    pop edi
    pop esi
    xor al, al
    pop ebp
    ret
    pop edi
    pop esi
    mov al, 1
    pop ebp
    ret
    }
}

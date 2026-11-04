extern int g_101da9bc;
extern void (__stdcall *fp_101d49d8)(void);
extern void (__stdcall *fp_101d49f8)(void);
extern void sub_1000ea92(void);
extern void sub_1000ec50(void);
extern void sub_1000ee6b(void);
extern void sub_10020969(void);

__declspec(naked) void FUN_10020a70(void)
{
    __asm {
    push esi
    push edi
    push 0x40000
    mov esi, eax
    call fp_101d49d8
    mov dword ptr g_101da9bc, eax
    call sub_10020969
    mov edi, dword ptr g_101da9bc
    push 0
    push 3
    push 1
    push 0x200
    push 0x200
    mov eax, 0x32
    mov ecx, esi
    call sub_1000ee6b
    mov eax, dword ptr [esi]
    add esp, 0x18
    cmp eax, 4
    jne L1
    push edi
    push 0
    push 0x32
    push esi
    call sub_1000ec50
    mov eax, dword ptr g_101da9bc
    add esp, 0x10
    push eax
    call fp_101d49f8
    add esp, 4
    pop edi
    pop esi
    ret
    push ebx
    push edi
    push 0x32
    xor edi, edi
    xor ebx, ebx
    call sub_1000ea92
    mov eax, dword ptr g_101da9bc
    add esp, 8
    pop ebx
    push eax
    call fp_101d49f8
    add esp, 4
    pop edi
    pop esi
    ret
    }
}

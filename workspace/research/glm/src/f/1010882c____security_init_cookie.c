extern int g_101a50d0;
extern void (__stdcall *fp_1010c028)(void);
extern void (__stdcall *fp_1010c0b8)(void);
extern void (__stdcall *fp_1010c0bc)(void);
extern void (__stdcall *fp_1010c0f4)(void);
extern void (__stdcall *fp_1010c0fc)(void);

__declspec(naked) void ___security_init_cookie(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x10
    mov eax, dword ptr g_101a50d0
    test eax, eax
    je L3
    cmp eax, 0xbb40e64e
    jne L3
    push esi
    lea eax, [ebp - 8]
    push eax
    call fp_1010c0f4
    mov esi, dword ptr [ebp - 4]
    xor esi, dword ptr [ebp - 8]
    call fp_1010c0b8
    xor esi, eax
    call fp_1010c0fc
    xor esi, eax
    call fp_1010c0bc
    xor esi, eax
    lea eax, [ebp - 0x10]
    push eax
    call fp_1010c028
    mov eax, dword ptr [ebp - 0xc]
    xor eax, dword ptr [ebp - 0x10]
    xor esi, eax
    mov dword ptr g_101a50d0, esi
    jne L3
    mov dword ptr g_101a50d0, 0xbb40e64e
    pop esi
    leave
    ret
    }
}

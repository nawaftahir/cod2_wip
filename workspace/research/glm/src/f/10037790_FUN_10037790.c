extern int g_101d1b9c;
extern int g_10764578;
extern int g_1076457c;
extern void (__stdcall *fp_101d49e0)(void);
extern void (__stdcall *fp_101d4b14)(void);
extern void sub_10037690(void);

__declspec(naked) void FUN_10037790(void)
{
    __asm {
    mov eax, dword ptr g_10764578
    sub esp, 0x40
    test eax, eax
    je L1
    mov ecx, dword ptr g_101d1b9c
    test ecx, ecx
    je L1
    mov ecx, dword ptr [ecx]
    lea eax, [esp]
    call sub_10037690
    mov eax, dword ptr g_1076457c
    mov ecx, dword ptr g_10764578
    lea eax, [eax + eax*2]
    shl eax, 1
    push eax
    push ecx
    lea edx, [esp + 8]
    push edx
    call fp_101d4b14
    mov eax, dword ptr g_10764578
    push eax
    call fp_101d49e0
    add esp, 0x10
    xor ecx, ecx
    mov dword ptr g_10764578, ecx
    mov dword ptr g_1076457c, ecx
    add esp, 0x40
    ret
    }
}

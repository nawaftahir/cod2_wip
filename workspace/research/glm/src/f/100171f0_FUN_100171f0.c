extern int g_101d1b2c;
extern int g_101d1b30;
extern int g_101d1b98;
extern void sub_1000c93f(void);
extern void sub_1000fc6e(void);

__declspec(naked) void FUN_100171f0(void)
{
    __asm {
    mov eax, dword ptr g_101d1b30
    mov ecx, dword ptr g_101d1b2c
    mov edx, dword ptr [eax + 0x3c]
    push esi
    cmp edx, dword ptr [ecx + 0x3c]
    jne L2
    mov edx, dword ptr [eax + 0x40]
    cmp edx, dword ptr [ecx + 0x40]
    jne L2
    mov edx, dword ptr [eax + 0x38]
    cmp edx, dword ptr [ecx + 0x38]
    je L2
    mov esi, dword ptr g_101d1b98
    call sub_1000c93f
    mov eax, dword ptr [esp + 8]
    push eax
    mov eax, dword ptr g_101d1b98
    call sub_1000fc6e
    add esp, 4
    test al, al
    mov eax, dword ptr g_101d1b2c
    je L2
    mov eax, dword ptr g_101d1b30
    pop esi
    ret
    }
}

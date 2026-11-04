extern int g_1076ac64;
extern int g_1076ac68;
extern int g_1076ac6c;
extern int g_1076ac70;
extern int g_1076ac74;
extern int g_1076ac78;
extern int g_1076ac94;
extern void (__stdcall *fp_1010c130)(void);

__declspec(naked) void ___sbh_heap_init(void)
{
    __asm {
    push 0x140
    push 0
    push dword ptr g_1076ac94
    call fp_1010c130
    test eax, eax
    mov dword ptr g_1076ac6c, eax
    jne L1
    ret
    mov ecx, dword ptr [esp + 4]
    and dword ptr g_1076ac64, 0
    and dword ptr g_1076ac68, 0
    mov dword ptr g_1076ac74, eax
    xor eax, eax
    mov dword ptr g_1076ac70, ecx
    mov dword ptr g_1076ac78, 0x10
    inc eax
    ret
    }
}

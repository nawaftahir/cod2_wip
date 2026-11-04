extern int g_1072dde0;
extern int g_1072dde4;
extern int g_1072dde8;
extern int g_1072ddec;
extern int g_1072debc;
extern int g_1076671c;
extern int g_10766720;
extern int g_10766724;
extern int g_10766748;
extern void sub_1003e900(void);

__declspec(naked) void FUN_1003e9b0(void)
{
    __asm {
    mov ecx, dword ptr g_10766724
    xor eax, eax
    sub esp, 0x10
    cmp ecx, 1
    mov byte ptr g_1072debc, al
    jne L2
    mov ecx, dword ptr g_1076671c
    mov edx, dword ptr g_10766720
    mov dword ptr [esp], eax
    mov dword ptr [esp + 4], eax
    jmp L2
    mov ecx, dword ptr g_1072dde0
    mov edx, dword ptr g_1072dde4
    mov dword ptr [esp], ecx
    mov ecx, dword ptr g_1072dde8
    mov dword ptr [esp + 4], edx
    mov edx, dword ptr g_1072ddec
    push esi
    lea esi, [esp + 4]
    mov dword ptr [esp + 0xc], ecx
    mov dword ptr [esp + 0x10], edx
    mov byte ptr g_10766748, al
    call sub_1003e900
    pop esi
    add esp, 0x10
    ret
    }
}

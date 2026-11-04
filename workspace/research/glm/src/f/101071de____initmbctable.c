extern int g_1076adac;
extern void sub_1010709e(void);

__declspec(naked) void ___initmbctable(void)
{
    __asm {
    cmp dword ptr g_1076adac, 0
    jne L1
    push -3
    call sub_1010709e
    pop ecx
    mov dword ptr g_1076adac, 1
    xor eax, eax
    ret
    }
}

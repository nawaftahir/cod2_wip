extern int g_101ae00c;
extern int g_101ae018;

__declspec(naked) void ___heap_select(void)
{
    __asm {
    cmp dword ptr g_101ae00c, 2
    jne L1
    cmp dword ptr g_101ae018, 5
    jb L1
    xor eax, eax
    inc eax
    ret
    push 3
    pop eax
    ret
    }
}

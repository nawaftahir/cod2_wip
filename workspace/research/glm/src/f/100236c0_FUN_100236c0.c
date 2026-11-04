extern int g_1019bd54;

__declspec(naked) void FUN_100236c0(void)
{
    __asm {
    push ecx
    movzx edx, byte ptr [ecx + 2]
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    fmul dword ptr g_1019bd54
    fstp dword ptr [eax]
    movzx edx, byte ptr [ecx + 1]
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    fmul dword ptr g_1019bd54
    fstp dword ptr [eax + 4]
    movzx edx, byte ptr [ecx]
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    fmul dword ptr g_1019bd54
    fstp dword ptr [eax + 8]
    movzx ecx, byte ptr [ecx + 3]
    mov dword ptr [esp], ecx
    fild dword ptr [esp]
    fmul dword ptr g_1019bd54
    fstp dword ptr [eax + 0xc]
    pop ecx
    ret
    }
}

extern int g_1019bd54;
extern int g_101ce798;
extern int g_101d61b8;
extern int g_101d61b9;
extern int g_101d61ba;
extern int g_101d61c8;

__declspec(naked) void FUN_10024920(void)
{
    __asm {
    push ecx
    mov cl, byte ptr g_101d61c8
    test cl, cl
    je L1
    movzx ecx, byte ptr g_101d61ba
    mov dword ptr [esp], ecx
    fild dword ptr [esp]
    fmul dword ptr g_1019bd54
    fstp dword ptr [eax]
    movzx edx, byte ptr g_101d61b9
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    fmul dword ptr g_1019bd54
    fstp dword ptr [eax + 4]
    movzx ecx, byte ptr g_101d61b8
    mov dword ptr [esp], ecx
    mov dword ptr [eax + 0xc], 0x3f800000
    fild dword ptr [esp]
    fmul dword ptr g_1019bd54
    fstp dword ptr [eax + 8]
    pop ecx
    ret
    mov ecx, dword ptr g_101ce798
    movzx edx, byte ptr [ecx + 8]
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    fmul dword ptr g_1019bd54
    fstp dword ptr [eax]
    movzx edx, byte ptr [ecx + 9]
    mov dword ptr [esp], edx
    fild dword ptr [esp]
    fmul dword ptr g_1019bd54
    fstp dword ptr [eax + 4]
    movzx ecx, byte ptr [ecx + 0xa]
    mov dword ptr [esp], ecx
    mov dword ptr [eax + 0xc], 0x3f800000
    fild dword ptr [esp]
    fmul dword ptr g_1019bd54
    fstp dword ptr [eax + 8]
    pop ecx
    ret
    }
}

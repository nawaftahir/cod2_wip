extern int g_1019bcac;
extern int g_1019bd80;

__declspec(naked) void FUN_10032490(void)
{
    __asm {
    sub esp, 0x10
    fld dword ptr [ecx]
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 8]
    fld dword ptr [esp]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp + 4]
    mov dl, byte ptr [esp + 4]
    mov byte ptr [eax], dl
    fld dword ptr [ecx + 4]
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp + 4]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp]
    mov dl, byte ptr [esp]
    mov byte ptr [eax + 1], dl
    fld dword ptr [ecx + 8]
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp + 4]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp]
    mov dl, byte ptr [esp]
    mov byte ptr [eax + 2], dl
    fld dword ptr [ecx + 0xc]
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp + 4]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 4]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp]
    mov cl, byte ptr [esp]
    mov byte ptr [eax + 3], cl
    add esp, 0x10
    ret
    }
}

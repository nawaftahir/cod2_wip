extern int g_1019bc78;
extern int g_1019bcac;
extern int g_1019bcb0;
extern int g_1019bd80;
extern int g_101d1b9c;
extern void sub_100590b0(void);
extern void sub_10059250(void);

__declspec(naked) void FUN_100106b0(void)
{
    __asm {
    sub esp, 0x20
    push esi
    push edi
    mov edi, dword ptr [esp + 0x2c]
    lea esi, [esp + 0x10]
    call sub_10059250
    fstp st(0)
    mov eax, dword ptr g_101d1b9c
    fld dword ptr [eax + 0xb8]
    lea esi, [esp + 0x1c]
    fsub dword ptr [esp + 0x10]
    fstp dword ptr [esp + 0x1c]
    fld dword ptr [eax + 0xbc]
    fsub dword ptr [esp + 0x14]
    fstp dword ptr [esp + 0x20]
    fld dword ptr [eax + 0xc0]
    fsub dword ptr [esp + 0x18]
    fstp dword ptr [esp + 0x24]
    call sub_100590b0
    fstp st(0)
    fld dword ptr [esp + 0x1c]
    fadd dword ptr g_1019bc78
    fmul dword ptr g_1019bcb0
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp + 8]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x10]
    fld dword ptr [esp + 8]
    fadd qword ptr [esp + 0x10]
    fistp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0x20]
    mov eax, dword ptr [esp + 0x34]
    fadd dword ptr g_1019bc78
    mov cl, byte ptr [esp + 0xc]
    mov byte ptr [eax + 2], cl
    fmul dword ptr g_1019bcb0
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp + 0x34]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x10]
    fld dword ptr [esp + 0x34]
    fadd qword ptr [esp + 0x10]
    fistp dword ptr [esp + 0xc]
    fld dword ptr [esp + 0x24]
    mov dl, byte ptr [esp + 0xc]
    fadd dword ptr g_1019bc78
    mov byte ptr [eax + 1], dl
    fmul dword ptr g_1019bcb0
    fmul dword ptr g_1019bcac
    fstp dword ptr [esp + 0x34]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 0x10]
    fld dword ptr [esp + 0x34]
    fadd qword ptr [esp + 0x10]
    fistp dword ptr [esp + 0xc]
    mov cl, byte ptr [esp + 0xc]
    pop edi
    mov byte ptr [eax], cl
    mov byte ptr [eax + 3], 0x80
    pop esi
    add esp, 0x20
    ret
    }
}

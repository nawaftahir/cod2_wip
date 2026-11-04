extern int g_1019bcac;
extern int g_1019bd80;
extern void sub_1002c370(void);
extern void sub_10059250(void);

__declspec(naked) void FUN_100107e0(void)
{
    __asm {
    sub esp, 0xc
    push esi
    push edi
    mov edi, dword ptr [esp + 0x18]
    lea esi, [esp + 8]
    call sub_10059250
    fstp st(0)
    mov ecx, dword ptr [esp + 0x10]
    mov eax, dword ptr [esp + 0x1c]
    mov esi, dword ptr [esp + 0x20]
    push ecx
    push 0x3faa9fbe
    push 0x3f800000
    mov dword ptr [esi], eax
    call sub_1002c370
    fmul dword ptr g_1019bcac
    add esp, 0xc
    fstp dword ptr [esp + 0x20]
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 0x20]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp + 0x1c]
    mov dl, byte ptr [esp + 0x1c]
    pop edi
    mov byte ptr [esi + 3], dl
    pop esi
    add esp, 0xc
    ret
    }
}

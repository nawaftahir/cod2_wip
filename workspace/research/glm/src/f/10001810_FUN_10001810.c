extern int g_1019bd80;

__declspec(naked) void FUN_10001810(void)
{
    __asm {
    sub esp, 0x10
    fld qword ptr g_1019bd80
    fstp qword ptr [esp + 8]
    fld dword ptr [esp + 0x14]
    fadd qword ptr [esp + 8]
    fistp dword ptr [esp + 4]
    mov eax, dword ptr [esp + 4]
    add esp, 0x10
    ret
    }
}

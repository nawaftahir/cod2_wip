
__declspec(naked) void FUN_10102f45(void)
{
    __asm {
    mov edx, dword ptr [esp + 4]
    and edx, 0x300
    or edx, 0x7f
    mov word ptr [esp + 6], dx
    fldcw word ptr [esp + 6]
    ret
    }
}

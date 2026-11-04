
__declspec(naked) void FUN_10102fce(void)
{
    __asm {
    cmp word ptr [esp], 0x27f
    je L0
    fldcw word ptr [esp]
    pop edx
    ret
    }
}

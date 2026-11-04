
__declspec(naked) void __frnd(void)
{
    __asm {
    push ecx
    push ecx
    fld qword ptr [esp + 0xc]
    frndint
    fstp qword ptr [esp]
    fld qword ptr [esp]
    pop ecx
    pop ecx
    ret
    }
}

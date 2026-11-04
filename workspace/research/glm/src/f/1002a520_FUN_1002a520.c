
__declspec(naked) void FUN_1002a520(void)
{
    __asm {
    fld dword ptr [esp + 4]
    mov ecx, 6
    fmul dword ptr [eax]
    fstp dword ptr [eax]
    mov eax, dword ptr [esp + 0xc]
    add eax, 8
    fld dword ptr [esp + 8]
    add eax, 0x10
    dec ecx
    fmul dword ptr [eax - 0x18]
    fstp dword ptr [eax - 0x18]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax - 0x14]
    fstp dword ptr [eax - 0x14]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax - 0x10]
    fstp dword ptr [eax - 0x10]
    fld dword ptr [esp + 8]
    fmul dword ptr [eax - 0xc]
    fstp dword ptr [eax - 0xc]
    jne L1
    ret
    }
}

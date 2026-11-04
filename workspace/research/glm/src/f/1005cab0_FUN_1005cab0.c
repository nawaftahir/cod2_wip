extern int g_1019bc84;
extern void sub_10059d80(void);

__declspec(naked) void FUN_1005cab0(void)
{
    __asm {
    sub esp, 0xc
    push ebx
    push esi
    mov esi, eax
    push edi
    lea ebx, [esi + 0x18]
    lea edi, [esp + 0xc]
    call sub_10059d80
    fld dword ptr g_1019bc84
    fsub dword ptr [esp + 0xc]
    pop edi
    fstp dword ptr [esi + 0xc]
    fld dword ptr g_1019bc84
    fsub dword ptr [esp + 0xc]
    fstp dword ptr [esi + 0x10]
    fld dword ptr g_1019bc84
    fsub dword ptr [esp + 0x10]
    fstp dword ptr [esi + 0x14]
    pop esi
    pop ebx
    add esp, 0xc
    ret
    }
}

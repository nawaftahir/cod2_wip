extern void sub_100f84d0(void);

__declspec(naked) void ___free_lc_time(void)
{
    __asm {
    push esi
    mov esi, dword ptr [esp + 8]
    test esi, esi
    je L0
    push dword ptr [esi + 4]
    call sub_100f84d0
    push dword ptr [esi + 8]
    call sub_100f84d0
    push dword ptr [esi + 0xc]
    call sub_100f84d0
    push dword ptr [esi + 0x10]
    call sub_100f84d0
    push dword ptr [esi + 0x14]
    call sub_100f84d0
    push dword ptr [esi + 0x18]
    call sub_100f84d0
    push dword ptr [esi]
    call sub_100f84d0
    push dword ptr [esi + 0x20]
    call sub_100f84d0
    push dword ptr [esi + 0x24]
    call sub_100f84d0
    push dword ptr [esi + 0x28]
    call sub_100f84d0
    push dword ptr [esi + 0x2c]
    call sub_100f84d0
    push dword ptr [esi + 0x30]
    call sub_100f84d0
    push dword ptr [esi + 0x34]
    call sub_100f84d0
    push dword ptr [esi + 0x1c]
    call sub_100f84d0
    push dword ptr [esi + 0x38]
    call sub_100f84d0
    push dword ptr [esi + 0x3c]
    call sub_100f84d0
    add esp, 0x40
    push dword ptr [esi + 0x40]
    call sub_100f84d0
    push dword ptr [esi + 0x44]
    call sub_100f84d0
    push dword ptr [esi + 0x48]
    call sub_100f84d0
    push dword ptr [esi + 0x4c]
    call sub_100f84d0
    push dword ptr [esi + 0x50]
    call sub_100f84d0
    push dword ptr [esi + 0x54]
    call sub_100f84d0
    push dword ptr [esi + 0x58]
    call sub_100f84d0
    push dword ptr [esi + 0x5c]
    call sub_100f84d0
    push dword ptr [esi + 0x60]
    call sub_100f84d0
    push dword ptr [esi + 0x64]
    call sub_100f84d0
    push dword ptr [esi + 0x68]
    call sub_100f84d0
    push dword ptr [esi + 0x6c]
    call sub_100f84d0
    push dword ptr [esi + 0x70]
    call sub_100f84d0
    push dword ptr [esi + 0x74]
    call sub_100f84d0
    push dword ptr [esi + 0x78]
    call sub_100f84d0
    push dword ptr [esi + 0x7c]
    call sub_100f84d0
    add esp, 0x40
    push dword ptr [esi + 0x80]
    call sub_100f84d0
    push dword ptr [esi + 0x84]
    call sub_100f84d0
    push dword ptr [esi + 0x88]
    call sub_100f84d0
    push dword ptr [esi + 0x8c]
    call sub_100f84d0
    push dword ptr [esi + 0x90]
    call sub_100f84d0
    push dword ptr [esi + 0x94]
    call sub_100f84d0
    push dword ptr [esi + 0x98]
    call sub_100f84d0
    push dword ptr [esi + 0x9c]
    call sub_100f84d0
    push dword ptr [esi + 0xa0]
    call sub_100f84d0
    push dword ptr [esi + 0xa4]
    call sub_100f84d0
    push dword ptr [esi + 0xa8]
    call sub_100f84d0
    add esp, 0x2c
    pop esi
    ret
    }
}

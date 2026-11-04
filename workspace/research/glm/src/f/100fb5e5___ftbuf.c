extern void sub_100f6af5(void);

__declspec(naked) void __ftbuf(void)
{
    __asm {
    cmp dword ptr [esp + 4], 0
    je L2
    push esi
    mov esi, dword ptr [esp + 0xc]
    test byte ptr [esi + 0xd], 0x10
    je L2
    push esi
    call sub_100f6af5
    and byte ptr [esi + 0xd], 0xee
    and dword ptr [esi + 0x18], 0
    and dword ptr [esi], 0
    and dword ptr [esi + 8], 0
    pop ecx
    pop esi
    ret
    }
}

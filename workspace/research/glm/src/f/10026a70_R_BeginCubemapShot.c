extern void sub_100268b0(void);

__declspec(naked) void R_BeginCubemapShot(void)
{
    __asm {
    mov eax, dword ptr [esp + 4]
    push eax
    call sub_100268b0
    add esp, 4
    xor eax, eax
    /* tail jmp 0x1003ea30: outside matcher scan window, emitted raw */
    _emit 0xe9
    _emit 0xac
    _emit 0x7f
    _emit 0x01
    _emit 0x00
    }
}

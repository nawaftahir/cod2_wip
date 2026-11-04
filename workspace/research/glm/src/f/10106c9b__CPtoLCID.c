
__declspec(naked) void _CPtoLCID(void)
{
    __asm {
    sub eax, 0x3a4
    je L4
    sub eax, 4
    je L4
    sub eax, 0xd
    je L4
    dec eax
    je L4
    xor eax, eax
    ret
    mov eax, 0x404
    ret
    mov eax, 0x412
    ret
    mov eax, 0x804
    ret
    mov eax, 0x411
    ret
    }
}

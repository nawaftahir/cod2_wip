
__declspec(naked) void FUN_100f8c58(void)
{
    __asm {
    mov ax, word ptr [esp + 0xa]
    and ax, 0x7ff0
    xor ecx, ecx
    cmp ax, 0x7ff0
    setne cl
    mov eax, ecx
    ret
    }
}

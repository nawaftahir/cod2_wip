
__declspec(naked) void FUN_10102fb8(void)
{
    __asm {
    mov eax, dword ptr [esp + 8]
    and eax, 0x7ff00000
    cmp eax, 0x7ff00000
    je L1
    ret
    mov eax, dword ptr [esp + 8]
    ret
    }
}

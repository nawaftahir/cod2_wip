extern int c_10000000;
extern int c_10100000;

__declspec(naked) void FUN_1008549a(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, c_10000000
    je L1
    cmp eax, c_10100000
    je L1
    cmp eax, 0x11200000
    je L1
    cmp eax, 0x20700000
    je L1
    cmp eax, 0x20800000
    je L1
    cmp eax, 0x20900000
    je L1
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}

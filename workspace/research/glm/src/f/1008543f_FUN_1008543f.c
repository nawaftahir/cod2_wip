extern int c_10300000;
extern int c_10500000;
extern int c_10600000;
extern int c_10700000;

__declspec(naked) void FUN_1008543f(void)
{
    __asm {
    mov eax, dword ptr [ecx]
    and eax, 0xfff00000
    cmp eax, c_10300000
    je L1
    cmp eax, c_10500000
    je L1
    cmp eax, c_10600000
    je L1
    cmp eax, c_10700000
    je L1
    xor eax, eax
    ret
    xor eax, eax
    inc eax
    ret
    }
}

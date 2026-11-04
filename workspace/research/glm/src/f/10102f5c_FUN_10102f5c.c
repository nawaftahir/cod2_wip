extern int g_1017e300;

__declspec(naked) void FUN_10102f5c(void)
{
    __asm {
    test eax, 0x80000
    je L1
    mov eax, 7
    ret
    fadd qword ptr g_1017e300
    mov eax, 1
    ret
    }
}

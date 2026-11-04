extern void (__stdcall *fp_1010c034)(void);

__declspec(naked) void ___crtInitCritSecNoSpinCount@8(void)
{
    __asm {
    push dword ptr [esp + 4]
    call fp_1010c034
    xor eax, eax
    inc eax
    ret 8
    }
}

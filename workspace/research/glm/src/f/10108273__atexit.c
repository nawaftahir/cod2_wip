extern void sub_1010823b(void);

__declspec(naked) void _atexit(void)
{
    __asm {
    push dword ptr [esp + 4]
    call sub_1010823b
    neg eax
    sbb eax, eax
    neg eax
    pop ecx
    dec eax
    ret
    }
}

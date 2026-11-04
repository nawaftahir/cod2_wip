extern void sub_100fc438(void);

__declspec(naked) void operator_new(void)
{
    __asm {
    push 1
    push dword ptr [esp + 8]
    call sub_100fc438
    pop ecx
    pop ecx
    ret
    }
}

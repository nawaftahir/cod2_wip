extern void sub_100f6142(void);

__declspec(naked) void __controlfp(void)
{
    __asm {
    mov eax, dword ptr [esp + 8]
    and eax, 0xfff7ffff
    push eax
    push dword ptr [esp + 8]
    call sub_100f6142
    pop ecx
    pop ecx
    ret
    }
}

extern void sub_100cb366(void);

__declspec(naked) void FUN_100cb7ab(void)
{
    __asm {
    mov eax, dword ptr [ecx + 0x100]
    push 0
    push 0
    push dword ptr [eax + 4]
    push dword ptr [eax + 0xc]
    push dword ptr [eax + 8]
    push dword ptr [eax + 0x10]
    push 0xe
    call sub_100cb366
    ret
    }
}

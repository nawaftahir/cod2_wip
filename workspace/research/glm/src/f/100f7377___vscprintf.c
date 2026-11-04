extern void sub_100fa4e6(void);

__declspec(naked) void __vscprintf(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x20
    push dword ptr [ebp + 0xc]
    and dword ptr [ebp - 0x18], 0
    push dword ptr [ebp + 8]
    and dword ptr [ebp - 0x20], 0
    lea eax, [ebp - 0x20]
    push eax
    mov dword ptr [ebp - 0x1c], 0x7fffffff
    mov dword ptr [ebp - 0x14], 0x42
    call sub_100fa4e6
    add esp, 0xc
    leave
    ret
    }
}

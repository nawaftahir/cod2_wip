extern void sub_100fb114(void);

__declspec(naked) void _rand(void)
{
    __asm {
    call sub_100fb114
    mov ecx, dword ptr [eax + 0x14]
    imul ecx, ecx, 0x343fd
    add ecx, 0x269ec3
    mov dword ptr [eax + 0x14], ecx
    mov eax, ecx
    shr eax, 0x10
    and eax, 0x7fff
    ret
    }
}

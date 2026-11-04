extern int g_101a4684;
extern void sub_100f7ccd(void);
extern void sub_100fb119(void);
extern void sub_100fd52c(void);

__declspec(naked) void _isspace(void)
{
    __asm {
    call sub_100fb119
    mov eax, dword ptr [eax + 0x64]
    cmp eax, dword ptr g_101a4684
    je L2
    call sub_100f7ccd
    cmp dword ptr [eax + 0x28], 1
    jle L2
    push 8
    push dword ptr [esp + 8]
    push eax
    call sub_100fd52c
    add esp, 0xc
    ret
    mov eax, dword ptr [eax + 0x48]
    mov ecx, dword ptr [esp + 4]
    movzx eax, byte ptr [eax + ecx*2]
    and eax, 8
    ret
    }
}

extern void sub_100fc22b(void);
extern void sub_100fc237(void);

__declspec(naked) void __set_errno(void)
{
    __asm {
    mov eax, dword ptr [esp + 4]
    cmp eax, 1
    je L2
    jle L2
    cmp eax, 3
    jg L2
    call sub_100fc22b
    mov dword ptr [eax], 0x22
    ret
    call sub_100fc237
    mov dword ptr [eax], 0x21
    ret
    }
}

extern void (__stdcall *fp_1010c030)(void);
extern void sub_100fc08f(void);

__declspec(naked) void __lock_file2(void)
{
    __asm {
    mov eax, dword ptr [esp + 4]
    cmp eax, 0x14
    jge L1
    add eax, 0x10
    push eax
    call sub_100fc08f
    pop ecx
    ret
    mov eax, dword ptr [esp + 8]
    add eax, 0x20
    push eax
    call fp_1010c030
    ret
    }
}

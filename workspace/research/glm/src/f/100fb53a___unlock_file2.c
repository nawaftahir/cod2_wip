extern void (__stdcall *fp_1010c03c)(void);
extern void sub_100fbfc2(void);

__declspec(naked) void __unlock_file2(void)
{
    __asm {
    mov eax, dword ptr [esp + 4]
    cmp eax, 0x14
    jge L1
    add eax, 0x10
    push eax
    call sub_100fbfc2
    pop ecx
    ret
    mov eax, dword ptr [esp + 8]
    add eax, 0x20
    push eax
    call fp_1010c03c
    ret
    }
}

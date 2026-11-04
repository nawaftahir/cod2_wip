extern int g_101a55b8;
extern void sub_100fc25b(void);
extern void sub_101029d4(void);
extern void sub_10102cd9(void);

__declspec(naked) void __handle_qnan2(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    cmp dword ptr g_101a55b8, 0
    fld qword ptr [ebp + 0xc]
    fadd qword ptr [ebp + 0x14]
    fstp qword ptr [ebp - 8]
    jne L1
    push dword ptr [ebp + 0x1c]
    fld qword ptr [ebp - 8]
    sub esp, 0x18
    fstp qword ptr [esp + 0x10]
    fld qword ptr [ebp + 0x14]
    fstp qword ptr [esp + 8]
    fld qword ptr [ebp + 0xc]
    fstp qword ptr [esp]
    push dword ptr [ebp + 8]
    push 1
    call sub_101029d4
    add esp, 0x24
    leave
    ret
    call sub_100fc25b
    push 0xffff
    push dword ptr [ebp + 0x1c]
    mov dword ptr [eax], 0x21
    call sub_10102cd9
    fld qword ptr [ebp - 8]
    pop ecx
    pop ecx
    leave
    ret
    }
}

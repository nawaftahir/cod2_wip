extern void sub_101030d9(void);

__declspec(naked) void FUN_101030c0(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 0x10
    and esp, 0xfffffff0
    fxch st(1)
    fstp qword ptr [esp]
    fstp qword ptr [esp + 8]
    call sub_101030d9
    leave
    ret
    }
}

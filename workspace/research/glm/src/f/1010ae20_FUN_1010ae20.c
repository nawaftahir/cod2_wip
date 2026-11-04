extern void sub_1010ae3e(void);

__declspec(naked) void FUN_1010ae20(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 8
    and esp, 0xfffffff0
    fstp qword ptr [esp]
    movq xmm0, qword ptr [esp]
    call sub_1010ae3e
    leave
    ret
    }
}

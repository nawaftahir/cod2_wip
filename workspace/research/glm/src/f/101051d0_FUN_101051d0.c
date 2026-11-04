extern void sub_101051ee(void);

__declspec(naked) void FUN_101051d0(void)
{
    __asm {
    push ebp
    mov ebp, esp
    sub esp, 8
    and esp, 0xfffffff0
    fstp qword ptr [esp]
    movq xmm0, qword ptr [esp]
    call sub_101051ee
    leave
    ret
    }
}

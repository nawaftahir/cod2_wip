extern int g_101a55b8;
extern void sub_10102d87(void);
extern void sub_101042b6(void);

__declspec(naked) void __cintrindisp2(void)
{
    __asm {
    push ebp
    mov ebp, esp
    add esp, 0xfffffd30
    push ebx
    wait
    fnstcw word ptr [ebp - 0xa4]
    wait
    cmp dword ptr g_101a55b8, 0
    je L2
    call sub_10102d87
    or byte ptr [ebp - 0x2c8], 3
    call sub_101042b6
    pop ebx
    leave
    ret
    fxch st(1)
    fst qword ptr [ebp - 0x86]
    fxch st(1)
    fst qword ptr [ebp - 0x7e]
    jmp L2
    }
}

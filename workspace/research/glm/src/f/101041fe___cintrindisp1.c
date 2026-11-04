extern int g_101a55b8;
extern void sub_10102d1f(void);
extern void sub_101042bc(void);

__declspec(naked) void __cintrindisp1(void)
{
    __asm {
    push ebp
    mov ebp, esp
    add esp, 0xfffffd30
    push ebx
    wait
    fnstcw word ptr [ebp - 0xa4]
    cmp dword ptr g_101a55b8, 0
    je L2
    call sub_10102d1f
    or byte ptr [ebp - 0x2c8], 1
    and byte ptr [ebp - 0x2c8], 0xfd
    call sub_101042bc
    pop ebx
    leave
    ret
    fst qword ptr [ebp - 0x86]
    jmp L2
    }
}

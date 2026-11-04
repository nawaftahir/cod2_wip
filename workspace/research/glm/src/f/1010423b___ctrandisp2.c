extern void sub_10102d67(void);
extern void sub_10104283(void);
extern void sub_10104404(void);

__declspec(naked) void __ctrandisp2(void)
{
    __asm {
    push ebp
    mov ebp, esp
    add esp, 0xfffffd30
    push ebx
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10104404
    add esp, 8
    push dword ptr [ebp + 0x14]
    push dword ptr [ebp + 0x10]
    call sub_10104404
    add esp, 8
    wait
    fnstcw word ptr [ebp - 0xa4]
    or byte ptr [ebp - 0x2c8], 2
    mov byte ptr [ebp - 0x8f], 1
    call sub_10102d67
    call sub_10104283
    pop ebx
    leave
    ret
    }
}

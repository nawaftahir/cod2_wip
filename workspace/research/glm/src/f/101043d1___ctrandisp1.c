extern void sub_10102d00(void);
extern void sub_10104283(void);
extern void sub_10104404(void);

__declspec(naked) void __ctrandisp1(void)
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
    wait
    fnstcw word ptr [ebp - 0xa4]
    and byte ptr [ebp - 0x2c8], 0xfd
    call sub_10102d00
    call sub_10104283
    pop ebx
    leave
    ret
    }
}

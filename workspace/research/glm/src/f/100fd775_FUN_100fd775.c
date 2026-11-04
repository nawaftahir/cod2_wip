extern void sub_100fdfa9(int);

__declspec(naked) void FUN_100fd775(void)
{
    __asm {
        cmp [ebp+10h], 0
        jz do_err
        jmp done
    do_err:
        push 8
        call sub_100fdfa9
        pop ecx
    done:
        ret
    }
}

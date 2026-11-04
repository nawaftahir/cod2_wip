extern void sub_101077f1(void);

__declspec(naked) void FUN_10107e72(void)
{
    __asm {
    cmp dword ptr [ebp - 0x1c], 0
    je L0
    push dword ptr [ebp - 0x20]
    call sub_101077f1
    pop ecx
    ret
    }
}

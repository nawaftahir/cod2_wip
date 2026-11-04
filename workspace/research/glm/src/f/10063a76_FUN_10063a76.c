/* vtable-pair probe: thiscall, flag-gated virtual call */
extern void *sub_10063a5c(void *);
extern void *sub_100f7865(void *);

__declspec(naked) void *FUN_10063a76(int flags)
{
    __asm {
        mov edi, edi
        push ebp
        mov ebp, esp
        push esi
        mov esi, ecx
        call sub_10063a5c
        test byte ptr [ebp+8], 1
        jz skip
        push esi
        call sub_100f7865
        pop ecx
    skip:
        mov eax, esi
        pop esi
        pop ebp
        ret 4
    }
}

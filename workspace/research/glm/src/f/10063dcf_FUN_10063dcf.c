/* vtable-pair probe: thiscall, flag-gated virtual call */
extern void *sub_10063db5(void *);
extern void *sub_100f7865(void *);

__declspec(naked) void *FUN_10063dcf(int flags)
{
    __asm {
        mov edi, edi
        push ebp
        mov ebp, esp
        push esi
        mov esi, ecx
        call sub_10063db5
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

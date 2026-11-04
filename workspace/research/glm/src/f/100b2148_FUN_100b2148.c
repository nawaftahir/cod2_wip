/* vtable-pair probe: thiscall, flag-gated virtual call */
extern void *sub_100b0cbc(void *);
extern void *sub_100f7865(void *);

__declspec(naked) void *FUN_100b2148(int flags)
{
    __asm {
        mov edi, edi
        push ebp
        mov ebp, esp
        push esi
        mov esi, ecx
        call sub_100b0cbc
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

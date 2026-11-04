extern void sub_10085c01(void);
extern void sub_10085dbc(void);

__declspec(naked) void FUN_1006db35(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    call sub_10085c01
    test byte ptr [ebp + 8], 1
    je L1
    push esi
    call sub_10085dbc
    mov eax, esi
    pop esi
    pop ebp
    ret 4
    }
}

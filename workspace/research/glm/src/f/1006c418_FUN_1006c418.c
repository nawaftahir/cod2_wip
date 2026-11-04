extern void sub_100853bc(void);
extern void sub_1008585a(void);

__declspec(naked) void FUN_1006c418(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    mov esi, ecx
    call sub_100853bc
    test byte ptr [ebp + 8], 1
    je L1
    push esi
    call sub_1008585a
    mov eax, esi
    pop esi
    pop ebp
    ret 4
    }
}

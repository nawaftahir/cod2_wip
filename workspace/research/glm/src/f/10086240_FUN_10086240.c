extern void sub_1006db74(void);
extern void sub_10085c0f(void);
extern void sub_10085c97(void);
extern void sub_10085d89(void);
extern void sub_10085f0e(void);

__declspec(naked) void FUN_10086240(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0x80
    mov edi, ecx
    call sub_10085d89
    test eax, eax
    je L5
    mov ecx, eax
    call sub_10085c0f
    mov esi, eax
    jmp L5
    xor esi, esi
    test esi, esi
    je L5
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_10085c97
    test eax, eax
    jge L5
    push 1
    mov ecx, esi
    call sub_1006db74
    or eax, 0xffffffff
    jmp L5
    push esi
    mov ecx, edi
    call sub_10085f0e
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}

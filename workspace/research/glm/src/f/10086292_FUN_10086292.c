extern void sub_1006c454(void);
extern void sub_10085394(void);
extern void sub_10085824(void);
extern void sub_10085aed(void);
extern void sub_1008606f(void);

__declspec(naked) void FUN_10086292(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0x74
    mov edi, ecx
    call sub_10085824
    test eax, eax
    je L5
    mov ecx, eax
    call sub_10085394
    mov esi, eax
    jmp L5
    xor esi, esi
    test esi, esi
    je L5
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_10085aed
    test eax, eax
    jge L5
    push 1
    mov ecx, esi
    call sub_1006c454
    or eax, 0xffffffff
    jmp L5
    push esi
    mov ecx, edi
    call sub_1008606f
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}

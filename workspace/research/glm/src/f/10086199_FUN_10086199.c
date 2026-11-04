extern void sub_1006c45c(void);
extern void sub_10085394(void);
extern void sub_10085824(void);
extern void sub_10085896(void);
extern void sub_10086077(void);

__declspec(naked) void FUN_10086199(void)
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
    push 0
    push dword ptr [ebp + 0x10]
    mov ecx, esi
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_10085896
    test eax, eax
    jge L5
    push 1
    mov ecx, esi
    call sub_1006c45c
    or eax, 0xffffffff
    jmp L5
    push esi
    mov ecx, edi
    call sub_10086077
    pop edi
    pop esi
    pop ebp
    ret 0xc
    }
}

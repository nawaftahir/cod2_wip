extern void sub_10085e24(void);
extern void sub_10085e52(void);
extern void sub_100cb942(void);
extern void sub_100cb9a2(void);
extern void sub_100f787a(void);

__declspec(naked) void FUN_100861f0(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push esi
    push edi
    push 0x34
    mov edi, ecx
    call sub_100f787a
    test eax, eax
    pop ecx
    je L5
    mov ecx, eax
    call sub_100cb942
    mov esi, eax
    jmp L5
    xor esi, esi
    test esi, esi
    je L5
    push dword ptr [ebp + 8]
    mov ecx, esi
    call sub_100cb9a2
    test eax, eax
    jge L5
    push 1
    mov ecx, esi
    call sub_10085e24
    or eax, 0xffffffff
    jmp L5
    push esi
    mov ecx, edi
    call sub_10085e52
    pop edi
    pop esi
    pop ebp
    ret 4
    }
}

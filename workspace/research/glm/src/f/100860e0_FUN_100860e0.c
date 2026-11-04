extern void sub_10085e2d(void);
extern void sub_10085e5b(void);
extern void sub_100cb942(void);
extern void sub_100cb963(void);
extern void sub_100f787a(void);

__declspec(naked) void FUN_100860e0(void)
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
    push dword ptr [ebp + 0x14]
    mov ecx, esi
    push dword ptr [ebp + 0x10]
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call sub_100cb963
    test eax, eax
    jge L5
    push 1
    mov ecx, esi
    call sub_10085e2d
    or eax, 0xffffffff
    jmp L5
    push esi
    mov ecx, edi
    call sub_10085e5b
    pop edi
    pop esi
    pop ebp
    ret 0x10
    }
}

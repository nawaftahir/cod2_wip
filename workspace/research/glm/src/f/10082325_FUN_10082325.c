extern int g_1010c064;
extern int g_1010c068;
extern void (__stdcall *fp_1010c054)(void);
extern void (__stdcall *fp_1010c058)(void);
extern void (__stdcall *fp_1010c05c)(void);
extern void (__stdcall *fp_1010c060)(void);
extern void sub_10082319(void);

__declspec(naked) void FUN_10082325(void)
{
    __asm {
    mov edi, edi
    push ebp
    mov ebp, esp
    push ebx
    push esi
    mov ebx, ecx
    xor esi, esi
    cmp dword ptr [ebx], esi
    push edi
    je L7
    call sub_10082319
    cmp dword ptr [ebp + 0x14], esi
    mov edi, dword ptr g_1010c068
    jne L7
    mov edi, dword ptr g_1010c064
    cmp dword ptr [ebp + 0x10], esi
    je L7
    push 2
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call edi
    mov esi, eax
    test esi, esi
    jne L7
    push 0xa
    push dword ptr [ebp + 0xc]
    push dword ptr [ebp + 8]
    call edi
    mov esi, eax
    test esi, esi
    je L7
    push esi
    push dword ptr [ebp + 8]
    call fp_1010c060
    test eax, eax
    mov dword ptr [ebx + 8], eax
    je L7
    push esi
    push dword ptr [ebp + 8]
    call fp_1010c05c
    test eax, eax
    mov dword ptr [ebx], eax
    je L7
    push eax
    call fp_1010c058
    test eax, eax
    mov dword ptr [ebx + 4], eax
    jne L7
    call fp_1010c054
    mov eax, 0x88760b59
    jmp L7
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    pop ebp
    ret 0x10
    }
}

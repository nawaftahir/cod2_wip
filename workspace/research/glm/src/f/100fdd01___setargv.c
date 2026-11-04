extern int c_101ae050;
extern int g_101ae020;
extern int g_101ae024;
extern int g_101ae03c;
extern int g_101ae154;
extern int g_1076adac;
extern int g_1076bdcc;
extern void (__stdcall *fp_1010c160)(void);
extern void sub_100fc4ce(void);
extern void sub_100fdbee(void);
extern void sub_100fdc1f(void);
extern void sub_101071f5(void);

__declspec(naked) void __setargv(void)
{
    __asm {
    push ebp
    mov ebp, esp
    push ecx
    push ecx
    push ebx
    push esi
    push edi
    xor edi, edi
    cmp dword ptr g_1076adac, edi
    jne L5
    call sub_101071f5
    push 0x104
    mov esi, c_101ae050
    push esi
    push edi
    mov byte ptr g_101ae154, 0
    call fp_1010c160
    mov eax, dword ptr g_1076bdcc
    cmp eax, edi
    mov dword ptr g_101ae03c, esi
    je L5
    cmp byte ptr [eax], 0
    mov ebx, eax
    jne L5
    mov ebx, esi
    lea eax, [ebp - 4]
    push eax
    push edi
    lea esi, [ebp - 8]
    xor ecx, ecx
    mov eax, ebx
    call sub_100fdbee
    mov esi, dword ptr [ebp - 4]
    mov eax, dword ptr [ebp - 8]
    shl esi, 2
    add eax, esi
    push eax
    call sub_100fc4ce
    mov edi, eax
    add esp, 0xc
    test edi, edi
    jne L5
    or eax, 0xffffffff
    jmp L5
    lea eax, [ebp - 4]
    push eax
    lea ecx, [esi + edi]
    push edi
    lea esi, [ebp - 8]
    mov eax, ebx
    call sub_100fdc1f
    mov eax, dword ptr [ebp - 4]
    dec eax
    pop ecx
    mov dword ptr g_101ae020, eax
    pop ecx
    mov dword ptr g_101ae024, edi
    xor eax, eax
    pop edi
    pop esi
    pop ebx
    leave
    ret
    }
}

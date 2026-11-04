extern int g_101ce708;
extern int g_101ce754;
extern int g_101ce790;
extern int g_101ce7b8;
extern void sub_1002ffab(void);
extern void sub_100301a3(void);
extern void sub_100302ef(void);
extern void sub_10030412(void);

__declspec(naked) void FUN_100308c0(void)
{
    __asm {
    push ecx
    mov eax, dword ptr g_101ce754
    mov eax, dword ptr [eax + 8]
    cmp eax, 1
    jne L4
    call sub_100301a3
    pop ecx
    ret
    mov ecx, dword ptr g_101ce708
    cmp dword ptr [ecx + 8], 2
    je L4
    cmp eax, 2
    jne L4
    call sub_1002ffab
    pop ecx
    ret
    mov edx, dword ptr g_101ce7b8
    mov al, byte ptr [edx + 8]
    test al, al
    je L4
    call sub_100302ef
    pop ecx
    ret
    mov eax, dword ptr g_101ce790
    mov cl, byte ptr [eax + 8]
    test cl, cl
    je L4
    call sub_10030412
    pop ecx
    ret
    }
}

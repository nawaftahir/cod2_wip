extern int g_101ce7c8;
extern void sub_1001da96(void);
extern void sub_1001de8d(void);

__declspec(naked) void FUN_1001e220(void)
{
    __asm {
    push esi
    mov esi, eax
    mov eax, dword ptr g_101ce7c8
    test byte ptr [eax + 8], 1
    je L2
    push ebx
    mov eax, edi
    call sub_1001da96
    add esp, 4
    mov ecx, dword ptr g_101ce7c8
    test byte ptr [ecx + 8], 2
    je L2
    push ebx
    mov eax, edi
    call sub_1001de8d
    add esp, 4
    pop esi
    ret
    }
}

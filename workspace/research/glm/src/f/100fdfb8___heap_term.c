extern int g_1010c090;
extern int g_1010c104;
extern int g_1076ac68;
extern int g_1076ac6c;
extern int g_1076ac94;
extern int g_1076ac98;
extern void (__stdcall *fp_1010c174)(void);

__declspec(naked) void __heap_term(void)
{
    __asm {
    cmp dword ptr g_1076ac98, 3
    jne L3
    push ebx
    xor ebx, ebx
    cmp dword ptr g_1076ac68, ebx
    push ebp
    mov ebp, dword ptr g_1010c104
    jle L3
    push esi
    mov esi, dword ptr g_1076ac6c
    push edi
    mov edi, dword ptr g_1010c090
    add esi, 0xc
    push 0x4000
    push 0x100000
    push dword ptr [esi]
    call edi
    push 0x8000
    push 0
    push dword ptr [esi]
    call edi
    push dword ptr [esi + 4]
    push 0
    push dword ptr g_1076ac94
    call ebp
    add esi, 0x14
    inc ebx
    cmp ebx, dword ptr g_1076ac68
    jl L3
    pop edi
    pop esi
    push dword ptr g_1076ac6c
    push 0
    push dword ptr g_1076ac94
    call ebp
    pop ebp
    pop ebx
    push dword ptr g_1076ac94
    call fp_1010c174
    ret
    }
}

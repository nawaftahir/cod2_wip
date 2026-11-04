extern int g_101ce624;
extern int g_101da9c8;
extern int c_10196d28;
extern int c_10196d00;
extern int c_10196cd0;
extern int g_1076a878;
extern int g_10678510;
extern void (__stdcall *fp_101d4af8)(void);
extern void (__stdcall *fp_101d49c8)(void);
extern void sub_10023cc0(void);
extern void sub_100138c0(void);
extern void sub_10023af0(void);
extern void sub_10023780(void);

__declspec(naked) void R_AddRefEntityToScene(void)
{
    __asm {
    push edi
    mov edi, dword ptr [esp + 8]
    cmp dword ptr [edi], 1
    jg L_big
    mov eax, dword ptr [esp + 0x10]
    mov ecx, dword ptr [esp + 0xc]
    push eax
    push ecx
    push edi
    call sub_10023cc0
    add esp, 0xc
    pop edi
    ret
L_big:
    mov edx, dword ptr g_101ce624
    mov al, byte ptr [edx + 8]
    test al, al
    je L_no_warn
    mov eax, dword ptr g_101da9c8
    cmp dword ptr [eax + 0xa000c], 0x1cc5
    jb L_no_warn
    push offset c_10196d28
    push 0xbb8
    push 5
    call fp_101d4af8
    add esp, 0xc
L_no_warn:
    mov eax, dword ptr [edi]
    test eax, eax
    jl L_clamp
    cmp eax, 0xa
    jl L_ok
L_clamp:
    push eax
    push offset c_10196d00
    push 1
    call sub_100138c0
    add esp, 0xc
L_ok:
    mov eax, dword ptr g_101da9c8
    cmp dword ptr [eax + 0xa000c], 0x1ff8
    jb L_alloc
    mov eax, dword ptr [eax]
    cmp dword ptr g_1076a878, eax
    je L_zero
    push offset c_10196cd0
    push 2
    mov dword ptr g_1076a878, eax
    call fp_101d49c8
    add esp, 8
L_zero:
    xor eax, eax
    pop edi
    ret
L_alloc:
    push esi
    call sub_10023af0
    mov esi, eax
    test esi, esi
    jge L_have
    pop esi
    xor eax, eax
    pop edi
    ret
L_have:
    mov ecx, dword ptr [esp + 0x10]
    push ecx
    push edi
    push esi
    call sub_10023780
    mov ecx, dword ptr g_10678510
    mov eax, esi
    imul eax, eax, 0x74
    add esp, 0xc
    pop esi
    add eax, ecx
    pop edi
    ret
    }
}

extern int g_101ce5fc;
extern int g_101ce604;
extern int g_101ce6d8;
extern int g_101ce728;
extern int g_101ce73c;
extern int g_101ce768;
extern int g_101ce778;
extern int g_101d1b9c;
extern void (__stdcall *fp_101d4a5c)(void);

__declspec(naked) void FUN_10021c80(void)
{
    __asm {
    mov eax, dword ptr g_101d1b9c
    test eax, eax
    jne L0
    xor al, al
    ret
    mov eax, dword ptr g_101ce73c
    mov cl, byte ptr [eax + 7]
    test cl, cl
    push ebx
    jne L1
    xor bl, bl
    jmp L2
    push eax
    call fp_101d4a5c
    add esp, 4
    mov bl, 1
    mov eax, dword ptr g_101ce5fc
    mov cl, byte ptr [eax + 7]
    test cl, cl
    jne L3
    xor al, al
    jmp L4
    push eax
    call fp_101d4a5c
    add esp, 4
    mov al, 1
    or bl, al
    mov eax, dword ptr g_101ce604
    mov cl, byte ptr [eax + 7]
    test cl, cl
    jne L5
    xor al, al
    jmp L6
    push eax
    call fp_101d4a5c
    add esp, 4
    mov al, 1
    or bl, al
    mov eax, dword ptr g_101ce6d8
    mov cl, byte ptr [eax + 7]
    test cl, cl
    jne L7
    xor al, al
    jmp L8
    push eax
    call fp_101d4a5c
    add esp, 4
    mov al, 1
    or bl, al
    mov eax, dword ptr g_101ce778
    mov cl, byte ptr [eax + 7]
    test cl, cl
    jne L9
    xor al, al
    jmp L10
    push eax
    call fp_101d4a5c
    add esp, 4
    mov al, 1
    or bl, al
    mov eax, dword ptr g_101ce768
    mov cl, byte ptr [eax + 7]
    test cl, cl
    jne L11
    xor al, al
    jmp L12
    push eax
    call fp_101d4a5c
    add esp, 4
    mov al, 1
    or bl, al
    mov eax, dword ptr g_101ce728
    mov cl, byte ptr [eax + 7]
    test cl, cl
    jne L13
    xor al, al
    or al, bl
    pop ebx
    ret
    push eax
    call fp_101d4a5c
    mov al, 1
    add esp, 4
    or al, bl
    pop ebx
    ret
    }
}

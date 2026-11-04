extern int g_101a4db4;
extern int g_101a4e48;
extern int g_101a4e4c;
extern int g_101a4e50;
extern int g_101a4e54;
extern int g_101a4e58;
extern int g_101a4e5c;
extern int g_101adf6c;
extern int g_101adf6e;
extern int g_101adf70;
extern int g_101adf72;
extern int g_101adf74;
extern int g_101adf76;
extern int g_101adf78;
extern int g_101adf7a;
extern int g_101adfc0;
extern int g_101adfc2;
extern int g_101adfc4;
extern int g_101adfc6;
extern int g_101adfc8;
extern int g_101adfca;
extern int g_101adfcc;
extern int g_101adfce;
extern int g_101adfd4;
extern void sub_100fc71e(void);

__declspec(naked) void __isindst_lk(void)
{
    __asm {
    push esi
    xor esi, esi
    cmp dword ptr g_101a4db4, esi
    jne L0
    xor eax, eax
    pop esi
    ret
    push ebp
    xor ebp, ebp
    push edi
    mov edi, dword ptr [ebx + 0x14]
    inc ebp
    cmp edi, dword ptr g_101a4e48
    jne L1
    cmp edi, dword ptr g_101a4e54
    je L2
    cmp dword ptr g_101adfd4, esi
    je L3
    cmp word ptr g_101adfc0, si
    movzx eax, word ptr g_101adfce
    movzx ecx, word ptr g_101adfc8
    push eax
    movzx eax, word ptr g_101adfcc
    push eax
    movzx eax, word ptr g_101adfca
    push eax
    jne L4
    movzx eax, word ptr g_101adfc4
    push esi
    push eax
    movzx eax, word ptr g_101adfc6
    push eax
    push edi
    push ebp
    jmp L5
    movzx eax, word ptr g_101adfc6
    push eax
    push esi
    push esi
    push edi
    push esi
    movzx eax, word ptr g_101adfc2
    push ebp
    call sub_100fc71e
    movzx eax, word ptr g_101adf7a
    movzx ecx, word ptr g_101adf74
    add esp, 0x24
    cmp word ptr g_101adf6c, si
    push eax
    movzx eax, word ptr g_101adf78
    push eax
    movzx eax, word ptr g_101adf76
    push eax
    jne L6
    movzx eax, word ptr g_101adf70
    push esi
    push eax
    movzx eax, word ptr g_101adf72
    push eax
    push edi
    push ebp
    movzx eax, word ptr g_101adf6e
    push esi
    call sub_100fc71e
    add esp, 0x24
    jmp L2
    movzx eax, word ptr g_101adf72
    push eax
    push esi
    push esi
    push edi
    push esi
    jmp L7
    push esi
    push esi
    push esi
    push esi
    push esi
    push ebp
    push edi
    push ebp
    push ebp
    push 2
    pop ecx
    push 4
    pop eax
    call sub_100fc71e
    push esi
    push esi
    push esi
    push esi
    push esi
    push 5
    push edi
    push ebp
    push esi
    push 2
    pop ecx
    push 0xa
    pop eax
    call sub_100fc71e
    add esp, 0x48
    mov edx, dword ptr g_101a4e4c
    mov eax, dword ptr g_101a4e58
    cmp edx, eax
    mov ecx, dword ptr [ebx + 0x1c]
    jge L8
    cmp ecx, edx
    jl L9
    cmp ecx, eax
    jg L9
    cmp ecx, edx
    jle L10
    cmp ecx, eax
    jge L10
    mov eax, ebp
    pop edi
    pop ebp
    pop esi
    ret
    xor eax, eax
    jmp L11
    cmp ecx, eax
    jl L12
    cmp ecx, edx
    jg L12
    cmp ecx, eax
    jle L10
    cmp ecx, edx
    jl L9
    mov eax, dword ptr [ebx + 8]
    imul eax, eax, 0x3c
    add eax, dword ptr [ebx + 4]
    imul eax, eax, 0x3c
    add eax, dword ptr [ebx]
    imul eax, eax, 0x3e8
    cmp ecx, edx
    jne L13
    xor ecx, ecx
    cmp eax, dword ptr g_101a4e50
    setge cl
    mov eax, ecx
    jmp L11
    xor ecx, ecx
    cmp eax, dword ptr g_101a4e5c
    setl cl
    jmp L14
    }
}

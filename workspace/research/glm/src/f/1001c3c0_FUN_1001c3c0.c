extern void sub_1001c310(void);

__declspec(naked) void FUN_1001c3c0(void)
{
    __asm {
    push ebx
    push ebp
    xor ebp, ebp
    cmp word ptr [esi + 6], bp
    push edi
    mov edi, eax
    jbe L3
    lea ebx, [esi + 0x14]
    mov eax, dword ptr [esi]
    mov ecx, dword ptr [esp + 0x10]
    push ebx
    push 2
    push eax
    push ecx
    call sub_1001c310
    add esp, 0x10
    test al, al
    je L3
    movzx edx, word ptr [esi + 6]
    inc ebp
    add ebx, 0x5c
    cmp ebp, edx
    jl L3
    pop edi
    pop ebp
    mov al, 1
    pop ebx
    ret
    pop edi
    pop ebp
    xor al, al
    pop ebx
    ret
    }
}
